#!/bin/bash


#nodeJS install and Adding PATH
#node.js v6 LTS
wget https://nodejs.org/dist/v6.10.1/node-v6.10.1-linux-x64.tar.xz
xz -d node-v6.10.1-linux-x64.tar.xz
tar -xvf node-v6.10.1-linux-x64.tar
mkdir /usr/local/node
mv node-v6.10.1-linux-x64 /usr/local/node/
rm -rf node-v6.10.1-linux-x64.tar
printf "export NODE_HOME=/usr/local/node/node-v6.10.1-linux-x64\nexport PATH=\$PATH:\$NODE_HOME/bin" >> /etc/profile
source /etc/profile

git --version
node --version
npm --version

#4
npm install -g webpack webpack-dev-server
#5 
mkdir react_project
#
cd react_project
#
npm init -y
#7 
npm install --save react react-dom
#8 
npm install --save-dev babel-core babel-loader babel-preset-es2015 babel-preset-react
npm install --save-dev react-hot-loader webpack webpack-dev-server
sed -i 's/&& exit 1\"/&,\n\t"dev-server": "webpack-dev-server"/' package.json
#9 
printf "var webpack = require('webpack');\nmodule.exports = {\n\tentry: './src/index.js',\n\n\toutput: {\n\t\tpath:__dirname + '/public/',\n\t\tfilename: 'bundle.js'\n},\n\ndevServer: {\n\thot:true,\n\tinline: true,\n\thost: '0.0.0.0',\n\tport: 4000,\n\tcontentBase: __dirname + '/public/',\n},\n\nmodule: {\n\tloaders: [\n\t\t{\n\t\t\ttest: /\\.js$/,\n\t\t\tloader: 'babel-loader',\n\t\t\texclude: /node_modules/,\n\t\t\tquery: {\n\t\t\t\tcacheDirectory: true, \n\t\t\t\tpresets: ['es2015', 'react']\n\n\t\t\t}\n\t\t}\n\t]\n},\n\nplugins: [\n\tnew webpack.HotModuleReplacementPlugin()\n\t]\n};" > webpack.config.js
#10 
mkdir public
printf "<"'!'"DOCTYPE html>\n<html>\n<head>\n<meta charset=\"UTF-8\">\n<title>React Hello</title>\n</head>\n<body>\n\t<div id=\"title\">yangssem</div>\n\t<script src=\"bundle.js\"></script>\n</body>\n</html>" > public/index.html
#11 
mkdir -p src/components
printf "import React from 'react';\nclass App extends React.Component{\n\trender() {\n\t\treturn(\n\t\t\t\t<h1> Hello Yangssem</h1>\n\t\t);\n\t}\n}\nexport default App;\n" > src/components/App.js

#12 
printf "{\n\t\"esversion\":6\n}" > .jshintrc

#13 
printf "import React from 'react';\nimport ReactDOM from 'react-dom';\nimport App from './components/App';\n\nconst rootElement = document.getElementById('title');\nReactDOM.render(<App />, rootElement);" > src/index.js

#14

#16 

#mongod --version

