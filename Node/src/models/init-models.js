var DataTypes = require("sequelize").DataTypes;
var _order_detail = require("./order_detail");
var _orders = require("./orders");
var _product = require("./product");

function initModels(sequelize) {
  var order_detail = _order_detail(sequelize, DataTypes);
  var orders = _orders(sequelize, DataTypes);
  var product = _product(sequelize, DataTypes);


  return {
    order_detail,
    orders,
    product,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
