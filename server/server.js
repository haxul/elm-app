const http = require('http');

const server = http.createServer((req, res) => {
    if (req.url === '/json' && req.method === "GET") {
        res.writeHead(200, {'Content-Type': 'application/json', "Access-Control-Allow-Origin": "*"});
        const body = {
            "hello": "world",
            test: 1
        }
        res.write(JSON.stringify(body));
        res.end();
    } else if (req.url === "/test" && req.method === "POST") {
        res.writeHead(200, {'Content-Type': 'application/json', "Access-Control-Allow-Origin": "*"});
        const body = {
            "hello": "POST",
        }
        res.write(JSON.stringify(body));
        res.end();
    } else {
        res.end('Invalid request');
    }
});

server.listen(8080);
