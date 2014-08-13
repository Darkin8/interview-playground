var express = require('express');
var mysql = require('mysql');

var app = express();
var connection = mysql.createConnection({
	host: 'localhost',
	database: 'main',
	user: 'root',
	password: '12345'
});

var validator = require('validator');

connection.connect();

app.get('/', function(req, res) {
	connection.query("select human.human_id as id, human.name as name, count(ideas.idea_id) as num_ideas from human left join ideas on (human.brain_id = ideas.brain_id) group by id limit 100",
		function (err, rows, fields) {
			if (err) {
				console.log("DB read error");
				throw err;
			}

			var result = "/	      - list of authors\n" +
				     "/[author_id]  - list of ideas\n\n";
			if (rows != null && rows.length > 0) {
				for (var i=0; i<rows.length; i++) {
					result += rows[i].name + " (" + rows[i].num_ideas + ")" +
						"[id:" + rows[i].id + "]\n";
				}
			}

			res.send(result);
		});
});

app.get('/:author_id', function(req, res) {
	var id = req.param('author_id');
	if(validator.isInt(id)) {
		id = validator.toInt(id);
	} else {
		res.redirect('/');
		return;
	}
	
	connection.query("select human.name as name, ideas.content as content from ideas left join human on (ideas.brain_id = human.brain_id) where human.human_id = ?", [id],
		function(err, rows, fields) {
			if (err) {
				console.log("DB read error");
				throw err;
			}
			
			if (rows != null && rows.length > 0) {
				var result = "Great ideas of {" + rows[0].name + "}\n\n";
				for (var i=0; i<rows.length; i++) {
					result += (i + 1) + ". " + rows[i].content + "\n";
				}
				
				res.send(result);
			} else {
				res.redirect('/');
			}
		});
});

app.listen(3000);
