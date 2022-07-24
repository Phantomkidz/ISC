const { Op, models } = require('../db')
const validator = require('validator')
const ordersModels = models.orders
const orderDetailModels = models.order_detail
const productModels = models.product
const _ = require('lodash')
const moment = require('moment')


const self = (module.exports = {
  getOrder: req => {
    const { startDate, endDate, status, page, limit } = req.query
    const calPage = (page - 1) * limit
    ordersModels.hasMany(orderDetailModels, { foreignKey: "oId", sourceKey: "oId" })
    orderDetailModels.hasOne(productModels, { foreignKey: "pId", sourceKey: "pId" })
    return ordersModels.findAll({
      include: [
        {
          model: orderDetailModels,
          required: true,
          separate: true,
          include: [
            {
              model: productModels,
              required: true
            }
          ]
        }
      ],
      where: {
        [Op.and]: [
          status ? { oStatus: status } : null,
          startDate ? {
            startDate: {
              [Op.gte]: startDate
            }
          } : null,
          endDate ? {
            endDate: {
              [Op.lte]: endDate
            }
          } : null
        ],
      },

      offset: page ? calPage : null, limit: limit ? parseInt(limit) : null,
      subQuery: false,
    })
  },
  setOrder: async (orderList = [], setOneRow = false) => {
    let results = []
    await Promise.all(
      orderList.map(data => {
        let row = {
          orderId: data.oId,
          shippingAddress: data.oAddress,
          orderStatus: data.oStatus,
          startDate: moment(data.startDate).format('YYYY-MM-DD HH:mm:ss'),
          endDate: moment(data.endDate).format('YYYY-MM-DD HH:mm:ss'),
          paidDate: data.paidDate ? moment(data.paidDate).format('YYYY-MM-DD HH:mm:ss') : '',
          orderDetail: data.order_details.map(item => {
            return {
              orderDetailId: item.odId,
              orderId: item.oId,
              productId: item.pId,
              productGender: item.product.pGender,
              productStyle: item.product.pStyle,
              productSize: item.product.pSize,
              productPrice: item.product.pPrice,
            }
          })
        }
        results.push(row)
      })
    )
    const resultOne = results[0] || []
    return setOneRow ? resultOne : _.orderBy(results, ['orderId'], ['asc'])
  },
  create: req => {
    const { orderList, shippingAddress, orderStatus, startDate, endDate, paidDate } = req.body
    console.log(paidDate)
    return ordersModels.create({
      oAddress: shippingAddress,
      oStatus: orderStatus,
      startDate: startDate,
      endDate: endDate,
      paidDate: paidDate
    }).then(async result => {
      let createData = orderList.map(productId => {
        return {
          oId: result.oId,
          pId: productId
        }
      })
      await orderDetailModels.bulkCreate(createData)
    })
  },
  update: async req => {
    const { orderList, shippingAddress, orderStatus, startDate, endDate, paidDate } = req.body
    const { orderId } = req.params
    await orderDetailModels.destroy({
      where: {
        oId: orderId
      }
    })
    let createData = orderList.map(productId => {
      return {
        oId: orderId,
        pId: productId
      }
    })
    await orderDetailModels.bulkCreate(createData)
    ordersModels.update({
      oAddress: shippingAddress,
      oStatus: orderStatus,
      startDate: startDate,
      endDate: endDate,
      paidDate: paidDate,
    }, {
      where: {
        oId: orderId,
      },
    })
  },
})

