var express = require('express');
var mysql = require('mysql');

var app = express();
var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '12345'
});

connection.connect();

app.get('/', function(req, res) {
	connection.query("select human.human_id as id, human.name as name, count(ideas.idea_id) as num_ideas from human left join ideas on (human.brain_id = ideas.brain_id) group by id limit 100",
		function (err, rows, fields) {
			if (err) {
				console.log("DB read error");
				throw err;
			}

			var result = "";
			if (rows != null && rows.length > 0) {
				for (var i=0; i<rows.length; i++) {
					result += rows[i].name + " (" + rows[i].num_ideas + ")\n";
				}
			}

			res.send(result);
		});
});

app.listen(3000);
