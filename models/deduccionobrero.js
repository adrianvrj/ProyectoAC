const { DataTypes } = require('sequelize');
const sequelize = require('../db');

const DeduccionObrero = sequelize.define('DEDUCCIONESOBRERO', {
  fecha: {
    type: DataTypes.DATE,
    primaryKey: true,
  },
  cedula: {
    type: DataTypes.MEDIUMINT,
    primaryKey: true,
  },
  ccss: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  bancopopular: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  asociocionsolidarista: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
});
module.exports = DeduccionObrero;