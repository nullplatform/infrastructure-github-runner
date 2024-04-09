const http = require('http');
const hostname = '0.0.0.0';
const port = 8080;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end('{ "status": "ok" }');
});

server.listen(port, hostname, () => {
  console.log(`Server is running on port ${port}`);
});
