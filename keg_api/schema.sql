DROP TABLE IF EXISTS adjectives;
DROP TABLE IF EXISTS nouns;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS tavern_name_formats;
DROP TABLE IF EXISTS tavern_locations;
DROP TABLE IF EXISTS tavern_buildings;
DROP TABLE IF EXISTS tavern_owner;
DROP TABLE IF EXISTS tavern_atmosphere;
DROP TABLE IF EXISTS tavern_tonights_menu;
DROP TABLE IF EXISTS tavern_environmental_flavour;
DROP TABLE IF EXISTS tavern_main_activity;
DROP TABLE IF EXISTS tavern_relevant_activity;
DROP TABLE IF EXISTS tavern_condition_of_rooms;
DROP TABLE IF EXISTS tavern_cost_of_rooms;


CREATE TABLE adjectives (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	adjective TEXT UNIQUE NOT NULL
);

CREATE TABLE nouns (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	noun TEXT UNIQUE NOT NULL
);

CREATE TABLE locations (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	location TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_name_formats (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	format TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_locations (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	location TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_buildings (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	building TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_owner (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	owner TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_atmosphere (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	atmosphere TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_tonights_menu (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	tonights_menu TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_environmental_flavour (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	environmental_flavour TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_main_activity (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	main_activity TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_relevant_activity (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	relevant_activity TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_condition_of_rooms (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	condition_of_rooms TEXT UNIQUE NOT NULL
);

CREATE TABLE tavern_cost_of_rooms (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	cost_of_rooms TEXT UNIQUE NOT NULL
);
