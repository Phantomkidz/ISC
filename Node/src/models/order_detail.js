const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('order_detail', {
    odId: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      field: 'od_id'
    },
    oId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      comment: "FK order",
      field: 'o_id'
    },
    pId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      comment: "FK product",
      field: 'p_id'
    }
  }, {
    sequelize,
    tableName: 'order_detail',
    timestamps: false,
    freezeTableName: true,
    createdAt: false,
    updateAt: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "od_id" },
        ]
      },
    ]
  });
};
