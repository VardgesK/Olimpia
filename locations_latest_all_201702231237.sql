CREATE TABLE `locations_latest_all` (
  `car_id` int(10) unsigned NOT NULL,
  `dt` datetime default NULL,
  `driver_id` int(10) unsigned default NULL, -- no
  `lat` double default NULL,
  `long` double default NULL,
  `alt` smallint(5) unsigned default NULL,
  `speed` smallint(5) unsigned default NULL,
  `heading` smallint(5) unsigned default NULL,
  `satellites` tinyint(3) unsigned default NULL,
  `fuel` smallint(5) unsigned default NULL, -- no
  `ext_voltage` smallint(5) unsigned default NULL, -- no
  `temperature` smallint(6) default NULL, -- no
  `signal_type` int(10) unsigned default NULL, -- no
  PRIMARY KEY  (`car_id`),
  KEY `locations_latest_driver_id__ix` (`driver_id`)
  -- , CONSTRAINT `locations_latest_car_id__cars_id__f_ix` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
  -- , CONSTRAINT `locations_latest_driver_id__drivers_id__f_ix` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO locatordb.locations_latest_all (`car_id`,`driver_id`,`lat`,`long`,`alt`,`speed`,`heading`,`satellites`,`fuel`,`ext_voltage`,`temperature`,`dt`,`signal_type`) VALUES
(26,NULL,40.160739,44.300842,868,0,112,10,0,0,0,'2017-02-23 12:36:36.000',4160)
,(28,NULL,40.403034,44.644573,1666,0,272,10,0,0,0,'2017-02-23 12:36:32.000',4160)
,(30,NULL,40.186419,44.512131,1029,0,20,8,0,0,0,'2017-02-23 12:36:35.000',64)
,(32,NULL,40.220454,44.501824,1141,49,222,9,0,0,0,'2017-02-23 12:37:32.000',4096)
,(33,NULL,40.128528,44.002112,872,63,57,10,0,0,0,'2017-02-23 12:37:32.000',4096)
,(34,NULL,40.205066,44.461776,1079,0,201,10,0,0,0,'2017-02-23 12:33:04.000',4160)
,(35,NULL,39.906032,44.670736,877,0,315,10,0,0,0,'2017-02-23 12:37:05.000',4160)
,(36,NULL,39.638382,46.552536,1199,0,258,8,0,0,0,'2014-05-31 11:55:21.000',0)
,(39,NULL,40.182547,44.568493,1373,0,266,9,0,0,0,'2017-02-23 12:36:19.000',64)
,(41,NULL,40.21121,44.519731,1206,0,92,10,0,0,0,'2017-02-23 12:33:45.000',64)
;



CREATE TABLE `tracking_tickets` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `car_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ticket_number` varchar(20),
  `display_name` varchar(64),
  `start_lat` double default NULL,
  `start_long` double default NULL,
  `finish_lat` double default NULL,
  `finish_long` double default NULL, 
  `expire_dt` date NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `tracking_tickets_car_id__ix` (`car_id`),
  KEY `tracking_tickets_user_id__ix` (`user_id`),
  KEY `tracking_tickets_ticket_number__ix` (`ticket_number`)
  -- , CONSTRAINT `tracking_tickets_user_id__users_id__f_ix` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
  -- , CONSTRAINT `tracking_tickets_car_id__cars_id__f_ix` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tracking_tickets` (`car_id`, `user_id`, `ticket_number`, `display_name`, `start_lat`, `start_long`, `finish_lat`, `finish_long`, `expire_dt`, `created_at`) VALUES
(26, 1, '4444-5555-ABCD-1111', 'Car 1', 40.265056, 44.531158, 40.215056, 44.431158, '2017-03-01', NOW())
,(28, 1, '4444-5555-ABCD-1112', 'Car 2', 40.265056, 44.531158, null, null, '2017-03-01', NOW())
,(30, 1, '4444-5555-ABCD-1113', 'Car 3', null, null, 40.215056, 44.431158, '2017-03-01', NOW())
,(32, 1, '4444-5555-ABCD-1114', 'Car 4', null, null, null, null, '2017-03-01', NOW())
,(33, 1, '4444-5555-ABCD-1115', 'Car 5', 40.265056, 44.531158, 40.215056, 44.431158, '2017-02-01', NOW())
;
