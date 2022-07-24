const express = require('express')
const router = express.Router()
const Order = require('../functions/Order')

router.get('/', async (req, res) => {
  let results = await Order.getOrder(req)
  results = await Order.setOrder(results)
  res.status(200).send({
    status: 200,
    message: 'Get Success',
    results
  })
})

router.post('/', async (req, res) => {
  await Order.create(req)
  res.status(201).send({
    status: 201,
    message: 'Created',
  })
})

router.put('/:orderId', async (req, res) => {
  await Order.update(req)
  res.status(201).send({
    status: 201,
    message: 'Updated',
  })
})




module.exports = router