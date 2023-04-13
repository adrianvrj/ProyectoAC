const express = require('express');
const path = require('path');

const app = express();

app.set('view engine', 'ejs');
//utilizar .ejs para las views en el folder de views
app.set('views', path.join(__dirname, 'views'));

//json parser para las consultas a bd
app.use(express.json({limit: '10000mb', extended: true}));
app.use(express.urlencoded({limit: '10000mb', extended:true, parameterLimit:500000000}));
app.use(express.text({limit:'10000mb'}))

app.use(express.static('public'));
app.use(express.static('files'));
app.use(express.static(path.join(__dirname, 'public')))

app.get('/', function(req, res){
    res.render("index");
});

app.listen('9000', () =>{
    console.log('Server running on port 9000');
});