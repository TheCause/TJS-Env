## installation d'express
npm install express --save
## installation de json-server
npm install json-server --save

## creation de l'arborescence root de l'application

mkdir timelinejs
cd timelinejs

## Création de l'applicationjs
##echo "var express = require('express');var app = express();app.use(express.static('public'));app.listen(3000, function () {console.log('Timelinejs sur le port 3000');});" > app.js
echo "const jsonServer = require('json-server');const server = jsonServer.create();const router = jsonServer.router('./public/my.json');const middlewares = jsonServer.defaults();server.use(middlewares);server.get('/echo', (req, res) => {res.jsonp(req.query)});server.use(jsonServer.bodyParser);server.use((req, res, next) => {if (req.method === 'POST') {req.body.createdAt = Date.now()};next()});server.use(router);server.listen(3000, () => {console.log('JSON Server is running')});" > app.js


## Creation de l'arborescene public et récupération des fichiers js/css/font
mkdir public
cd public
wget https://raw.github.com/TheCause/TJS-Env/master/index.html

## Création du fichier my.json
wget https://raw.github.com/TheCause/TJS-Env/master/my.json

mkdir js
cd js
wget https://cdn.knightlab.com/libs/timeline3/latest/js/timeline.js
cd ..
mkdir css
cd css
wget https://cdn.knightlab.com/libs/timeline3/latest/css/timeline.css
mkdir fonts
cd fonts
wget https://cdn.knightlab.com/libs/timeline3/latest/css/fonts/font.default.css
cd ..
mkdir icons
cd icons
wget https://cdn.knightlab.com/libs/timeline3/latest/css/icons/tl-icons.ttf
wget https://cdn.knightlab.com/libs/timeline3/latest/css/icons/tl-icons.woff

cd ../../../
## suppression de l'initialisation de google analytics
sed -i $(grep -nr "this._initAnalytics();" public/js/timeline.js | cut -d: -f1)d public/js/timeline.js
