const http = require('http');
const server = http.createServer((req, res) => {
 res.writeHead(200, {'Content-Type': 'text/plain; charset=utf-8'}); 
 res.write('Hello Word');
 res.end();
});
server.listen(8080, () => {
 console.log('Application runningg...');
});