#drop database `concerts_db`;

create database `concerts_db`;

create table `concerts_db`.`artists`(
	`artist_id` varchar(255),
    `artist_name` varchar(255) not null,
    primary key (`artist_name`)
);

create table `concerts_db`.`venues`(
	`venue_id` int not null,
    `latitude` double,
    `longitude` double,
    `venue_name` varchar(255),
    `country` varchar(255),
    `city` varchar(255),
    `region` varchar(255),
    primary key(`venue_id`)
);

create table `concerts_db`.`events_table`(
		`event_id` int not null,
        `title` varchar(255),
        `datetime` timestamp,
		`description` varchar(255),
        `venue_id` int not null,
        primary key (`event_id`)
);
alter table `concerts_db`.`events_table` 
add constraint `FK_venues` 
foreign key (`venue_id`) references `concerts_db`.`venues`(`venue_id`) on delete cascade;

create table `concerts_db`.`partecipations`(
	`event_id` int not null,
	`artist_name` varchar(255) not null,
	primary key (`event_id`,`artist_name`)	
);
alter table `concerts_db`.`partecipations` 
add constraint `FK_events_table` 
foreign key (`event_id`) references `concerts_db`.`events_table`(`event_id`) on delete cascade;

alter table `concerts_db`.`partecipations` 
add constraint `FK_artists` 
foreign key (`artist_name`) references `concerts_db`.`artists`(`artist_name`) on delete cascade;

select * from `test`.`artists`;
select * from `test`.`venues`;
select * from `test`.`events_table`;
select * from `test`.`partecipations`;
