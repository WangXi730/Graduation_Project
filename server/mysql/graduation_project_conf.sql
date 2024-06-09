CREATE DATABASE `graduation_project`;

USE `graduation_project`;

CREATE TABLE tb_user (
    id BIGINT(20) NOT NULL PRIMARY KEY,
    username VARCHAR(20),
    password VARCHAR(20)
);


CREATE TABLE db_buffer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    char_column CHAR(10),
    bigint_column BIGINT
);

insert into db_buffer values(1,'user id',1000000000);
insert into db_buffer values(2,'group id',1000000000);

CREATE TABLE group_map (
    group_id BIGINT(20) NOT NULL PRIMARY KEY,
    user_list TEXT,
    user_count SMALLINT(6)
);

CREATE TABLE tb_index (
    data_name VARCHAR(20),
    data_table VARCHAR(20)
);

insert into tb_index values('username','tb_user');
insert into tb_index values('password','tb_user');

CREATE TABLE game_list (
    name CHAR(40) PRIMARY KEY,
    url TEXT
);

