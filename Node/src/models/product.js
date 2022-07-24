const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('product', {
    pId: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      field: 'p_id'
    },
    pGender: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'p_gender'
    },
    pStyle: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'p_style'
    },
    pSize: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'p_size'
    },
    pPrice: {
      type: DataTypes.INTEGER,
      allowNull: true,
      field: 'p_price'
    }
  }, {
    sequelize,
    tableName: 'product',
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
          { name: "p_id" },
        ]
      },
    ]
  });
};
