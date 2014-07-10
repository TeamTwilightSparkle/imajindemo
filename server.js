//	serversetup.js
//	make sure this reflects values in serversetup.js
var ipaddress = "192.168.1.9";
var port = "1110";
var rootaddress = 'http://'+ipaddress+'/imajindemo';
var serveraddress = 'http://'+ipaddress+':'+port;

var serverhost = "localhost";
var serveruser = "root";
var serverpassword = "mountain";
var serverdatabase = "imagine";

var http = require('http');
var url = require('url');
var mysql = require('mysql');
var qs = require('querystring');

var connection = mysql.createConnection({
    host: serverhost,
    user: serveruser,
    password: serverpassword,
    database: serverdatabase
});

http.createServer(function (request, response) {
	var pathname = url.parse(request.url).pathname;
	var parameter = pathname.split("/");
	
	console.log(parameter);
    if (parameter[1] == "compose" && parameter.length == 2 && request.method == 'POST') {
        var body = '';
        request.on('data', function (data) {
            body += data;

            // Too much POST data, kill the connection! Thank you stack overflow: http://stackoverflow.com/questions/4295782/how-do-you-extract-post-data-in-node-js
            if (body.length > 1e6)
                req.connection.destroy();
        });
        request.on('end', function () {
            var post = qs.parse(body);
			var theQuery = "INSERT INTO content (title, summary, description, username, last_modified, date_created) VALUES ('"+post['title']+"', '"+post['summary']+"', '"+post['description']+"', '"+post['username']+"', '12-12-12', '12-12-12')";
			connection.query(theQuery, function (error, rows, fields) {
				if (error) {
					console.log(error);
					response.writeHead(200, {
						'Access-Control-Allow-Origin': '*',
						'Content-Type': 'text/plain'
					});
					response.write(JSON.stringify(error));
					response.end();
				}
			});
			console.log(post);
        });
    }
	else if (parameter[1] == "newfeed" && parameter.length == 2 && request.method == 'POST') {
		connection.query('SELECT * FROM content ORDER BY id DESC', function (error, rows, fields) {
			response.writeHead(200, {
				'Access-Control-Allow-Origin': '*',
				'Content-Type': 'text/plain'
			});
			response.write(JSON.stringify(rows));
			response.end();
		});	
	}
	else if (parameter[1] == "login" && parameter.length == 2 && request.method == 'POST') {
		console.log("logging in");
        var body = '';
        request.on('data', function (data) {
            body += data;

            if (body.length > 1e6)
                req.connection.destroy();
        });
        request.on('end', function () {
            var post = qs.parse(body);
			var theQuery = "SELECT username FROM profile WHERE username='"+post['username']+"'";
			connection.query(theQuery, function (error, rows, fields) {
				response.writeHead(200, {
					'Access-Control-Allow-Origin': '*',
					'Content-Type': 'text/plain'
				});
				response.write(JSON.stringify(rows));
				response.end();
			});
			console.log(post);
        });
    }
	else if (parameter[1] == "signup" && parameter.length == 2 && request.method == 'POST') {
		console.log("signing up");
        var body = '';
        request.on('data', function (data) {
            body += data;

            if (body.length > 1e6)
                req.connection.destroy();
        });
        request.on('end', function () {
            var post = qs.parse(body);
			var theQuery = "INSERT INTO profile (id, username, level, last_seen, date_joined) VALUES (NULL, '"+post['username']+"', '0', '12-12-12', '12-12-12')";			
			connection.query(theQuery, function (error, rows, fields) {
				console.log(error);
				response.writeHead(200, {
					'Access-Control-Allow-Origin': '*',
					'Content-Type': 'text/plain'
				});
				response.write(JSON.stringify(error));
				response.end();
			});
			console.log(post);
        });
    }
	else if (parameter[1] == "charge" && parameter.length == 2 && request.method == 'POST') {
		console.log("charging");
        var body = '';
        request.on('data', function (data) {
            body += data;

            if (body.length > 1e6)
                req.connection.destroy();
        });
        request.on('end', function () {
            var post = qs.parse(body);
			var theQuery = "UPDATE content SET charges = charges + 1 WHERE id='"+post['id']+"'";		
			connection.query(theQuery, function (error, rows, fields) {
				console.log(error);
				response.writeHead(200, {
					'Access-Control-Allow-Origin': '*',
					'Content-Type': 'text/plain'
				});
				response.write(JSON.stringify(error));
				response.end();
			});
			console.log("Post: " + post);
        });
    }
	else if (parameter[1] == "idea" && parameter.length == 2 && request.method == 'POST') {
		console.log("getting idea");
        var body = '';
        request.on('data', function (data) {
            body += data;

            if (body.length > 1e6)
                req.connection.destroy();
        });
        request.on('end', function () {
            var post = qs.parse(body);
			var theQuery = "SELECT * FROM content WHERE id='"+post['id']+"'";	
			connection.query(theQuery, function (error, rows, fields) {
				console.log(error);
				response.writeHead(200, {
					'Access-Control-Allow-Origin': '*',
					'Content-Type': 'text/plain'
				});
				response.write(JSON.stringify(rows));
				response.end();
			});
			console.log("Post: " + post);
        });
	}
}).listen(port, ipaddress);
