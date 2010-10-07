-- phpMyAdmin SQL Dump
-- version 3.1.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Jeu 07 Octobre 2010 à 19:32
-- Version du serveur: 5.1.30
-- Version de PHP: 5.2.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `generateur`
--

-- --------------------------------------------------------

--
-- Structure de la table `gen_adjectifs`
--

CREATE TABLE IF NOT EXISTS `gen_adjectifs` (
  `id_adj` int(11) NOT NULL AUTO_INCREMENT,
  `id_dico` int(11) NOT NULL,
  `elision` int(11) NOT NULL,
  `prefix` varchar(255) COLLATE utf8_bin NOT NULL,
  `m_s` varchar(255) COLLATE utf8_bin NOT NULL,
  `f_s` varchar(255) COLLATE utf8_bin NOT NULL,
  `m_p` varchar(255) COLLATE utf8_bin NOT NULL,
  `f_p` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_adj`),
  KEY `id_dico` (`id_dico`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2178 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_complements`
--

CREATE TABLE IF NOT EXISTS `gen_complements` (
  `id_cpm` int(11) NOT NULL AUTO_INCREMENT,
  `id_dico` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `ordre` int(11) NOT NULL,
  `lib` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_cpm`),
  KEY `id_dico` (`id_dico`),
  KEY `num` (`num`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=133 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_concepts`
--

CREATE TABLE IF NOT EXISTS `gen_concepts` (
  `id_concept` int(11) NOT NULL AUTO_INCREMENT,
  `id_dico` int(11) NOT NULL,
  `lib` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_concept`),
  KEY `id_dico` (`id_dico`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6882 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_concepts_adjectifs`
--

CREATE TABLE IF NOT EXISTS `gen_concepts_adjectifs` (
  `id_concept` int(11) NOT NULL,
  `id_adj` int(11) NOT NULL,
  PRIMARY KEY (`id_concept`,`id_adj`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gen_concepts_conjugaisons`
--

CREATE TABLE IF NOT EXISTS `gen_concepts_conjugaisons` (
  `id_concept` int(11) NOT NULL,
  `id_conj` int(11) NOT NULL,
  PRIMARY KEY (`id_concept`,`id_conj`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gen_concepts_generateurs`
--

CREATE TABLE IF NOT EXISTS `gen_concepts_generateurs` (
  `id_concept` int(11) NOT NULL,
  `id_gen` int(11) NOT NULL,
  PRIMARY KEY (`id_concept`,`id_gen`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gen_concepts_substantifs`
--

CREATE TABLE IF NOT EXISTS `gen_concepts_substantifs` (
  `id_concept` int(11) NOT NULL,
  `id_sub` int(11) NOT NULL,
  PRIMARY KEY (`id_concept`,`id_sub`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gen_concepts_syntagmes`
--

CREATE TABLE IF NOT EXISTS `gen_concepts_syntagmes` (
  `id_concept` int(11) NOT NULL,
  `id_syn` int(11) NOT NULL,
  PRIMARY KEY (`id_concept`,`id_syn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gen_concepts_verbes`
--

CREATE TABLE IF NOT EXISTS `gen_concepts_verbes` (
  `id_concept` int(11) NOT NULL,
  `id_verbe` int(11) NOT NULL,
  PRIMARY KEY (`id_concept`,`id_verbe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gen_conjugaisons`
--

CREATE TABLE IF NOT EXISTS `gen_conjugaisons` (
  `id_conj` int(11) NOT NULL AUTO_INCREMENT,
  `id_dico` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `modele` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_conj`),
  KEY `num` (`num`),
  KEY `id_dico` (`id_dico`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=104 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_determinants`
--

CREATE TABLE IF NOT EXISTS `gen_determinants` (
  `id_dtm` int(11) NOT NULL AUTO_INCREMENT,
  `id_dico` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `ordre` int(11) NOT NULL,
  `lib` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_dtm`),
  KEY `num` (`num`),
  KEY `id_dico` (`id_dico`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=362 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_dicos`
--

CREATE TABLE IF NOT EXISTS `gen_dicos` (
  `id_dico` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `maj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url_source` varchar(255) COLLATE utf8_bin NOT NULL,
  `path_source` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_dico`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_generateurs`
--

CREATE TABLE IF NOT EXISTS `gen_generateurs` (
  `id_gen` int(11) NOT NULL AUTO_INCREMENT,
  `id_dico` int(11) NOT NULL,
  `valeur` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_gen`),
  KEY `id_dico` (`id_dico`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4788 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_substantifs`
--

CREATE TABLE IF NOT EXISTS `gen_substantifs` (
  `id_sub` int(11) NOT NULL AUTO_INCREMENT,
  `id_dico` int(11) NOT NULL,
  `elision` int(11) NOT NULL,
  `prefix` varchar(255) COLLATE utf8_bin NOT NULL,
  `s` varchar(255) COLLATE utf8_bin NOT NULL,
  `p` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_sub`),
  KEY `id_dico` (`id_dico`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8028 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_syntagmes`
--

CREATE TABLE IF NOT EXISTS `gen_syntagmes` (
  `id_syn` int(11) NOT NULL AUTO_INCREMENT,
  `id_dico` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `ordre` int(11) NOT NULL,
  `lib` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_syn`),
  KEY `num` (`num`),
  KEY `id_dico` (`id_dico`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=389 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_terminaisons`
--

CREATE TABLE IF NOT EXISTS `gen_terminaisons` (
  `id_trm` int(11) NOT NULL AUTO_INCREMENT,
  `id_conj` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `lib` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_trm`),
  KEY `id_verbe` (`id_conj`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3116 ;

-- --------------------------------------------------------

--
-- Structure de la table `gen_verbes`
--

CREATE TABLE IF NOT EXISTS `gen_verbes` (
  `id_verbe` int(11) NOT NULL AUTO_INCREMENT,
  `id_conj` int(11) NOT NULL,
  `id_dico` int(11) NOT NULL,
  `elision` int(11) NOT NULL,
  `prefix` varchar(255) COLLATE utf8_bin NOT NULL,
  `modele` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_verbe`),
  KEY `id_dico` (`id_dico`),
  KEY `id_conj` (`id_conj`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2692 ;
