-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 29, 2009 at 08:17 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mybestho_sma`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL auto_increment,
  `street` varchar(100) collate latin1_general_ci NOT NULL,
  `district` varchar(100) collate latin1_general_ci NOT NULL,
  `city` varchar(100) collate latin1_general_ci NOT NULL,
  `state` varchar(100) collate latin1_general_ci NOT NULL,
  `zip` varchar(100) collate latin1_general_ci NOT NULL,
  `country_id` int(11) NOT NULL default '77',
  PRIMARY KEY  (`address_id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` VALUES(1, '1 Test Drive', '', 'Testtown', '', 'TE57 1US', 77);
INSERT INTO `addresses` VALUES(2, '2 Test Drive', '', 'Testtown', '', 'TE57 2US', 0);
INSERT INTO `addresses` VALUES(3, '3 Test Drive', '', 'Testtown', '', 'TE57 3US', 0);
INSERT INTO `addresses` VALUES(4, '4 Test Drive', '', 'Testtown', '', 'TE57 4US', 0);
INSERT INTO `addresses` VALUES(5, '5 Test Drive', '', 'Testtown', '', 'TE57 5US', 77);
INSERT INTO `addresses` VALUES(6, '1 Test Lane', '', 'Testtown', '', 'TE57 1US', 77);
INSERT INTO `addresses` VALUES(7, '1 Test Road', '', 'Testtown', '', 'TE57 1US', 64);
INSERT INTO `addresses` VALUES(8, '1 Test Road', '', 'Testtown', 'Testshire', 'TE57 1US', 64);
INSERT INTO `addresses` VALUES(9, '1 Test Road', '', 'Testford', 'Testshire', 'TE57 1US', 64);
INSERT INTO `addresses` VALUES(10, '1 Test Road', '', 'Testford', 'Testshire', 'TE57 1US', 48);
INSERT INTO `addresses` VALUES(11, '1 Test Road', '', 'Testford', 'Testshire', 'TE57 1US', 77);
INSERT INTO `addresses` VALUES(12, 'hjhojhmjnhkid', '', 'fhihfrhmh', '', 'hjnghnhn', 77);
INSERT INTO `addresses` VALUES(13, '7 Pinova Close', 'Ifield', 'Crawley', 'West Sussex', 'RH11 7GL', 77);
INSERT INTO `addresses` VALUES(14, 'hhhhh', '', 'ghjjhhh', '', 'tgfhdfh', 77);
INSERT INTO `addresses` VALUES(15, 'Admin', '', 'Crawley', '', 'RH11 7GL', 77);
INSERT INTO `addresses` VALUES(16, 'Superuser', '', 'Crawley', '', 'RH11 7GL', 77);
INSERT INTO `addresses` VALUES(17, '3 Test Drive', '', 'Testford', '', 'TE5 7ZX', 77);
INSERT INTO `addresses` VALUES(18, '7 Pinova Close', '', 'Crawley', 'West Sussex', 'RH11 7GL', 77);
INSERT INTO `addresses` VALUES(19, 'g', 'g', 'g', 'g', 'g', 77);
INSERT INTO `addresses` VALUES(20, '', '', '', '', '', 77);
INSERT INTO `addresses` VALUES(21, 'o', '', 'o', 'o', 'o', 77);
INSERT INTO `addresses` VALUES(22, 'Admin', 'Admin', 'Admin', 'Admin', 'Admin', 77);

-- --------------------------------------------------------

--
-- Table structure for table `aliases`
--

CREATE TABLE `aliases` (
  `alias_id` int(11) NOT NULL auto_increment,
  `alias` varchar(100) collate latin1_general_ci NOT NULL,
  `description` text collate latin1_general_ci NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY  (`alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `aliases`
--

