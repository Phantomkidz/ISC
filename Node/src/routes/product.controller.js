const express = require('express')
const router = express.Router()
const Product = require('../functions/Product')

router.get('/', async (req, res) => {
  let results = await Product.getProduct(req)
  results = await Product.setProduct(results)
  res.status(200).send({
    status: 200,
    message: 'success',
    results
  })
})

router.get('/:productId', async (req, res) => {
  let results = await Product.getProduct(req)
  results = await Product.setProduct(results, true)
  res.status(200).send({
    status: 200,
    message: 'success',
    results
  })
})



module.exports = router