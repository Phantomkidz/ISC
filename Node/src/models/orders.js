const Sequelize = require('sequelize')
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('orders', {
    oId: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      field: 'o_id'
    },
    oAddress: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'o_address'
    },
    oStatus: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'o_status'
    },
    startDate: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'start_date'
    },
    endDate: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'end_date'
    },
    paidDate: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'paid_date'
    }
  }, {
    sequelize,
    tableName: 'orders',
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
          { name: "o_id" },
        ]
      },
    ]
  })
}
