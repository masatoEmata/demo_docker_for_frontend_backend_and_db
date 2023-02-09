create database mydb;

use mydb;

create table tasks (
  id int primary key auto_increment,
  title varchar(255) not null,
  created_at timestamp not null default current_timestamp
);

insert into tasks (title) values
('dev front env'),
('dev back end');

create user 'myuser'@'%' identified by 'password';

grant select,insert,update,delete on mydb.* to 'myuser'@'%';
