CREATE TABLE IF NOT EXISTS `cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` smallint(6) NOT NULL,
  `is_box` tinyint(1) NOT NULL,
  `is_saga` tinyint(1) NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BA29D7577153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` smallint(6) NOT NULL,
  `size` smallint(6) NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `date_release` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_97BE309877153098` (`code`),
  KEY `IDX_97BE30985EC1162` (`cycle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sphere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `octgnid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1835DB0077153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8CDE572977153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `sphere_id` int(11) DEFAULT NULL,
  `position` smallint(6) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `traits` varchar(255) DEFAULT NULL,
  `text` longtext,
  `flavor` longtext,
  `is_unique` tinyint(1) NOT NULL,
  `cost` smallint(6) DEFAULT NULL,
  `threat` smallint(6) DEFAULT NULL,
  `willpower` smallint(6) DEFAULT NULL,
  `attack` smallint(6) DEFAULT NULL,
  `defense` smallint(6) DEFAULT NULL,
  `health` smallint(6) DEFAULT NULL,
  `victory` smallint(6) DEFAULT NULL,
  `quest` smallint(6) DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  `deck_limit` smallint(6) NOT NULL,
  `illustrator` varchar(255) DEFAULT NULL,
  `octgnid` varchar(255) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `has_errata` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_161498D377153098` (`code`),
  KEY `IDX_161498D31919B217` (`pack_id`),
  KEY `IDX_161498D3C54C8C93` (`type_id`),
  KEY `IDX_161498D3CC00E937` (`sphere_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) NOT NULL,
  `username_canonical` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `email_canonical` varchar(180) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `date_creation` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `reputation` int(11) NOT NULL,
  `resume` longtext,
  `donation` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `deck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `last_pack_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `description_md` longtext,
  `problem` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4FAC3637A76ED395` (`user_id`),
  KEY `IDX_4FAC36376FBD9006` (`last_pack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `deckslot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deck_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E3FEA03B111948DC` (`deck_id`),
  KEY `IDX_E3FEA03B4ACC9A20` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `decklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `precedent_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `tournament_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `description_md` longtext,
  `signature` varchar(32) DEFAULT NULL,
  `nb_votes` int(11) NOT NULL,
  `nb_favorites` int(11) NOT NULL,
  `nb_comments` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ED030EC6A76ED395` (`user_id`),
  KEY `IDX_ED030EC6D909C2C2` (`precedent_id`),
  KEY `IDX_ED030EC6727ACA70` (`parent_id`),
  KEY `IDX_ED030EC633D1A3E7` (`tournament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `decklistslot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `decklist_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F8CAE53670AA3482` (`decklist_id`),
  KEY `IDX_F8CAE5364ACC9A20` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
