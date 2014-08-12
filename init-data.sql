create database `main`;
use `main`;

create table `human` (
	human_id int auto_increment primary key,
	name varchar(32),
<<<<<<< HEAD
	brain_id int not null unique) enigne InnoDB;

create table `brains` (
	brain_id int not null primary key,
=======
	brain_id int not null unique) engine InnoDB;

create table `brains` (
	brain_id int auto_increment primary key,
>>>>>>> 62a41da... Simple service #1
	iq_level int,
	foreign key (brain_id) references human(brain_id) on delete cascade) engine InnoDB;

create table `ideas` (
	idea_id int auto_increment primary key,
	content text,
	brain_id int not null,
	foreign key (brain_id) references brains(brain_id) on delete cascade) engine InnoDB;
<<<<<<< HEAD
=======

insert into `human`
	(name, brain_id) values
	("Aristotle", 1),("Socrates", 2),("Einstein", 3), ("George W. Bush", 4);

insert into `brains`
	(brain_id, iq_level) values
	(1, 150), (2, 160), (3, 170), (4, 50);

insert into `ideas`
	(brain_id, content) values
	(1, "Love is composed of a single soul inhabiting two bodies."),
	(1, "It is the mark of an educated mind to be able to entertain a thought without accepting it."),
	(1, "The roots of education are bitter, but the fruit is sweet."),
	(2, "I know that I am intelligent, because I know that I know nothing."),
	(2, "By all means, marry. If you get a good wife, you'll become happy; if you get a bad one, you'll become a philosopher."),
	(2, "The only true wisdom is in knowing you know nothing."),
	(2, "Beware the barrenness of a busy life."),
	(2, "Wisdom begins in wonder."),
	(2, "He is richest who is content with the least, for content is the wealth of nature."),
	(3, "Learn from yesterday, live for today, hope for tomorrow. The important thing is not to stop questioning."),
	(3, "You have to learn the rules of the game. And then you have to play better than anyone else."),
	(3, "Try not to become a man of success, but rather try to become a man of value."),

	(3, "The difference between stupidity and genius is that genius has its limits."),
	(3, "We cannot solve our problems with the same thinking we used when we created them."),
	(4, "I want to thank you for taking time out of your day to come and witness my hanging."),
	(4, "It's clearly a budget. It's got a lot of numbers in it."),
	(4, "I have a different vision of leadership. A leadership is someone who brings people together."),
	(4, "I just want you to know that, when we talk about war, we're really talking about peace.");
>>>>>>> 62a41da... Simple service #1
