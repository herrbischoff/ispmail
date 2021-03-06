DROP DATABASE mailserver;
CREATE DATABASE mailserver;

GRANT SELECT ON mailserver.*
TO 'mailuser'@'localhost'
IDENTIFIED BY 'fLxsWdf5ABLqwhZr';

CREATE TABLE `mailserver`.`virtual_domains` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mailserver`.`virtual_users` (
  `id` int(11) NOT NULL auto_increment,
  `domain_id` int(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mailserver`.`virtual_aliases` (
  `id` int(11) NOT NULL auto_increment,
  `domain_id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mailserver`.`virtual_domains` (
  `id` ,
  `name`
)
VALUES (
  '1', 'example.org'
);

INSERT INTO `mailserver`.`virtual_users` (
  `id` ,
  `domain_id` ,
  `password` ,
  `email`
)
VALUES (
  '1', '1', MD5( 'summersun' ) , 'john@example.org'
);

INSERT INTO `mailserver`.`virtual_aliases` (
  `id`,
  `domain_id`,
  `source`,
  `destination`
)
VALUES (
  '1', '1', 'jack@example.org', 'john@example.org'
);
