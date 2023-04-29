const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('orgdb', 'root', 'password', {
  host: 'localhost',
  dialect: 'mysql',
});

module.exports = sequelize;