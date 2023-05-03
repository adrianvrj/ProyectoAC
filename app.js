const express = require('express');
const path = require('path');
const Sequelize = require('sequelize');
const app = express();
const paginate = require('paginate-array');
const sequelize = require('./db');
const Emplyee = require('./models/employee');
const Planilla = require('./models/planilla');
const DeduccionObrero = require('./models/deduccionobrero');

sequelize.sync({ force: false })
  .then(() => {
    console.log('Database synchronized');
  })
  .catch((error) => {
    console.error('Error synchronizing the database:', error);
  });

app.set('view engine', 'ejs');
//utilizar .ejs para las views en el folder de views
app.set('views', path.join(__dirname, 'views'));

//json parser para las consultas a bd
app.use(express.json({ limit: '10000mb', extended: true }));
app.use(express.urlencoded({ limit: '10000mb', extended: true, parameterLimit: 500000000 }));
app.use(express.text({ limit: '10000mb' }));

app.use(express.static('public'));
app.use(express.static('files'));
app.use(express.static(path.join(__dirname, 'public')))

app.get('/', async function (req, res) {
  const op = Sequelize.Op;
  const d = new Date();
  let month = d.getMonth() + 1;
  let year = d.getFullYear();
  var planilla = await Planilla.findAll({
    where: {
      [op.and]: [
        Sequelize.where(Sequelize.fn('MONTH', Sequelize.col('fecha')), month),
        Sequelize.where(Sequelize.fn('YEAR', Sequelize.col('fecha')), year),
      ],
    },
  });
  var planillas = [];
  planilla.forEach(empleado => {
    var reg = {
      nplanilla: empleado.dataValues.nplanilla,
      cedula: empleado.dataValues.cedula,
      deduccionesobrero: empleado.dataValues.deduccionesobrero,
      deduccionespatronales: empleado.dataValues.deduccionespatronales,
      impuestorentasalario: empleado.dataValues.impuestorentasalario,
      salariobruto: empleado.dataValues.salariobruto,
      salariototal: empleado.dataValues.salariototal,
      fecha: empleado.dataValues.fecha,
      createdAt: null,
      updatedAt: null
    }
    planillas.push(reg);
  });
  const currentPage = parseInt(req.query.page) || 1;
  const pageSize = 5; // Number of items per page

  const paginatedData = paginate(planilla, currentPage, pageSize);

  res.render("index", {
    planillas: JSON.stringify(planillas),
    mes: month,
    data: paginatedData 
  });
});

app.get('/report/:cedula/:fecha/:nplanilla', async (req, res) => {
  const { cedula, fecha, nplanilla } = req.params;
  var resp = (await sequelize.query('SELECT * FROM DEDUCCIONESOBREROS WHERE FECHA = "' + fecha + '" AND CEDULA = ' + cedula + ' LIMIT 1;'));
  const obrero = resp[0];
  resp = (await sequelize.query('SELECT * FROM DEDUCCIONESPATRONALES WHERE FECHA = "' + fecha + '" AND CEDULA = ' + cedula + ' LIMIT 1;'));
  const patronales = resp[0];
  const planilla = await Planilla.findByPk(nplanilla);
  if (obrero[0].ASOCIACIONSOLIDARISTA == null) {
    obrero[0].ASOCIACIONSOLIDARISTA = 0
  }
  const reporte = {
    nplanilla: nplanilla,
    cedula: cedula,
    ccssobrero: obrero[0].CCSS,
    bpobrero: obrero[0].BANCOPOPULAR,
    as: obrero[0].ASOCIACIONSOLIDARISTA,
    totalobrero: planilla.deduccionesobrero,
    ccsspatronal: patronales[0].CCSS,
    aguinaldo: patronales[0].AGUINALDO,
    cesantia: patronales[0].CESANTIA,
    vacaciones: patronales[0].VACACIONES,
    ins: patronales[0].RIESGOTRABAJOINS,
    totalpatronales: planilla.deduccionespatronales,
    salariobruto: planilla.salariobruto,
    salariototal: planilla.salariototal,
    fecha: planilla.fecha
  }
  res.render('report', {
    reporte: reporte
  });
});

app.post('/filtrarPlanilla', async (req, res) => {
  const op = Sequelize.Op;
  const d = new Date();
  let month = req.body.mes;
  let year = req.body.anio;
  var planilla = await Planilla.findAll({
    where: {
      [op.and]: [
        Sequelize.where(Sequelize.fn('MONTH', Sequelize.col('fecha')), month),
        Sequelize.where(Sequelize.fn('YEAR', Sequelize.col('fecha')), year),
      ],
    },
  });
  var planillas = [];
  planilla.forEach(empleado => {
    var reg = {
      nplanilla: empleado.dataValues.nplanilla,
      cedula: empleado.dataValues.cedula,
      deduccionesobrero: empleado.dataValues.deduccionesobrero,
      deduccionespatronales: empleado.dataValues.deduccionespatronales,
      impuestorentasalario: empleado.dataValues.impuestorentasalario,
      salariobruto: empleado.dataValues.salariobruto,
      salariototal: empleado.dataValues.salariototal,
      fecha: empleado.dataValues.fecha,
      createdAt: null,
      updatedAt: null
    }
    planillas.push(reg);
  });
  res.render("index", {
    planillas: JSON.stringify(planillas),
    mes: month
  });
});

app.post('/generarPlanilla', async (req, res) => {
  await sequelize.query('CALL calcular_planilla_mes(' + req.body.mes + ');');
  res.redirect('/');
});

app.listen('9000', () => {
  console.log('Server running on port 9000');
});