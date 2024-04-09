const { createServer } = require('node:http');
const hostname = '0.0.0.0';
const port = 8080;

const server = createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end('{ "status": "ok" }');
});

server.listen(port, hostname, () => {
  console.log(`Listening on ${hostname}:${port}`);
});
