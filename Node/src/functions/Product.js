const { Op, models } = require('../db')
const validator = require('validator')
const productModel = models.product
var _ = require('lodash')

const self = (module.exports = {
  getProduct: req => {
    const { productId } = req.params
    const { gender, style, size, page, limit } = req.query
    const calPage = (page - 1) * limit
    return productModel.findAll({
      where: {
        [Op.and]: [productId ? { pId: productId } : null,
        gender ? { pGender: gender } : null,
        style ? {
          pStyle: {
            [Op.like]: `%${style}%`
          }
        } : null,
        size ? { pSize: size } : null,
        ],
      },
      offset: page ? calPage : null, limit: limit ? parseInt(limit) : null,
      subQuery: false,
    })
  },
  setProduct: async (productList = [], setOneRow = false) => {
    let results = []
    await Promise.all(
      productList.map(data => {
        let row = {
          productId: data.pId,
          productGender: data.pGender,
          productStyle: data.pStyle,
          productSize: data.pSize,
          productPrice: data.pPrice,
        }
        results.push(row)
      })
    )
    const resultOne = results[0] || []
    return setOneRow ? resultOne : results
  }
})


