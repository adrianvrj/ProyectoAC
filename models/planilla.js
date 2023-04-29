const { DataTypes } = require('sequelize');
const sequelize = require('../db');

const Planilla = sequelize.define('PLANILLAEMPLEADO', {
  nplanilla: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  cedula: {
    type: DataTypes.MEDIUMINT,
    allowNull: false,
  },
  deduccionesobrero: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  deduccionespatronales: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  impuestorentasalario: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  salariobruto: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  salariototal: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  fecha: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
});

module.exports = Planilla;