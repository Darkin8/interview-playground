create database `main`;
use `main`;

create table `human` (
	human_id int not null primary key,
	name varchar(32),
	brain_id int not null unique) enigne InnoDB;

create table `brains` (
	brain_id int not null primary key,
	iq_level int,
	foreign key (brain_id) references human(brain_id) on delete cascade) engine InnoDB;

create table `ideas` (
	idea_id int not null primary key,
	content text,
	brain_id int not null,
	foreign key (brain_id) references brains(brain_id) on delete cascade) engine InnoDB;