INSERT INTO `aliases` VALUES(1, 'Alias 1', '', 1);
INSERT INTO `aliases` VALUES(2, 'Alias 2', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aliasusers`
--

CREATE TABLE `aliasusers` (
  `aliasuser_id` int(11) NOT NULL auto_increment,
  `alias_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`aliasuser_id`),
  KEY `alias_id` (`alias_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `aliasusers`
--

INSERT INTO `aliasusers` VALUES(18, 2, 4);
INSERT INTO `aliasusers` VALUES(17, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL auto_increment,
  `categorytype_id` int(11) NOT NULL,
  `category` varchar(100) collate latin1_general_ci NOT NULL,
  `ordering` int(11) NOT NULL,
  `description` text collate latin1_general_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`),
  KEY `categorytype_id` (`categorytype_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` VALUES(1, 1, 'Category 1', 1000, 'Cat 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec cursus rhoncus risus non imperdiet. Praesent dolor metus, luctus vitae eleifend sit amet, viverra sit amet lacus. Proin convallis pulvinar augue, vitae ornare diam congue id. Nunc ante nisl, dapibus quis lobortis ut, rhoncus id velit. Donec ut lacus vitae nunc ultrices venenatis nec egestas orci. Etiam dapibus nunc diam.', 0, '2009-07-14 04:09:12', 1);
INSERT INTO `categories` VALUES(2, 1, 'Category 1 1', 1000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 1, '2009-07-14 05:08:00', 1);
INSERT INTO `categories` VALUES(3, 1, 'Category 1 2', 2000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 1, '2009-07-14 05:11:24', 1);
INSERT INTO `categories` VALUES(4, 1, 'Category 1 3', 3000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 1, '2009-07-14 05:11:52', 1);
INSERT INTO `categories` VALUES(5, 1, 'Category 2', 2000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 0, '2009-07-14 05:12:11', 1);
INSERT INTO `categories` VALUES(6, 1, 'Category 3', 3000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 0, '2009-07-14 05:12:48', 1);
INSERT INTO `categories` VALUES(7, 1, 'Category 3 1', 1000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 6, '2009-07-14 05:13:14', 1);
INSERT INTO `categories` VALUES(20, 3, 'Forum Category 2', 2000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 0, '2009-07-14 06:52:00', 1);
INSERT INTO `categories` VALUES(21, 3, 'Forum Category 3', 3000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 0, '2009-07-14 06:52:40', 0);
INSERT INTO `categories` VALUES(22, 3, 'Forum Category 3 1', 1000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 21, '2009-07-14 06:53:06', 1);
INSERT INTO `categories` VALUES(9, 1, 'Category 1 2 1', 1000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 3, '2009-07-14 05:14:02', 1);
INSERT INTO `categories` VALUES(10, 1, 'Category 1 2 2', 2000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 3, '2009-07-14 05:14:16', 1);
INSERT INTO `categories` VALUES(11, 1, 'Category 1 2 3', 3000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 3, '2009-07-14 05:14:32', 1);
INSERT INTO `categories` VALUES(12, 1, 'Category 1 2 2 1', 1000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 10, '2009-07-14 05:14:47', 1);
INSERT INTO `categories` VALUES(19, 3, 'Forum Category 1', 1000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 0, '2009-07-14 06:51:40', 1);
INSERT INTO `categories` VALUES(13, 1, 'Category 3 1 1', 1000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 7, '2009-07-14 06:48:36', 1);
INSERT INTO `categories` VALUES(14, 1, 'Category 3 1 2', 2000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 7, '2009-07-14 06:48:54', 1);
INSERT INTO `categories` VALUES(15, 1, 'Category 3 1 2 1', 1000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 14, '2009-07-14 06:49:23', 1);
INSERT INTO `categories` VALUES(16, 1, 'Category 3 1 2 2', 2000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 14, '2009-07-14 06:49:46', 1);
INSERT INTO `categories` VALUES(17, 1, 'Category 3 1 2 1 1', 1000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 15, '2009-07-14 06:50:23', 1);
INSERT INTO `categories` VALUES(18, 1, 'Category 4', 4000, 'Morbi ultrices, purus sed venenatis feugiat, lorem purus venenatis lacus, at sodales diam risus id velit. Mauris quam turpis, scelerisque vitae euismod sit amet, luctus vel leo. Phasellus luctus dignissim nibh eu tincidunt. Duis aliquam, diam eu tristique gravida, sem mi tempor turpis, sed viverra metus arcu ut diam. Maecenas tempus lobortis mauris, a convallis est luctus vitae. Nunc eleifend eleifend lobortis. In elit nisl, ornare eu viverra vel, vehicula vitae erat. In hac habitasse platea dictumst. Vivamus porttitor, est non dictum pulvinar, neque dui pulvinar metus, quis mattis neque est vitae augue. Phasellus in arcu interdum magna consequat vulputate. Suspendisse nec justo vel mauris sagittis convallis non a tortor. Donec dolor ante, dapibus at vehicula et, hendrerit vitae turpis. Aenean tristique, risus a varius bibendum, felis est mattis neque, nec posuere nunc leo at quam. ', 0, '2009-07-14 06:50:42', 1);
INSERT INTO `categories` VALUES(23, 1, 'Category 3 1 2 1 2', 2000, 'Curabitur lacinia turpis et risus sagittis euismod. Nunc vel velit sit amet eros rhoncus mattis et a elit. Mauris augue felis, imperdiet ut cursus quis, malesuada non mauris. Donec vitae neque metus, sit amet viverra nulla. Sed lacus sapien, facilisis et vestibulum id, interdum at magna. Cras vel velit quis metus lacinia rhoncus et eu nibh. Donec viverra suscipit odio, faucibus commodo massa cursus non. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi at mauris et dui ornare bibendum. Sed vel laoreet lacus. Sed ullamcorper metus fermentum augue dapibus a sodales ligula bibendum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam congue feugiat arcu, in elementum odio laoreet sit amet. Nam posuere aliquam consequat. Proin ultricies tincidunt iaculis. Nam cursus, orci at imperdiet tempus, lectus ipsum ultricies arcu, eget tincidunt magna magna nec justo. Sed at libero felis, vel aliquam massa. ', 15, '2009-07-15 04:09:31', 1);
INSERT INTO `categories` VALUES(24, 3, 'Forum Category 3 2', 2000, 'Curabitur lacinia turpis et risus sagittis euismod. Nunc vel velit sit amet eros rhoncus mattis et a elit. Mauris augue felis, imperdiet ut cursus quis, malesuada non mauris. Donec vitae neque metus, sit amet viverra nulla. Sed lacus sapien, facilisis et vestibulum id, interdum at magna. Cras vel velit quis metus lacinia rhoncus et eu nibh. Donec viverra suscipit odio, faucibus commodo massa cursus non. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi at mauris et dui ornare bibendum. Sed vel laoreet lacus. Sed ullamcorper metus fermentum augue dapibus a sodales ligula bibendum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam congue feugiat arcu, in elementum odio laoreet sit amet. Nam posuere aliquam consequat. Proin ultricies tincidunt iaculis. Nam cursus, orci at imperdiet tempus, lectus ipsum ultricies arcu, eget tincidunt magna magna nec justo. Sed at libero felis, vel aliquam massa. ', 21, '2009-07-15 04:10:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categorytypes`
--

CREATE TABLE `categorytypes` (
  `categorytype_id` int(11) NOT NULL auto_increment,
  `categorytype` varchar(100) collate latin1_general_ci NOT NULL,
  `ordering` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY  (`categorytype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categorytypes`
--

INSERT INTO `categorytypes` VALUES(1, 'events', 1000, 1);
INSERT INTO `categorytypes` VALUES(2, 'products', 3000, 0);
INSERT INTO `categorytypes` VALUES(3, 'forum', 2000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL auto_increment,
  `comment` text collate latin1_general_ci NOT NULL,
  `received` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`comment_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL auto_increment,
  `ISO_3166` char(2) collate latin1_general_ci NOT NULL,
  `country` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=247 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` VALUES(1, 'AD', 'Andorra');
INSERT INTO `countries` VALUES(2, 'AE', 'United Arab Emirates');
INSERT INTO `countries` VALUES(3, 'AF', 'Afghanistan');
INSERT INTO `countries` VALUES(4, 'AG', 'Antigua and Barbuda');
INSERT INTO `countries` VALUES(5, 'AI', 'Anguilla');
INSERT INTO `countries` VALUES(6, 'AL', 'Albania');
INSERT INTO `countries` VALUES(7, 'AM', 'Armenia');
INSERT INTO `countries` VALUES(8, 'AN', 'Netherlands Antilles');
INSERT INTO `countries` VALUES(9, 'AO', 'Angola');
INSERT INTO `countries` VALUES(10, 'AP', 'Asia/Pacific Region');
INSERT INTO `countries` VALUES(11, 'AQ', 'Antarctica');
INSERT INTO `countries` VALUES(12, 'AR', 'Argentina');
INSERT INTO `countries` VALUES(13, 'AS', 'American Samoa');
INSERT INTO `countries` VALUES(14, 'AT', 'Austria');
INSERT INTO `countries` VALUES(15, 'AU', 'Australia');
INSERT INTO `countries` VALUES(16, 'AW', 'Aruba');
INSERT INTO `countries` VALUES(17, 'AX', 'Aland Islands');
INSERT INTO `countries` VALUES(18, 'AZ', 'Azerbaijan');
INSERT INTO `countries` VALUES(19, 'BA', 'Bosnia and Herzegovina');
INSERT INTO `countries` VALUES(20, 'BB', 'Barbados');
INSERT INTO `countries` VALUES(21, 'BD', 'Bangladesh');
INSERT INTO `countries` VALUES(22, 'BE', 'Belgium');
INSERT INTO `countries` VALUES(23, 'BF', 'Burkina Faso');
INSERT INTO `countries` VALUES(24, 'BG', 'Bulgaria');
INSERT INTO `countries` VALUES(25, 'BH', 'Bahrain');
INSERT INTO `countries` VALUES(26, 'BI', 'Burundi');
INSERT INTO `countries` VALUES(27, 'BJ', 'Benin');
INSERT INTO `countries` VALUES(28, 'BM', 'Bermuda');
INSERT INTO `countries` VALUES(29, 'BN', 'Brunei Darussalam');
INSERT INTO `countries` VALUES(30, 'BO', 'Bolivia');
INSERT INTO `countries` VALUES(31, 'BR', 'Brazil');
INSERT INTO `countries` VALUES(32, 'BS', 'Bahamas');
INSERT INTO `countries` VALUES(33, 'BT', 'Bhutan');
INSERT INTO `countries` VALUES(34, 'BV', 'Bouvet Island');
INSERT INTO `countries` VALUES(35, 'BW', 'Botswana');
INSERT INTO `countries` VALUES(36, 'BY', 'Belarus');
INSERT INTO `countries` VALUES(37, 'BZ', 'Belize');
INSERT INTO `countries` VALUES(38, 'CA', 'Canada');
INSERT INTO `countries` VALUES(39, 'CC', 'Cocos (Keeling) Islands');
INSERT INTO `countries` VALUES(40, 'CD', 'The Democratic Republic of the Congo');
INSERT INTO `countries` VALUES(41, 'CF', 'Central African Republic');
INSERT INTO `countries` VALUES(42, 'CG', 'Congo');
INSERT INTO `countries` VALUES(43, 'CH', 'Switzerland');
INSERT INTO `countries` VALUES(44, 'CI', 'Cote d''Ivoire');
INSERT INTO `countries` VALUES(45, 'CK', 'Cook Islands');
INSERT INTO `countries` VALUES(46, 'CL', 'Chile');
INSERT INTO `countries` VALUES(47, 'CM', 'Cameroon');
INSERT INTO `countries` VALUES(48, 'CN', 'China');
INSERT INTO `countries` VALUES(49, 'CO', 'Colombia');
INSERT INTO `countries` VALUES(50, 'CR', 'Costa Rica');
INSERT INTO `countries` VALUES(51, 'CU', 'Cuba');
INSERT INTO `countries` VALUES(52, 'CV', 'Cape Verde');
INSERT INTO `countries` VALUES(53, 'CX', 'Christmas Island');
INSERT INTO `countries` VALUES(54, 'CY', 'Cyprus');
INSERT INTO `countries` VALUES(55, 'CZ', 'Czech Republic');
INSERT INTO `countries` VALUES(56, 'DE', 'Germany');
INSERT INTO `countries` VALUES(57, 'DJ', 'Djibouti');
INSERT INTO `countries` VALUES(58, 'DK', 'Denmark');
INSERT INTO `countries` VALUES(59, 'DM', 'Dominica');
INSERT INTO `countries` VALUES(60, 'DO', 'Dominican Republic');
INSERT INTO `countries` VALUES(61, 'DZ', 'Algeria');
INSERT INTO `countries` VALUES(62, 'EC', 'Ecuador');
INSERT INTO `countries` VALUES(63, 'EE', 'Estonia');
INSERT INTO `countries` VALUES(64, 'EG', 'Egypt');
INSERT INTO `countries` VALUES(65, 'EH', 'Western Sahara');
INSERT INTO `countries` VALUES(66, 'ER', 'Eritrea');
INSERT INTO `countries` VALUES(67, 'ES', 'Spain');
INSERT INTO `countries` VALUES(68, 'ET', 'Ethiopia');
INSERT INTO `countries` VALUES(69, 'EU', 'Europe');
INSERT INTO `countries` VALUES(70, 'FI', 'Finland');
INSERT INTO `countries` VALUES(71, 'FJ', 'Fiji');
INSERT INTO `countries` VALUES(72, 'FK', 'Falkland Islands (Malvinas)');
INSERT INTO `countries` VALUES(73, 'FM', 'Federated States of Micronesia');
INSERT INTO `countries` VALUES(74, 'FO', 'Faroe Islands');
INSERT INTO `countries` VALUES(75, 'FR', 'France');
INSERT INTO `countries` VALUES(76, 'GA', 'Gabon');
INSERT INTO `countries` VALUES(77, 'GB', 'United Kingdom');
INSERT INTO `countries` VALUES(78, 'GD', 'Grenada');
INSERT INTO `countries` VALUES(79, 'GE', 'Georgia');
INSERT INTO `countries` VALUES(80, 'GF', 'French Guiana');
INSERT INTO `countries` VALUES(81, 'GG', 'Guernsey');
INSERT INTO `countries` VALUES(82, 'GH', 'Ghana');
INSERT INTO `countries` VALUES(83, 'GI', 'Gibraltar');
INSERT INTO `countries` VALUES(84, 'GL', 'Greenland');
INSERT INTO `countries` VALUES(85, 'GM', 'Gambia');
INSERT INTO `countries` VALUES(86, 'GN', 'Guinea');
INSERT INTO `countries` VALUES(87, 'GP', 'Guadeloupe');
INSERT INTO `countries` VALUES(88, 'GQ', 'Equatorial Guinea');
INSERT INTO `countries` VALUES(89, 'GR', 'Greece');
INSERT INTO `countries` VALUES(90, 'GS', 'South Georgia and the South Sandwich Islands');
INSERT INTO `countries` VALUES(91, 'GT', 'Guatemala');
INSERT INTO `countries` VALUES(92, 'GU', 'Guam');
INSERT INTO `countries` VALUES(93, 'GW', 'Guinea-Bissau');
INSERT INTO `countries` VALUES(94, 'GY', 'Guyana');
INSERT INTO `countries` VALUES(95, 'HK', 'Hong Kong');
INSERT INTO `countries` VALUES(96, 'HM', 'Heard Island and McDonald Islands');
INSERT INTO `countries` VALUES(97, 'HN', 'Honduras');
INSERT INTO `countries` VALUES(98, 'HR', 'Croatia');
INSERT INTO `countries` VALUES(99, 'HT', 'Haiti');
INSERT INTO `countries` VALUES(100, 'HU', 'Hungary');
INSERT INTO `countries` VALUES(101, 'ID', 'Indonesia');
INSERT INTO `countries` VALUES(102, 'IE', 'Ireland');
INSERT INTO `countries` VALUES(103, 'IL', 'Israel');
INSERT INTO `countries` VALUES(104, 'IM', 'Isle of Man');
INSERT INTO `countries` VALUES(105, 'IN', 'India');
INSERT INTO `countries` VALUES(106, 'IO', 'British Indian Ocean Territory');
INSERT INTO `countries` VALUES(107, 'IQ', 'Iraq');
INSERT INTO `countries` VALUES(108, 'IR', 'Islamic Republic of Iran');
INSERT INTO `countries` VALUES(109, 'IS', 'Iceland');
INSERT INTO `countries` VALUES(110, 'IT', 'Italy');
INSERT INTO `countries` VALUES(111, 'JE', 'Jersey');
INSERT INTO `countries` VALUES(112, 'JM', 'Jamaica');
INSERT INTO `countries` VALUES(113, 'JO', 'Jordan');
INSERT INTO `countries` VALUES(114, 'JP', 'Japan');
INSERT INTO `countries` VALUES(115, 'KE', 'Kenya');
INSERT INTO `countries` VALUES(116, 'KG', 'Kyrgyzstan');
INSERT INTO `countries` VALUES(117, 'KH', 'Cambodia');
INSERT INTO `countries` VALUES(118, 'KI', 'Kiribati');
INSERT INTO `countries` VALUES(119, 'KM', 'Comoros');
INSERT INTO `countries` VALUES(120, 'KN', 'Saint Kitts and Nevis');
INSERT INTO `countries` VALUES(121, 'KP', 'Democratic People''s Republic of Korea');
INSERT INTO `countries` VALUES(122, 'KR', 'Republic of Korea');
INSERT INTO `countries` VALUES(123, 'KW', 'Kuwait');
INSERT INTO `countries` VALUES(124, 'KY', 'Cayman Islands');
INSERT INTO `countries` VALUES(125, 'KZ', 'Kazakhstan');
INSERT INTO `countries` VALUES(126, 'LA', 'Lao People''s Democratic Republic');
INSERT INTO `countries` VALUES(127, 'LB', 'Lebanon');
INSERT INTO `countries` VALUES(128, 'LC', 'Saint Lucia');
INSERT INTO `countries` VALUES(129, 'LI', 'Liechtenstein');
INSERT INTO `countries` VALUES(130, 'LK', 'Sri Lanka');
INSERT INTO `countries` VALUES(131, 'LR', 'Liberia');
INSERT INTO `countries` VALUES(132, 'LS', 'Lesotho');
INSERT INTO `countries` VALUES(133, 'LT', 'Lithuania');
INSERT INTO `countries` VALUES(134, 'LU', 'Luxembourg');
INSERT INTO `countries` VALUES(135, 'LV', 'Latvia');
INSERT INTO `countries` VALUES(136, 'LY', 'Libyan Arab Jamahiriya');
INSERT INTO `countries` VALUES(137, 'MA', 'Morocco');
INSERT INTO `countries` VALUES(138, 'MC', 'Monaco');
INSERT INTO `countries` VALUES(139, 'MD', 'Republic of Moldova');
INSERT INTO `countries` VALUES(140, 'ME', 'Montenegro');
INSERT INTO `countries` VALUES(141, 'MG', 'Madagascar');
INSERT INTO `countries` VALUES(142, 'MH', 'Marshall Islands');
INSERT INTO `countries` VALUES(143, 'MK', 'Macedonia');
INSERT INTO `countries` VALUES(144, 'ML', 'Mali');
INSERT INTO `countries` VALUES(145, 'MM', 'Myanmar');
INSERT INTO `countries` VALUES(146, 'MN', 'Mongolia');
INSERT INTO `countries` VALUES(147, 'MO', 'Macao');
INSERT INTO `countries` VALUES(148, 'MP', 'Northern Mariana Islands');
INSERT INTO `countries` VALUES(149, 'MQ', 'Martinique');
INSERT INTO `countries` VALUES(150, 'MR', 'Mauritania');
INSERT INTO `countries` VALUES(151, 'MS', 'Montserrat');
INSERT INTO `countries` VALUES(152, 'MT', 'Malta');
INSERT INTO `countries` VALUES(153, 'MU', 'Mauritius');
INSERT INTO `countries` VALUES(154, 'MV', 'Maldives');
INSERT INTO `countries` VALUES(155, 'MW', 'Malawi');
INSERT INTO `countries` VALUES(156, 'MX', 'Mexico');
INSERT INTO `countries` VALUES(157, 'MY', 'Malaysia');
INSERT INTO `countries` VALUES(158, 'MZ', 'Mozambique');
INSERT INTO `countries` VALUES(159, 'NA', 'Namibia');
INSERT INTO `countries` VALUES(160, 'NC', 'New Caledonia');
INSERT INTO `countries` VALUES(161, 'NE', 'Niger');
INSERT INTO `countries` VALUES(162, 'NF', 'Norfolk Island');
INSERT INTO `countries` VALUES(163, 'NG', 'Nigeria');
INSERT INTO `countries` VALUES(164, 'NI', 'Nicaragua');
INSERT INTO `countries` VALUES(165, 'NL', 'Netherlands');
INSERT INTO `countries` VALUES(166, 'NO', 'Norway');
INSERT INTO `countries` VALUES(167, 'NP', 'Nepal');
INSERT INTO `countries` VALUES(168, 'NR', 'Nauru');
INSERT INTO `countries` VALUES(169, 'NU', 'Niue');
INSERT INTO `countries` VALUES(170, 'NZ', 'New Zealand');
INSERT INTO `countries` VALUES(171, 'OM', 'Oman');
INSERT INTO `countries` VALUES(172, 'PA', 'Panama');
INSERT INTO `countries` VALUES(173, 'PE', 'Peru');
INSERT INTO `countries` VALUES(174, 'PF', 'French Polynesia');
INSERT INTO `countries` VALUES(175, 'PG', 'Papua New Guinea');
INSERT INTO `countries` VALUES(176, 'PH', 'Philippines');
INSERT INTO `countries` VALUES(177, 'PK', 'Pakistan');
INSERT INTO `countries` VALUES(178, 'PL', 'Poland');
INSERT INTO `countries` VALUES(179, 'PM', 'Saint Pierre and Miquelon');
INSERT INTO `countries` VALUES(180, 'PN', 'Pitcairn');
INSERT INTO `countries` VALUES(181, 'PR', 'Puerto Rico');
INSERT INTO `countries` VALUES(182, 'PS', 'Palestinian Territory');
INSERT INTO `countries` VALUES(183, 'PT', 'Portugal');
INSERT INTO `countries` VALUES(184, 'PW', 'Palau');
INSERT INTO `countries` VALUES(185, 'PY', 'Paraguay');
INSERT INTO `countries` VALUES(186, 'QA', 'Qatar');
INSERT INTO `countries` VALUES(187, 'RE', 'Reunion');
INSERT INTO `countries` VALUES(188, 'RO', 'Romania');
INSERT INTO `countries` VALUES(189, 'RS', 'Serbia');
INSERT INTO `countries` VALUES(190, 'RU', 'Russian Federation');
INSERT INTO `countries` VALUES(191, 'RW', 'Rwanda');
INSERT INTO `countries` VALUES(192, 'SA', 'Saudi Arabia');
INSERT INTO `countries` VALUES(193, 'SB', 'Solomon Islands');
INSERT INTO `countries` VALUES(194, 'SC', 'Seychelles');
INSERT INTO `countries` VALUES(195, 'SD', 'Sudan');
INSERT INTO `countries` VALUES(196, 'SE', 'Sweden');
INSERT INTO `countries` VALUES(197, 'SG', 'Singapore');
INSERT INTO `countries` VALUES(198, 'SH', 'Saint Helena');
INSERT INTO `countries` VALUES(199, 'SI', 'Slovenia');
INSERT INTO `countries` VALUES(200, 'SJ', 'Svalbard and Jan Mayen');
INSERT INTO `countries` VALUES(201, 'SK', 'Slovakia');
INSERT INTO `countries` VALUES(202, 'SL', 'Sierra Leone');
INSERT INTO `countries` VALUES(203, 'SM', 'San Marino');
INSERT INTO `countries` VALUES(204, 'SN', 'Senegal');
INSERT INTO `countries` VALUES(205, 'SO', 'Somalia');
INSERT INTO `countries` VALUES(206, 'SR', 'Suriname');
INSERT INTO `countries` VALUES(207, 'ST', 'Sao Tome and Principe');
INSERT INTO `countries` VALUES(208, 'SV', 'El Salvador');
INSERT INTO `countries` VALUES(209, 'SY', 'Syrian Arab Republic');
INSERT INTO `countries` VALUES(210, 'SZ', 'Swaziland');
INSERT INTO `countries` VALUES(211, 'TC', 'Turks and Caicos Islands');
INSERT INTO `countries` VALUES(212, 'TD', 'Chad');
INSERT INTO `countries` VALUES(213, 'TF', 'French Southern Territories');
INSERT INTO `countries` VALUES(214, 'TG', 'Togo');
INSERT INTO `countries` VALUES(215, 'TH', 'Thailand');
INSERT INTO `countries` VALUES(216, 'TJ', 'Tajikistan');
INSERT INTO `countries` VALUES(217, 'TK', 'Tokelau');
INSERT INTO `countries` VALUES(218, 'TL', 'Timor-Leste');
INSERT INTO `countries` VALUES(219, 'TM', 'Turkmenistan');
INSERT INTO `countries` VALUES(220, 'TN', 'Tunisia');
INSERT INTO `countries` VALUES(221, 'TO', 'Tonga');
INSERT INTO `countries` VALUES(222, 'TR', 'Turkey');
INSERT INTO `countries` VALUES(223, 'TT', 'Trinidad and Tobago');
INSERT INTO `countries` VALUES(224, 'TV', 'Tuvalu');
INSERT INTO `countries` VALUES(225, 'TW', 'Taiwan');
INSERT INTO `countries` VALUES(226, 'TZ', 'United Republic of Tanzania');
INSERT INTO `countries` VALUES(227, 'UA', 'Ukraine');
INSERT INTO `countries` VALUES(228, 'UG', 'Uganda');
INSERT INTO `countries` VALUES(229, 'UM', 'United States Minor Outlying Islands');
INSERT INTO `countries` VALUES(230, 'US', 'United States');
INSERT INTO `countries` VALUES(231, 'UY', 'Uruguay');
INSERT INTO `countries` VALUES(232, 'UZ', 'Uzbekistan');
INSERT INTO `countries` VALUES(233, 'VA', 'Holy See (Vatican City State)');
INSERT INTO `countries` VALUES(234, 'VC', 'Saint Vincent and the Grenadines');
INSERT INTO `countries` VALUES(235, 'VE', 'Venezuela');
INSERT INTO `countries` VALUES(236, 'VG', 'British Virgin Islands');
INSERT INTO `countries` VALUES(237, 'VI', 'U.S. Virgin Islands');
INSERT INTO `countries` VALUES(238, 'VN', 'Vietnam');
INSERT INTO `countries` VALUES(239, 'VU', 'Vanuatu');
INSERT INTO `countries` VALUES(240, 'WF', 'Wallis and Futuna');
INSERT INTO `countries` VALUES(241, 'WS', 'Samoa');
INSERT INTO `countries` VALUES(242, 'YE', 'Yemen');
INSERT INTO `countries` VALUES(243, 'YT', 'Mayotte');
INSERT INTO `countries` VALUES(244, 'ZA', 'South Africa');
INSERT INTO `countries` VALUES(245, 'ZM', 'Zambia');
INSERT INTO `countries` VALUES(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL auto_increment,
  `identifier` varchar(100) collate latin1_general_ci NOT NULL,
  `title` varchar(100) collate latin1_general_ci NOT NULL,
  `filename` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`document_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` VALUES(4, 'document1', 'Lorem ipsum dolor sit amet,', 'Autumn Leaves.jpg');
INSERT INTO `documents` VALUES(5, 'document2', 'In hac habitasse platea dictumst.', 'Creek.jpg');
INSERT INTO `documents` VALUES(6, 'document3', 'In risus nulla, ultricies a iaculis ut, pharetra vitae turpis. Donec ac neque dui. Aenean ut tristiq', 'Desert Landscape.jpg');
INSERT INTO `documents` VALUES(7, 'document4', 'tree', 'Tree.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `emailaliases`
--

CREATE TABLE `emailaliases` (
  `emailalias_id` int(11) NOT NULL auto_increment,
  `email_id` int(11) NOT NULL,
  `alias_id` int(11) NOT NULL,
  PRIMARY KEY  (`emailalias_id`),
  KEY `email_id` (`email_id`,`alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `emailaliases`
--

INSERT INTO `emailaliases` VALUES(9, 4, 1);
INSERT INTO `emailaliases` VALUES(10, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `emaillog`
--

CREATE TABLE `emaillog` (
  `emaillog_id` int(11) NOT NULL auto_increment,
  `email_id` int(11) NOT NULL,
  `user_id` int(100) NOT NULL,
  `sent` datetime NOT NULL,
  PRIMARY KEY  (`emaillog_id`),
  KEY `email_id` (`email_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `emaillog`
--

INSERT INTO `emaillog` VALUES(1, 4, 4, '2009-07-16 08:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `email_id` int(11) NOT NULL auto_increment,
  `subject` varchar(100) collate latin1_general_ci NOT NULL,
  `emailbody` text collate latin1_general_ci NOT NULL,
  `created` datetime NOT NULL,
  `sent` datetime NOT NULL,
  `to_subscribers` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY  (`email_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` VALUES(1, 'Email 1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum aliquam aliquam ipsum non venenatis. Maecenas semper euismod aliquet. Aliquam dignissim, orci at tincidunt tincidunt, magna dui adipiscing eros, eu fringilla orci nulla eget orci. Vivamus luctus convallis libero, nec consectetur lacus imperdiet id. Suspendisse velit ipsum, gravida facilisis dignissim vel, gravida vitae est. Aliquam erat volutpat. Etiam quis ante leo. Maecenas feugiat, dolor at condimentum aliquam, enim urna pulvinar augue, ultricies lacinia est purus eu nunc. Nullam et nibh vitae nibh sollicitudin gravida. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam ut magna ante. Vestibulum a felis eu sapien congue sollicitudin. Sed urna erat, porta in malesuada et, eleifend sit amet felis. In lectus sapien, ultricies eget pretium quis, consectetur at enim. Aliquam viverra leo magna, vitae sagittis lectus. Quisque et dui quis quam porta tincidunt nec eleifend dolor. Sed aliquam nulla vel dui imperdiet sollicitudin. In euismod egestas lorem ut vulputate. Aliquam mi tellus, varius ultrices fringilla non, aliquet ut lacus.</p>', '2009-07-15 06:32:04', '2009-08-08 00:00:00', 1, 1);
INSERT INTO `emails` VALUES(4, 'Email 4', 'Phasellus non molestie sapien. Etiam a pharetra dolor. Mauris ac sapien orci. Integer sed enim quis ipsum ultricies feugiat a eu enim. Pellentesque eget molestie risus. Morbi ipsum arcu, blandit eget dapibus quis, lobortis non elit. Phasellus convallis luctus lacus, nec vestibulum risus adipiscing nec. Curabitur aliquam turpis porttitor lorem porta consequat. Ut neque eros, hendrerit a dictum imperdiet, ornare vel felis. Nam ac justo lorem, nec malesuada purus. Sed sapien dui, elementum et mattis eget, cursus in mauris. Etiam a diam velit, id semper orci. Nam quis risus nisl. Vivamus quis nunc nec velit cursus pellentesque nec eu nisi. Aliquam eu metus urna, eget blandit ligula. Aliquam ac sem lectus. In euismod turpis non dolor facilisis elementum eget et ante. ', '2009-07-16 07:44:25', '2009-07-17 00:00:00', 0, 1);
INSERT INTO `emails` VALUES(3, 'Email 3', 'Phasellus laoreet, erat vel rutrum dapibus, arcu eros faucibus diam, eu sagittis lorem sapien et eros. Ut vitae ipsum eget urna dignissim venenatis quis nec sem. Quisque enim justo, dignissim sed consequat sed, facilisis sed risus. Nam tincidunt tortor sit amet ante interdum molestie. In in tortor eget ipsum tempor malesuada nec a dui. Sed vel nibh et mi pretium tincidunt non sed velit. Donec nisl neque, venenatis eget ultrices in, scelerisque in risus. Ut laoreet eros eu sem lacinia at varius lacus condimentum. Maecenas egestas mauris ac leo fringilla vitae vehicula eros condimentum. Nunc mauris diam, ornare nec egestas eget, aliquet vel sem. Ut varius purus eget ante laoreet ac accumsan felis semper. Nulla facilisi. Quisque non gravida purus. Aenean quis erat enim. Integer urna urna, placerat non viverra in, lacinia quis mauris. Aenean consectetur molestie sem, id fermentum leo rutrum pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam sed posuere sapien. Praesent interdum, ante vitae feugiat malesuada, lacus sapien tincidunt massa, id porta justo odio sit amet lacus. Donec quis rutrum felis. ', '2009-07-15 08:06:20', '2009-07-16 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emailusertypes`
--

CREATE TABLE `emailusertypes` (
  `emailusertype_id` int(11) NOT NULL auto_increment,
  `email_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `included` int(11) NOT NULL default '0',
  PRIMARY KEY  (`emailusertype_id`),
  KEY `email_id` (`email_id`,`usertype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=151 ;

--
-- Dumping data for table `emailusertypes`
--

INSERT INTO `emailusertypes` VALUES(102, 1, 4, 0);
INSERT INTO `emailusertypes` VALUES(101, 1, 3, 1);
INSERT INTO `emailusertypes` VALUES(100, 1, 2, 0);
INSERT INTO `emailusertypes` VALUES(148, 4, 2, 0);
INSERT INTO `emailusertypes` VALUES(149, 4, 3, 0);
INSERT INTO `emailusertypes` VALUES(150, 4, 4, 0);
INSERT INTO `emailusertypes` VALUES(103, 3, 2, 0);
INSERT INTO `emailusertypes` VALUES(104, 3, 3, 1);
INSERT INTO `emailusertypes` VALUES(105, 3, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL auto_increment,
  `event` varchar(100) collate latin1_general_ci NOT NULL,
  `venue_id` int(11) NOT NULL,
  `starttime` datetime NOT NULL,
  `stoptime` datetime NOT NULL,
  `maxattendees` int(11) NOT NULL,
  `maxwaitinglist` int(11) NOT NULL,
  `email_id` int(11) NOT NULL,
  `confirmemail_id` int(11) NOT NULL,
  `onlistemail_id` int(11) NOT NULL,
  `offlistemail_id` int(11) NOT NULL,
  `recurrence` int(11) NOT NULL,
  `description` text collate latin1_general_ci NOT NULL,
  `enablereg` int(11) NOT NULL,
  `enableunreg` int(11) NOT NULL,
  `image` varchar(100) collate latin1_general_ci NOT NULL,
  `active` int(11) NOT NULL,
  `metadata_id` int(11) NOT NULL,
  PRIMARY KEY  (`event_id`),
  KEY `venue_id` (`venue_id`,`email_id`),
  KEY `confirmemail_id` (`confirmemail_id`),
  KEY `onlistemail_id` (`onlistemail_id`),
  KEY `offlistemail_id` (`offlistemail_id`),
  KEY `metadata_id` (`metadata_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `events`
--


-- --------------------------------------------------------

--
-- Table structure for table `forumposts`
--

CREATE TABLE `forumposts` (
  `forumpost_id` int(11) NOT NULL auto_increment,
  `posting` text collate latin1_general_ci NOT NULL,
  `posted` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `forumthread_id` int(11) NOT NULL,
  `alerted` int(11) NOT NULL,
  PRIMARY KEY  (`forumpost_id`),
  KEY `user_id` (`user_id`,`forumthread_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `forumposts`
--


-- --------------------------------------------------------

--
-- Table structure for table `forumthreads`
--

CREATE TABLE `forumthreads` (
  `forumthread_id` int(11) NOT NULL auto_increment,
  `forumthread` varchar(100) collate latin1_general_ci NOT NULL,
  `posting` text collate latin1_general_ci NOT NULL,
  `posted` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY  (`forumthread_id`),
  KEY `user_id` (`user_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `forumthreads`
--


-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL auto_increment,
  `identifier` varchar(100) collate latin1_general_ci NOT NULL,
  `filename` varchar(100) collate latin1_general_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `imagetype` varchar(100) collate latin1_general_ci NOT NULL,
  `thumbnail` varchar(100) collate latin1_general_ci NOT NULL,
  `thumbwidth` int(11) NOT NULL,
  `thumbheight` int(11) NOT NULL,
  `thumbtype` varchar(100) collate latin1_general_ci NOT NULL,
  `linkurl` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` VALUES(5, 'image4', 'Desert Landscape.jpg', 1024, 768, '2', 'Desert Landscape.jpg', 1024, 768, '2', 'http://sma.iclarence.com/page/en-uk/testpage1/');
INSERT INTO `images` VALUES(3, 'image2', 'Oryx Antelope.jpg', 1024, 768, '2', 'Oryx Antelope.jpg', 1024, 768, '2', 'http://sma.iclarence.com/page/en-uk/testpage2/');
INSERT INTO `images` VALUES(4, 'image3', 'Garden.jpg', 1024, 768, '2', 'Garden.jpg', 1024, 768, '2', 'http://news.bbc.co.uk');
INSERT INTO `images` VALUES(6, 'image1', 'Toco Toucan.jpg', 1024, 768, '2', 'Toco Toucan.jpg', 1024, 768, '2', 'http://www.google.com');
INSERT INTO `images` VALUES(7, 'image5', 'Forest Flowers.jpg', 1022, 766, '2', 'Forest Flowers.jpg', 1022, 766, '2', 'http://www.youtube.com');
INSERT INTO `images` VALUES(8, 'image6', 'Humpback Whale.jpg', 1024, 768, '2', 'Humpback Whale.jpg', 1024, 768, '2', 'http://www.iclarence.com');
INSERT INTO `images` VALUES(9, 'image7', 'Winter Leaves.jpg', 1024, 768, '2', 'Winter Leaves.jpg', 1024, 768, '2', 'http://cms.iclarence.com');
INSERT INTO `images` VALUES(11, 'image8', 'Green Sea Turtle.jpg', 1024, 768, '2', 'Green Sea Turtle.jpg', 1024, 768, '2', 'http://www.twitter.com');
INSERT INTO `images` VALUES(12, 'image10', 'Frangipani Flowers.jpg', 1024, 768, '2', 'Frangipani Flowers.jpg', 1024, 768, '2', 'http://www.multimap.com');
INSERT INTO `images` VALUES(14, 'image11', 'Forest.jpg', 1024, 768, '2', 'Forest.jpg', 1024, 768, '2', 'http://sma.iclarence.com/page/en-uk/news/');
INSERT INTO `images` VALUES(15, 'image12', 'Waterfall.jpg', 1024, 768, '2', 'Waterfall.jpg', 1024, 768, '2', 'http://sma.iclarence.com');

-- --------------------------------------------------------

--
-- Table structure for table `languagepages`
--

CREATE TABLE `languagepages` (
  `languagepage_id` int(11) NOT NULL auto_increment,
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `metadata_id` int(11) NOT NULL,
  `menuname` varchar(100) collate latin1_general_ci NOT NULL,
  `heading` varchar(100) collate latin1_general_ci NOT NULL,
  `introduction` text collate latin1_general_ci NOT NULL,
  `content` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`languagepage_id`),
  KEY `page_id` (`page_id`,`language_id`),
  KEY `metadata_id` (`metadata_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=203 ;

--
-- Dumping data for table `languagepages`
--

INSERT INTO `languagepages` VALUES(198, 74, 1, 200, 'Announcements', 'Announcements', '', '');
INSERT INTO `languagepages` VALUES(102, 35, 3, 104, 'Bienvenido', 'Bienvenido', 'Pellentesque nec mi a justo dictum pharetra eget dapibus quam. Donec vel euismod arcu. Integer pretium molestie nibh eget tempor. Pellentesque imperdiet, lacus at malesuada accumsan, est lectus iaculis sapien, et scelerisque lacus massa eget tellus.', 'Pellentesque nec mi a justo dictum pharetra eget dapibus quam. Donec vel euismod arcu. Integer pretium molestie nibh eget tempor. Pellentesque imperdiet, lacus at malesuada accumsan, est lectus iaculis sapien, et scelerisque lacus massa eget tellus. Donec lacus felis, eleifend non condimentum eget, dapibus sit amet dui. Aliquam aliquet placerat iaculis. Praesent eu arcu ligula. Sed nec tellus orci, ac facilisis justo. Quisque justo tortor, blandit id ornare vel, tincidunt at enim. Aliquam fringilla hendrerit placerat. Vivamus mattis, lectus et aliquet volutpat, dolor mauris luctus libero, id sodales risus massa nec felis. Quisque nunc mi, condimentum id scelerisque at, molestie sed nibh. Sed volutpat magna nec ligula volutpat eu fermentum ligula posuere. Donec id tellus et libero sagittis vestibulum. Nunc velit lacus, vulputate nec euismod sit amet, egestas sed magna. Nulla facilisi. Donec posuere euismod risus vitae aliquam.');
INSERT INTO `languagepages` VALUES(202, 37, 1, 204, 'Test Page 2', 'Test Page 2', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas suscipit turpis a neque molestie molestie. Aenean a metus sit amet felis blandit tincidunt. Vestibulum non sapien lectus, quis mattis orci. Vestibulum nulla lectus, adipiscing vitae lobortis quis, semper eu sem. Nulla tincidunt est at erat auctor dignissim rutrum nisi hendrerit.', 'ellentesque nec mi a justo dictum pharetra eget dapibus quam. Donec vel euismod arcu. Integer pretium molestie nibh eget tempor. Pellentesque imperdiet, lacus at malesuada accumsan, est lectus iaculis sapien, et scelerisque lacus massa eget tellus. Donec lacus felis, eleifend non condimentum eget, dapibus sit amet dui. Aliquam aliquet placerat iaculis. Praesent eu arcu ligula. Sed nec tellus orci, ac facilisis justo. Quisque justo tortor, blandit id ornare vel, tincidunt at enim. Aliquam fringilla hendrerit placerat. Vivamus mattis, lectus et aliquet volutpat, dolor mauris luctus libero, id sodales risus massa nec felis. Quisque nunc mi, condimentum id scelerisque at, molestie sed nibh. Sed volutpat magna nec ligula volutpat eu fermentum ligula posuere. Donec id tellus et libero sagittis vestibulum. Nunc velit lacus, vulputate nec euismod sit amet, egestas sed magna. Nulla facilisi. Donec posuere euismod risus vitae aliquam.\r\n\r\nNulla in nibh nec nisi laoreet vulputate vel nec lacus. In ut porta erat. Phasellus et enim nisl, a bibendum odio. Pellentesque ullamcorper odio quis lacus fringilla convallis. Nullam ipsum mauris, volutpat ac eleifend rutrum, mollis sit amet ipsum. Integer vel nisi sed arcu tempor ultricies nec nec risus. Vestibulum nec dui non ligula sodales fermentum tristique pulvinar nisl. Vestibulum ac neque turpis, id ornare nulla. Duis dictum malesuada lorem non tempor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas suscipit turpis a neque molestie molestie. Aenean a metus sit amet felis blandit tincidunt. Vestibulum non sapien lectus, quis mattis orci. Vestibulum nulla lectus, adipiscing vitae lobortis quis, semper eu sem. Nulla tincidunt est at erat auctor dignissim rutrum nisi hendrerit. Ut neque lectus, consectetur at volutpat et, volutpat vitae ligula. Sed dictum auctor facilisis. Fusce pharetra, metus ac porttitor vestibulum, augue enim pulvinar lacus, eu rutrum ante metus sit amet neque. In tortor leo, blandit pellentesque porttitor sit amet, rutrum sed neque. Donec ultrices imperdiet dui, eget ultricies ligula consequat vitae.');
INSERT INTO `languagepages` VALUES(183, 38, 1, 185, 'Test Page 3', 'Test Page 3', 'Morbi commodo rhoncus augue ut ultrices. Donec faucibus risus in erat viverra fermentum sed sed quam. Sed tempus adipiscing consectetur. Etiam odio massa, auctor non porttitor in, ullamcorper vel nisi. In pharetra, leo condimentum suscipit condimentum, magna mauris consequat metus, vel sagittis quam dui eget massa. Nullam et mi in metus dictum cursus.', 'Aliquam erat volutpat. Aliquam erat volutpat. Aliquam nunc eros, malesuada ut vestibulum egestas, volutpat eget ligula. Donec aliquet orci ut eros consequat vel interdum dui rutrum. Sed vel turpis vel velit tincidunt venenatis eu id nunc. Vestibulum vestibulum molestie cursus. Quisque a lectus et sem dictum convallis sit amet eu enim. Duis sed urna at ligula laoreet pharetra. Phasellus a odio sem. Proin a mi sapien, in pharetra odio.\r\n\r\nSed quis dolor nisl. Mauris tempus nibh vitae eros vestibulum ornare. Ut placerat, odio a ullamcorper tempor, magna diam aliquet libero, nec venenatis nulla urna nec leo. Mauris blandit augue sed nibh posuere porta. Morbi commodo rhoncus augue ut ultrices. Donec faucibus risus in erat viverra fermentum sed sed quam. Sed tempus adipiscing consectetur. Etiam odio massa, auctor non porttitor in, ullamcorper vel nisi. In pharetra, leo condimentum suscipit condimentum, magna mauris consequat metus, vel sagittis quam dui eget massa. Nullam et mi in metus dictum cursus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus lobortis dictum nisi ut tristique. Nam et ipsum vel arcu tincidunt bibendum id ut sem. Mauris eget auctor nibh. Donec ac justo orci, ac iaculis nibh. Aliquam ullamcorper ipsum in elit viverra quis pellentesque massa hendrerit. Sed placerat dignissim erat ut vehicula.');
INSERT INTO `languagepages` VALUES(157, 36, 3, 159, 'Uno', 'Uno', '1 En el principio de todas las cosas era la Palabra, y la Palabra estaba con Dios y la Palabra era Dios.\r\n 2 La Palabra estaba en el principio con Dios.\r\n\r\n 3 Por medio de ella creó Dios todas las cosas, y sin ella nada de lo creado fue creado.', '1 En el principio de todas las cosas era la Palabra, y la Palabra estaba con Dios y la Palabra era Dios.\r\n\r\n 2 La Palabra estaba en el principio con Dios.\r\n\r\n 3 Por medio de ella creó Dios todas las cosas, y sin ella nada de lo creado fue creado.\r\n\r\n 4 Porque en la Palabra estaba la vida, y la vida era la luz que iluminaba a la humanidad.\r\n\r\n 5 Esa luz brilla en la oscuridad, y la oscuridad no pudo extinguirla.\r\n\r\n 6 Hubo una vez un hombre llamado Juan, al que Dios envió\r\n\r\n 7 como testigo, para que diese testimonio de la luz y para que todos tuvieran oportunidad de creer por medio de él.\r\n\r\n 8 Juan no era la luz, sino únicamente el enviado a dar testimonio de la luz.\r\n\r\n 9 Aquel que era la luz verdadera había de venir muy pronto a este mundo, para iluminarnos a todos.\r\n\r\n 10 Pero cuando la Palabra vino al mundo, que había sido creado por ella, el mundo no la reconoció.\r\n\r\n 11 La Palabra vino a visitar a los suyos, y los suyos no quisieron recibirla.\r\n\r\n 12 Pero a todos los que la recibieron, a los que creen en su nombre, les concedió el privilegio de poder ser hechos hijos de Dios.\r\n\r\n 13 En ellos tuvo lugar un nuevo nacimiento, no como resultado de la voluntad humana de engendrar hijos según nuestra naturaleza de carne y sangre, sino de la voluntad de Dios.\r\n\r\n 14 Aquella Palabra se hizo hombre, y como hombre vivió entre nosotros con plenitud de gracia y de verdad. Y fuimos testigos de su gloria, la gloria que pertenece al Hijo único de Dios Padre.\r\n\r\n 15 Juan dio testimonio de él, proclamando:\r\n\r\n   A este me refería yo cuando dije: El que viene después de mí es superior a mí, porque ya existía antes que yo naciera.\r\n\r\n 16 Todos hemos recibido con plenitud las riquezas de su gracia, que él ha derramado sin cesar sobre nosotros.\r\n\r\n 17 Porque ciertamente Dios, por medio de Moisés, nos reveló la ley; pero por medio de Jesucristo, en su venida, nos reveló la gracia y la verdad.\r\n\r\n 18 Nadie ha visto jamás a Dios; pero su Hijo único, que está siempre con el Padre, nos lo ha dado a conocer.');
INSERT INTO `languagepages` VALUES(171, 39, 1, 173, 'Test Page 1 1', 'Test Page 1 1', 'Nulla in nibh nec nisi laoreet vulputate vel nec lacus. In ut porta erat. Phasellus et enim nisl, a bibendum odio. Pellentesque ullamcorper odio quis lacus fringilla convallis. Nullam ipsum mauris, volutpat ac eleifend rutrum, mollis sit amet ipsum. Integer vel nisi sed arcu tempor ultricies nec nec risus. Vestibulum nec dui non ligula sodales fermentum tristique pulvinar nisl.', 'Nulla in nibh nec nisi laoreet vulputate vel nec lacus. In ut porta erat. Phasellus et enim nisl, a bibendum odio. Pellentesque ullamcorper odio quis lacus fringilla convallis. Nullam ipsum mauris, volutpat ac eleifend rutrum, mollis sit amet ipsum. Integer vel nisi sed arcu tempor ultricies nec nec risus. Vestibulum nec dui non ligula sodales fermentum tristique pulvinar nisl. Vestibulum ac neque turpis, id ornare nulla. Duis dictum malesuada lorem non tempor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas suscipit turpis a neque molestie molestie. Aenean a metus sit amet felis blandit tincidunt. Vestibulum non sapien lectus, quis mattis orci. Vestibulum nulla lectus, adipiscing vitae lobortis quis, semper eu sem. Nulla tincidunt est at erat auctor dignissim rutrum nisi hendrerit. Ut neque lectus, consectetur at volutpat et, volutpat vitae ligula. Sed dictum auctor facilisis. Fusce pharetra, metus ac porttitor vestibulum, augue enim pulvinar lacus, eu rutrum ante metus sit amet neque. In tortor leo, blandit pellentesque porttitor sit amet, rutrum sed neque. Donec ultrices imperdiet dui, eget ultricies ligula consequat vitae.');
INSERT INTO `languagepages` VALUES(172, 40, 1, 174, 'Test Page 1 2', 'Test Page 1 2', 'Sed quis dolor nisl. Mauris tempus nibh vitae eros vestibulum ornare. Ut placerat, odio a ullamcorper tempor, magna diam aliquet libero, nec venenatis nulla urna nec leo. Mauris blandit augue sed nibh posuere porta. Morbi commodo rhoncus augue ut ultrices. Donec faucibus risus in erat viverra fermentum sed sed quam. Sed tempus adipiscing consectetur.', 'Sed quis dolor nisl. Mauris tempus nibh vitae eros vestibulum ornare. Ut placerat, odio a ullamcorper tempor, magna diam aliquet libero, nec venenatis nulla urna nec leo. Mauris blandit augue sed nibh posuere porta. Morbi commodo rhoncus augue ut ultrices. Donec faucibus risus in erat viverra fermentum sed sed quam. Sed tempus adipiscing consectetur. Etiam odio massa, auctor non porttitor in, ullamcorper vel nisi. In pharetra, leo condimentum suscipit condimentum, magna mauris consequat metus, vel sagittis quam dui eget massa. Nullam et mi in metus dictum cursus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus lobortis dictum nisi ut tristique. Nam et ipsum vel arcu tincidunt bibendum id ut sem. Mauris eget auctor nibh. Donec ac justo orci, ac iaculis nibh. Aliquam ullamcorper ipsum in elit viverra quis pellentesque massa hendrerit. Sed placerat dignissim erat ut vehicula.');
INSERT INTO `languagepages` VALUES(100, 39, 3, 102, 'Uno Uno', 'Uno Uno', '11 La Palabra vino a visitar a los suyos, y los suyos no quisieron recibirla.\r\n\r\n 12 Pero a todos los que la recibieron, a los que creen en su nombre, les concedió el privilegio de poder ser hechos hijos de Dios.', '10 Pero cuando la Palabra vino al mundo, que había sido creado por ella, el mundo no la reconoció.\r\n\r\n 11 La Palabra vino a visitar a los suyos, y los suyos no quisieron recibirla.\r\n\r\n 12 Pero a todos los que la recibieron, a los que creen en su nombre, les concedió el privilegio de poder ser hechos hijos de Dios.\r\n\r\n 13 En ellos tuvo lugar un nuevo nacimiento, no como resultado de la voluntad humana de engendrar hijos según nuestra naturaleza de carne y sangre, sino de la voluntad de Dios.\r\n\r\n 14 Aquella Palabra se hizo hombre, y como hombre vivió entre nosotros con plenitud de gracia y de verdad. Y fuimos testigos de su gloria, la gloria que pertenece al Hijo único de Dios Padre.');
INSERT INTO `languagepages` VALUES(173, 41, 1, 175, 'Test Page 1 2 1', 'Test Page 1 2 1', 'Mauris tempus nibh vitae eros vestibulum ornare. Ut placerat, odio a ullamcorper tempor, magna diam aliquet libero, nec venenatis nulla urna nec leo. Mauris blandit augue sed nibh posuere porta. Morbi commodo rhoncus augue ut ultrices. Donec faucibus risus in erat viverra fermentum sed sed quam. Sed tempus adipiscing consectetur. Etiam odio massa, auctor non porttitor in, ullamcorper vel nisi.', 'Aliquam erat volutpat. Aliquam erat volutpat. Aliquam nunc eros, malesuada ut vestibulum egestas, volutpat eget ligula. Donec aliquet orci ut eros consequat vel interdum dui rutrum. Sed vel turpis vel velit tincidunt venenatis eu id nunc. Vestibulum vestibulum molestie cursus. Quisque a lectus et sem dictum convallis sit amet eu enim. Duis sed urna at ligula laoreet pharetra. Phasellus a odio sem. Proin a mi sapien, in pharetra odio.\r\n\r\nSed quis dolor nisl. Mauris tempus nibh vitae eros vestibulum ornare. Ut placerat, odio a ullamcorper tempor, magna diam aliquet libero, nec venenatis nulla urna nec leo. Mauris blandit augue sed nibh posuere porta. Morbi commodo rhoncus augue ut ultrices. Donec faucibus risus in erat viverra fermentum sed sed quam. Sed tempus adipiscing consectetur. Etiam odio massa, auctor non porttitor in, ullamcorper vel nisi. In pharetra, leo condimentum suscipit condimentum, magna mauris consequat metus, vel sagittis quam dui eget massa. Nullam et mi in metus dictum cursus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus lobortis dictum nisi ut tristique. Nam et ipsum vel arcu tincidunt bibendum id ut sem. Mauris eget auctor nibh. Donec ac justo orci, ac iaculis nibh. Aliquam ullamcorper ipsum in elit viverra quis pellentesque massa hendrerit. Sed placerat dignissim erat ut vehicula.');
INSERT INTO `languagepages` VALUES(18, 41, 3, 20, 'Uno Dos Uno', 'Uno Dos Uno', '15 Juan dio testimonio de él, proclamando:\r\n\r\n   A este me refería yo cuando dije: El que viene después de mí es superior a mí, porque ya existía antes que yo naciera.\r\n\r\n 16 Todos hemos recibido con plenitud las riquezas de su gracia, que él ha derramado sin cesar sobre nosotros.', '15 Juan dio testimonio de él, proclamando:\r\n\r\n   A este me refería yo cuando dije: El que viene después de mí es superior a mí, porque ya existía antes que yo naciera.\r\n\r\n 16 Todos hemos recibido con plenitud las riquezas de su gracia, que él ha derramado sin cesar sobre nosotros.\r\n\r\n 17 Porque ciertamente Dios, por medio de Moisés, nos reveló la ley; pero por medio de Jesucristo, en su venida, nos reveló la gracia y la verdad.\r\n\r\n 18 Nadie ha visto jamás a Dios; pero su Hijo único, que está siempre con el Padre, nos lo ha dado a conocer.');
INSERT INTO `languagepages` VALUES(179, 42, 1, 181, 'News Items', 'News Items', 'Aliquam erat volutpat. Aliquam erat volutpat. Aliquam nunc eros, malesuada ut vestibulum egestas, volutpat eget ligula. Donec aliquet orci ut eros consequat vel interdum dui rutrum. Sed vel turpis vel velit tincidunt venenatis eu id nunc.', 'Aliquam erat volutpat. Aliquam erat volutpat. Aliquam nunc eros, malesuada ut vestibulum egestas, volutpat eget ligula. Donec aliquet orci ut eros consequat vel interdum dui rutrum. Sed vel turpis vel velit tincidunt venenatis eu id nunc. Vestibulum vestibulum molestie cursus. Quisque a lectus et sem dictum convallis sit amet eu enim. Duis sed urna at ligula laoreet pharetra. Phasellus a odio sem. Proin a mi sapien, in pharetra odio.');
INSERT INTO `languagepages` VALUES(36, 44, 1, 38, 'Terms and Conditions', 'Terms and Conditions', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum venenatis euismod metus laoreet porttitor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce ut fermentum tellus. Maecenas vel urna lacus, ut malesuada augue. Phasellus eu ante enim, eu sollicitudin sem. Proin at lectus at ante pellentesque malesuada mollis vel lectus. Proin vitae arcu tortor. Pellentesque sit amet tortor sit amet erat condimentum egestas vitae ut odio. Nullam ut lacus enim, at congue risus. Phasellus bibendum ornare urna non elementum. In hac habitasse platea dictumst. Nunc ultrices, augue ut congue elementum, quam purus ullamcorper metus, id viverra odio dui vel orci. Etiam sed elit nulla, ac vulputate lacus. Phasellus pulvinar rutrum blandit. Mauris gravida eros at lorem venenatis dapibus. Cras bibendum sem tellus. Vivamus dictum sem ac massa suscipit eget vulputate diam sagittis. In in mauris dui, ut dictum erat. Ut vitae suscipit turpis. Sed sapien mauris, molestie at ultrices volutpat, rutrum ac erat.\r\n\r\nNam rutrum rhoncus leo ut egestas. Proin suscipit, felis sed consequat luctus, odio metus suscipit tortor, non semper sem mauris id risus. Donec eu posuere mi. Nunc eu malesuada elit. Nunc consectetur eros vel nunc ornare a pharetra arcu tempor. Ut vehicula rutrum enim, eu pharetra sem rutrum id. Integer sed sapien ante. Integer tempor iaculis scelerisque. Donec sed ornare turpis. Proin a elit sapien, sit amet mollis velit. Vestibulum mi eros, aliquam vel porta sed, dignissim imperdiet neque. Fusce luctus tortor quis ligula viverra consequat. Nulla bibendum semper dapibus. Pellentesque lobortis arcu quis lacus scelerisque consectetur. Fusce tincidunt, nisl at lobortis luctus, erat ante hendrerit lorem, a viverra mi risus sed nisi. Morbi nec sapien nec tellus elementum elementum.\r\n\r\nUt a lectus ante, id sagittis ante. Duis blandit quam a risus imperdiet sit amet pretium velit aliquam. Donec quis dui sapien, sed eleifend nunc. Nulla nulla purus, tincidunt vel aliquet id, pulvinar quis urna. Proin vel diam arcu, eu auctor elit. Cras in purus sed nisi volutpat convallis. Curabitur venenatis vulputate vestibulum. Ut eleifend orci rutrum lorem tincidunt laoreet. Phasellus non dolor quis dolor sagittis euismod. Fusce suscipit lacus nec felis ultricies molestie vel id risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare ante in lectus feugiat condimentum cursus ipsum bibendum. Praesent eget tortor felis. Praesent at risus ut purus consequat pretium ac et dolor. Morbi laoreet urna non velit mollis ut pretium lacus eleifend. Vestibulum vel magna et est consectetur ultricies. Proin nec augue nisl. Quisque fermentum, enim eget molestie tincidunt, ligula arcu laoreet ligula, eget aliquam nisl nisl nec quam. Sed eget fermentum risus. Fusce varius dui in nisl porta ultrices.');
INSERT INTO `languagepages` VALUES(184, 43, 1, 186, 'News 1', 'News 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tincidunt, ante eget consequat rutrum, diam lectus vestibulum est, sagittis egestas dui nunc non nisi. Etiam vitae dapibus lectus. Aenean porta nunc at dolor aliquet faucibus.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tincidunt, ante eget consequat rutrum, diam lectus vestibulum est, sagittis egestas dui nunc non nisi. Etiam vitae dapibus lectus. Aenean porta nunc at dolor aliquet faucibus. Sed quis lacus eget sapien vestibulum rhoncus in lobortis dolor. Donec nunc turpis, scelerisque ut consequat quis, vestibulum sed quam. Suspendisse ante arcu, mattis non convallis vitae, rhoncus congue tellus. Quisque augue elit, gravida ac aliquam id, scelerisque vel velit. Fusce dictum, tortor quis posuere porta, nunc turpis bibendum nulla, sed euismod velit felis a diam. Suspendisse sodales nisi ullamcorper velit tincidunt dignissim. Mauris bibendum malesuada ultricies. Curabitur nulla dolor, porttitor et viverra in, mollis in mauris. Curabitur rhoncus placerat ornare. Praesent erat purus, dapibus vel luctus non, pretium ut orci. Donec ornare nisl sed justo ornare luctus. Aliquam scelerisque pulvinar urna id interdum.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nunc elit, lacinia sit amet pretium sed, vestibulum consectetur ipsum. Aenean mi nunc, consectetur nec fringilla ac, ultricies in nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin ac nisl nec odio venenatis lobortis et at nisl. Vivamus risus arcu, egestas et gravida vitae, blandit vel tortor. Etiam vitae massa ut sem suscipit vulputate ut ut mauris. Aliquam a enim id mauris tincidunt eleifend eu ac lectus. Donec ornare facilisis massa, sed malesuada neque consequat ac. Aliquam quis elit leo. Fusce vitae nisi justo. Vivamus non magna quis orci bibendum porta. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean et magna non metus tempor sagittis. Vestibulum sit amet enim a felis condimentum iaculis eu ac enim.\r\n\r\nEtiam vel nulla eget odio blandit viverra congue ac lorem. Nullam interdum elementum congue. Nullam id ipsum ut mi cursus fermentum ac vel eros. Sed varius fringilla consequat. Duis convallis eros sit amet elit convallis tempus. Maecenas id adipiscing dolor. Sed vitae diam sit amet ipsum aliquet fringilla aliquam quis leo. Nulla eu erat id sem euismod fermentum vel vitae nibh. Nullam quam lorem, faucibus vitae aliquet a, mattis non tellus. Aliquam rutrum, ante a fringilla feugiat, purus nibh tempor orci, sit amet consectetur orci erat ut quam. Vestibulum volutpat malesuada velit, eu feugiat tellus aliquam vel. Nulla velit odio, volutpat et ultrices at, sollicitudin a ligula. Fusce felis tortor, tristique eget consectetur ac, laoreet at enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque dignissim bibendum odio luctus varius. Duis eget venenatis felis. Integer a tincidunt lectus. Aenean lacinia dapibus luctus. Duis velit sapien, placerat sed scelerisque et, luctus vel enim. Sed urna nisi, imperdiet quis dignissim vel, suscipit eu orci.</p>');
INSERT INTO `languagepages` VALUES(174, 46, 1, 176, 'Test Page 1 2 2', 'Test Page 1 2 2', ' Aliquam rutrum, ante a fringilla feugiat, purus nibh tempor orci, sit amet consectetur orci erat ut quam. Vestibulum volutpat malesuada velit, eu feugiat tellus aliquam vel. Nulla velit odio, volutpat et ultrices at, sollicitudin a ligula. Fusce felis tortor, tristique eget consectetur ac, laoreet at enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque dignissim bibendum odio luctus varius. Duis eget venenatis felis.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nunc elit, lacinia sit amet pretium sed, vestibulum consectetur ipsum. Aenean mi nunc, consectetur nec fringilla ac, ultricies in nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin ac nisl nec odio venenatis lobortis et at nisl. Vivamus risus arcu, egestas et gravida vitae, blandit vel tortor. Etiam vitae massa ut sem suscipit vulputate ut ut mauris. Aliquam a enim id mauris tincidunt eleifend eu ac lectus. Donec ornare facilisis massa, sed malesuada neque consequat ac. Aliquam quis elit leo. Fusce vitae nisi justo. Vivamus non magna quis orci bibendum porta. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean et magna non metus tempor sagittis. Vestibulum sit amet enim a felis condimentum iaculis eu ac enim.\r\n\r\nEtiam vel nulla eget odio blandit viverra congue ac lorem. Nullam interdum elementum congue. Nullam id ipsum ut mi cursus fermentum ac vel eros. Sed varius fringilla consequat. Duis convallis eros sit amet elit convallis tempus. Maecenas id adipiscing dolor. Sed vitae diam sit amet ipsum aliquet fringilla aliquam quis leo. Nulla eu erat id sem euismod fermentum vel vitae nibh. Nullam quam lorem, faucibus vitae aliquet a, mattis non tellus. Aliquam rutrum, ante a fringilla feugiat, purus nibh tempor orci, sit amet consectetur orci erat ut quam. Vestibulum volutpat malesuada velit, eu feugiat tellus aliquam vel. Nulla velit odio, volutpat et ultrices at, sollicitudin a ligula. Fusce felis tortor, tristique eget consectetur ac, laoreet at enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque dignissim bibendum odio luctus varius. Duis eget venenatis felis. Integer a tincidunt lectus. Aenean lacinia dapibus luctus. Duis velit sapien, placerat sed scelerisque et, luctus vel enim. Sed urna nisi, imperdiet quis dignissim vel, suscipit eu orci.');
INSERT INTO `languagepages` VALUES(149, 47, 1, 151, 'News 2', 'News 2', 'Sed sed metus nibh, at semper risus. Phasellus feugiat eleifend neque eu hendrerit. In sed velit ac dolor sollicitudin eleifend at vel purus. Cras quis libero lorem, et ultricies sem. Morbi laoreet hendrerit dolor, ac mattis metus tincidunt non. Quisque sed lacinia libero. Aliquam varius sem consequat magna congue semper. Integer velit nibh, ornare non pretium vel, accumsan ut lectus.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nunc elit, lacinia sit amet pretium sed, vestibulum consectetur ipsum. Aenean mi nunc, consectetur nec fringilla ac, ultricies in nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin ac nisl nec odio venenatis lobortis et at nisl. Vivamus risus arcu, egestas et gravida vitae, blandit vel tortor. Etiam vitae massa ut sem suscipit vulputate ut ut mauris. Aliquam a enim id mauris tincidunt eleifend eu ac lectus. Donec ornare facilisis massa, sed malesuada neque consequat ac. Aliquam quis elit leo. Fusce vitae nisi justo. Vivamus non magna quis orci bibendum porta. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean et magna non metus tempor sagittis. Vestibulum sit amet enim a felis condimentum iaculis eu ac enim.\r\n\r\nEtiam vel nulla eget odio blandit viverra congue ac lorem. Nullam interdum elementum congue. Nullam id ipsum ut mi cursus fermentum ac vel eros. Sed varius fringilla consequat. Duis convallis eros sit amet elit convallis tempus. Maecenas id adipiscing dolor. Sed vitae diam sit amet ipsum aliquet fringilla aliquam quis leo. Nulla eu erat id sem euismod fermentum vel vitae nibh. Nullam quam lorem, faucibus vitae aliquet a, mattis non tellus. Aliquam rutrum, ante a fringilla feugiat, purus nibh tempor orci, sit amet consectetur orci erat ut quam. Vestibulum volutpat malesuada velit, eu feugiat tellus aliquam vel. Nulla velit odio, volutpat et ultrices at, sollicitudin a ligula. Fusce felis tortor, tristique eget consectetur ac, laoreet at enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque dignissim bibendum odio luctus varius. Duis eget venenatis felis. Integer a tincidunt lectus. Aenean lacinia dapibus luctus. Duis velit sapien, placerat sed scelerisque et, luctus vel enim. Sed urna nisi, imperdiet quis dignissim vel, suscipit eu orci.\r\n\r\nAliquam in turpis elit, vitae interdum mi. Donec semper bibendum sapien, sed eleifend augue facilisis at. Etiam scelerisque est eu dui lobortis auctor. Pellentesque nisl est, cursus ut adipiscing vel, vehicula ac leo. Sed sed metus nibh, at semper risus. Phasellus feugiat eleifend neque eu hendrerit. In sed velit ac dolor sollicitudin eleifend at vel purus. Cras quis libero lorem, et ultricies sem. Morbi laoreet hendrerit dolor, ac mattis metus tincidunt non. Quisque sed lacinia libero. Aliquam varius sem consequat magna congue semper. Integer velit nibh, ornare non pretium vel, accumsan ut lectus. Nunc vel dolor mattis nisi tincidunt porta. Vestibulum tincidunt adipiscing urna, sit amet vehicula elit adipiscing sit amet. Donec vitae nibh sit amet turpis euismod venenatis pharetra nec sem. Praesent nec leo lectus, non congue elit. Mauris vestibulum, dolor vel aliquet sagittis, orci arcu mollis ipsum, sed convallis nibh ante id felis.');
INSERT INTO `languagepages` VALUES(150, 48, 1, 152, 'News 3', 'News 3', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque placerat ultrices ipsum eget dapibus. Aliquam elementum libero eu lorem cursus ullamcorper. Sed placerat consequat elementum. Suspendisse placerat posuere ligula id pharetra. Etiam consequat quam ut dolor porttitor eu ultrices mi vehicula.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nunc elit, lacinia sit amet pretium sed, vestibulum consectetur ipsum. Aenean mi nunc, consectetur nec fringilla ac, ultricies in nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin ac nisl nec odio venenatis lobortis et at nisl. Vivamus risus arcu, egestas et gravida vitae, blandit vel tortor. Etiam vitae massa ut sem suscipit vulputate ut ut mauris. Aliquam a enim id mauris tincidunt eleifend eu ac lectus. Donec ornare facilisis massa, sed malesuada neque consequat ac. Aliquam quis elit leo. Fusce vitae nisi justo. Vivamus non magna quis orci bibendum porta. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean et magna non metus tempor sagittis. Vestibulum sit amet enim a felis condimentum iaculis eu ac enim.\r\n\r\nEtiam vel nulla eget odio blandit viverra congue ac lorem. Nullam interdum elementum congue. Nullam id ipsum ut mi cursus fermentum ac vel eros. Sed varius fringilla consequat. Duis convallis eros sit amet elit convallis tempus. Maecenas id adipiscing dolor. Sed vitae diam sit amet ipsum aliquet fringilla aliquam quis leo. Nulla eu erat id sem euismod fermentum vel vitae nibh. Nullam quam lorem, faucibus vitae aliquet a, mattis non tellus. Aliquam rutrum, ante a fringilla feugiat, purus nibh tempor orci, sit amet consectetur orci erat ut quam. Vestibulum volutpat malesuada velit, eu feugiat tellus aliquam vel. Nulla velit odio, volutpat et ultrices at, sollicitudin a ligula. Fusce felis tortor, tristique eget consectetur ac, laoreet at enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque dignissim bibendum odio luctus varius. Duis eget venenatis felis. Integer a tincidunt lectus. Aenean lacinia dapibus luctus. Duis velit sapien, placerat sed scelerisque et, luctus vel enim. Sed urna nisi, imperdiet quis dignissim vel, suscipit eu orci.\r\n\r\nAliquam in turpis elit, vitae interdum mi. Donec semper bibendum sapien, sed eleifend augue facilisis at. Etiam scelerisque est eu dui lobortis auctor. Pellentesque nisl est, cursus ut adipiscing vel, vehicula ac leo. Sed sed metus nibh, at semper risus. Phasellus feugiat eleifend neque eu hendrerit. In sed velit ac dolor sollicitudin eleifend at vel purus. Cras quis libero lorem, et ultricies sem. Morbi laoreet hendrerit dolor, ac mattis metus tincidunt non. Quisque sed lacinia libero. Aliquam varius sem consequat magna congue semper. Integer velit nibh, ornare non pretium vel, accumsan ut lectus. Nunc vel dolor mattis nisi tincidunt porta. Vestibulum tincidunt adipiscing urna, sit amet vehicula elit adipiscing sit amet. Donec vitae nibh sit amet turpis euismod venenatis pharetra nec sem. Praesent nec leo lectus, non congue elit. Mauris vestibulum, dolor vel aliquet sagittis, orci arcu mollis ipsum, sed convallis nibh ante id felis.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque placerat ultrices ipsum eget dapibus. Aliquam elementum libero eu lorem cursus ullamcorper. Sed placerat consequat elementum. Suspendisse placerat posuere ligula id pharetra. Etiam consequat quam ut dolor porttitor eu ultrices mi vehicula. Cras ac risus leo, sed commodo diam. Maecenas sit amet elit purus. Cras nec nulla sit amet neque aliquet suscipit in eget sapien. Aenean eget nulla a arcu molestie feugiat. Duis ullamcorper lacus vitae sapien tempor a porta turpis ornare. Donec eget justo vel justo posuere auctor in sit amet justo. Etiam sagittis dignissim scelerisque. Aliquam a est ac orci convallis venenatis eu vehicula mi. Donec gravida justo gravida tellus commodo convallis.');
INSERT INTO `languagepages` VALUES(99, 49, 1, 101, 'Contact Us', 'Contact Us', 'Sed varius fringilla consequat. Duis convallis eros sit amet elit convallis tempus. Maecenas id adipiscing dolor. Sed vitae diam sit amet ipsum aliquet fringilla aliquam quis leo. Nulla eu erat id sem euismod fermentum vel vitae nibh.', 'Etiam vel nulla eget odio blandit viverra congue ac lorem. Nullam interdum elementum congue. Nullam id ipsum ut mi cursus fermentum ac vel eros. Sed varius fringilla consequat. Duis convallis eros sit amet elit convallis tempus. Maecenas id adipiscing dolor. Sed vitae diam sit amet ipsum aliquet fringilla aliquam quis leo. Nulla eu erat id sem euismod fermentum vel vitae nibh. Nullam quam lorem, faucibus vitae aliquet a, mattis non tellus. Aliquam rutrum, ante a fringilla feugiat, purus nibh tempor orci, sit amet consectetur orci erat ut quam. Vestibulum volutpat malesuada velit, eu feugiat tellus aliquam vel. Nulla velit odio, volutpat et ultrices at, sollicitudin a ligula. Fusce felis tortor, tristique eget consectetur ac, laoreet at enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque dignissim bibendum odio luctus varius. Duis eget venenatis felis. Integer a tincidunt lectus. Aenean lacinia dapibus luctus. Duis velit sapien, placerat sed scelerisque et, luctus vel enim. Sed urna nisi, imperdiet quis dignissim vel, suscipit eu orci.');
INSERT INTO `languagepages` VALUES(181, 50, 1, 183, 'Test Page 4', 'Test Page 4', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque placerat ultrices ipsum eget dapibus. Aliquam elementum libero eu lorem cursus ullamcorper. Sed placerat consequat elementum. Suspendisse placerat posuere ligula id pharetra. Etiam consequat quam ut dolor porttitor eu ultrices mi vehicula. Cras ac risus leo, sed commodo diam. Maecenas sit amet elit purus.', 'Aliquam in turpis elit, vitae interdum mi. Donec semper bibendum sapien, sed eleifend augue facilisis at. Etiam scelerisque est eu dui lobortis auctor. Pellentesque nisl est, cursus ut adipiscing vel, vehicula ac leo. Sed sed metus nibh, at semper risus. Phasellus feugiat eleifend neque eu hendrerit. In sed velit ac dolor sollicitudin eleifend at vel purus. Cras quis libero lorem, et ultricies sem. Morbi laoreet hendrerit dolor, ac mattis metus tincidunt non. Quisque sed lacinia libero. Aliquam varius sem consequat magna congue semper. Integer velit nibh, ornare non pretium vel, accumsan ut lectus. Nunc vel dolor mattis nisi tincidunt porta. Vestibulum tincidunt adipiscing urna, sit amet vehicula elit adipiscing sit amet. Donec vitae nibh sit amet turpis euismod venenatis pharetra nec sem. Praesent nec leo lectus, non congue elit. Mauris vestibulum, dolor vel aliquet sagittis, orci arcu mollis ipsum, sed convallis nibh ante id felis.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque placerat ultrices ipsum eget dapibus. Aliquam elementum libero eu lorem cursus ullamcorper. Sed placerat consequat elementum. Suspendisse placerat posuere ligula id pharetra. Etiam consequat quam ut dolor porttitor eu ultrices mi vehicula. Cras ac risus leo, sed commodo diam. Maecenas sit amet elit purus. Cras nec nulla sit amet neque aliquet suscipit in eget sapien. Aenean eget nulla a arcu molestie feugiat. Duis ullamcorper lacus vitae sapien tempor a porta turpis ornare. Donec eget justo vel justo posuere auctor in sit amet justo. Etiam sagittis dignissim scelerisque. Aliquam a est ac orci convallis venenatis eu vehicula mi. Donec gravida justo gravida tellus commodo convallis.');
INSERT INTO `languagepages` VALUES(177, 51, 1, 179, 'Test Page 2 1', 'Test Page 2 1', 'Proin quis dui quis turpis aliquet ultricies. Fusce tincidunt dui ac lorem porta euismod. Quisque nec felis felis. Sed suscipit viverra neque eget mollis. Mauris rutrum dapibus dolor, in aliquet enim lobortis vitae. Quisque auctor metus eget turpis commodo in accumsan lectus convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc congue viverra magna posuere rhoncus.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut cursus mauris. Duis fringilla fermentum eros sit amet iaculis. Curabitur faucibus imperdiet quam ut porttitor. Maecenas tellus tellus, congue ut elementum at, interdum et sem. Fusce tempus mauris a eros facilisis rutrum. Vestibulum turpis sapien, gravida eget rutrum non, condimentum ac quam. Nullam est ante, volutpat vel mattis eu, bibendum commodo metus. Cras placerat ornare tempus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum in ante pharetra nulla dapibus semper. Donec in ornare dolor. Cras tristique nunc et orci laoreet imperdiet. Cras varius risus a ligula congue dictum. Vivamus euismod nulla consectetur velit sodales sit amet tincidunt justo blandit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla mi eros, congue sit amet euismod eu, aliquet convallis nibh.\r\n\r\nNam eu nulla non metus feugiat pellentesque. Donec semper consequat euismod. Praesent ut leo sem. Fusce ultrices, arcu quis volutpat adipiscing, felis nisi tempor lectus, sit amet congue sem odio at metus. Donec et vulputate diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales metus feugiat risus sagittis tincidunt. Pellentesque tincidunt volutpat nulla a dapibus. Fusce pellentesque sollicitudin gravida. Vivamus vehicula ante at velit fermentum vitae aliquam felis aliquet. In erat massa, volutpat eget bibendum id, feugiat vel est. Sed malesuada, diam eu sagittis vulputate, sem neque venenatis lorem, eget blandit dolor odio nec metus. Sed semper, nibh eget dignissim molestie, purus nisl bibendum elit, non pulvinar metus tellus in nunc. Fusce non sapien eu mauris fringilla vulputate. Aenean sed erat quis nibh imperdiet ullamcorper. Etiam cursus libero at nisi rutrum ac molestie mauris malesuada. Sed interdum, libero non feugiat sagittis, neque diam lacinia mi, quis elementum risus elit vitae tortor. Vestibulum sit amet arcu quam. Nullam sit amet velit eu lectus ullamcorper congue convallis et orci.\r\n\r\nProin quis dui quis turpis aliquet ultricies. Fusce tincidunt dui ac lorem porta euismod. Quisque nec felis felis. Sed suscipit viverra neque eget mollis. Mauris rutrum dapibus dolor, in aliquet enim lobortis vitae. Quisque auctor metus eget turpis commodo in accumsan lectus convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc congue viverra magna posuere rhoncus. Ut nec diam vel felis venenatis iaculis id sit amet nisi. Sed ullamcorper rhoncus vulputate. Donec bibendum, eros in pulvinar tincidunt, purus eros congue orci, ut laoreet nisi urna ut eros. Nunc imperdiet sapien et enim condimentum sed fringilla mauris congue.');
INSERT INTO `languagepages` VALUES(176, 52, 1, 178, 'Test Page 2 2', 'Test Page 2 2', 'Nam eu nulla non metus feugiat pellentesque. Donec semper consequat euismod. Praesent ut leo sem. Fusce ultrices, arcu quis volutpat adipiscing, felis nisi tempor lectus, sit amet congue sem odio at metus. Donec et vulputate diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nam eu nulla non metus feugiat pellentesque. Donec semper consequat euismod. Praesent ut leo sem. Fusce ultrices, arcu quis volutpat adipiscing, felis nisi tempor lectus, sit amet congue sem odio at metus. Donec et vulputate diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut cursus mauris. Duis fringilla fermentum eros sit amet iaculis. Curabitur faucibus imperdiet quam ut porttitor. Maecenas tellus tellus, congue ut elementum at, interdum et sem. Fusce tempus mauris a eros facilisis rutrum. Vestibulum turpis sapien, gravida eget rutrum non, condimentum ac quam. Nullam est ante, volutpat vel mattis eu, bibendum commodo metus. Cras placerat ornare tempus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum in ante pharetra nulla dapibus semper. Donec in ornare dolor. Cras tristique nunc et orci laoreet imperdiet. Cras varius risus a ligula congue dictum. Vivamus euismod nulla consectetur velit sodales sit amet tincidunt justo blandit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla mi eros, congue sit amet euismod eu, aliquet convallis nibh.\r\n\r\nNam eu nulla non metus feugiat pellentesque. Donec semper consequat euismod. Praesent ut leo sem. Fusce ultrices, arcu quis volutpat adipiscing, felis nisi tempor lectus, sit amet congue sem odio at metus. Donec et vulputate diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales metus feugiat risus sagittis tincidunt. Pellentesque tincidunt volutpat nulla a dapibus. Fusce pellentesque sollicitudin gravida. Vivamus vehicula ante at velit fermentum vitae aliquam felis aliquet. In erat massa, volutpat eget bibendum id, feugiat vel est. Sed malesuada, diam eu sagittis vulputate, sem neque venenatis lorem, eget blandit dolor odio nec metus. Sed semper, nibh eget dignissim molestie, purus nisl bibendum elit, non pulvinar metus tellus in nunc. Fusce non sapien eu mauris fringilla vulputate. Aenean sed erat quis nibh imperdiet ullamcorper. Etiam cursus libero at nisi rutrum ac molestie mauris malesuada. Sed interdum, libero non feugiat sagittis, neque diam lacinia mi, quis elementum risus elit vitae tortor. Vestibulum sit amet arcu quam. Nullam sit amet velit eu lectus ullamcorper congue convallis et orci.\r\n\r\nProin quis dui quis turpis aliquet ultricies. Fusce tincidunt dui ac lorem porta euismod. Quisque nec felis felis. Sed suscipit viverra neque eget mollis. Mauris rutrum dapibus dolor, in aliquet enim lobortis vitae. Quisque auctor metus eget turpis commodo in accumsan lectus convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc congue viverra magna posuere rhoncus. Ut nec diam vel felis venenatis iaculis id sit amet nisi. Sed ullamcorper rhoncus vulputate. Donec bibendum, eros in pulvinar tincidunt, purus eros congue orci, ut laoreet nisi urna ut eros. Nunc imperdiet sapien et enim condimentum sed fringilla mauris congue.');
INSERT INTO `languagepages` VALUES(57, 53, 1, 59, 'Search Results', 'Search Results', '', 'Nam vitae venenatis felis. Mauris a sapien quis risus varius volutpat sit amet at ligula. Cras ac arcu erat. Vivamus sed arcu felis, et mollis elit. In faucibus viverra ipsum vel malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent et nisl quis odio volutpat pretium sed ultrices lacus. Maecenas vel metus vitae leo tincidunt mollis ac at odio. In auctor elit quis mauris porta venenatis. Suspendisse id pretium ipsum. Maecenas ut sem eros. Fusce laoreet bibendum felis, ac tempus lacus venenatis rhoncus. Nulla at porttitor justo. Cras vel eros sed diam consequat faucibus sit amet non nibh. Sed accumsan eros eu dolor auctor id lobortis nunc feugiat.');
INSERT INTO `languagepages` VALUES(58, 54, 1, 60, 'Advanced Search', 'Advanced Search', '', 'Nullam pretium eleifend nibh, ut interdum arcu tempor ut. Curabitur vel felis justo. Mauris non eros dui, vitae pharetra elit. Aliquam et nunc erat, eu consequat orci. Etiam vestibulum malesuada lacus nec venenatis. Sed elementum, orci quis dapibus eleifend, felis turpis consequat magna, sed placerat arcu lorem nec dolor. Nullam vestibulum vulputate nisi, ut sodales erat lacinia vel. Suspendisse suscipit cursus diam vel convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tincidunt cursus arcu, sit amet accumsan libero porttitor quis. Nam tellus augue, pretium ut ullamcorper vel, rutrum in sem. Vivamus nisl eros, mattis euismod egestas eget, molestie vitae velit. In tempus tempus ante eu rhoncus. Ut non magna a lacus iaculis ornare sed eu erat. Nulla congue lacinia porttitor. Ut rhoncus sapien id elit molestie tempus. Quisque vitae risus vel felis scelerisque convallis fringilla non nulla. Nulla facilisi.');
INSERT INTO `languagepages` VALUES(60, 53, 3, 62, 'Search Results', 'Search Results', '', '');
INSERT INTO `languagepages` VALUES(61, 44, 3, 63, 'Terms and Conditions', 'Terms and Conditions', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eleifend lorem at mauris feugiat ac lacinia urna ullamcorper. Aenean in tellus libero. Maecenas nec vulputate tortor. Sed vel mi erat, ac eleifend lacus. Aenean tincidunt enim nec orci adipiscing non blandit ligula pretium. Mauris vitae nibh odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed vitae sodales velit. Maecenas pretium, eros id porttitor interdum, mauris mauris suscipit sem, non semper ipsum justo id libero. Morbi ut orci et dui pellentesque eleifend a quis lectus. Quisque blandit sapien eu leo vestibulum dapibus. Curabitur dui ligula, condimentum ut adipiscing eu, condimentum interdum arcu. Sed auctor lorem et velit dictum tempor malesuada est mattis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisi. Donec congue varius metus, ac bibendum erat imperdiet id. Vivamus quis lacus elit, id consectetur purus. Nunc magna enim, placerat ut faucibus id, rhoncus sit amet erat. Curabitur eu risus leo, non consectetur diam. Vestibulum vitae fringilla odio.\r\n\r\nIn lacinia, velit a lobortis pellentesque, orci lectus mollis felis, tincidunt porta leo dui quis tortor. Quisque bibendum eleifend tincidunt. Nullam tincidunt gravida lectus, vel gravida nibh rhoncus vel. Curabitur dictum erat id nibh sodales sed porttitor lorem aliquam. Etiam sed laoreet lectus. Fusce at turpis quis dui blandit lacinia sit amet nec sem. Duis vitae magna nulla. Vivamus dictum, ligula ac rhoncus gravida, magna enim gravida purus, ut faucibus nibh sapien blandit turpis. Cras mauris nulla, hendrerit nec fermentum at, ultricies vel ipsum. Vestibulum porttitor purus eu odio hendrerit non interdum tellus aliquam. Integer ultrices erat elementum nibh posuere suscipit. Etiam a urna non dui feugiat porta vel et leo. Nullam ut leo at lacus convallis fringilla ut non tellus. Ut accumsan viverra euismod. Integer tincidunt dapibus nisl et sagittis. Phasellus eget risus odio, sed interdum sapien. Maecenas velit purus, viverra sit amet fermentum ut, suscipit non lacus. Vivamus eu enim eget dolor posuere viverra. Donec pretium lacinia luctus. Cras a mi sed nibh facilisis aliquet.\r\n\r\nNullam a libero ut leo ultricies tempor. Donec placerat aliquet sapien, eget varius neque accumsan sed. Suspendisse consequat consectetur est quis varius. Duis faucibus libero lorem. Proin lacinia, orci ut semper mollis, justo ligula varius quam, et molestie quam augue et tortor. Quisque vulputate mattis arcu non dignissim. Sed eu neque orci. Mauris viverra mi id magna semper venenatis. Cras faucibus, magna ac dapibus egestas, est velit ullamcorper libero, sed euismod est nibh vel odio. Ut accumsan urna dui, et consequat augue. Maecenas condimentum congue urna id fermentum. Fusce adipiscing malesuada ipsum, et pretium augue viverra ac. Pellentesque non eros quis enim feugiat rutrum.\r\n\r\nMaecenas posuere nisl eget nulla egestas vel placerat nunc dictum. In hac habitasse platea dictumst. Nulla laoreet ullamcorper mi vel congue. Integer a pharetra ligula. Nam bibendum consectetur sem, vitae viverra ipsum semper at. Nullam in eleifend massa. Aliquam egestas arcu nulla, in aliquet felis. Donec quis metus tellus, nec suscipit justo. Ut imperdiet malesuada aliquet. Vestibulum enim lorem, dignissim at lacinia et, bibendum at nulla. Nullam nec nibh enim, non ullamcorper lorem. Curabitur et convallis felis. Proin nibh dolor, vulputate sit amet condimentum nec, tristique in elit. Fusce fermentum pellentesque gravida. Nulla facilisi. Vivamus nec placerat orci.\r\n\r\nDonec auctor, urna eget consequat porttitor, orci lacus posuere enim, a blandit nibh est non nulla. Vivamus dapibus tincidunt lacus, vel vulputate libero sagittis sed. Curabitur dapibus sollicitudin erat in ornare. Cras nec dolor et mi vehicula pulvinar vel vitae mi. Curabitur consectetur neque sed risus mollis ac volutpat ligula tincidunt. Sed metus metus, lobortis a hendrerit eget, elementum eget est. Curabitur tristique nisi sit amet libero adipiscing eleifend. Ut sed nisi sem, ut molestie massa. Aenean velit elit, commodo volutpat tempus eu, adipiscing et elit. Aenean eros odio, ullamcorper eget consequat ut, porttitor a lacus. Integer vel massa leo. Nunc id purus felis. Aliquam ac consectetur lacus. Fusce in elit dolor. Aliquam eget quam eget metus elementum tempus sit amet vel velit.');
INSERT INTO `languagepages` VALUES(62, 54, 3, 64, 'Advanced Search', 'Advanced Search', '', '');
INSERT INTO `languagepages` VALUES(63, 40, 3, 65, 'Uno Dos', 'Uno Dos', 'Porque de tal manera amó Dios al mundo, que dio a su Hijo unigénito, para que todo aquel que cree en El, no se pierda, mas tenga vida eterna.', '16Porque de tal manera amó Dios al mundo, que dio a su Hijo unigénito, para que todo aquel que cree en El, no se pierda, mas tenga vida eterna.\r\n    17Porque Dios no envió a su Hijo al mundo para juzgar al mundo, sino para que el mundo sea salvo por El.\r\n\r\n    18El que cree en El no es condenado; pero el que no cree, ya ha sido condenado, porque no ha creído en el nombre del unigénito Hijo de Dios.\r\n\r\n    19Y este es el juicio: que la luz vino al mundo, y los hombres amaron más las tinieblas que la luz, pues sus acciones eran malas.\r\n\r\n    20Porque todo el que hace lo malo odia la luz, y no viene a la luz para que sus acciones no sean expuestas.\r\n\r\n    21Pero el que practica la verdad viene a la luz, para que sus acciones sean manifestadas que han sido hechas en Dios.');
INSERT INTO `languagepages` VALUES(151, 55, 1, 153, 'News 4', 'News 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nibh sit amet turpis consequat mollis sit amet vitae quam. Curabitur cursus condimentum enim sit amet placerat. Nunc hendrerit accumsan porta. Duis pretium neque porttitor purus porta tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur eu nisi metus, sit amet congue nibh.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nibh sit amet turpis consequat mollis sit amet vitae quam. Curabitur cursus condimentum enim sit amet placerat. Nunc hendrerit accumsan porta. Duis pretium neque porttitor purus porta tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur eu nisi metus, sit amet congue nibh. Cras vel dolor vitae massa volutpat faucibus. Quisque eget commodo augue. Donec non quam vel mi viverra vehicula vel nec enim. Mauris felis arcu, venenatis vel pulvinar eu, malesuada sed arcu. Vestibulum consequat neque augue. Maecenas ac dui nec ante gravida rhoncus non vitae mauris. Mauris nisi ligula, aliquam at suscipit in, lobortis nec odio. Praesent ac dolor ac felis pellentesque ultrices et sed mauris. Curabitur venenatis, sem mattis aliquet dignissim, turpis turpis hendrerit diam, viverra fringilla diam ipsum vitae augue. Cras at est ac enim consectetur tempor. Nunc eget mauris arcu, sagittis aliquet ante.\r\n\r\nCras sit amet consectetur lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus pretium metus sed elit convallis nec lobortis lorem ullamcorper. Etiam nibh arcu, mattis quis sodales sit amet, tempus et ligula. Phasellus id sapien a turpis facilisis ullamcorper. Nulla nec pellentesque felis. Maecenas feugiat nulla et sem iaculis et dapibus lectus dignissim. Nullam tempor est a justo dapibus egestas scelerisque at lorem. Praesent neque orci, convallis ut placerat ut, feugiat non nisl. Fusce libero mauris, aliquet eu placerat nec, pretium ut turpis. Mauris augue lectus, posuere in facilisis ut, posuere ut tortor. Suspendisse pharetra urna at sem pulvinar sit amet consectetur nulla pulvinar. Mauris lorem est, mattis eu ornare in, molestie vitae ante.');
INSERT INTO `languagepages` VALUES(197, 57, 1, 199, 'News 6', 'News 6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nibh sit amet turpis consequat mollis sit amet vitae quam. Curabitur cursus condimentum enim sit amet placerat. Nunc hendrerit accumsan porta. Duis pretium neque porttitor purus porta tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur eu nisi metus, sit amet congue nibh.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nibh sit amet turpis consequat mollis sit amet vitae quam. Curabitur cursus condimentum enim sit amet placerat. Nunc hendrerit accumsan porta. Duis pretium neque porttitor purus porta tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur eu nisi metus, sit amet congue nibh. Cras vel dolor vitae massa volutpat faucibus. Quisque eget commodo augue. Donec non quam vel mi viverra vehicula vel nec enim. Mauris felis arcu, venenatis vel pulvinar eu, malesuada sed arcu. Vestibulum consequat neque augue. Maecenas ac dui nec ante gravida rhoncus non vitae mauris. Mauris nisi ligula, aliquam at suscipit in, lobortis nec odio. Praesent ac dolor ac felis pellentesque ultrices et sed mauris. Curabitur venenatis, sem mattis aliquet dignissim, turpis turpis hendrerit diam, viverra fringilla diam ipsum vitae augue. Cras at est ac enim consectetur tempor. Nunc eget mauris arcu, sagittis aliquet ante.\r\n\r\nCras sit amet consectetur lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus pretium metus sed elit convallis nec lobortis lorem ullamcorper. Etiam nibh arcu, mattis quis sodales sit amet, tempus et ligula. Phasellus id sapien a turpis facilisis ullamcorper. Nulla nec pellentesque felis. Maecenas feugiat nulla et sem iaculis et dapibus lectus dignissim. Nullam tempor est a justo dapibus egestas scelerisque at lorem. Praesent neque orci, convallis ut placerat ut, feugiat non nisl. Fusce libero mauris, aliquet eu placerat nec, pretium ut turpis. Mauris augue lectus, posuere in facilisis ut, posuere ut tortor. Suspendisse pharetra urna at sem pulvinar sit amet consectetur nulla pulvinar. Mauris lorem est, mattis eu ornare in, molestie vitae ante.');
INSERT INTO `languagepages` VALUES(196, 56, 1, 198, 'News 5', 'News 5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nibh sit amet turpis consequat mollis sit amet vitae quam. Curabitur cursus condimentum enim sit amet placerat. Nunc hendrerit accumsan porta. Duis pretium neque porttitor purus porta tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur eu nisi metus, sit amet congue nibh.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nibh sit amet turpis consequat mollis sit amet vitae quam. Curabitur cursus condimentum enim sit amet placerat. Nunc hendrerit accumsan porta. Duis pretium neque porttitor purus porta tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur eu nisi metus, sit amet congue nibh. Cras vel dolor vitae massa volutpat faucibus. Quisque eget commodo augue. Donec non quam vel mi viverra vehicula vel nec enim. Mauris felis arcu, venenatis vel pulvinar eu, malesuada sed arcu. Vestibulum consequat neque augue. Maecenas ac dui nec ante gravida rhoncus non vitae mauris. Mauris nisi ligula, aliquam at suscipit in, lobortis nec odio. Praesent ac dolor ac felis pellentesque ultrices et sed mauris. Curabitur venenatis, sem mattis aliquet dignissim, turpis turpis hendrerit diam, viverra fringilla diam ipsum vitae augue. Cras at est ac enim consectetur tempor. Nunc eget mauris arcu, sagittis aliquet ante.\r\n\r\nCras sit amet consectetur lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus pretium metus sed elit convallis nec lobortis lorem ullamcorper. Etiam nibh arcu, mattis quis sodales sit amet, tempus et ligula. Phasellus id sapien a turpis facilisis ullamcorper. Nulla nec pellentesque felis. Maecenas feugiat nulla et sem iaculis et dapibus lectus dignissim. Nullam tempor est a justo dapibus egestas scelerisque at lorem. Praesent neque orci, convallis ut placerat ut, feugiat non nisl. Fusce libero mauris, aliquet eu placerat nec, pretium ut turpis. Mauris augue lectus, posuere in facilisis ut, posuere ut tortor. Suspendisse pharetra urna at sem pulvinar sit amet consectetur nulla pulvinar. Mauris lorem est, mattis eu ornare in, molestie vitae ante.');
INSERT INTO `languagepages` VALUES(195, 79, 1, 197, 'Announcement 5', 'Nulla sodales, risus at lobortis commodo, arcu dolor sodales nisi, condimentum euismod diam purus se', '', 'Nulla sodales, risus at lobortis commodo, arcu dolor sodales nisi, condimentum euismod diam purus sed nisl. Maecenas eget ligula a neque elementum euismod vel a eros. Duis gravida mattis justo quis sollicitudin. Sed pharetra bibendum dui eget tincidunt. Aliquam sagittis consectetur pulvinar. Vivamus non velit at diam rhoncus convallis. Maecenas bibendum, mauris sed pellentesque eleifend, sapien leo dictum nisi, eget semper ante arcu id augue. Cras vehicula fringilla neque, ut tempus ante convallis et. Cras at lectus tempor lacus sollicitudin rhoncus. Vestibulum sit amet urna sem. Phasellus vitae ante non dolor vestibulum dignissim non id lectus. Integer vel massa vel orci eleifend pretium eget consectetur massa. Aenean consequat accumsan luctus. Pellentesque neque velit, condimentum nec ornare sit amet, hendrerit ut magna. Etiam vestibulum congue ligula, vel vehicula lectus dictum non. Sed interdum ante nec leo posuere vitae interdum nunc porttitor. Duis at aliquam augue. Cras ipsum dolor, volutpat nec imperdiet quis, tempus ac libero. ');
INSERT INTO `languagepages` VALUES(105, 61, 1, 107, 'Logout', 'Logout', '', '');
INSERT INTO `languagepages` VALUES(106, 62, 1, 108, 'Register', 'Register', '', '');
INSERT INTO `languagepages` VALUES(116, 63, 1, 118, 'Forgotten Password', 'Forgotten Password', '', '');
INSERT INTO `languagepages` VALUES(108, 64, 1, 110, 'My Details', 'My Details', '', '');
INSERT INTO `languagepages` VALUES(91, 61, 3, 93, 'Logout', 'Logout', '', '');
INSERT INTO `languagepages` VALUES(92, 62, 3, 94, 'Register', 'Register', '', '');
INSERT INTO `languagepages` VALUES(93, 64, 3, 95, 'My Details', 'My Details', '', '');
INSERT INTO `languagepages` VALUES(94, 63, 3, 96, 'Forgotten Password', 'Forgotten Password', '', '');
INSERT INTO `languagepages` VALUES(95, 49, 3, 97, 'Contact Us', 'Contact Us', '', '');
INSERT INTO `languagepages` VALUES(96, 42, 3, 98, 'News', 'News', '', '');
INSERT INTO `languagepages` VALUES(97, 43, 3, 99, 'News 1', 'News 1', '', '');
INSERT INTO `languagepages` VALUES(109, 65, 1, 111, 'Account Activation', 'Account Activation', '', '');
INSERT INTO `languagepages` VALUES(115, 66, 1, 117, 'Update My Details', 'Update My Details', '', '');
INSERT INTO `languagepages` VALUES(121, 67, 1, 123, 'Password Change', 'Password Change', '', '');
INSERT INTO `languagepages` VALUES(118, 65, 3, 120, 'Activation', 'Activation', '', '');
INSERT INTO `languagepages` VALUES(119, 66, 3, 121, 'Update My Details', 'Update My Details', '', '');
INSERT INTO `languagepages` VALUES(120, 67, 3, 122, 'Change My Password', 'Change My Password', '', '');
INSERT INTO `languagepages` VALUES(190, 75, 1, 192, 'Announcement 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin laoreet imperdiet leo nec commodo. Morbi at eros at velit viverra varius quis eu magna. Duis dignissim consectetur dolor sed porta. Vestibulum sollicitudin euismod felis, eget fermentum ligula facilisis et. Curabitur mattis eros ac diam sodales euismod. Quisque a justo diam. Mauris eget odio augue, sit amet faucibus magna. Aliquam elementum sagittis nibh ut euismod. Maecenas sit amet elit euismod lectus interdum tincidunt. Pellentesque dapibus ultrices iaculis. Curabitur pellentesque dolor rutrum quam porttitor et sollicitudin est ullamcorper. Morbi eu magna sed sem rutrum cursus gravida id erat. Duis urna erat, ullamcorper nec tincidunt eget, ullamcorper vitae ipsum. Sed a orci neque, sed bibendum neque. Vivamus id ipsum molestie metus vulputate scelerisque. Nullam vel ligula arcu. ');
INSERT INTO `languagepages` VALUES(191, 76, 1, 193, 'Announcement 2', 'Vestibulum risus nulla, dapibus id lacinia dignissim, ornare cursus felis.', '', 'Vestibulum risus nulla, dapibus id lacinia dignissim, ornare cursus felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In hac habitasse platea dictumst. Praesent viverra turpis in felis molestie elementum. Suspendisse potenti. Nunc at erat a velit porta iaculis. In tincidunt imperdiet sem, at mollis erat tincidunt ac. Donec neque nunc, viverra sed feugiat commodo, condimentum ac nunc. Fusce orci orci, elementum eu tincidunt id, tempus eu risus. Ut luctus, quam vel mattis tempus, lacus dolor mattis purus, id ornare purus eros ut mauris. Ut in enim neque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam fringilla tempus imperdiet. Cras sit amet leo nec diam pharetra sodales a a lacus. Curabitur nec elit nisi, ac semper nisi. Sed fringilla massa vitae massa sagittis vehicula. Duis ut orci a leo auctor lobortis. Nulla orci mi, condimentum at condimentum id, aliquam non felis. ');
INSERT INTO `languagepages` VALUES(194, 77, 1, 196, 'Announcement 3', 'Curabitur in laoreet ipsum.', '', 'Curabitur in laoreet ipsum. Nulla fringilla, dui eu pharetra venenatis, nisi sapien ultricies risus, in varius lorem felis vitae urna. Aliquam scelerisque est nec augue semper suscipit. Nunc quis ultrices eros. Proin interdum pellentesque felis et bibendum. Nullam ac quam eu leo varius fermentum. Curabitur lobortis elementum massa, sed elementum nulla cursus et. Mauris lobortis, est non sollicitudin lobortis, tortor nisi convallis arcu, sed vestibulum justo augue non magna. Aliquam ut dolor nunc. Sed at molestie felis. Nulla est tortor, pellentesque ut venenatis sed, sodales vel ante. Quisque ultrices pharetra nulla, at pulvinar dui semper nec. Duis in condimentum tellus. Donec pharetra mi et arcu dignissim in sollicitudin arcu dignissim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam id ipsum quis leo egestas varius. Phasellus laoreet lobortis justo. Phasellus viverra sodales augue, id dapibus est rutrum in. Donec mollis pretium nibh non euismod. Proin in aliquet erat. ');
INSERT INTO `languagepages` VALUES(126, 69, 1, 128, 'Cancel Subscription', 'Cancel Subscription', '', '');
INSERT INTO `languagepages` VALUES(127, 70, 1, 129, 'Site Map', 'Site Map', '', '');
INSERT INTO `languagepages` VALUES(128, 70, 3, 130, 'Site Map', 'Site Map', '', '');
INSERT INTO `languagepages` VALUES(129, 69, 3, 131, 'Cancel Subscription', 'Cancel Subscription', '', '');
INSERT INTO `languagepages` VALUES(130, 71, 1, 132, 'Add New Venue', 'Add New Venue', '', '');
INSERT INTO `languagepages` VALUES(193, 78, 1, 195, 'Announcement 4', 'Morbi malesuada nibh magna, vitae facilisis massa.', '', 'Morbi malesuada nibh magna, vitae facilisis massa. Quisque tortor nisl, iaculis et tempus quis, pulvinar vel est. Quisque vel velit justo, vel rutrum nunc. Nullam malesuada fermentum ipsum, at fermentum nibh scelerisque non. Vestibulum vitae turpis eu quam malesuada gravida. Vestibulum sollicitudin magna at urna consequat at pulvinar urna pharetra. Phasellus ornare, dui vel fringilla fermentum, ipsum orci euismod diam, condimentum pellentesque justo enim sit amet massa. Pellentesque accumsan, sapien non rutrum varius, quam lectus euismod nisl, at consequat justo turpis id nunc. Nulla non odio odio. Phasellus viverra, turpis vitae tincidunt volutpat, arcu sem cursus risus, eget ultricies felis purus vel dolor. Quisque vitae lorem vitae mi consectetur sodales at nec nisl. ');
INSERT INTO `languagepages` VALUES(185, 35, 1, 187, 'Home', 'Welcome to our site!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante leo, ornare eu tincidunt posuere, dapibus cursus diam. Ut tempor faucibus nibh, a egestas odio iaculis non. Ut at lorem in elit volutpat suscipit quis nec metus. Integer viverra mauris vel augue egestas et placerat leo pretium. Proin luctus est tempor turpis sagittis ac dictum dui pellentesque. Integer malesuada vulputate consequat.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante leo, ornare eu tincidunt posuere, dapibus cursus diam. Ut tempor faucibus nibh, a egestas odio iaculis non. Ut at lorem in elit volutpat suscipit quis nec metus. Integer viverra mauris vel augue egestas et placerat leo pretium. Proin luctus est tempor turpis sagittis ac dictum dui pellentesque. Integer malesuada vulputate consequat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed in risus id eros interdum posuere vitae lobortis turpis. Phasellus sodales consectetur mauris, in malesuada nisl commodo in. Nunc condimentum quam vitae neque rutrum tempor. In congue, metus eget adipiscing semper, neque velit sollicitudin odio, at dapibus leo tellus vel sapien. Aliquam fringilla pulvinar pellentesque. Nullam accumsan, nulla sed fermentum mollis, orci velit venenatis ipsum, ut fermentum enim turpis vitae eros. Integer nibh lectus, fermentum nec tristique a, aliquet et orci. Fusce dignissim tellus a leo faucibus aliquam. Duis facilisis faucibus elit, congue elementum quam dapibus at. Aliquam rutrum elit a velit pellentesque vel sagittis arcu sodales. Sed commodo dolor eget tortor ultrices lacinia.</p>');
INSERT INTO `languagepages` VALUES(200, 45, 1, 202, 'About Us', 'About Us', 'Praesent eget tortor felis. Praesent at risus ut purus consequat pretium ac et dolor. Morbi laoreet urna non velit mollis ut pretium lacus eleifend. Vestibulum vel magna et est consectetur ultricies. Proin nec augue nisl. Quisque fermentum, enim eget molestie tincidunt, ligula arcu laoreet ligula, eget aliquam nisl nisl nec quam. Sed eget fermentum risus.', '<p>Nam rutrum rhoncus leo ut egestas. Proin suscipit, felis sed consequat luctus, odio metus suscipit tortor, non semper sem mauris id risus. Donec eu posuere mi. Nunc eu malesuada elit. Nunc consectetur eros vel nunc ornare a pharetra arcu tempor. Ut vehicula rutrum enim, eu pharetra sem rutrum id. Integer sed sapien ante. Integer tempor iaculis scelerisque. Donec sed ornare turpis. Proin a elit sapien, sit amet mollis velit. Vestibulum mi eros, aliquam vel porta sed, dignissim imperdiet neque. Fusce luctus tortor quis ligula viverra consequat. Nulla bibendum semper dapibus. Pellentesque lobortis arcu quis lacus scelerisque consectetur. Fusce tincidunt, nisl at lobortis luctus, erat ante hendrerit lorem, a viverra mi risus sed nisi. Morbi nec sapien nec tellus elementum elementum.</p><p>Ut a lectus ante, id sagittis ante. Duis blandit quam a risus imperdiet sit amet pretium velit aliquam. Donec quis dui sapien, sed eleifend nunc. Nulla nulla purus, tincidunt vel aliquet id, pulvinar quis urna. Proin vel diam arcu, eu auctor elit. Cras in purus sed nisi volutpat convallis. Curabitur venenatis vulputate vestibulum. Ut eleifend orci rutrum lorem tincidunt laoreet. Phasellus non dolor quis dolor sagittis euismod. Fusce suscipit lacus nec felis ultricies molestie vel id risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare ante in lectus feugiat condimentum cursus ipsum bibendum. Praesent eget tortor felis. Praesent at risus ut purus consequat pretium ac et dolor. Morbi laoreet urna non velit mollis ut pretium lacus eleifend. Vestibulum vel magna et est consectetur ultricies. Proin nec augue nisl. Quisque fermentum, enim eget molestie tincidunt, ligula arcu laoreet ligula, eget aliquam nisl nisl nec quam. Sed eget fermentum risus. Fusce varius dui in nisl porta ultrices.</p><p>Sed vulputate vestibulum sem ac rutrum. Proin sit amet urna justo. Cras ullamcorper semper faucibus. Mauris a velit arcu, id porta augue. Suspendisse scelerisque odio eu libero commodo condimentum. Morbi ornare pharetra aliquam. Praesent ut nibh id eros pretium cursus et eu tellus. Praesent luctus orci sit amet nulla pharetra mollis sit amet sit amet massa. Mauris imperdiet velit non erat fermentum eleifend a vitae nibh. Curabitur a lacinia libero.</p>');
INSERT INTO `languagepages` VALUES(158, 72, 1, 160, 'Suggest Poll', 'Suggest New Online Poll', '', '');
INSERT INTO `languagepages` VALUES(160, 73, 1, 162, 'Poll Results', 'Poll Results', '', '');
INSERT INTO `languagepages` VALUES(201, 36, 1, 203, 'Test Page 1', 'Test Page 1', 'Etiam vitae dapibus lectus. Aenean porta nunc at dolor aliquet faucibus. Sed quis lacus eget sapien vestibulum rhoncus in lobortis dolor. Donec nunc turpis, scelerisque ut consequat quis, vestibulum sed quam. Suspendisse ante arcu, mattis non convallis vitae, rhoncus congue tellus. Quisque augue elit, gravida ac aliquam id, scelerisque vel velit.Etiam vitae dapibus lectus. Aenean porta nunc at dolor aliquet faucibus. Sed quis lacus eget sapien vestibulum rhoncus in lobortis dolor. Donec nunc turpis, scelerisque ut consequat quis, vestibulum sed quam. Suspendisse ante arcu, mattis non convallis vitae, rhoncus congue tellus. Quisque augue elit, gravida ac aliquam id, scelerisque vel velit.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tincidunt, ante eget consequat rutrum, diam lectus vestibulum est, sagittis egestas dui nunc non nisi. Etiam vitae dapibus lectus. Aenean porta nunc at dolor aliquet faucibus. Sed quis lacus eget sapien vestibulum rhoncus in lobortis dolor. Donec nunc turpis, scelerisque ut consequat quis, vestibulum sed quam. Suspendisse ante arcu, mattis non convallis vitae, rhoncus congue tellus. Quisque augue elit, gravida ac aliquam id, scelerisque vel velit. Fusce dictum, tortor quis posuere porta, nunc turpis bibendum nulla, sed euismod velit felis a diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tincidunt, ante eget consequat rutrum, diam lectus vestibulum est, sagittis egestas dui nunc non nisi. Etiam vitae dapibus lectus. Aenean porta nunc at dolor aliquet faucibus. Sed quis lacus eget sapien vestibulum rhoncus in lobortis dolor. Donec nunc turpis, scelerisque ut consequat quis, vestibulum sed quam. Suspendisse ante arcu, mattis non convallis vitae, rhoncus congue tellus. Quisque augue elit, gravida ac aliquam id, scelerisque vel velit. Fusce dictum, tortor quis posuere porta, nunc turpis bibendum nulla, sed euismod velit felis a diam.Suspendisse sodales nisi ullamcorper velit tincidunt dignissim. Mauris bibendum malesuada ultricies. Curabitur nulla dolor, porttitor et viverra in, mollis in mauris. Curabitur rhoncus placerat ornare. Praesent erat purus, dapibus vel luctus non, pretium ut orci. Donec ornare nisl sed justo ornare luctus. Aliquam scelerisque pulvinar urna id interdum.\r\n\r\n</p><p>Pellentesque nec mi a justo dictum pharetra eget dapibus quam. Donec vel euismod arcu. Integer pretium molestie nibh eget tempor. Pellentesque imperdiet, lacus at malesuada accumsan, est lectus iaculis sapien, et scelerisque lacus massa eget tellus. Donec lacus felis, eleifend non condimentum eget, dapibus sit amet dui. Aliquam aliquet placerat iaculis. Praesent eu arcu ligula. Sed nec tellus orci, ac facilisis justo. Quisque justo tortor, blandit id ornare vel, tincidunt at enim. Aliquam fringilla hendrerit placerat. Vivamus mattis, lectus et aliquet volutpat, dolor mauris luctus libero, id sodales risus massa nec felis. Quisque nunc mi, condimentum id scelerisque at, molestie sed nibh. Sed volutpat magna nec ligula volutpat eu fermentum ligula posuere. Donec id tellus et libero sagittis vestibulum. Nunc velit lacus, vulputate nec euismod sit amet, egestas sed magna. Nulla facilisi. Donec posuere euismod risus vitae aliquam.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL auto_increment,
  `identifier` varchar(100) collate latin1_general_ci NOT NULL,
  `language` varchar(100) collate latin1_general_ci NOT NULL,
  `active` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY  (`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` VALUES(1, 'en-uk', 'English (United Kingdom)', 1, 1);
INSERT INTO `languages` VALUES(2, 'en-us', 'English (United States)', 1, 100);
INSERT INTO `languages` VALUES(3, 'es', 'Spanish', 1, 200);
INSERT INTO `languages` VALUES(4, 'fr', 'French', 0, 300);
INSERT INTO `languages` VALUES(5, 'de', 'German', 0, 400);
INSERT INTO `languages` VALUES(6, 'it', 'Italian', 0, 600);
INSERT INTO `languages` VALUES(7, 'nl', 'Dutch', 0, 700);

-- --------------------------------------------------------

--
-- Table structure for table `metadata`
--

CREATE TABLE `metadata` (
  `metadata_id` int(11) NOT NULL auto_increment,
  `title` varchar(100) collate latin1_general_ci NOT NULL,
  `keywords` text collate latin1_general_ci NOT NULL,
  `description` text collate latin1_general_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY  (`metadata_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=205 ;

--
-- Dumping data for table `metadata`
--

INSERT INTO `metadata` VALUES(104, 'Bienvenido', 'bienvenido, pellentesque', 'Pellentesque nec mi a justo dictum pharetra eget dapibus quam. Donec vel euismod arcu. Integer pretium molestie nibh eget tempor.', 35, 3);
INSERT INTO `metadata` VALUES(187, 'Welcome', 'lorem, ipsum, dolor, sit, amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante leo, ornare eu tincidunt posuere, dapibus cursus diam. Ut tempor faucibus nibh, a egestas odio iaculis non.', 35, 1);
INSERT INTO `metadata` VALUES(203, 'Test Page 1', 'donec, nunc, turpis', 'Donec nunc turpis, scelerisque ut consequat quis, vestibulum sed quam. Suspendisse ante arcu, mattis non convallis vitae, rhoncus congue tellus.', 36, 1);
INSERT INTO `metadata` VALUES(204, 'Test Page 2', 'vistibulum, nulla, lectus', 'Vestibulum nulla lectus, adipiscing vitae lobortis quis, semper eu sem. Nulla tincidunt est at erat auctor dignissim rutrum nisi hendrerit.', 37, 1);
INSERT INTO `metadata` VALUES(185, 'Test Page 3', 'sed, tempus, adipiscing', 'Sed tempus adipiscing consectetur. Etiam odio massa, auctor non porttitor in, ullamcorper vel nisi.', 38, 1);
INSERT INTO `metadata` VALUES(159, 'Uno', 'principio, palabra, Dios', 'En el principio de todas las cosas era la Palabra, y la Palabra estaba con Dios y la Palabra era Dios.', 36, 3);
INSERT INTO `metadata` VALUES(173, 'Test Page 1 1', 'nullam, ipsum, mauris', 'Nullam ipsum mauris, volutpat ac eleifend rutrum, mollis sit amet ipsum. Integer vel nisi sed arcu tempor ultricies nec nec risus.', 39, 1);
INSERT INTO `metadata` VALUES(174, 'Test Page 1 2', 'sed, quis, dolor nisl, mauris', 'Sed quis dolor nisl. Mauris tempus nibh vitae eros vestibulum ornare. Ut placerat, odio a ullamcorper tempor, magna diam aliquet libero, nec venenatis nulla urna nec leo.', 40, 1);
INSERT INTO `metadata` VALUES(102, 'Uno Uno', 'palabra, visitor, suyos, recibirla', 'La Palabra vino a visitar a los suyos, y los suyos no quisieron recibirla.', 39, 3);
INSERT INTO `metadata` VALUES(175, 'Test Page 1 2 1', 'mauris, tempus, nibh', 'Mauris tempus nibh vitae eros vestibulum ornare. Ut placerat, odio a ullamcorper tempor, magna diam aliquet libero, nec venenatis nulla urna nec leo.', 41, 1);
INSERT INTO `metadata` VALUES(20, 'Uno Dos Uno', 'Juan, testimonio, proclamando', 'A este me refería yo cuando dije: El que viene después de mí es superior a mí, porque ya existía antes que yo naciera.', 41, 3);
INSERT INTO `metadata` VALUES(181, 'News', 'news', 'Aliquam erat volutpat. Aliquam erat volutpat. Aliquam nunc eros, malesuada ut vestibulum egestas, volutpat eget ligula.', 42, 1);
INSERT INTO `metadata` VALUES(186, 'News 1', '', '', 43, 1);
INSERT INTO `metadata` VALUES(38, 'Terms and Conditions', '', '', 44, 1);
INSERT INTO `metadata` VALUES(202, 'About Us', 'praesent, eget, tortor', 'Praesent eget tortor felis. Praesent at risus ut purus consequat pretium ac et dolor. Morbi laoreet urna non velit mollis ut pretium lacus eleifend.', 45, 1);
INSERT INTO `metadata` VALUES(176, 'Test Page 1 2 2', 'vestibulum, ante, ipsum', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque dignissim bibendum odio luctus varius. Duis eget venenatis felis.', 46, 1);
INSERT INTO `metadata` VALUES(151, 'News 2', 'quisque, sed, lacinia', 'Quisque sed lacinia libero. Aliquam varius sem consequat magna congue semper. Integer velit nibh, ornare non pretium vel, accumsan ut lectus.', 47, 1);
INSERT INTO `metadata` VALUES(152, 'News 3', 'liquam, elementum, libero', 'liquam elementum libero eu lorem cursus ullamcorper. Sed placerat consequat elementum. Suspendisse placerat posuere ligula id pharetra. Etiam consequat quam ut dolor porttitor eu ultrices mi vehicula.', 48, 1);
INSERT INTO `metadata` VALUES(101, 'Contact Us', 'maecenas, id, adipiscing', 'Sed varius fringilla consequat. Duis convallis eros sit amet elit convallis tempus. Maecenas id adipiscing dolor. Sed vitae diam sit amet ipsum aliquet fringilla aliquam quis leo. Nulla eu erat id sem euismod fermentum vel vitae nibh.', 49, 1);
INSERT INTO `metadata` VALUES(183, 'Test Page 4', 'vestibulum, ante, ipsum, primis', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque placerat ultrices ipsum eget dapibus.', 50, 1);
INSERT INTO `metadata` VALUES(179, 'Test Page 2 1', 'proin, quis, dui, turpis', 'Proin quis dui quis turpis aliquet ultricies. Fusce tincidunt dui ac lorem porta euismod. Quisque nec felis felis. Sed suscipit viverra neque eget mollis. Mauris rutrum dapibus dolor, in aliquet enim lobortis vitae.', 51, 1);
INSERT INTO `metadata` VALUES(178, 'Test Page 2 2', 'nam, eu, nulla, non, metus', 'Nam eu nulla non metus feugiat pellentesque. Donec semper consequat euismod. Praesent ut leo sem. Fusce ultrices, arcu quis volutpat adipiscing, felis nisi tempor lectus, sit amet congue sem odio at metus. Donec et vulputate diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 52, 1);
INSERT INTO `metadata` VALUES(59, 'Search Results', '', '', 53, 1);
INSERT INTO `metadata` VALUES(60, 'Advanced Search', '', '', 54, 1);
INSERT INTO `metadata` VALUES(62, 'Search Results', '', '', 53, 3);
INSERT INTO `metadata` VALUES(63, 'Terms and Conditions', '', '', 44, 3);
INSERT INTO `metadata` VALUES(64, 'Advanced Search', '', '', 54, 3);
INSERT INTO `metadata` VALUES(65, 'Uno Dos', '', 'Porque de tal manera amó Dios al mundo, que dio a su Hijo unigénito, para que todo aquel que cree en El, no se pierda, mas tenga vida eterna.', 40, 3);
INSERT INTO `metadata` VALUES(153, 'News 4', '', '', 55, 1);
INSERT INTO `metadata` VALUES(198, 'News 5', '', '', 56, 1);
INSERT INTO `metadata` VALUES(199, 'News 6', '', '', 57, 1);
INSERT INTO `metadata` VALUES(200, 'Announcements', '', '', 74, 1);
INSERT INTO `metadata` VALUES(192, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', '', 75, 1);
INSERT INTO `metadata` VALUES(193, 'Vestibulum risus nulla, dapibus id lacinia dignissim, ornare cursus felis.', '', '', 76, 1);
INSERT INTO `metadata` VALUES(196, 'Curabitur in laoreet ipsum.', '', '', 77, 1);
INSERT INTO `metadata` VALUES(195, 'Morbi malesuada nibh magna, vitae facilisis massa.', '', '', 78, 1);
INSERT INTO `metadata` VALUES(197, 'Nulla sodales, risus at lobortis commodo, arcu dolor sodales nisi, condimentum euismod diam purus se', '', '', 79, 1);
INSERT INTO `metadata` VALUES(107, 'Logout', '', '', 61, 1);
INSERT INTO `metadata` VALUES(108, 'Register', '', '', 62, 1);
INSERT INTO `metadata` VALUES(118, 'Forgotten Password', '', '', 63, 1);
INSERT INTO `metadata` VALUES(110, 'My Details', '', '', 64, 1);
INSERT INTO `metadata` VALUES(93, 'Logout', '', '', 61, 3);
INSERT INTO `metadata` VALUES(94, 'Register', '', '', 62, 3);
INSERT INTO `metadata` VALUES(95, 'My Details', '', '', 64, 3);
INSERT INTO `metadata` VALUES(96, 'Forgotten Password', '', '', 63, 3);
INSERT INTO `metadata` VALUES(97, 'Contact Us', '', '', 49, 3);
INSERT INTO `metadata` VALUES(98, 'News', '', '', 42, 3);
INSERT INTO `metadata` VALUES(99, 'News 1', '', '', 43, 3);
INSERT INTO `metadata` VALUES(111, 'Account Activation', '', '', 65, 1);
INSERT INTO `metadata` VALUES(117, 'Update My Details', '', '', 66, 1);
INSERT INTO `metadata` VALUES(123, 'Password Change', '', '', 67, 1);
INSERT INTO `metadata` VALUES(120, 'Activation', '', '', 65, 3);
INSERT INTO `metadata` VALUES(121, 'Update My Details', '', '', 66, 3);
INSERT INTO `metadata` VALUES(122, 'Change My Password', '', '', 67, 3);
INSERT INTO `metadata` VALUES(128, 'Cancel Subscription', '', '', 69, 1);
INSERT INTO `metadata` VALUES(129, 'Site Map', '', '', 70, 1);
INSERT INTO `metadata` VALUES(130, 'Site Map', '', '', 70, 3);
INSERT INTO `metadata` VALUES(131, 'Cancel Subscription', '', '', 69, 3);
INSERT INTO `metadata` VALUES(132, 'New Venue', '', '', 71, 1);
INSERT INTO `metadata` VALUES(160, 'Suggest New Online Poll', '', '', 72, 1);
INSERT INTO `metadata` VALUES(162, 'Poll Results', '', '', 73, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagedocuments`
--

CREATE TABLE `pagedocuments` (
  `pagedocument_id` int(11) NOT NULL auto_increment,
  `page_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY  (`pagedocument_id`),
  KEY `page_id` (`page_id`,`document_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=87 ;

--
-- Dumping data for table `pagedocuments`
--

INSERT INTO `pagedocuments` VALUES(83, 36, 6);
INSERT INTO `pagedocuments` VALUES(84, 37, 4);
INSERT INTO `pagedocuments` VALUES(85, 37, 5);
INSERT INTO `pagedocuments` VALUES(86, 37, 6);
INSERT INTO `pagedocuments` VALUES(82, 36, 5);
INSERT INTO `pagedocuments` VALUES(81, 36, 4);
INSERT INTO `pagedocuments` VALUES(60, 50, 6);
INSERT INTO `pagedocuments` VALUES(59, 50, 5);
INSERT INTO `pagedocuments` VALUES(58, 50, 4);
INSERT INTO `pagedocuments` VALUES(64, 35, 4);
INSERT INTO `pagedocuments` VALUES(65, 35, 5);
INSERT INTO `pagedocuments` VALUES(41, 40, 5);
INSERT INTO `pagedocuments` VALUES(42, 40, 6);
INSERT INTO `pagedocuments` VALUES(43, 41, 5);
INSERT INTO `pagedocuments` VALUES(44, 46, 4);
INSERT INTO `pagedocuments` VALUES(45, 46, 5);
INSERT INTO `pagedocuments` VALUES(46, 46, 6);
INSERT INTO `pagedocuments` VALUES(48, 52, 5);
INSERT INTO `pagedocuments` VALUES(49, 51, 4);
INSERT INTO `pagedocuments` VALUES(52, 42, 4);
INSERT INTO `pagedocuments` VALUES(53, 42, 5);
INSERT INTO `pagedocuments` VALUES(54, 42, 6);
INSERT INTO `pagedocuments` VALUES(63, 43, 6);
INSERT INTO `pagedocuments` VALUES(62, 43, 5);
INSERT INTO `pagedocuments` VALUES(61, 43, 4);
INSERT INTO `pagedocuments` VALUES(66, 76, 6);
INSERT INTO `pagedocuments` VALUES(70, 77, 6);
INSERT INTO `pagedocuments` VALUES(68, 78, 4);
INSERT INTO `pagedocuments` VALUES(69, 78, 5);
INSERT INTO `pagedocuments` VALUES(71, 56, 5);
INSERT INTO `pagedocuments` VALUES(72, 56, 6);
INSERT INTO `pagedocuments` VALUES(73, 57, 5);
INSERT INTO `pagedocuments` VALUES(74, 57, 6);
INSERT INTO `pagedocuments` VALUES(78, 45, 4);
INSERT INTO `pagedocuments` VALUES(79, 45, 5);
INSERT INTO `pagedocuments` VALUES(80, 45, 6);

-- --------------------------------------------------------

--
-- Table structure for table `pageimages`
--

CREATE TABLE `pageimages` (
  `pageimage_id` int(11) NOT NULL auto_increment,
  `page_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY  (`pageimage_id`),
  KEY `page_id` (`page_id`,`image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=127 ;

--
-- Dumping data for table `pageimages`
--

INSERT INTO `pageimages` VALUES(121, 36, 3);
INSERT INTO `pageimages` VALUES(81, 43, 4);
INSERT INTO `pageimages` VALUES(124, 37, 4);
INSERT INTO `pageimages` VALUES(76, 50, 11);
INSERT INTO `pageimages` VALUES(79, 38, 15);
INSERT INTO `pageimages` VALUES(123, 36, 6);
INSERT INTO `pageimages` VALUES(12, 47, 3);
INSERT INTO `pageimages` VALUES(13, 48, 4);
INSERT INTO `pageimages` VALUES(14, 55, 6);
INSERT INTO `pageimages` VALUES(109, 56, 7);
INSERT INTO `pageimages` VALUES(112, 57, 5);
INSERT INTO `pageimages` VALUES(20, 72, 10);
INSERT INTO `pageimages` VALUES(122, 36, 4);
INSERT INTO `pageimages` VALUES(120, 36, 5);
INSERT INTO `pageimages` VALUES(70, 42, 8);
INSERT INTO `pageimages` VALUES(85, 35, 5);
INSERT INTO `pageimages` VALUES(86, 35, 3);
INSERT INTO `pageimages` VALUES(87, 35, 4);
INSERT INTO `pageimages` VALUES(88, 35, 6);
INSERT INTO `pageimages` VALUES(89, 35, 7);
INSERT INTO `pageimages` VALUES(90, 35, 8);
INSERT INTO `pageimages` VALUES(91, 35, 9);
INSERT INTO `pageimages` VALUES(93, 35, 12);
INSERT INTO `pageimages` VALUES(92, 35, 11);
INSERT INTO `pageimages` VALUES(49, 39, 7);
INSERT INTO `pageimages` VALUES(50, 39, 8);
INSERT INTO `pageimages` VALUES(51, 40, 9);
INSERT INTO `pageimages` VALUES(52, 40, 12);
INSERT INTO `pageimages` VALUES(53, 41, 5);
INSERT INTO `pageimages` VALUES(54, 46, 7);
INSERT INTO `pageimages` VALUES(55, 46, 9);
INSERT INTO `pageimages` VALUES(56, 46, 12);
INSERT INTO `pageimages` VALUES(58, 52, 7);
INSERT INTO `pageimages` VALUES(59, 51, 6);
INSERT INTO `pageimages` VALUES(60, 51, 7);
INSERT INTO `pageimages` VALUES(71, 42, 9);
INSERT INTO `pageimages` VALUES(72, 42, 11);
INSERT INTO `pageimages` VALUES(82, 43, 6);
INSERT INTO `pageimages` VALUES(80, 43, 5);
INSERT INTO `pageimages` VALUES(77, 50, 15);
INSERT INTO `pageimages` VALUES(83, 43, 14);
INSERT INTO `pageimages` VALUES(84, 43, 15);
INSERT INTO `pageimages` VALUES(94, 35, 14);
INSERT INTO `pageimages` VALUES(95, 35, 15);
INSERT INTO `pageimages` VALUES(101, 75, 8);
INSERT INTO `pageimages` VALUES(100, 75, 6);
INSERT INTO `pageimages` VALUES(102, 76, 5);
INSERT INTO `pageimages` VALUES(103, 76, 14);
INSERT INTO `pageimages` VALUES(104, 76, 15);
INSERT INTO `pageimages` VALUES(107, 77, 7);
INSERT INTO `pageimages` VALUES(106, 78, 4);
INSERT INTO `pageimages` VALUES(108, 79, 9);
INSERT INTO `pageimages` VALUES(110, 56, 14);
INSERT INTO `pageimages` VALUES(111, 56, 15);
INSERT INTO `pageimages` VALUES(113, 57, 3);
INSERT INTO `pageimages` VALUES(114, 57, 8);
INSERT INTO `pageimages` VALUES(115, 57, 15);
INSERT INTO `pageimages` VALUES(117, 45, 5);
INSERT INTO `pageimages` VALUES(118, 45, 3);
INSERT INTO `pageimages` VALUES(119, 45, 15);
INSERT INTO `pageimages` VALUES(125, 37, 7);
INSERT INTO `pageimages` VALUES(126, 37, 12);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL auto_increment,
  `identifier` varchar(100) collate latin1_general_ci NOT NULL,
  `pageorder` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL default '0',
  `created` datetime NOT NULL,
  `active` int(11) NOT NULL default '0',
  `newspage` int(11) NOT NULL default '0',
  `newsitem` int(11) NOT NULL default '0',
  `newsdate` date NOT NULL,
  `announcement` int(11) NOT NULL default '0',
  `inmenu` int(11) NOT NULL default '1',
  `inusermenu` int(11) NOT NULL,
  `homepage` int(11) NOT NULL default '0',
  `listpage` int(11) NOT NULL default '0',
  `image` varchar(100) collate latin1_general_ci NOT NULL,
  `core` int(11) NOT NULL default '0',
  PRIMARY KEY  (`page_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=80 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` VALUES(35, 'home', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-08', 0, 1, 0, 1, 0, '', 1);
INSERT INTO `pages` VALUES(36, 'testpage1', 1000, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-06', 0, 1, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(37, 'testpage2', 2000, 0, '0000-00-00 00:00:00', 1, 0, 0, '0000-00-00', 0, 1, 0, 0, 1, '', 0);
INSERT INTO `pages` VALUES(38, 'testpage3', 3000, 0, '0000-00-00 00:00:00', 0, 0, 0, '2009-07-25', 0, 1, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(39, 'testpage11', 1000, 36, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-16', 0, 1, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(40, 'testpage12', 2000, 36, '0000-00-00 00:00:00', 1, 0, 0, '0000-00-00', 0, 1, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(41, 'testpage121', 1001, 40, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-10', 0, 1, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(42, 'news', 7000, 0, '0000-00-00 00:00:00', 1, 1, 0, '0000-00-00', 0, 1, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(43, 'news1', 100, 42, '0000-00-00 00:00:00', 1, 0, 1, '2009-07-03', 0, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(44, 'tac', 10000, 0, '0000-00-00 00:00:00', 1, 0, 0, '0000-00-00', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(45, 'about', 500, 0, '0000-00-00 00:00:00', 1, 0, 0, '0000-00-00', 0, 1, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(46, 'testpage122', 2000, 40, '2009-06-27 16:19:10', 1, 0, 0, '0000-00-00', 0, 1, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(47, 'news2', 2000, 42, '0000-00-00 00:00:00', 1, 0, 1, '2009-07-24', 0, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(48, 'news3', 3000, 42, '0000-00-00 00:00:00', 1, 0, 1, '2009-07-31', 0, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(49, 'contact', 8000, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-24', 0, 1, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(50, 'testpage4', 4000, 0, '0000-00-00 00:00:00', 0, 0, 0, '2009-07-04', 0, 1, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(51, 'testpage21', 1000, 37, '0000-00-00 00:00:00', 1, 0, 0, '2009-06-19', 0, 1, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(52, 'testpage22', 2000, 37, '2009-06-28 10:33:09', 1, 0, 0, '2009-06-06', 0, 1, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(53, 'searchresults', 9000, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-06-17', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(54, 'advsearch', 8900, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-06-29', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(55, 'news4', 4000, 42, '0000-00-00 00:00:00', 1, 0, 1, '2009-07-01', 0, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(56, 'news5', 5000, 42, '0000-00-00 00:00:00', 1, 0, 1, '2009-07-02', 0, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(57, 'news6', 6000, 42, '0000-00-00 00:00:00', 1, 0, 1, '2009-07-09', 0, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(61, 'logout', 20, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-04', 0, 0, 1, 0, 0, '', 1);
INSERT INTO `pages` VALUES(62, 'register', 30, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-04', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(63, 'forgotten', 90, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-04', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(64, 'mydetails', 60, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-04', 0, 0, 1, 0, 0, '', 1);
INSERT INTO `pages` VALUES(65, 'activate', 40, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-07', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(66, 'updatedetails', 70, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-10', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(67, 'changepassword', 80, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-10', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(69, 'unsubscribe', 50, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-12', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(71, 'newvenue', 150, 0, '2009-07-16 09:20:56', 1, 0, 0, '2009-07-16', 0, 0, 1, 0, 0, '', 1);
INSERT INTO `pages` VALUES(70, 'sitemap', 9500, 0, '0000-00-00 00:00:00', 1, 0, 0, '2009-07-13', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(72, 'newpoll', 160, 0, '2009-07-21 06:36:05', 1, 0, 0, '2009-07-21', 0, 0, 1, 0, 0, '', 1);
INSERT INTO `pages` VALUES(73, 'listpolls', 170, 0, '2009-07-21 12:38:01', 1, 0, 0, '2009-07-21', 0, 0, 0, 0, 0, '', 1);
INSERT INTO `pages` VALUES(74, 'announcements', 5000, 0, '2009-07-28 12:14:47', 1, 0, 0, '2009-07-28', 0, 0, 0, 0, 1, '', 0);
INSERT INTO `pages` VALUES(75, 'announcement1', 1000, 74, '2009-07-28 12:16:50', 1, 0, 0, '2009-07-28', 1, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(76, 'announcement2', 2000, 74, '2009-07-28 12:19:03', 1, 0, 0, '2009-07-28', 1, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(77, 'announcement3', 3000, 74, '2009-07-28 12:20:04', 1, 0, 0, '2009-07-28', 1, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(78, 'announcement4', 4000, 74, '2009-07-28 12:21:58', 1, 0, 0, '2009-07-28', 1, 0, 0, 0, 0, '', 0);
INSERT INTO `pages` VALUES(79, 'announcement5', 5000, 74, '2009-07-28 12:23:38', 1, 0, 0, '2009-07-28', 1, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pageusertypes`
--

CREATE TABLE `pageusertypes` (
  `pageusertype_id` int(11) NOT NULL auto_increment,
  `page_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `visible` int(11) NOT NULL default '1',
  PRIMARY KEY  (`pageusertype_id`),
  KEY `page_id` (`page_id`,`usertype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=820 ;

--
-- Dumping data for table `pageusertypes`
--

INSERT INTO `pageusertypes` VALUES(767, 35, 3, 1);
INSERT INTO `pageusertypes` VALUES(766, 35, 2, 1);
INSERT INTO `pageusertypes` VALUES(396, 44, 4, 1);
INSERT INTO `pageusertypes` VALUES(763, 43, 2, 1);
INSERT INTO `pageusertypes` VALUES(768, 35, 4, 1);
INSERT INTO `pageusertypes` VALUES(732, 41, 4, 1);
INSERT INTO `pageusertypes` VALUES(742, 51, 2, 1);
INSERT INTO `pageusertypes` VALUES(743, 51, 3, 1);
INSERT INTO `pageusertypes` VALUES(727, 40, 2, 1);
INSERT INTO `pageusertypes` VALUES(728, 40, 3, 1);
INSERT INTO `pageusertypes` VALUES(754, 50, 2, 1);
INSERT INTO `pageusertypes` VALUES(510, 49, 4, 1);
INSERT INTO `pageusertypes` VALUES(756, 50, 4, 1);
INSERT INTO `pageusertypes` VALUES(755, 50, 3, 1);
INSERT INTO `pageusertypes` VALUES(740, 52, 3, 1);
INSERT INTO `pageusertypes` VALUES(741, 52, 4, 1);
INSERT INTO `pageusertypes` VALUES(744, 51, 4, 1);
INSERT INTO `pageusertypes` VALUES(739, 52, 2, 1);
INSERT INTO `pageusertypes` VALUES(391, 53, 2, 1);
INSERT INTO `pageusertypes` VALUES(658, 47, 2, 1);
INSERT INTO `pageusertypes` VALUES(813, 45, 4, 1);
INSERT INTO `pageusertypes` VALUES(394, 44, 2, 1);
INSERT INTO `pageusertypes` VALUES(661, 48, 2, 1);
INSERT INTO `pageusertypes` VALUES(662, 48, 3, 1);
INSERT INTO `pageusertypes` VALUES(748, 42, 2, 1);
INSERT INTO `pageusertypes` VALUES(749, 42, 3, 1);
INSERT INTO `pageusertypes` VALUES(734, 46, 3, 1);
INSERT INTO `pageusertypes` VALUES(733, 46, 2, 1);
INSERT INTO `pageusertypes` VALUES(663, 48, 4, 1);
INSERT INTO `pageusertypes` VALUES(812, 45, 3, 1);
INSERT INTO `pageusertypes` VALUES(811, 45, 2, 1);
INSERT INTO `pageusertypes` VALUES(735, 46, 4, 1);
INSERT INTO `pageusertypes` VALUES(764, 43, 3, 1);
INSERT INTO `pageusertypes` VALUES(765, 43, 4, 1);
INSERT INTO `pageusertypes` VALUES(659, 47, 3, 1);
INSERT INTO `pageusertypes` VALUES(660, 47, 4, 1);
INSERT INTO `pageusertypes` VALUES(508, 49, 2, 1);
INSERT INTO `pageusertypes` VALUES(509, 49, 3, 1);
INSERT INTO `pageusertypes` VALUES(815, 36, 3, 1);
INSERT INTO `pageusertypes` VALUES(814, 36, 2, 1);
INSERT INTO `pageusertypes` VALUES(730, 41, 2, 1);
INSERT INTO `pageusertypes` VALUES(750, 42, 4, 1);
INSERT INTO `pageusertypes` VALUES(726, 39, 4, 1);
INSERT INTO `pageusertypes` VALUES(725, 39, 3, 1);
INSERT INTO `pageusertypes` VALUES(729, 40, 4, 1);
INSERT INTO `pageusertypes` VALUES(724, 39, 2, 1);
INSERT INTO `pageusertypes` VALUES(395, 44, 3, 1);
INSERT INTO `pageusertypes` VALUES(762, 38, 4, 0);
INSERT INTO `pageusertypes` VALUES(731, 41, 3, 1);
INSERT INTO `pageusertypes` VALUES(818, 37, 3, 1);
INSERT INTO `pageusertypes` VALUES(819, 37, 4, 1);
INSERT INTO `pageusertypes` VALUES(816, 36, 4, 1);
INSERT INTO `pageusertypes` VALUES(817, 37, 2, 1);
INSERT INTO `pageusertypes` VALUES(760, 38, 2, 1);
INSERT INTO `pageusertypes` VALUES(761, 38, 3, 0);
INSERT INTO `pageusertypes` VALUES(392, 53, 3, 1);
INSERT INTO `pageusertypes` VALUES(393, 53, 4, 1);
INSERT INTO `pageusertypes` VALUES(397, 54, 2, 1);
INSERT INTO `pageusertypes` VALUES(398, 54, 3, 1);
INSERT INTO `pageusertypes` VALUES(399, 54, 4, 1);
INSERT INTO `pageusertypes` VALUES(666, 55, 4, 1);
INSERT INTO `pageusertypes` VALUES(665, 55, 3, 1);
INSERT INTO `pageusertypes` VALUES(664, 55, 2, 1);
INSERT INTO `pageusertypes` VALUES(801, 56, 4, 1);
INSERT INTO `pageusertypes` VALUES(800, 56, 3, 1);
INSERT INTO `pageusertypes` VALUES(799, 56, 2, 1);
INSERT INTO `pageusertypes` VALUES(804, 57, 4, 1);
INSERT INTO `pageusertypes` VALUES(803, 57, 3, 1);
INSERT INTO `pageusertypes` VALUES(802, 57, 2, 1);
INSERT INTO `pageusertypes` VALUES(795, 77, 4, 1);
INSERT INTO `pageusertypes` VALUES(794, 77, 3, 1);
INSERT INTO `pageusertypes` VALUES(793, 77, 2, 1);
INSERT INTO `pageusertypes` VALUES(784, 76, 2, 1);
INSERT INTO `pageusertypes` VALUES(785, 76, 3, 1);
INSERT INTO `pageusertypes` VALUES(786, 76, 4, 1);
INSERT INTO `pageusertypes` VALUES(781, 75, 2, 1);
INSERT INTO `pageusertypes` VALUES(782, 75, 3, 1);
INSERT INTO `pageusertypes` VALUES(783, 75, 4, 1);
INSERT INTO `pageusertypes` VALUES(528, 61, 4, 0);
INSERT INTO `pageusertypes` VALUES(527, 61, 3, 1);
INSERT INTO `pageusertypes` VALUES(526, 61, 2, 1);
INSERT INTO `pageusertypes` VALUES(529, 62, 2, 0);
INSERT INTO `pageusertypes` VALUES(530, 62, 3, 0);
INSERT INTO `pageusertypes` VALUES(531, 62, 4, 1);
INSERT INTO `pageusertypes` VALUES(559, 63, 2, 0);
INSERT INTO `pageusertypes` VALUES(560, 63, 3, 0);
INSERT INTO `pageusertypes` VALUES(561, 63, 4, 1);
INSERT INTO `pageusertypes` VALUES(535, 64, 2, 1);
INSERT INTO `pageusertypes` VALUES(536, 64, 3, 1);
INSERT INTO `pageusertypes` VALUES(537, 64, 4, 0);
INSERT INTO `pageusertypes` VALUES(567, 65, 4, 1);
INSERT INTO `pageusertypes` VALUES(566, 65, 3, 1);
INSERT INTO `pageusertypes` VALUES(565, 65, 2, 1);
INSERT INTO `pageusertypes` VALUES(568, 66, 2, 1);
INSERT INTO `pageusertypes` VALUES(569, 66, 3, 1);
INSERT INTO `pageusertypes` VALUES(570, 66, 4, 0);
INSERT INTO `pageusertypes` VALUES(574, 67, 2, 1);
INSERT INTO `pageusertypes` VALUES(575, 67, 3, 1);
INSERT INTO `pageusertypes` VALUES(576, 67, 4, 0);
INSERT INTO `pageusertypes` VALUES(807, 74, 4, 1);
INSERT INTO `pageusertypes` VALUES(806, 74, 3, 1);
INSERT INTO `pageusertypes` VALUES(805, 74, 2, 1);
INSERT INTO `pageusertypes` VALUES(600, 69, 4, 1);
INSERT INTO `pageusertypes` VALUES(599, 69, 3, 0);
INSERT INTO `pageusertypes` VALUES(598, 69, 2, 0);
INSERT INTO `pageusertypes` VALUES(597, 70, 4, 1);
INSERT INTO `pageusertypes` VALUES(596, 70, 3, 1);
INSERT INTO `pageusertypes` VALUES(595, 70, 2, 1);
INSERT INTO `pageusertypes` VALUES(601, 71, 2, 1);
INSERT INTO `pageusertypes` VALUES(602, 71, 3, 1);
INSERT INTO `pageusertypes` VALUES(603, 71, 4, 0);
INSERT INTO `pageusertypes` VALUES(687, 72, 4, 0);
INSERT INTO `pageusertypes` VALUES(686, 72, 3, 1);
INSERT INTO `pageusertypes` VALUES(685, 72, 2, 1);
INSERT INTO `pageusertypes` VALUES(693, 73, 4, 1);
INSERT INTO `pageusertypes` VALUES(692, 73, 3, 1);
INSERT INTO `pageusertypes` VALUES(691, 73, 2, 1);
INSERT INTO `pageusertypes` VALUES(790, 78, 2, 1);
INSERT INTO `pageusertypes` VALUES(791, 78, 3, 1);
INSERT INTO `pageusertypes` VALUES(792, 78, 4, 1);
INSERT INTO `pageusertypes` VALUES(796, 79, 2, 1);
INSERT INTO `pageusertypes` VALUES(797, 79, 3, 1);
INSERT INTO `pageusertypes` VALUES(798, 79, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `passwordchanges`
--

CREATE TABLE `passwordchanges` (
  `passwordchange_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `changed` datetime NOT NULL,
  PRIMARY KEY  (`passwordchange_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `passwordchanges`
--

INSERT INTO `passwordchanges` VALUES(1, 15, '2009-07-13 03:23:41');
INSERT INTO `passwordchanges` VALUES(2, 14, '2009-07-13 04:03:10');
INSERT INTO `passwordchanges` VALUES(3, 11, '2009-07-13 04:03:17');
INSERT INTO `passwordchanges` VALUES(4, 12, '2009-07-13 04:17:53');
INSERT INTO `passwordchanges` VALUES(5, 15, '2009-07-13 04:42:58');
INSERT INTO `passwordchanges` VALUES(6, 19, '2009-07-13 07:23:47');
INSERT INTO `passwordchanges` VALUES(7, 18, '2009-07-13 07:23:53');
INSERT INTO `passwordchanges` VALUES(8, 16, '2009-07-13 16:05:59');
INSERT INTO `passwordchanges` VALUES(9, 8, '2009-07-29 07:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `pollanswers`
--

CREATE TABLE `pollanswers` (
  `answer_id` int(11) NOT NULL auto_increment,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(100) collate latin1_general_ci NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY  (`answer_id`),
  KEY `pole_id` (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=172 ;

--
-- Dumping data for table `pollanswers`
--

INSERT INTO `pollanswers` VALUES(171, 1, 'Option 1 5', 4);
INSERT INTO `pollanswers` VALUES(170, 1, 'Option 1 4', 3);
INSERT INTO `pollanswers` VALUES(169, 1, 'Option 1 3', 2);
INSERT INTO `pollanswers` VALUES(168, 1, 'Option 1 2', 1);
INSERT INTO `pollanswers` VALUES(167, 1, 'Option 1 1', 0);
INSERT INTO `pollanswers` VALUES(142, 3, 'Option 3 2', 1);
INSERT INTO `pollanswers` VALUES(141, 3, 'Option 3 1', 0);
INSERT INTO `pollanswers` VALUES(166, 4, 'option 4 4', 3);
INSERT INTO `pollanswers` VALUES(165, 4, 'option 4 3', 2);
INSERT INTO `pollanswers` VALUES(164, 4, 'option 4 2', 1);
INSERT INTO `pollanswers` VALUES(163, 4, 'option 4 1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `poll_id` int(11) NOT NULL auto_increment,
  `poll` varchar(100) collate latin1_general_ci NOT NULL,
  `startdate` date NOT NULL,
  `stopdate` date NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY  (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` VALUES(1, 'Poll 1', '2009-07-21', '2009-07-23', 1);
INSERT INTO `polls` VALUES(3, 'Poll 3', '2009-07-21', '2009-07-30', 1);
INSERT INTO `polls` VALUES(4, 'Suggested poll 4', '2009-07-31', '2009-08-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pollvotes`
--

CREATE TABLE `pollvotes` (
  `vote_id` int(11) NOT NULL auto_increment,
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `cast` datetime NOT NULL,
  PRIMARY KEY  (`vote_id`),
  KEY `pole_id` (`poll_id`,`answer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `pollvotes`
--

INSERT INTO `pollvotes` VALUES(1, 1, 159, '2009-07-22 05:59:29');
INSERT INTO `pollvotes` VALUES(2, 1, 161, '2009-07-22 06:01:52');
INSERT INTO `pollvotes` VALUES(3, 1, 161, '2009-07-22 06:10:35');
INSERT INTO `pollvotes` VALUES(4, 1, 160, '2009-07-22 06:19:34');
INSERT INTO `pollvotes` VALUES(5, 1, 158, '2009-07-22 06:20:17');
INSERT INTO `pollvotes` VALUES(6, 1, 158, '2009-07-22 06:20:22');
INSERT INTO `pollvotes` VALUES(7, 1, 158, '2009-07-22 06:20:27');
INSERT INTO `pollvotes` VALUES(8, 1, 162, '2009-07-22 06:20:31');
INSERT INTO `pollvotes` VALUES(9, 1, 162, '2009-07-22 06:20:35');
INSERT INTO `pollvotes` VALUES(10, 1, 162, '2009-07-22 06:20:40');
INSERT INTO `pollvotes` VALUES(11, 1, 162, '2009-07-22 06:20:44');
INSERT INTO `pollvotes` VALUES(12, 1, 162, '2009-07-22 06:20:47');
INSERT INTO `pollvotes` VALUES(13, 1, 162, '2009-07-22 06:20:51');
INSERT INTO `pollvotes` VALUES(14, 1, 162, '2009-07-22 06:20:55');
INSERT INTO `pollvotes` VALUES(15, 1, 162, '2009-07-22 06:20:59');
INSERT INTO `pollvotes` VALUES(16, 1, 162, '2009-07-22 06:21:03');
INSERT INTO `pollvotes` VALUES(17, 1, 162, '2009-07-22 06:21:07');
INSERT INTO `pollvotes` VALUES(18, 3, 141, '2009-07-23 06:16:38');
INSERT INTO `pollvotes` VALUES(19, 3, 142, '2009-07-27 06:20:37');
INSERT INTO `pollvotes` VALUES(20, 3, 142, '2009-07-28 17:53:43');
INSERT INTO `pollvotes` VALUES(21, 3, 142, '2009-07-28 18:13:23');
INSERT INTO `pollvotes` VALUES(22, 3, 142, '2009-07-28 18:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `timezone_id` int(11) NOT NULL auto_increment,
  `timezone` varchar(100) collate latin1_general_ci NOT NULL,
  `hoursdifference` float NOT NULL,
  PRIMARY KEY  (`timezone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` VALUES(1, '(UTC -12:00) International Date Line West', -12);
INSERT INTO `timezones` VALUES(2, '(UTC -11:00) Midway Island, Samoa', -11);
INSERT INTO `timezones` VALUES(3, '(UTC -10:00) Hawaii', -10);
INSERT INTO `timezones` VALUES(4, '(UTC -09:30) Taiohae, Marquesas Islands', -9.5);
INSERT INTO `timezones` VALUES(5, '(UTC -09:00) Alaska', -9);
INSERT INTO `timezones` VALUES(6, '(UTC -08:00) Pacific Time (US &amp; Canada)', -8);
INSERT INTO `timezones` VALUES(7, '(UTC -07:00) Mountain Time (US &amp; Canada)', -7);
INSERT INTO `timezones` VALUES(8, '(UTC -06:00) Central Time (US &amp; Canada), Mexico City', -6);
INSERT INTO `timezones` VALUES(9, '(UTC -05:00) Eastern Time (US &amp; Canada), Bogota, Lima', -5);
INSERT INTO `timezones` VALUES(10, '(UTC -04:30) Venezuela', -4.5);
INSERT INTO `timezones` VALUES(11, '(UTC -04:00) Atlantic Time (Canada), Caracas, La Paz', -4);
INSERT INTO `timezones` VALUES(12, '(UTC -03:30) St. John''s, Newfoundland, Labrador', -3.5);
INSERT INTO `timezones` VALUES(13, '(UTC -03:00) Brazil, Buenos Aires, Georgetown', -3);
INSERT INTO `timezones` VALUES(14, '(UTC -02:00) Mid-Atlantic', -2);
INSERT INTO `timezones` VALUES(15, '(UTC -01:00) Azores, Cape Verde Islands', -1);
INSERT INTO `timezones` VALUES(16, '(UTC 00:00) Western Europe Time, London, Lisbon, Casablanca', 0);
INSERT INTO `timezones` VALUES(17, '(UTC +01:00) Amsterdam, Berlin, Brussels, Copenhagen, Madrid, Paris', 1);
INSERT INTO `timezones` VALUES(18, '(UTC +02:00) Istanbul, Jerusalem, Kaliningrad, South Africa', 2);
INSERT INTO `timezones` VALUES(19, '(UTC +03:00) Baghdad, Riyadh, Moscow, St. Petersburg', 3);
INSERT INTO `timezones` VALUES(20, '(UTC +03:30) Tehran', 3.5);
INSERT INTO `timezones` VALUES(21, '(UTC +04:00) Abu Dhabi, Muscat, Baku, Tbilisi', 4);
INSERT INTO `timezones` VALUES(22, '(UTC +04:30) Kabul', 4.5);
INSERT INTO `timezones` VALUES(23, '(UTC +05:00) Ekaterinburg, Islamabad, Karachi, Tashkent', 5);
INSERT INTO `timezones` VALUES(24, '(UTC +05:30) Bombay, Calcutta, Madras, New Delhi, Colombo', 5.5);
INSERT INTO `timezones` VALUES(25, '(UTC +05:45) Kathmandu', 5.75);
INSERT INTO `timezones` VALUES(26, '(UTC +06:00) Almaty, Dhaka', 6);
INSERT INTO `timezones` VALUES(27, '(UTC +06:30) Yagoon', 6.5);
INSERT INTO `timezones` VALUES(28, '(UTC +07:00) Bangkok, Hanoi, Jakarta', 7);
INSERT INTO `timezones` VALUES(29, '(UTC +08:00) Beijing, Perth, Singapore, Hong Kong', 8);
INSERT INTO `timezones` VALUES(30, '(UTC +08:00) Western Australia', 8);
INSERT INTO `timezones` VALUES(31, '(UTC +09:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk', 9);
INSERT INTO `timezones` VALUES(32, '(UTC +09:30) Adelaide, Darwin, Yakutsk', 9.5);
INSERT INTO `timezones` VALUES(33, '(UTC +10:00) Eastern Australia, Guam, Vladivostok', 10);
INSERT INTO `timezones` VALUES(34, '(UTC +10:30) Lord Howe Island (Australia)', 10.5);
INSERT INTO `timezones` VALUES(35, '(UTC +11:00) Magadan, Solomon Islands, New Caledonia', 11);
INSERT INTO `timezones` VALUES(36, '(UTC +11:30) Norfolk Island', 11.5);
INSERT INTO `timezones` VALUES(37, '(UTC +12:00) Auckland, Wellington, Fiji, Kamchatka', 12);
INSERT INTO `timezones` VALUES(38, '(UTC +12:45) Chatham Island', 12.75);
INSERT INTO `timezones` VALUES(39, '(UTC +13:00) Tonga', 13);
INSERT INTO `timezones` VALUES(40, '(UTC +14:00) Kiribati', 14);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL auto_increment,
  `title` varchar(100) collate latin1_general_ci NOT NULL,
  `firstname` varchar(100) collate latin1_general_ci NOT NULL,
  `lastname` varchar(100) collate latin1_general_ci NOT NULL,
  `username` varchar(100) collate latin1_general_ci NOT NULL,
  `companyname` varchar(100) collate latin1_general_ci NOT NULL,
  `address_id` int(11) NOT NULL,
  `email` varchar(100) collate latin1_general_ci NOT NULL,
  `phone` varchar(100) collate latin1_general_ci NOT NULL,
  `mobile` varchar(100) collate latin1_general_ci NOT NULL,
  `fax` varchar(100) collate latin1_general_ci NOT NULL,
  `website` varchar(100) collate latin1_general_ci NOT NULL,
  `password` varchar(100) collate latin1_general_ci NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `userlogin` int(11) NOT NULL,
  `subscription` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `timezone_id` int(11) NOT NULL,
  `receivehtml` int(11) NOT NULL,
  `activationkey` varchar(100) collate latin1_general_ci NOT NULL,
  `unsubscription` varchar(100) collate latin1_general_ci NOT NULL,
  `active` int(11) NOT NULL,
  `joined` datetime NOT NULL,
  PRIMARY KEY  (`user_id`),
  KEY `usertype_id` (`usertype_id`),
  KEY `language_id` (`language_id`,`timezone_id`),
  KEY `address_id` (`address_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(4, 'Mr', 'Test', 'User1', 'testuser1', '', 11, 'testuser1@iclarence.com', '01234 511112', '', '', '', '2fdf8718e2125c30394db33c0896a882', 3, 1, 1, 1, 16, 1, '', '', 1, '0000-00-00 00:00:00');
INSERT INTO `users` VALUES(5, 'Mr', 'Test', 'User', 'testuser', '', 12, 'testuser@iclarence.com', '6666677777', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 3, 1, 1, 1, 16, 1, '', '', 1, '0000-00-00 00:00:00');
INSERT INTO `users` VALUES(6, 'Mr', 'Ian', 'Clarence', 'iclarence', 'iClarence.com', 13, 'ian@iclarence.com', '01293 611580', '07765 694857', '020 8181 7785', 'http://www.iclarence.com', '9ea6b1078e344f0f569725e2b2157d80', 1, 1, 1, 1, 16, 1, 'activ888meePLzmuAd63PhM6N8ua', '', 1, '0000-00-00 00:00:00');
INSERT INTO `users` VALUES(7, 'Mr', 'Test', 'User2', 'testuser2', '', 14, 'testuser2@iclarence.com', '01293 611580', '', '', '', 'ad0a16e48a162aa6d178790a54be47e7', 3, 1, 1, 3, 16, 1, 'activ888meePLzM6zS2jEeVac3dP3', '', 1, '0000-00-00 00:00:00');
INSERT INTO `users` VALUES(8, 'Mr', 'Admin', 'Admin', 'administrator', '', 22, 'admin@iclarence.com', 'Admin', 'Admin', 'Admin', '', '200ceb26807d6bf99fd6f4f0d1ca54d4', 2, 1, 0, 1, 16, 0, '', '', 1, '0000-00-00 00:00:00');
INSERT INTO `users` VALUES(9, 'Mr', 'Super', 'User', 'superuser', '', 16, 'superuser@iclarence.com', '07765 694857', '07765 694857', '', '', '3d4c1b9f4365f59710e5f7f21c6678f2', 1, 1, 1, 1, 16, 1, '', '', 1, '0000-00-00 00:00:00');
INSERT INTO `users` VALUES(10, 'Mr', 'Test', 'User3', 'testuser3', '', 17, 'testuser3@iclarence.com', '01293 611580', '', '', '', '60d5a0dcf97870449f0ed9b8ad663b23', 3, 1, 1, 1, 16, 1, 'activ888meePLzDp5PT75knAP896', '', 1, '0000-00-00 00:00:00');
INSERT INTO `users` VALUES(11, '', 'qqqqq', '', 'qqqqq', '', 0, 'q@w.e', '', '', '', '', '99a49faca29a6973ff26fa06878b892f', 4, 0, 1, 1, 16, 0, '', '', 0, '0000-00-00 00:00:00');
INSERT INTO `users` VALUES(12, '', 'aaa', 'bbb', 'aaa', '', 0, 'a@b.c', '', '', '', '', '1d7e96989aeeb6401b06e3b54dcdd657', 4, 0, 1, 1, 16, 0, '', '', 0, '0000-00-00 00:00:00');
INSERT INTO `users` VALUES(20, 'Mr', 'f', 'f', 'f', '', 19, 'f@m.b', '3', '3', '3', '', '6eea9b7ef19179a06954edd0f6c05ceb', 3, 1, 1, 1, 16, 1, 'activ888meePLzLwogdV3EZaUjZY6mWiA6', '', 0, '2009-07-29 05:47:04');
INSERT INTO `users` VALUES(18, '', 'ddd', '', 'ddd', '', 0, 'd@d.d', '', '', '', '', '3e19153abef98462da939ee57fc29646', 4, 0, 1, 1, 16, 0, '', 'unsub5cr1Bmii5YW79oxCuAYhsubD', 0, '2009-07-13 05:36:21');
INSERT INTO `users` VALUES(19, '', 'ggg', '', 'ggg', '', 0, 'g@g.g', '', '', '', '', 'd466ab3764afeaf781708ce2334cb74b', 4, 0, 1, 1, 16, 0, '', 'unsub5cr1BmiiVtwXnjnxkTtSShKr', 0, '2009-07-13 07:20:41');
INSERT INTO `users` VALUES(21, 'Mr', 'k', 'k', '', '', 20, 'k@k.k', '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 3, 0, 0, 1, 16, 1, '', '', 0, '2009-07-29 06:51:48');
INSERT INTO `users` VALUES(22, 'Mr', 'o', 'o', 'o', '', 21, 'o@o.o', 'o', '', '', '', 'aba9934119a659255a49562a7b7b0fe9', 3, 1, 1, 1, 16, 1, 'activ888meePLzEQ62JALS9PYy53yUcDu', '', 1, '2009-07-29 06:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE `usertypes` (
  `usertype_id` int(11) NOT NULL auto_increment,
  `usertype` varchar(100) collate latin1_general_ci NOT NULL,
  `description` text collate latin1_general_ci NOT NULL,
  `abbrev` char(1) collate latin1_general_ci NOT NULL,
  `ordering` int(11) NOT NULL,
  `unloggedon` int(11) NOT NULL default '0',
  `admin` int(11) NOT NULL default '0',
  PRIMARY KEY  (`usertype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` VALUES(1, 'superuser', 'superusers', 'x', 1000, 0, 1);
INSERT INTO `usertypes` VALUES(2, 'administrator', 'administrators', 'a', 500, 0, 1);
INSERT INTO `usertypes` VALUES(3, 'ordinary', 'ordinary users', 's', 50, 0, 0);
INSERT INTO `usertypes` VALUES(4, 'anonymous', 'unlogged in users', 'n', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `venue_id` int(11) NOT NULL auto_increment,
  `venue` varchar(100) collate latin1_general_ci NOT NULL,
  `address_id` int(11) NOT NULL,
  `description` text collate latin1_general_ci NOT NULL,
  `image` varchar(100) collate latin1_general_ci NOT NULL,
  `website` varchar(100) collate latin1_general_ci NOT NULL,
  `metadata_id` int(11) NOT NULL,
  PRIMARY KEY  (`venue_id`),
  KEY `address_id` (`address_id`),
  KEY `metadata_id` (`metadata_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `venues`
--

