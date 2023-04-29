const { DataTypes } = require('sequelize');
const sequelize = require('../db');

const Emplyee = sequelize.define('EMPLEADO', {
  cedula: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    allowNull: false
  },
  isactive: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
  },
  nombre: {
    type: DataTypes.CHAR(100),
    allowNull: false,
  },
  apellido1: {
    type: DataTypes.CHAR(100),
    allowNull: false,
  },
  apellido2: {
    type: DataTypes.CHAR(100),
    allowNull: false,
  },
  salario: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  }
});

module.exports = Emplyee;