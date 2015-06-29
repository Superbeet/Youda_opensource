/*
Navicat MySQL Data Transfer

<<<<<<< HEAD
Source Server         : demo
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : dev_youda

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2015-06-12 17:51:39
=======
Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : youda_dev_2

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-06-19 15:45:22
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `answers`
=======
-- Table structure for answers
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_content` longtext NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `support_num` int(11) DEFAULT NULL,
  `anonymous` int(11) DEFAULT NULL,
  `has_attach` int(11) DEFAULT NULL,
  `comment_num` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `answers_7aa0f6ee` (`question_id`),
  KEY `answers_e8701ad4` (`user_id`),
  CONSTRAINT `answers_question_id_5dc187fc_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `answers_user_id_341d40d7_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES ('1', 'Test0', '2015-05-23 14:53:31', '10', '0', '0', '2', '1', '2');
INSERT INTO `answers` VALUES ('2', 'Test1', '2015-05-23 14:53:31', '11', '0', '0', '3', '2', '2');
INSERT INTO `answers` VALUES ('3', 'Test2', '2015-05-23 14:53:31', '12', '0', '0', '4', '3', '2');
INSERT INTO `answers` VALUES ('4', 'Test3', '2015-05-23 14:53:31', '13', '0', '0', '5', '4', '2');
INSERT INTO `answers` VALUES ('5', 'Test4', '2015-05-23 14:53:31', '14', '0', '0', '6', '5', '2');
INSERT INTO `answers` VALUES ('6', 'Test5', '2015-05-23 14:53:31', '15', '0', '0', '7', '6', '2');
INSERT INTO `answers` VALUES ('7', 'Test6', '2015-05-23 14:53:31', '16', '0', '0', '8', '7', '2');
INSERT INTO `answers` VALUES ('8', 'Test7', '2015-05-23 14:53:31', '17', '0', '0', '9', '8', '2');
INSERT INTO `answers` VALUES ('9', 'Test8', '2015-05-23 14:53:31', '18', '0', '0', '10', '9', '2');
INSERT INTO `answers` VALUES ('10', 'Test9', '2015-05-23 14:53:31', '19', '0', '0', '11', '10', '2');
INSERT INTO `answers` VALUES ('11', 'Test10', '2015-05-23 14:54:33', '10', '1', '0', '2', '1', '1');
INSERT INTO `answers` VALUES ('12', 'Test11', '2015-05-23 14:54:33', '11', '1', '0', '3', '2', '1');
INSERT INTO `answers` VALUES ('13', 'Test12', '2015-05-23 14:54:34', '12', '1', '0', '4', '3', '1');
INSERT INTO `answers` VALUES ('14', 'Test13', '2015-05-23 14:54:34', '13', '1', '0', '5', '4', '1');
INSERT INTO `answers` VALUES ('15', 'Test14', '2015-05-23 14:54:34', '14', '1', '0', '6', '5', '1');
INSERT INTO `answers` VALUES ('16', 'Test15', '2015-05-23 14:54:34', '15', '1', '0', '7', '6', '1');
INSERT INTO `answers` VALUES ('17', 'Test16', '2015-05-23 14:54:34', '16', '1', '0', '8', '7', '1');
INSERT INTO `answers` VALUES ('18', 'Test17', '2015-05-23 14:54:34', '17', '1', '0', '9', '8', '1');
INSERT INTO `answers` VALUES ('19', 'Test18', '2015-05-23 14:54:34', '18', '1', '0', '10', '9', '1');
INSERT INTO `answers` VALUES ('20', 'Test19', '2015-05-23 14:54:34', '19', '1', '0', '11', '10', '1');
INSERT INTO `answers` VALUES ('21', 'Test00', '2015-06-10 15:46:39', '20', '1', '0', '10', '10', '2');

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `answers_comments`
=======
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES ('1', 'Test0', '2015-05-23 14:53:31', '10', '0', '0', '2', '1', '2');
INSERT INTO `answers` VALUES ('2', 'Test1', '2015-05-23 14:53:31', '11', '0', '0', '3', '2', '2');
INSERT INTO `answers` VALUES ('3', 'Test2', '2015-05-23 14:53:31', '12', '0', '0', '4', '3', '2');
INSERT INTO `answers` VALUES ('4', 'Test3', '2015-05-23 14:53:31', '13', '0', '0', '5', '4', '2');
INSERT INTO `answers` VALUES ('5', 'Test4', '2015-05-23 14:53:31', '14', '0', '0', '6', '5', '2');
INSERT INTO `answers` VALUES ('6', 'Test5', '2015-05-23 14:53:31', '15', '0', '0', '7', '6', '2');
INSERT INTO `answers` VALUES ('7', 'Test6', '2015-05-23 14:53:31', '16', '0', '0', '8', '7', '2');
INSERT INTO `answers` VALUES ('8', 'Test7', '2015-05-23 14:53:31', '17', '0', '0', '9', '8', '2');
INSERT INTO `answers` VALUES ('9', 'Test8', '2015-05-23 14:53:31', '18', '0', '0', '10', '9', '2');
INSERT INTO `answers` VALUES ('10', 'Test9', '2015-05-23 14:53:31', '19', '0', '0', '11', '10', '2');
INSERT INTO `answers` VALUES ('11', 'Test10', '2015-05-23 14:54:33', '10', '1', '0', '2', '1', '1');
INSERT INTO `answers` VALUES ('12', 'Test11', '2015-05-23 14:54:33', '11', '1', '0', '3', '2', '1');
INSERT INTO `answers` VALUES ('13', 'Test12', '2015-05-23 14:54:34', '12', '1', '0', '4', '3', '1');
INSERT INTO `answers` VALUES ('14', 'Test13', '2015-05-23 14:54:34', '13', '1', '0', '5', '4', '1');
INSERT INTO `answers` VALUES ('15', 'Test14', '2015-05-23 14:54:34', '14', '1', '0', '6', '5', '1');
INSERT INTO `answers` VALUES ('16', 'Test15', '2015-05-23 14:54:34', '15', '1', '0', '7', '6', '1');
INSERT INTO `answers` VALUES ('17', 'Test16', '2015-05-23 14:54:34', '16', '1', '0', '8', '7', '1');
INSERT INTO `answers` VALUES ('18', 'Test17', '2015-05-23 14:54:34', '17', '1', '0', '9', '8', '1');
INSERT INTO `answers` VALUES ('19', 'Test18', '2015-05-23 14:54:34', '18', '1', '0', '10', '9', '1');
INSERT INTO `answers` VALUES ('20', 'Test19', '2015-05-23 14:54:34', '19', '1', '0', '11', '10', '1');

-- ----------------------------
-- Table structure for answers_comments
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `answers_comments`;
CREATE TABLE `answers_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `time` datetime DEFAULT NULL,
  `comment_num` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `answers_comments_fb12e902` (`answer_id`),
  KEY `answers_comments_e8701ad4` (`user_id`),
  CONSTRAINT `answers_comments_answer_id_13738d0_fk_answers_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `answers_comments_user_id_21138b2b_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answers_comments
-- ----------------------------
INSERT INTO `answers_comments` VALUES ('1', 'Test0', '2015-05-23 15:08:08', '1', '0', '1', '2');
INSERT INTO `answers_comments` VALUES ('2', 'Test1', '2015-05-23 15:08:08', '2', '0', '2', '2');
INSERT INTO `answers_comments` VALUES ('3', 'Test2', '2015-05-23 15:08:08', '3', '0', '3', '2');
INSERT INTO `answers_comments` VALUES ('4', 'Test3', '2015-05-23 15:08:08', '4', '0', '4', '2');
INSERT INTO `answers_comments` VALUES ('5', 'Test4', '2015-05-23 15:08:09', '5', '0', '5', '2');
INSERT INTO `answers_comments` VALUES ('6', 'Test5', '2015-05-23 15:08:09', '6', '0', '6', '2');
INSERT INTO `answers_comments` VALUES ('7', 'Test6', '2015-05-23 15:08:09', '7', '0', '7', '2');
INSERT INTO `answers_comments` VALUES ('8', 'Test7', '2015-05-23 15:08:09', '8', '0', '8', '2');
INSERT INTO `answers_comments` VALUES ('9', 'Test8', '2015-05-23 15:08:09', '9', '0', '9', '2');
INSERT INTO `answers_comments` VALUES ('10', 'Test9', '2015-05-23 15:08:09', '10', '0', '10', '2');
INSERT INTO `answers_comments` VALUES ('11', 'Test00', '2015-06-10 15:42:18', '10', '0', '10', '2');

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `articles`
=======
-- Records of answers_comments
-- ----------------------------
INSERT INTO `answers_comments` VALUES ('1', 'Test0', '2015-05-23 15:08:08', '1', '0', '1', '2');
INSERT INTO `answers_comments` VALUES ('2', 'Test1', '2015-05-23 15:08:08', '2', '0', '2', '2');
INSERT INTO `answers_comments` VALUES ('3', 'Test2', '2015-05-23 15:08:08', '3', '0', '3', '2');
INSERT INTO `answers_comments` VALUES ('4', 'Test3', '2015-05-23 15:08:08', '4', '0', '4', '2');
INSERT INTO `answers_comments` VALUES ('5', 'Test4', '2015-05-23 15:08:09', '5', '0', '5', '2');
INSERT INTO `answers_comments` VALUES ('6', 'Test5', '2015-05-23 15:08:09', '6', '0', '6', '2');
INSERT INTO `answers_comments` VALUES ('7', 'Test6', '2015-05-23 15:08:09', '7', '0', '7', '2');
INSERT INTO `answers_comments` VALUES ('8', 'Test7', '2015-05-23 15:08:09', '8', '0', '8', '2');
INSERT INTO `answers_comments` VALUES ('9', 'Test8', '2015-05-23 15:08:09', '9', '0', '9', '2');
INSERT INTO `answers_comments` VALUES ('10', 'Test9', '2015-05-23 15:08:09', '10', '0', '10', '2');

-- ----------------------------
-- Table structure for articles
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) NOT NULL,
  `article_detail` longtext NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `active_time` datetime DEFAULT NULL,
  `browse_num` int(11) DEFAULT NULL,
  `comment_num` int(11) DEFAULT NULL,
  `attention_num` int(11) DEFAULT NULL,
  `topic_id` int(11),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `articles_19b4d727` (`topic_id`),
  KEY `articles_e8701ad4` (`user_id`),
  CONSTRAINT `articles_topic_id_7ce224c7_fk_topics_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`),
  CONSTRAINT `articles_user_id_4cfda94e_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `associations`
=======
-- Table structure for associations
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `associations`;
CREATE TABLE `associations` (
  `ass_id` int(11) NOT NULL AUTO_INCREMENT,
  `ass_name` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `entrance_time` datetime DEFAULT NULL,
  `leave_time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`ass_id`),
  KEY `associations_e8701ad4` (`user_id`),
  CONSTRAINT `associations_user_id_482161d7_fk_users_affiliate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_affiliate` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of associations
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `auth_group`
=======
-- Table structure for auth_group
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `auth_group_permissions`
=======
-- Table structure for auth_group_permissions
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `auth_permission`
=======
-- Table structure for auth_permission
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add answers', '7', 'add_answers');
INSERT INTO `auth_permission` VALUES ('20', 'Can change answers', '7', 'change_answers');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete answers', '7', 'delete_answers');
INSERT INTO `auth_permission` VALUES ('22', 'Can add answers comments', '8', 'add_answerscomments');
INSERT INTO `auth_permission` VALUES ('23', 'Can change answers comments', '8', 'change_answerscomments');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete answers comments', '8', 'delete_answerscomments');
INSERT INTO `auth_permission` VALUES ('25', 'Can add articles', '9', 'add_articles');
INSERT INTO `auth_permission` VALUES ('26', 'Can change articles', '9', 'change_articles');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete articles', '9', 'delete_articles');
INSERT INTO `auth_permission` VALUES ('28', 'Can add associations', '10', 'add_associations');
INSERT INTO `auth_permission` VALUES ('29', 'Can change associations', '10', 'change_associations');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete associations', '10', 'delete_associations');
INSERT INTO `auth_permission` VALUES ('31', 'Can add invitation users', '11', 'add_invitationusers');
INSERT INTO `auth_permission` VALUES ('32', 'Can change invitation users', '11', 'change_invitationusers');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete invitation users', '11', 'delete_invitationusers');
INSERT INTO `auth_permission` VALUES ('34', 'Can add user jobs', '12', 'add_userjobs');
INSERT INTO `auth_permission` VALUES ('35', 'Can change user jobs', '12', 'change_userjobs');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete user jobs', '12', 'delete_userjobs');
INSERT INTO `auth_permission` VALUES ('37', 'Can add logs', '13', 'add_logs');
INSERT INTO `auth_permission` VALUES ('38', 'Can change logs', '13', 'change_logs');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete logs', '13', 'delete_logs');
INSERT INTO `auth_permission` VALUES ('40', 'Can add messages', '14', 'add_messages');
INSERT INTO `auth_permission` VALUES ('41', 'Can change messages', '14', 'change_messages');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete messages', '14', 'delete_messages');
INSERT INTO `auth_permission` VALUES ('43', 'Can add private letters', '15', 'add_privateletters');
INSERT INTO `auth_permission` VALUES ('44', 'Can change private letters', '15', 'change_privateletters');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete private letters', '15', 'delete_privateletters');
INSERT INTO `auth_permission` VALUES ('46', 'Can add questions', '16', 'add_questions');
INSERT INTO `auth_permission` VALUES ('47', 'Can change questions', '16', 'change_questions');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete questions', '16', 'delete_questions');
INSERT INTO `auth_permission` VALUES ('49', 'Can add questions focus', '17', 'add_questionsfocus');
INSERT INTO `auth_permission` VALUES ('50', 'Can change questions focus', '17', 'change_questionsfocus');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete questions focus', '17', 'delete_questionsfocus');
INSERT INTO `auth_permission` VALUES ('52', 'Can add schools', '18', 'add_schools');
INSERT INTO `auth_permission` VALUES ('53', 'Can change schools', '18', 'change_schools');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete schools', '18', 'delete_schools');
INSERT INTO `auth_permission` VALUES ('55', 'Can add user school', '19', 'add_userschool');
INSERT INTO `auth_permission` VALUES ('56', 'Can change user school', '19', 'change_userschool');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete user school', '19', 'delete_userschool');
INSERT INTO `auth_permission` VALUES ('58', 'Can add topics', '20', 'add_topics');
INSERT INTO `auth_permission` VALUES ('59', 'Can change topics', '20', 'change_topics');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete topics', '20', 'delete_topics');
INSERT INTO `auth_permission` VALUES ('61', 'Can add topic focus', '21', 'add_topicfocus');
INSERT INTO `auth_permission` VALUES ('62', 'Can change topic focus', '21', 'change_topicfocus');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete topic focus', '21', 'delete_topicfocus');
INSERT INTO `auth_permission` VALUES ('64', 'Can add users', '22', 'add_users');
INSERT INTO `auth_permission` VALUES ('65', 'Can change users', '22', 'change_users');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete users', '22', 'delete_users');
INSERT INTO `auth_permission` VALUES ('67', 'Can add users focus', '23', 'add_usersfocus');
INSERT INTO `auth_permission` VALUES ('68', 'Can change users focus', '23', 'change_usersfocus');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete users focus', '23', 'delete_usersfocus');
INSERT INTO `auth_permission` VALUES ('70', 'Can add users affiliate', '24', 'add_usersaffiliate');
INSERT INTO `auth_permission` VALUES ('71', 'Can change users affiliate', '24', 'change_usersaffiliate');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete users affiliate', '24', 'delete_usersaffiliate');
INSERT INTO `auth_permission` VALUES ('73', 'Can add questions topic', '25', 'add_questionstopic');
INSERT INTO `auth_permission` VALUES ('74', 'Can change questions topic', '25', 'change_questionstopic');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete questions topic', '25', 'delete_questionstopic');
INSERT INTO `auth_permission` VALUES ('76', 'Can add question school', '26', 'add_questionschool');
INSERT INTO `auth_permission` VALUES ('77', 'Can change question school', '26', 'change_questionschool');
INSERT INTO `auth_permission` VALUES ('78', 'Can delete question school', '26', 'delete_questionschool');

-- ----------------------------
<<<<<<< HEAD
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add answers', '7', 'add_answers');
INSERT INTO `auth_permission` VALUES ('20', 'Can change answers', '7', 'change_answers');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete answers', '7', 'delete_answers');
INSERT INTO `auth_permission` VALUES ('22', 'Can add answers comments', '8', 'add_answerscomments');
INSERT INTO `auth_permission` VALUES ('23', 'Can change answers comments', '8', 'change_answerscomments');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete answers comments', '8', 'delete_answerscomments');
INSERT INTO `auth_permission` VALUES ('25', 'Can add articles', '9', 'add_articles');
INSERT INTO `auth_permission` VALUES ('26', 'Can change articles', '9', 'change_articles');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete articles', '9', 'delete_articles');
INSERT INTO `auth_permission` VALUES ('28', 'Can add associations', '10', 'add_associations');
INSERT INTO `auth_permission` VALUES ('29', 'Can change associations', '10', 'change_associations');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete associations', '10', 'delete_associations');
INSERT INTO `auth_permission` VALUES ('31', 'Can add invitation users', '11', 'add_invitationusers');
INSERT INTO `auth_permission` VALUES ('32', 'Can change invitation users', '11', 'change_invitationusers');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete invitation users', '11', 'delete_invitationusers');
INSERT INTO `auth_permission` VALUES ('34', 'Can add user jobs', '12', 'add_userjobs');
INSERT INTO `auth_permission` VALUES ('35', 'Can change user jobs', '12', 'change_userjobs');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete user jobs', '12', 'delete_userjobs');
INSERT INTO `auth_permission` VALUES ('37', 'Can add logs', '13', 'add_logs');
INSERT INTO `auth_permission` VALUES ('38', 'Can change logs', '13', 'change_logs');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete logs', '13', 'delete_logs');
INSERT INTO `auth_permission` VALUES ('40', 'Can add messages', '14', 'add_messages');
INSERT INTO `auth_permission` VALUES ('41', 'Can change messages', '14', 'change_messages');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete messages', '14', 'delete_messages');
INSERT INTO `auth_permission` VALUES ('43', 'Can add private letters', '15', 'add_privateletters');
INSERT INTO `auth_permission` VALUES ('44', 'Can change private letters', '15', 'change_privateletters');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete private letters', '15', 'delete_privateletters');
INSERT INTO `auth_permission` VALUES ('46', 'Can add questions', '16', 'add_questions');
INSERT INTO `auth_permission` VALUES ('47', 'Can change questions', '16', 'change_questions');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete questions', '16', 'delete_questions');
INSERT INTO `auth_permission` VALUES ('49', 'Can add questions focus', '17', 'add_questionsfocus');
INSERT INTO `auth_permission` VALUES ('50', 'Can change questions focus', '17', 'change_questionsfocus');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete questions focus', '17', 'delete_questionsfocus');
INSERT INTO `auth_permission` VALUES ('52', 'Can add schools', '18', 'add_schools');
INSERT INTO `auth_permission` VALUES ('53', 'Can change schools', '18', 'change_schools');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete schools', '18', 'delete_schools');
INSERT INTO `auth_permission` VALUES ('55', 'Can add user school', '19', 'add_userschool');
INSERT INTO `auth_permission` VALUES ('56', 'Can change user school', '19', 'change_userschool');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete user school', '19', 'delete_userschool');
INSERT INTO `auth_permission` VALUES ('58', 'Can add topics', '20', 'add_topics');
INSERT INTO `auth_permission` VALUES ('59', 'Can change topics', '20', 'change_topics');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete topics', '20', 'delete_topics');
INSERT INTO `auth_permission` VALUES ('61', 'Can add topic focus', '21', 'add_topicfocus');
INSERT INTO `auth_permission` VALUES ('62', 'Can change topic focus', '21', 'change_topicfocus');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete topic focus', '21', 'delete_topicfocus');
INSERT INTO `auth_permission` VALUES ('64', 'Can add users', '22', 'add_users');
INSERT INTO `auth_permission` VALUES ('65', 'Can change users', '22', 'change_users');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete users', '22', 'delete_users');
INSERT INTO `auth_permission` VALUES ('67', 'Can add users focus', '23', 'add_usersfocus');
INSERT INTO `auth_permission` VALUES ('68', 'Can change users focus', '23', 'change_usersfocus');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete users focus', '23', 'delete_usersfocus');
INSERT INTO `auth_permission` VALUES ('70', 'Can add users affiliate', '24', 'add_usersaffiliate');
INSERT INTO `auth_permission` VALUES ('71', 'Can change users affiliate', '24', 'change_usersaffiliate');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete users affiliate', '24', 'delete_usersaffiliate');

-- ----------------------------
-- Table structure for `auth_user`
=======
-- Table structure for auth_user
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
<<<<<<< HEAD

-- ----------------------------
-- Table structure for `auth_user_groups`
=======
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$12000$hbOZnwmknkvF$ebLjDeGkTFg/g/Nuy2YZCPRq2Xht6wQmAmgx0s7STso=', '2015-06-19 14:09:06', '1', 'jeffrey', '', '', 'aslan.yeh2010@gmail.com', '1', '1', '2015-06-19 14:09:06');

-- ----------------------------
-- Table structure for auth_user_groups
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `auth_user_user_permissions`
=======
-- Table structure for auth_user_user_permissions
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `django_admin_log`
=======
-- Table structure for django_admin_log
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `django_content_type`
=======
-- Table structure for django_content_type
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'log entry', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'answers', 'apps', 'answers');
INSERT INTO `django_content_type` VALUES ('8', 'answers comments', 'apps', 'answerscomments');
INSERT INTO `django_content_type` VALUES ('9', 'articles', 'apps', 'articles');
INSERT INTO `django_content_type` VALUES ('10', 'associations', 'apps', 'associations');
INSERT INTO `django_content_type` VALUES ('11', 'invitation users', 'apps', 'invitationusers');
INSERT INTO `django_content_type` VALUES ('12', 'user jobs', 'apps', 'userjobs');
INSERT INTO `django_content_type` VALUES ('13', 'logs', 'apps', 'logs');
INSERT INTO `django_content_type` VALUES ('14', 'messages', 'apps', 'messages');
INSERT INTO `django_content_type` VALUES ('15', 'private letters', 'apps', 'privateletters');
INSERT INTO `django_content_type` VALUES ('16', 'questions', 'apps', 'questions');
INSERT INTO `django_content_type` VALUES ('17', 'questions focus', 'apps', 'questionsfocus');
INSERT INTO `django_content_type` VALUES ('18', 'schools', 'apps', 'schools');
INSERT INTO `django_content_type` VALUES ('19', 'user school', 'apps', 'userschool');
INSERT INTO `django_content_type` VALUES ('20', 'topics', 'apps', 'topics');
INSERT INTO `django_content_type` VALUES ('21', 'topic focus', 'apps', 'topicfocus');
INSERT INTO `django_content_type` VALUES ('22', 'users', 'apps', 'users');
INSERT INTO `django_content_type` VALUES ('23', 'users focus', 'apps', 'usersfocus');
INSERT INTO `django_content_type` VALUES ('24', 'users affiliate', 'apps', 'usersaffiliate');
<<<<<<< HEAD

-- ----------------------------
-- Table structure for `django_migrations`
=======
INSERT INTO `django_content_type` VALUES ('25', 'questions topic', 'apps', 'questionstopic');
INSERT INTO `django_content_type` VALUES ('26', 'question school', 'apps', 'questionschool');

-- ----------------------------
-- Table structure for django_migrations
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2015-05-22 15:40:34');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2015-05-22 15:40:38');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2015-05-22 15:40:39');
INSERT INTO `django_migrations` VALUES ('4', 'apps', '0001_initial', '2015-05-22 15:41:01');
INSERT INTO `django_migrations` VALUES ('5', 'sessions', '0001_initial', '2015-05-22 15:41:02');
INSERT INTO `django_migrations` VALUES ('6', 'apps', '0002_auto_20150522_1543', '2015-05-22 15:43:11');
INSERT INTO `django_migrations` VALUES ('7', 'apps', '0003_auto_20150522_1627', '2015-05-22 16:27:21');
INSERT INTO `django_migrations` VALUES ('8', 'apps', '0004_auto_20150523_1058', '2015-05-23 10:58:39');
INSERT INTO `django_migrations` VALUES ('9', 'apps', '0005_auto_20150523_1105', '2015-05-23 11:05:11');
INSERT INTO `django_migrations` VALUES ('10', 'apps', '0006_auto_20150523_1551', '2015-05-23 15:51:33');

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `django_session`
=======
-- Table structure for django_session
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
<<<<<<< HEAD
INSERT INTO `django_session` VALUES ('m1dntphihowoux4u8i1g9qjggkm7ng33', 'NWEzMTcyYjkzZmZkOGQ4NWE5YjAzMzM1OTQ5NGUzZmNiZDJlNjFkZDp7InVwZGF0ZV90aW1lIjoiMjAxNS0wNi0wNCAxNDoyMTo0NSIsInBhc3N3b3JkIjoiMTIzIiwidXNlcl9uYW1lIjoidG9tY2F0IiwidXNlciI6InRvbWNhdCJ9', '2015-06-18 14:21:45');

-- ----------------------------
-- Table structure for `invitation_users`
=======

-- ----------------------------
-- Table structure for invitation_users
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `invitation_users`;
CREATE TABLE `invitation_users` (
  `invitation_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_user_name` varchar(10) NOT NULL,
  `receive_user_name` varchar(10) NOT NULL,
  `question_id` int(11) NOT NULL,
  `receive_user_id` int(11) NOT NULL,
  `send_user_id` int(11),
  PRIMARY KEY (`invitation_id`),
  KEY `invitation_users_7aa0f6ee` (`question_id`),
  KEY `invitation_users_6234ec5c` (`receive_user_id`),
  KEY `invitation_users_2df99390` (`send_user_id`),
  CONSTRAINT `invitation_users_question_id_774cf272_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `invitation_users_receive_user_id_57d5adbd_fk_users_user_id` FOREIGN KEY (`receive_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `invitation_users_send_user_id_51fe3301_fk_users_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invitation_users
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `logs`
=======
-- Table structure for logs
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `operate_time` datetime DEFAULT NULL,
  `operate_command` varchar(20) NOT NULL,
  `from` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `user_id` int(11),
  PRIMARY KEY (`log_id`),
  KEY `logs_e8701ad4` (`user_id`),
  CONSTRAINT `logs_user_id_25ac125e_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `messages`
=======
-- Table structure for messages
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `message_user_id` int(11) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `messages_4aa5ae28` (`message_user_id`),
  CONSTRAINT `messages_message_user_id_4c82513d_fk_users_user_id` FOREIGN KEY (`message_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messages
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `private_letters`
=======
-- Table structure for private_letters
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `private_letters`;
CREATE TABLE `private_letters` (
  `letter_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_user_name` varchar(10) NOT NULL,
  `receive_user_name` varchar(10) NOT NULL,
  `content` varchar(255) NOT NULL,
  `receive_user_id` int(11) NOT NULL,
  `send_user_id` int(11) NOT NULL,
  PRIMARY KEY (`letter_id`),
  KEY `private_letters_6234ec5c` (`receive_user_id`),
  KEY `private_letters_2df99390` (`send_user_id`),
  CONSTRAINT `private_letters_receive_user_id_19e60ced_fk_users_user_id` FOREIGN KEY (`receive_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `private_letters_send_user_id_1e540631_fk_users_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of private_letters
-- ----------------------------

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `questions`
=======
-- Table structure for questions
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_content` varchar(255) NOT NULL,
  `question_detail` longtext NOT NULL,
  `publish_time` datetime DEFAULT NULL,
  `active_time` datetime DEFAULT NULL,
  `browse_num` int(11) DEFAULT NULL,
  `answer_num` int(11) DEFAULT NULL,
  `want_answer_num` int(11) DEFAULT NULL,
  `attention_num` int(11) DEFAULT NULL,
  `invation_num` int(11) DEFAULT NULL,
  `anonymous` int(11) DEFAULT NULL,
  `has_attach` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `questions_e8701ad4` (`user_id`),
  CONSTRAINT `questions_user_id_7e4fa00f_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', 'how to learn python0', 'which books should i to read?', '2015-05-23 10:45:24', '2015-05-23 10:45:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('2', 'how to learn python1', 'which books should i to read?', '2015-05-23 10:45:25', '2015-05-23 10:45:25', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('3', 'how to learn python2', 'which books should i to read?', '2015-05-23 10:45:25', '2015-05-23 10:45:25', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('4', 'how to learn python3', 'which books should i to read?', '2015-05-23 10:45:25', '2015-05-23 10:45:25', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('5', 'how to learn python4', 'which books should i to read?', '2015-05-23 10:45:25', '2015-05-23 10:45:25', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('6', 'how to learn python5', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('7', 'how to learn python6', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('8', 'how to learn python7', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('9', 'how to learn python8', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('10', 'how to learn python9', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('11', 'how to learn python10', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('12', 'how to learn python11', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('13', 'how to learn python12', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('14', 'how to learn python13', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('15', 'how to learn python14', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('16', 'how to learn python15', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('17', 'how to learn python16', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('18', 'how to learn python17', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('19', 'how to learn python18', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('20', 'how to learn python19', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('21', 'how to learn python20', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('22', 'how to learn python21', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('23', 'how to learn python22', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('24', 'how to learn python23', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('25', 'how to learn python24', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('26', 'how to learn python25', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('27', 'how to learn python26', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('28', 'how to learn python27', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('29', 'how to learn python28', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('30', 'how to learn python29', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('31', 'how to learn python30', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('32', 'how to learn python31', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('33', 'how to learn python32', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('34', 'how to learn python33', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('35', 'how to learn python34', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('36', 'how to learn python35', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('37', 'how to learn python36', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('38', 'how to learn python37', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('39', 'how to learn python38', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('40', 'how to learn python39', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('41', 'how to learn python40', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('42', 'how to learn python41', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('43', 'how to learn python42', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('44', 'how to learn python43', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('45', 'how to learn python44', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('46', 'how to learn python45', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('47', 'how to learn python46', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('48', 'how to learn python47', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('49', 'how to learn python48', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('50', 'how to learn python49', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('51', 'how to learn python50', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('52', 'how to learn python51', 'which books should i to read?', '2015-05-23 11:20:26', '2015-05-23 11:20:26', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('53', 'how to learn python52', 'which books should i to read?', '2015-05-23 11:20:26', '2015-05-23 11:20:26', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('54', 'how to learn python53', 'which books should i to read?', '2015-05-23 11:20:26', '2015-05-23 11:20:26', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('55', 'how to learn python54', 'which books should i to read?', '2015-05-23 11:20:26', '2015-05-23 11:20:26', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('56', 'how to learn python55', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('57', 'how to learn python56', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('58', 'how to learn python57', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('59', 'how to learn python58', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('60', 'how to learn python59', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('61', 'how to learn python60', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('62', 'how to learn python61', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('63', 'how to learn python62', 'which books should i to read?', '2015-05-23 11:21:58', '2015-05-23 11:21:58', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('64', 'how to learn python63', 'which books should i to read?', '2015-05-23 11:21:58', '2015-05-23 11:21:58', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('65', 'how to learn python64', 'which books should i to read?', '2015-05-23 11:21:58', '2015-05-23 11:21:58', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('66', 'how to learn python55', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('67', 'how to learn python56', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('68', 'how to learn python57', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('69', 'how to learn python58', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('70', 'how to learn python59', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('71', 'how to learn python60', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('72', 'how to learn python61', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('73', 'how to learn python62', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('74', 'how to learn python63', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('75', 'how to learn python64', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');

-- ----------------------------
-- Table structure for `questions_focus`
=======
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', 'how to learn python0', 'which books should i to read?', '2015-05-23 10:45:24', '2015-05-23 10:45:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('2', 'how to learn python1', 'which books should i to read?', '2015-05-23 10:45:25', '2015-05-23 10:45:25', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('3', 'how to learn python2', 'which books should i to read?', '2015-05-23 10:45:25', '2015-05-23 10:45:25', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('4', 'how to learn python3', 'which books should i to read?', '2015-05-23 10:45:25', '2015-05-23 10:45:25', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('5', 'how to learn python4', 'which books should i to read?', '2015-05-23 10:45:25', '2015-05-23 10:45:25', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('6', 'how to learn python5', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('7', 'how to learn python6', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('8', 'how to learn python7', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('9', 'how to learn python8', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('10', 'how to learn python9', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '0', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('11', 'how to learn python10', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('12', 'how to learn python11', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('13', 'how to learn python12', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('14', 'how to learn python13', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('15', 'how to learn python14', 'which books should i to read?', '2015-05-23 11:20:24', '2015-05-23 11:20:24', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('16', 'how to learn python15', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('17', 'how to learn python16', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('18', 'how to learn python17', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('19', 'how to learn python18', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('20', 'how to learn python19', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('21', 'how to learn python20', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('22', 'how to learn python21', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('23', 'how to learn python22', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('24', 'how to learn python23', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('25', 'how to learn python24', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('26', 'how to learn python25', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('27', 'how to learn python26', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('28', 'how to learn python27', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('29', 'how to learn python28', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('30', 'how to learn python29', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('31', 'how to learn python30', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('32', 'how to learn python31', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('33', 'how to learn python32', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('34', 'how to learn python33', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('35', 'how to learn python34', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('36', 'how to learn python35', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('37', 'how to learn python36', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('38', 'how to learn python37', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('39', 'how to learn python38', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('40', 'how to learn python39', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('41', 'how to learn python40', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('42', 'how to learn python41', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('43', 'how to learn python42', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('44', 'how to learn python43', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('45', 'how to learn python44', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('46', 'how to learn python45', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('47', 'how to learn python46', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('48', 'how to learn python47', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('49', 'how to learn python48', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('50', 'how to learn python49', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('51', 'how to learn python50', 'which books should i to read?', '2015-05-23 11:20:25', '2015-05-23 11:20:25', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('52', 'how to learn python51', 'which books should i to read?', '2015-05-23 11:20:26', '2015-05-23 11:20:26', '100', '20', '20', '20', '5', null, '1', '3');
INSERT INTO `questions` VALUES ('53', 'how to learn python52', 'which books should i to read?', '2015-05-23 11:20:26', '2015-05-23 11:20:26', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('54', 'how to learn python53', 'which books should i to read?', '2015-05-23 11:20:26', '2015-05-23 11:20:26', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('55', 'how to learn python54', 'which books should i to read?', '2015-05-23 11:20:26', '2015-05-23 11:20:26', '100', '20', '20', '20', '5', null, '1', '1');
INSERT INTO `questions` VALUES ('56', 'how to learn python55', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('57', 'how to learn python56', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('58', 'how to learn python57', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('59', 'how to learn python58', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('60', 'how to learn python59', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('61', 'how to learn python60', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('62', 'how to learn python61', 'which books should i to read?', '2015-05-23 11:21:57', '2015-05-23 11:21:57', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('63', 'how to learn python62', 'which books should i to read?', '2015-05-23 11:21:58', '2015-05-23 11:21:58', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('64', 'how to learn python63', 'which books should i to read?', '2015-05-23 11:21:58', '2015-05-23 11:21:58', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('65', 'how to learn python64', 'which books should i to read?', '2015-05-23 11:21:58', '2015-05-23 11:21:58', '10', '10', '5', '2', '50', null, '1', '1');
INSERT INTO `questions` VALUES ('66', 'how to learn python55', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('67', 'how to learn python56', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('68', 'how to learn python57', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('69', 'how to learn python58', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('70', 'how to learn python59', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('71', 'how to learn python60', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('72', 'how to learn python61', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('73', 'how to learn python62', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('74', 'how to learn python63', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('75', 'how to learn python64', 'which books should i to read?', '2015-05-23 14:30:35', '2015-05-23 14:30:35', '10', '10', '5', '2', '50', null, '1', '2');
INSERT INTO `questions` VALUES ('76', '我是问题', '我是内容', '2015-06-10 10:47:27', '2015-06-10 10:47:27', null, null, null, null, null, null, null, '1');
INSERT INTO `questions` VALUES ('77', '我是问题', '我是内容', '2015-06-10 10:47:32', '2015-06-10 10:47:32', null, null, null, null, null, null, null, '1');
INSERT INTO `questions` VALUES ('78', '我是问题', '我是内容', '2015-06-10 10:47:34', '2015-06-10 10:47:34', null, null, null, null, null, null, null, '1');
INSERT INTO `questions` VALUES ('79', '我是问题', '我是内容', '2015-06-10 10:47:48', '2015-06-10 10:47:48', null, null, null, null, null, null, null, '1');
INSERT INTO `questions` VALUES ('80', '我是问题', '我是内容', '2015-06-10 11:31:05', '2015-06-10 11:31:05', null, null, null, null, null, null, null, '1');
INSERT INTO `questions` VALUES ('81', '我是问题', '<p>我是内容</p>', '2015-06-10 13:37:30', '2015-06-10 13:37:30', null, null, null, null, null, null, null, '1');
INSERT INTO `questions` VALUES ('82', '我是问题', '<p><strong>我是内容</strong></p>\r\n<p><em>我是第二行</em></p>', '2015-06-10 13:45:37', '2015-06-10 13:45:37', null, null, null, null, null, null, null, '1');
INSERT INTO `questions` VALUES ('83', '问题', '<p><strong>我使用的是方式二，在这里也许刚刚接触django的朋友会卡在这里，因为没法明白，怎么传入这个上下文。这里可以使用一个通用的方式去解决这个问题。请原谅我，我将脱离CSRF的内容，帮助你解决一下模板设置的问题，解决它才能解决它。回到django-admin.py startproject xxx初始化的项目中，打开settings.py文件，它是整个django项目的配置文件。找到TEMPLATE_DIRS配置上你模板目录的绝对路径，也可以是os.path生成出来的路径。然后通过from django.shortcuts import render_to_response来导入render_to_response。</strong></p>', '2015-06-10 13:47:33', '2015-06-10 13:47:33', null, null, null, null, null, null, null, '1');
INSERT INTO `questions` VALUES ('84', '问题', '<p>我的问题</p>', '2015-06-10 14:00:00', '2015-06-10 14:00:00', null, null, null, null, null, null, null, '1');
INSERT INTO `questions` VALUES ('85', '问题', '<p>我是问题内容</p>', '2015-06-10 14:04:03', '2015-06-10 14:04:03', null, null, null, null, null, '0', '1', '1');
INSERT INTO `questions` VALUES ('86', 'Europe\'s space agency is still looking for the Philae comet lander', '<div><a href=\"http://www.engadget.com/2015/06/12/esa-search-for-the-philae-lander/\"><img src=\"http://o.aolcdn.com/hss/storage/midas/dc0ddf945c7ef2a832b39ca144f3d23b/202125826/Revised_lander_search_area.jpg\" alt=\"\" data-credit=\"ESA\" data-mep=\"850050\" /></a></div>\r\n<p>The European Space Agency apparently hasn\'t given up on Philae that\'s currently <a href=\"http://www.engadget.com/2014/11/15/esa-comet-lander-philae-sleeps/\">hibernating</a>on comet 67P/Churyumov-Gerasimenko. In a new post on its website, the agency <a href=\"http://blogs.esa.int/rosetta/2015/06/11/the-quest-to-find-philae-2/\">has detailed</a> a highly technical game of \"Where\'s Waldo?\" that it\'s been playing since last year. See, the lander\'s harpoons failed to deploy upon touchdown, and it ended up bouncing away from its landing site until it reached underneath one of the comet\'s cliffs. In addition to being hidden <a href=\"http://www.engadget.com/2014/11/13/esas-comet-lander-is-stuck-in-the-shadows-where-it-cant-harnes/\">in the shadows</a>, the lander is relatively tiny -- even if <a href=\"http://www.engadget.com/2014/11/12/rosetta-philae-lander-comet-touchdown/\">Rosetta\'s</a> (its partner spacecraft) cameras managed to catch it on film, it would appear as a small bright speck and nothing more.</p>\r\n<p id=\"aeaoofnhgocdbnbeljkmbjdmhbcokfdb-mousedown\">So, the team looked at high-res images of the area where the lander most likely is and identified several bright spots that could be Philae. Since they found five candidates, they narrowed the landing location down to a 52 x 525 feet ellipse by using the radio signals transmitted between Rosetta and Philae before it went to sleep. Unfortunately, none of the bright spots were inside the ellipse, though a few were close enough. The team then compared before and after landing photos of the area to find the best candidate that was just outside the ellipse, as shown in the video below.</p>', '2015-06-12 11:05:28', '2015-06-12 11:05:28', null, null, null, null, null, '0', '1', '1');

-- ----------------------------
-- Table structure for questions_focus
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `questions_focus`;
CREATE TABLE `questions_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT,
  `focus_time` datetime NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11),
  PRIMARY KEY (`focus_id`),
  KEY `questions_focus_7aa0f6ee` (`question_id`),
  KEY `questions_focus_e8701ad4` (`user_id`),
  CONSTRAINT `questions_focus_question_id_187d3adf_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `questions_focus_user_id_965238e_fk_users_affiliate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_affiliate` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions_focus
-- ----------------------------
INSERT INTO `questions_focus` VALUES ('1', '2015-05-23 11:17:08', '1', '1');
INSERT INTO `questions_focus` VALUES ('2', '2015-05-23 11:17:08', '2', '1');
INSERT INTO `questions_focus` VALUES ('3', '2015-05-23 11:17:08', '3', '1');
INSERT INTO `questions_focus` VALUES ('4', '2015-05-23 11:17:08', '4', '1');
INSERT INTO `questions_focus` VALUES ('5', '2015-05-23 11:17:08', '5', '1');
INSERT INTO `questions_focus` VALUES ('6', '2015-05-23 11:25:21', '5', '1');
INSERT INTO `questions_focus` VALUES ('7', '2015-05-23 11:25:21', '6', '1');
INSERT INTO `questions_focus` VALUES ('8', '2015-05-23 11:25:21', '7', '1');
INSERT INTO `questions_focus` VALUES ('9', '2015-05-23 11:25:21', '8', '1');
INSERT INTO `questions_focus` VALUES ('10', '2015-05-23 11:25:21', '9', '1');
INSERT INTO `questions_focus` VALUES ('11', '2015-05-23 11:25:39', '10', '1');
INSERT INTO `questions_focus` VALUES ('12', '2015-05-23 11:25:39', '11', '1');
INSERT INTO `questions_focus` VALUES ('13', '2015-05-23 11:25:39', '12', '1');
INSERT INTO `questions_focus` VALUES ('14', '2015-05-23 11:25:39', '13', '1');
INSERT INTO `questions_focus` VALUES ('15', '2015-05-23 11:25:39', '14', '1');
INSERT INTO `questions_focus` VALUES ('16', '2015-05-23 14:30:35', '10', '1');
INSERT INTO `questions_focus` VALUES ('17', '2015-05-23 14:30:35', '11', '1');
INSERT INTO `questions_focus` VALUES ('18', '2015-05-23 14:30:35', '12', '1');
INSERT INTO `questions_focus` VALUES ('19', '2015-05-23 14:30:35', '13', '1');
INSERT INTO `questions_focus` VALUES ('20', '2015-05-23 14:30:35', '14', '1');

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `questions_topic`
=======
-- Table structure for questions_topic
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `questions_topic`;
CREATE TABLE `questions_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questions_id` (`question_id`,`topic_id`),
  KEY `questions_topic_390f3732` (`question_id`),
  KEY `questions_topic_5b4a14a9` (`topic_id`),
  CONSTRAINT `questions_topic_questions_id_11b14698_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `questions_topic_topics_id_57139228_fk_topics_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions_topic
-- ----------------------------
INSERT INTO `questions_topic` VALUES ('1', '1', '1');
INSERT INTO `questions_topic` VALUES ('3', '1', '4');
INSERT INTO `questions_topic` VALUES ('5', '2', '1');
INSERT INTO `questions_topic` VALUES ('2', '2', '5');
INSERT INTO `questions_topic` VALUES ('11', '3', '2');
INSERT INTO `questions_topic` VALUES ('7', '3', '9');
INSERT INTO `questions_topic` VALUES ('10', '3', '10');
INSERT INTO `questions_topic` VALUES ('12', '4', '1');
INSERT INTO `questions_topic` VALUES ('13', '76', '2');
INSERT INTO `questions_topic` VALUES ('14', '77', '2');
INSERT INTO `questions_topic` VALUES ('15', '78', '2');
INSERT INTO `questions_topic` VALUES ('16', '79', '2');
INSERT INTO `questions_topic` VALUES ('17', '80', '2');
INSERT INTO `questions_topic` VALUES ('18', '81', '1');
INSERT INTO `questions_topic` VALUES ('19', '82', '1');
INSERT INTO `questions_topic` VALUES ('20', '83', '1');
INSERT INTO `questions_topic` VALUES ('21', '84', '1');
INSERT INTO `questions_topic` VALUES ('22', '85', '1');
INSERT INTO `questions_topic` VALUES ('23', '86', '2');

-- ----------------------------
-- Table structure for question_school
-- ----------------------------
DROP TABLE IF EXISTS `question_school`;
CREATE TABLE `question_school` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
<<<<<<< HEAD
  UNIQUE KEY `questions_id` (`questions_id`,`topics_id`),
  KEY `questions_topic_390f3732` (`questions_id`),
  KEY `questions_topic_5b4a14a9` (`topics_id`),
  CONSTRAINT `questions_topic_questions_id_11b14698_fk_questions_question_id` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `questions_topic_topics_id_57139228_fk_topics_topic_id` FOREIGN KEY (`topics_id`) REFERENCES `topics` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions_topic
-- ----------------------------
INSERT INTO `questions_topic` VALUES ('1', '1', '1');
INSERT INTO `questions_topic` VALUES ('2', '2', '5');

-- ----------------------------
-- Table structure for `schools`
=======
  UNIQUE KEY `questions_id_index` (`question_id`,`school_id`) USING BTREE,
  KEY `questions_school_index_1` (`school_id`) USING BTREE,
  KEY `questions_school_index_2` (`question_id`) USING BTREE,
  CONSTRAINT `questions_school_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `questions_school_schools_id_fk` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_school
-- ----------------------------
INSERT INTO `question_school` VALUES ('1', '1', '1');
INSERT INTO `question_school` VALUES ('2', '2', '1');
INSERT INTO `question_school` VALUES ('3', '3', '1');
INSERT INTO `question_school` VALUES ('4', '4', '2');
INSERT INTO `question_school` VALUES ('5', '5', '2');
INSERT INTO `question_school` VALUES ('6', '6', '2');
INSERT INTO `question_school` VALUES ('7', '7', '3');
INSERT INTO `question_school` VALUES ('8', '8', '3');
INSERT INTO `question_school` VALUES ('9', '9', '3');
INSERT INTO `question_school` VALUES ('10', '10', '3');

-- ----------------------------
-- Table structure for schools
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `school_category` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
<<<<<<< HEAD

-- ----------------------------
-- Records of schools
-- ----------------------------
INSERT INTO `schools` VALUES ('1', '南京邮电大学', '南京', null);
INSERT INTO `schools` VALUES ('2', '南京邮电大学', '南京', null);
INSERT INTO `schools` VALUES ('3', '北京邮电大学', '南京', null);

-- ----------------------------
-- Table structure for `topics`
=======

-- ----------------------------
-- Records of schools
-- ----------------------------
INSERT INTO `schools` VALUES ('1', 'NUPT', 'NANJING', null);
INSERT INTO `schools` VALUES ('2', 'NKU', 'NANJING', null);
INSERT INTO `schools` VALUES ('3', 'BUPT', 'BEIJING', null);

-- ----------------------------
-- Table structure for topics
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `discuss_num` int(11) DEFAULT NULL,
  `topic_pic` varchar(255) DEFAULT NULL,
  `focus_num` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topics_5d9d18f7` (`school_id`),
  CONSTRAINT `topics_school_id_28ae9866_fk_schools_school_id` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES ('1', '我提意见', '0', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('2', '运营商', '9', '2015-05-03 09:47:40', '1', '我提意见', '0', '1');
INSERT INTO `topics` VALUES ('4', '互联网', '12', '2015-05-03 09:47:48', '5', '应聘深造', '0', '1');
INSERT INTO `topics` VALUES ('5', '应聘深造', '0', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('9', '邮子生活', '0', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('10', '索尼中国', '150', '2015-04-30 20:52:58', '9', '邮子生活', '0', '1');
INSERT INTO `topics` VALUES ('12', '实习', '1', '2015-04-30 21:14:34', '41', '科技学术', '0', '1');
INSERT INTO `topics` VALUES ('41', '科技学术', '0', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('60', '漫漫邮子路', '0', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('113', '职场疑云', '0', null, null, null, null, '1');
<<<<<<< HEAD
INSERT INTO `topics` VALUES ('139', '求职应聘', '5', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('140', '出国留学', '5', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('141', '考研保研', '5', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('142', '我要实习', '5', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('144', '考公务员', '5', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('145', '南邮轶事', '9', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('146', '社会百态', '9', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('147', '怦然心动', '9', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('148', '兴趣社团', '9', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('149', '闲谈人生', '9', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('150', '学术研究', '41', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('152', '创新竞赛', '41', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('153', '行业内幕', '113', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('155', '岗位交流', '113', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('157', '跳槽求职', '113', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('158', '合伙创业', '113', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('159', 'Offer专业户', '60', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('160', '考研达人', '60', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('161', '前辈寄语', '60', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('162', '北邮榜样', '60', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('172', '硬件技术', '41', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('173', '其他', '41', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('174', '资料共享', '0', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('175', '内推发布', '0', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('176', '硕博生活', '9', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('177', '软件开发', '41', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('178', '产品设计', '41', null, null, null, null, '1');
=======
INSERT INTO `topics` VALUES ('139', '求职应聘', '5', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('140', '出国留学', '5', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('141', '考研保研', '5', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('142', '我要实习', '5', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('144', '考公务员', '5', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('145', '南邮轶事', '9', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('146', '社会百态', '9', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('147', '怦然心动', '9', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('148', '兴趣社团', '9', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('149', '闲谈人生', '9', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('150', '学术研究', '41', null, null, null, null, '2');
INSERT INTO `topics` VALUES ('152', '创新竞赛', '41', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('153', '行业内幕', '113', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('155', '岗位交流', '113', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('157', '跳槽求职', '113', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('158', '合伙创业', '113', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('159', 'Offer专业户', '60', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('160', '考研达人', '60', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('161', '前辈寄语', '60', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('162', '北邮榜样', '60', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('172', '硬件技术', '41', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('173', '其他', '41', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('174', '资料共享', '0', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('175', '内推发布', '0', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('176', '硕博生活', '9', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('177', '软件开发', '41', null, null, null, null, '3');
INSERT INTO `topics` VALUES ('178', '产品设计', '41', null, null, null, null, '3');
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
INSERT INTO `topics` VALUES ('179', '产品运营', '41', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('181', '其他', '113', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('183', '冰桶挑战', '60', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('184', '校友频道', '0', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('185', '周兆熊频道', '184', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('186', '郑海波频道', '184', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('187', '梁绮莹频道', '184', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('188', '萌主频道', '184', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('189', '鼎山女尸频道', '184', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('191', '小胖频道', '184', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('192', '南京地区', '175', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('193', '上海地区', '175', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('194', '杭州地区', '175', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('195', '考研复试', '174', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('196', '期末笔记', '174', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('197', '面试宝典', '174', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('198', '其他', '174', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('199', '其他地区', '175', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('200', '于公子频道', '184', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('201', '苏州地区', '175', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('202', '北京地区', '175', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('203', '广东地区', '175', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('204', '野草频道', '184', null, null, null, null, '1');
INSERT INTO `topics` VALUES ('528', '运营商', '1', '2015-04-30 15:09:37', '11', '20141113/c1585b81a562260b78c41cbbf6973538_32_32.jpg', '44', '1');
INSERT INTO `topics` VALUES ('529', '互联网', '1', '2015-04-30 15:09:41', '18', '20141113/2c189ea872fc0be5bc6d68d033c44ef8_32_32.jpg', '68', '1');
INSERT INTO `topics` VALUES ('530', '索尼中国', '150', '2015-04-30 16:36:19', '2', '20141114/84a9040eba6f7dbda97c6ee09fee83ff_32_32.jpg', '7', '1');
INSERT INTO `topics` VALUES ('531', '实习', '150', '2015-04-30 16:41:04', '9', '20141117/302bdb6e37aa707be7da919fc9880b66_32_32.jpg', '27', '1');
INSERT INTO `topics` VALUES ('532', '保研', '2', '2015-04-30 19:08:32', '5', '20140825/f8c9ad81d1c1a188e83ae912ec1b054f_32_32.jpg', '14', '1');
INSERT INTO `topics` VALUES ('533', '华为', '4', '2015-04-30 19:08:34', '9', '20141114/3f8959196e514902fb013a5dac2bfee0_32_32.jpg', '35', '1');
INSERT INTO `topics` VALUES ('534', '阿里巴巴', null, null, '5', '20140825/fd529f7f7b6d14a5f3ce13dc5ecc1c9e_32_32.jpg', '40', '1');
INSERT INTO `topics` VALUES ('535', '广东移动', null, null, '1', '20141020/0d2320ad8b807f7899063dd69824625d_32_32.png', '10', '1');
INSERT INTO `topics` VALUES ('536', '百度', null, null, '10', '20141020/fbe92ff87db65f656732c871e930c06f_32_32.jpg', '27', '1');
INSERT INTO `topics` VALUES ('537', '腾讯', null, null, '7', '20141020/b21608ece71da13863a860cda6b6e842_32_32.png', '34', '1');
INSERT INTO `topics` VALUES ('538', '微软', null, null, '2', '20141020/d60b6a928f0c227b3aa7bd3c9f6761f5_32_32.jpg', '22', '1');
INSERT INTO `topics` VALUES ('539', '论文', null, null, '3', '20141021/d5c615d8d45766eee202a4e2d493ad5f_32_32.jpg', '20', '1');
INSERT INTO `topics` VALUES ('540', '研发', null, null, '10', '20141117/6ee99c59ee21c3bce3dfe188a723b53f_32_32.jpg', '29', '1');
INSERT INTO `topics` VALUES ('541', '大众点评', null, null, '1', '20141021/33ae6ef3c919d43085cd69b2a9de9970_32_32.jpg', '14', '1');
INSERT INTO `topics` VALUES ('542', '美团', null, null, '1', '20141021/f143506e970173a886ceceb95bdf5114_32_32.jpg', '14', '1');
INSERT INTO `topics` VALUES ('543', '留学', null, null, '7', '20141022/4a093af2a33a653b60ba93515a43ca90_32_32.jpg', '18', '1');
INSERT INTO `topics` VALUES ('544', '图像处理', null, null, '3', '20141022/2bf5dc5f19c9c59d6770e8df76d66637_32_32.jpg', '14', '1');
INSERT INTO `topics` VALUES ('545', '人脸识别', null, null, '1', '20141022/1c8836a0bd8ec32f88f84613cfba8705_32_32.jpg', '12', '1');
INSERT INTO `topics` VALUES ('546', 'STITP', null, null, '3', '20141113/942005961221907b46cf74a1686c9d09_32_32.png', '11', '1');
INSERT INTO `topics` VALUES ('547', '读书', null, null, '3', '20141113/505eb0961c28f98e74b90360cd641a7a_32_32.jpg', '16', '1');
INSERT INTO `topics` VALUES ('548', '友答网', null, null, '12', '20141113/07b70d6e974299164a885bbec166a021_32_32.jpg', '25', '1');
INSERT INTO `topics` VALUES ('549', '产品经理', null, null, '11', '20141113/1570ade1b38742369ed9588d754ddcee_32_32.jpg', '41', '1');
INSERT INTO `topics` VALUES ('550', '联想', null, null, '1', '20141113/0b64498cd9660fc2e15614e6993b901f_32_32.jpg', '6', '1');
INSERT INTO `topics` VALUES ('551', '中国移动', null, null, '11', '20141113/41c33504d7814bdfdbf5122716d77e82_32_32.jpg', '17', '1');
INSERT INTO `topics` VALUES ('552', '考研', null, null, '8', '20141113/5d90c046a1ae6e4714abe6797a897b7a_32_32.jpg', '14', '1');
INSERT INTO `topics` VALUES ('553', '创业', null, null, '16', '20141114/1e3546730e6daa660773d9efd798acfd_32_32.jpg', '37', '1');
INSERT INTO `topics` VALUES ('554', '找工作', null, null, '6', '20150118/794d856a5b8762cda319de82020c743f_32_32.jpg', '19', '1');
INSERT INTO `topics` VALUES ('555', '外企', null, null, '2', '20141116/bd3e221f3329843e99043c05fd45a013_32_32.jpg', '16', '1');
INSERT INTO `topics` VALUES ('556', '思杰Citrix', null, null, '3', '20141116/391e77b0ff850a75fa9ba4b5367b10b4_32_32.jpg', '11', '1');
INSERT INTO `topics` VALUES ('557', '中兴', null, null, '5', '20141116/70195b93411a3ea0ecd64c8c3443465c_32_32.jpg', '13', '1');
INSERT INTO `topics` VALUES ('558', '绩点', null, null, '2', '20141116/e29f387743c822547d53decbe3cbb22a_32_32.jpg', '8', '1');
INSERT INTO `topics` VALUES ('559', '毕业论文', null, null, '2', '20141116/ad91f556110f1115909c0057bcc56724_32_32.jpg', '8', '1');
INSERT INTO `topics` VALUES ('560', '答辩', null, null, '1', '20150118/5d4631824eb42eb2016c711e61460476_32_32.png', '4', '1');
INSERT INTO `topics` VALUES ('561', '小状元教育', null, null, '1', '20141117/53afcd405ef288aa4bfc1b5e79b7d488_32_32.jpg', '7', '1');
INSERT INTO `topics` VALUES ('562', 'APP', null, null, '3', '20141116/34646afa7c21b4b79c05c7c663163a3e_32_32.jpg', '18', '1');
INSERT INTO `topics` VALUES ('563', 'MobCtrl万能遥控', null, null, '1', '20141116/cd78898f275341650a6f5293ce16748d_32_32.jpg', '3', '1');
INSERT INTO `topics` VALUES ('564', 'Android', null, null, '11', '20141116/e0ff9371f210e4441a5e5512ae2fd23f_32_32.jpg', '28', '1');
INSERT INTO `topics` VALUES ('565', 'Yahoo', null, null, '1', '20141117/68a3840a557a474caa9ce06ffc45827b_32_32.jpg', '6', '1');
INSERT INTO `topics` VALUES ('566', '卡耐基梅隆CMU', null, null, '1', '20141117/415be73ffd0acc34125eae88556e8e9a_32_32.jpg', '7', '1');
INSERT INTO `topics` VALUES ('567', '因特尔Intel', null, null, '1', '20141117/b75c22b3ae9541797ea815b8a509c6bf_32_32.jpg', '8', '1');
INSERT INTO `topics` VALUES ('568', '高通Qualcomm', null, null, '1', '20141117/840c39bc4d6c0a390d7a1c5a23dee72e_32_32.jpg', '7', '1');
INSERT INTO `topics` VALUES ('569', '英伟达nvidia', null, null, '1', '20141117/435c32d533dea6647a6294591d006aaf_32_32.jpg', '7', '1');
INSERT INTO `topics` VALUES ('570', '半导体', '150', '2015-04-30 16:45:46', '1', '20141117/5534159fd9bf26bbda94cf833b784bae_32_32.jpg', '3', '1');
INSERT INTO `topics` VALUES ('571', '简历', '150', '2015-04-30 16:45:49', '3', '20141117/d79b3a5382a3f451350ead3c61be9abd_32_32.jpg', '18', '1');
INSERT INTO `topics` VALUES ('572', '思杰', null, null, '0', '20150118/0420845c142f969536f0f1c574d82882_32_32.jpg', '3', '1');
INSERT INTO `topics` VALUES ('573', '大数据', null, null, '3', '20141121/dfb720adf3445fe639b39f78460b7704_32_32.gif', '35', '1');
INSERT INTO `topics` VALUES ('574', '云计算', null, null, '2', '20141121/b039feb16f5365fd3c3245fe51695793_32_32.jpg', '19', '1');
INSERT INTO `topics` VALUES ('575', '中国移动互联网公司', null, null, '3', '20141121/2cda484f76562caee44d62284f6573ae_32_32.jpg', '12', '1');
INSERT INTO `topics` VALUES ('576', '移动MM', null, null, '1', '20141121/ca82225d7ed206172143ec01fa42ee1c_32_32.jpg', '7', '1');
INSERT INTO `topics` VALUES ('577', 'o2o', null, null, '4', '20141122/5e3461f57c58e2aaba00cb7982298d16_32_32.jpg', '10', '1');
INSERT INTO `topics` VALUES ('578', '安徽微腾科技股份有限公司', null, null, '1', '20141122/011e41b80644b218de07bd908fc33b78_32_32.jpg', '2', '1');
INSERT INTO `topics` VALUES ('579', '京东', null, null, '0', '20150117/718c235fc01336b22410dc287101f05c_32_32.png', '3', '1');
INSERT INTO `topics` VALUES ('580', '漫漫邮子路', null, null, '10', '20141122/feb65e9cbcf0d6572b9664132c02e959_32_32.jpg', '20', '1');
INSERT INTO `topics` VALUES ('581', '前端开发', null, null, '5', '20141125/c2da84540a227703d748b01bd0b0963c_32_32.jpg', '10', '1');
INSERT INTO `topics` VALUES ('582', '托福', null, null, '1', '20141125/b4b3aefdfa4ba9a68ac8ec4762a73361_32_32.jpg', '6', '1');
INSERT INTO `topics` VALUES ('583', 'GRE', null, null, '1', '20141125/0519d011d3a90cab62066449295a63be_32_32.jpg', '5', '1');
INSERT INTO `topics` VALUES ('584', '计算机视觉CV', null, null, '7', '20141125/76ccfd6214615444be5e2879de8fa7dc_32_32.jpg', '4', '1');
INSERT INTO `topics` VALUES ('585', '5G', null, null, '2', '20141125/83c297a1ada5b3e060cd4e1eee0ad340_32_32.jpg', '14', '1');
INSERT INTO `topics` VALUES ('586', '众筹', null, null, '2', '20141125/b8fe38d594c4a15fc55d063d348ea76f_32_32.jpg', '8', '1');
INSERT INTO `topics` VALUES ('587', '互联网金融', null, null, '2', '20141125/bcc173955f54bdd0bd7d32d1492c7298_32_32.jpg', '19', '1');
INSERT INTO `topics` VALUES ('588', '追梦网', null, null, '3', '20141125/ca549fef5193b29578b269d3623e8582_32_32.jpg', '13', '1');
INSERT INTO `topics` VALUES ('589', 'JAVA', null, null, '4', '20141128/6454b6caa05fb16e0df4bc21bcb5efd5_32_32.jpg', '19', '1');
INSERT INTO `topics` VALUES ('590', '新浪', null, null, '0', null, '3', '1');
INSERT INTO `topics` VALUES ('591', '字符识别OCR', null, null, '1', '20141130/ba87702dcce151d297da05f3436f5bc2_32_32.jpg', '4', '1');
INSERT INTO `topics` VALUES ('592', 'C/C++', null, null, '1', '20141129/151e062933f6353d103838c70a946a84_32_32.jpg', '17', '1');
INSERT INTO `topics` VALUES ('593', '北邮', null, null, '4', null, '6', '1');
INSERT INTO `topics` VALUES ('594', '南京邮电大学', null, null, '0', '20150118/ab14d67445c069a50efdcf654aa1e144_32_32.png', '7', '1');
INSERT INTO `topics` VALUES ('595', '销售工程师', null, null, '1', '20150118/97082deb5b2dad2a8b84f4885d2fcc3e_32_32.png', '6', '1');
INSERT INTO `topics` VALUES ('596', '飞思卡尔', null, null, '2', '20150117/590a943c9f10950f7462d5f2e487048b_32_32.jpg', '3', '1');
INSERT INTO `topics` VALUES ('597', '中兴软创', null, null, '2', '20150117/f4496d0cd772874ab91a5518e392470e_32_32.gif', '9', '1');
INSERT INTO `topics` VALUES ('598', '德州仪器TI', null, null, '1', '20150117/a69510139ac7459f3a7c2109270ffc0a_32_32.jpg', '1', '1');
INSERT INTO `topics` VALUES ('599', '贝尔英才学院', null, null, '2', '20150118/9c010a71aa0e2f8c21cc3e44953d33cd_32_32.gif', '6', '1');
INSERT INTO `topics` VALUES ('600', '计算机学院', null, null, '0', '20150118/660294d3d76d09a344371d6d6afc16c0_32_32.jpg', '7', '1');
INSERT INTO `topics` VALUES ('601', '算法', null, null, '4', '20150118/57babbd53790532909d8ea89406f929a_32_32.jpg', '15', '1');
INSERT INTO `topics` VALUES ('602', '操作系统', null, null, '2', '20150118/5a958434ce515c78e0f0fc42662f9428_32_32.jpg', '11', '1');
INSERT INTO `topics` VALUES ('603', 'PHP', null, null, '1', '20150118/a96f878a51799b4484af175b4b11f583_32_32.jpg', '6', '1');
INSERT INTO `topics` VALUES ('604', 'python', null, null, '4', '20150118/f487d4da3fed238029db1b8042a45fa6_32_32.jpg', '11', '1');
INSERT INTO `topics` VALUES ('605', 'perl', null, null, '1', '20150118/531ed4fade858bd988a8a989398183e8_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('606', 'C++', null, null, '3', '20150118/9b996f44ecf811f7077381b4ee07b750_32_32.jpg', '12', '1');
INSERT INTO `topics` VALUES ('607', 'C#', null, null, '1', '20150118/4e66142dd412befcfb179b076e979442_32_32.jpg', '2', '1');
INSERT INTO `topics` VALUES ('608', 'C', null, null, '1', '20150118/bd26c2440a96eff35f76c50ea285da29_32_32.png', '9', '1');
INSERT INTO `topics` VALUES ('609', '南洋理工NTU', null, null, '2', '20150118/7c21e0444b7b372ccf4cc4d082356bdd_32_32.jpg', '2', '1');
INSERT INTO `topics` VALUES ('610', '联通', null, null, '1', '20150118/46dfa7908ab3d57933b11fe5a2d208bd_32_32.jpg', '4', '1');
INSERT INTO `topics` VALUES ('611', '江苏省电信', null, null, '3', '20150118/dfdf7a257da86275b7407abe05e86d4f_32_32.jpg', '7', '1');
INSERT INTO `topics` VALUES ('612', '南邮', null, null, '3', '20150118/364ff6add5abf18873f86774319a5f87_32_32.jpg', '12', '1');
INSERT INTO `topics` VALUES ('613', '电院', null, null, '0', null, '2', '1');
INSERT INTO `topics` VALUES ('614', '自动化', null, null, '0', '20150118/b6f9ccfbf56878b2e6c8a018e995009c_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('615', '浙江大学', null, null, '1', '20150118/e101f39d4c99810c2872b57b7dc02ae8_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('616', '同济大学', null, null, '1', '20150118/403e645d5c11740dc1577463f76fdd45_32_32.png', '3', '1');
INSERT INTO `topics` VALUES ('617', '东南大学', null, null, '1', '20150118/e073a6ad916f05b9a8ae99a9131b9406_32_32.png', '3', '1');
INSERT INTO `topics` VALUES ('618', '上海交大', null, null, '1', '20150117/9086ad0ab62900a92e4f9c16744eae29_32_32.jpg', '3', '1');
INSERT INTO `topics` VALUES ('619', '计算机工程学院', null, null, '0', '20150118/cd7c00193872f5877b96588c3ec5a238_32_32.jpg', '5', '1');
INSERT INTO `topics` VALUES ('620', '公务员', null, null, '1', '20150118/d215ff0d3d0b365f12751ff9f0f61ee0_32_32.png', '6', '1');
INSERT INTO `topics` VALUES ('621', '中国电信', null, null, '4', '20150118/6a12cf80235727f1a41a0be5b4c1421d_32_32.jpg', '7', '1');
INSERT INTO `topics` VALUES ('622', '中国联通', null, null, '4', '20150118/0c5d0ded9bd780d7a944d3223552d692_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('623', '规划设计', null, null, '1', '20150118/2efe8b84dfa52fd41a3794bd3297cc6c_32_32.png', '4', '1');
INSERT INTO `topics` VALUES ('624', '网络优化', null, null, '1', '20150118/764914f928aea2d5338fad163695a797_32_32.png', '7', '1');
INSERT INTO `topics` VALUES ('625', '客户经理', null, null, '2', '20141215/def75c4300f25dc13cb49936c21f9550_32_32.jpg', '6', '1');
INSERT INTO `topics` VALUES ('626', '朱琦教授', null, null, '4', '20141216/b43ce186337002d68116afcbb7d339ba_32_32.jpg', '11', '1');
INSERT INTO `topics` VALUES ('627', '通信与信息工程学院', null, null, '0', '20150118/b0560f410c1f18f91bb2370534d4e23c_32_32.jpg', '6', '1');
INSERT INTO `topics` VALUES ('628', '南邮SCDA', null, null, '2', '20141216/a71efbb29ebcc4358cecdad34a9ffc4d_32_32.jpg', '3', '1');
INSERT INTO `topics` VALUES ('629', '技术支持', null, null, '4', '20150118/8f9ef5d82a935a66a3c7c2fe9d1c0cef_32_32.jpg', '9', '1');
INSERT INTO `topics` VALUES ('630', '通信工程', null, null, '1', '20150118/538dcd0513435ee449aae5c00dcaef8c_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('631', '香港城市大学', null, null, '1', '20150118/676cfd93c82d98ed98580ce5aeae65ad_32_32.png', '3', '1');
INSERT INTO `topics` VALUES ('632', 'Electronic Engineering', null, null, '0', '20150118/0a819814f4df7a831bc4888bb34f9200_32_32.png', '4', '1');
INSERT INTO `topics` VALUES ('633', '趋势科技', null, null, '2', '20141231/e318cd293a60e427f4e31464bc858b53_32_32.jpg', '6', '1');
INSERT INTO `topics` VALUES ('634', '虹软', null, null, '1', '20141231/481d64334568e9045a94257ae310fe93_32_32.png', '5', '1');
INSERT INTO `topics` VALUES ('635', '南京爱立信熊猫通信有限公司', null, null, '1', '20150118/aa9b5b577c35164c68eb72cc53d01f89_32_32.jpg', '1', '1');
INSERT INTO `topics` VALUES ('636', '内部创业', null, null, '1', null, '6', '1');
INSERT INTO `topics` VALUES ('637', '郑荣翔闲扯', null, null, '4', '20150102/9b6addf66d1573ff06bfc514d4b53bf7_32_32.jpg', '5', '1');
INSERT INTO `topics` VALUES ('638', 'ACM', null, null, '4', '20150118/bab701b68d58889e29276a26ca6dcc5a_32_32.png', '4', '1');
INSERT INTO `topics` VALUES ('639', '通信与信息系统', null, null, '0', '20150118/6d4256772669178677a0e06b3aac6d47_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('640', '小米通讯技术有限公司', null, null, '2', '20150118/2a133e086f83bfbe00e1b4b2b7513a0e_32_32.png', '5', '1');
INSERT INTO `topics` VALUES ('641', 'IBM', null, null, '1', '20150118/4942626f6c367d10762968d77c89b9ce_32_32.jpg', '3', '1');
INSERT INTO `topics` VALUES ('642', '香港科技大学', null, null, '1', '20150118/f7154dbb81d20fafdf9569e3c7d518dc_32_32.png', '1', '1');
INSERT INTO `topics` VALUES ('643', '跳槽', null, null, '2', '20150118/f1ed9d78352cb98a02bfb1673c7cdaa5_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('644', '上海移动', null, null, '1', '20150118/1a64d836213318919cc04b033f8d3a69_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('645', '中国邮政——南京', null, null, '1', '20150118/78454bfa4f33c5cacd126412755011a6_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('646', 'offer比较', null, null, '1', null, '6', '1');
INSERT INTO `topics` VALUES ('647', '自动化测试', null, null, '1', '20150118/216b0dce9c7f9b216b7055389972ec66_32_32.jpg', '2', '1');
INSERT INTO `topics` VALUES ('648', '职业规划', null, null, '5', '20150118/2a4ff78fd021b29cb4a025a17a9297cd_32_32.png', '6', '1');
INSERT INTO `topics` VALUES ('649', '网易', null, null, '1', '20150118/e07fdcf783de899ffd4341d9e80fe4ae_32_32.png', '4', '1');
INSERT INTO `topics` VALUES ('650', 'CSDN南邮', null, null, '1', '20150118/cb0fda472236b06dd312109cfaa30cb7_32_32.jpg', '5', '1');
INSERT INTO `topics` VALUES ('651', '博士', null, null, '4', '20150118/58568f44bb0389060594939e5a550a14_32_32.png', '4', '1');
INSERT INTO `topics` VALUES ('652', '淘宝', null, null, '1', '20150118/aa45ff6ba7a518a66d2625ec5eb94bc9_32_32.jpg', '3', '1');
INSERT INTO `topics` VALUES ('653', 'Oracle', null, null, '1', '20150118/5d055594a51335e0af66f32fb03201be_32_32.jpg', '4', '1');
INSERT INTO `topics` VALUES ('654', 'linux', null, null, '1', '20150118/f72b1fade6b0ee079ac510df6d3366c9_32_32.png', '5', '1');
INSERT INTO `topics` VALUES ('655', '数据库', null, null, '1', '20150118/5c82f464dd2642a49da779cc303f77eb_32_32.jpg', '5', '1');
INSERT INTO `topics` VALUES ('656', '生物医学工程', null, null, '1', '20150118/57aad0e32cc05809ec47d551094e5c1d_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('657', '地生院', null, null, '1', '20150118/47fc5d920225bae2fe9aded13d2e7a37_32_32.png', '2', '1');
INSERT INTO `topics` VALUES ('658', '校科协', null, null, '1', null, '8', '1');
INSERT INTO `topics` VALUES ('659', '校学生会', null, null, '1', null, '3', '1');
INSERT INTO `topics` VALUES ('660', '南邮创业协会', null, null, '1', null, '6', '1');
INSERT INTO `topics` VALUES ('661', '学通社', null, null, '1', null, '3', '1');
INSERT INTO `topics` VALUES ('662', '科研', null, null, '1', null, '2', '1');
INSERT INTO `topics` VALUES ('663', '笔试 ', null, null, '2', null, '2', '1');
INSERT INTO `topics` VALUES ('664', '面试', null, null, '3', null, '2', '1');
INSERT INTO `topics` VALUES ('665', '国电南瑞', null, null, '1', null, '3', '1');
INSERT INTO `topics` VALUES ('666', '群面', null, null, '1', null, '2', '1');
INSERT INTO `topics` VALUES ('667', '婚姻 ', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('668', '两性', null, null, '2', null, '1', '1');
INSERT INTO `topics` VALUES ('669', '家庭', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('670', '数学建模', null, null, '1', null, '4', '1');
INSERT INTO `topics` VALUES ('671', '研究生', null, null, '4', null, '4', '1');
INSERT INTO `topics` VALUES ('672', '可穿戴设备', null, null, '2', null, '3', '1');
INSERT INTO `topics` VALUES ('673', '语音识别', null, null, '1', null, '3', '1');
INSERT INTO `topics` VALUES ('674', '手势识别', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('675', '虚拟现实', null, null, '1', null, '2', '1');
INSERT INTO `topics` VALUES ('676', '金融', null, null, '2', null, '2', '1');
INSERT INTO `topics` VALUES ('677', '工作', null, null, '2', null, '2', '1');
INSERT INTO `topics` VALUES ('678', '毕业', null, null, '2', null, '3', '1');
INSERT INTO `topics` VALUES ('679', '杨震', null, null, '2', '20150127/2e4c04857ab88cf809804fa4edaae9d4_32_32.jpg', '5', '1');
INSERT INTO `topics` VALUES ('680', '教师点评', null, null, '2', null, '2', '1');
INSERT INTO `topics` VALUES ('681', '程序员', null, null, '2', null, '9', '1');
INSERT INTO `topics` VALUES ('682', '爱情', null, null, '1', null, '2', '1');
INSERT INTO `topics` VALUES ('683', '孙放', null, null, '4', '20150130/f6d9b9be1a5c5b1cac65c286cef664a4_32_32.png', '6', '1');
INSERT INTO `topics` VALUES ('684', '南邮摄影协会', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('685', '摄影', null, null, '1', null, '2', '1');
INSERT INTO `topics` VALUES ('686', '交友', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('687', '职场', null, null, '1', null, '2', '1');
INSERT INTO `topics` VALUES ('688', 'IOS', null, null, '2', null, '2', '1');
INSERT INTO `topics` VALUES ('689', '融合通信', null, null, '1', '20150202/e759d598fdad9187f6c8d64ab0a50779_32_32.png', '1', '1');
INSERT INTO `topics` VALUES ('690', '移动互联网', null, null, '1', null, '4', '1');
INSERT INTO `topics` VALUES ('691', '公益', null, null, '2', null, '1', '1');
INSERT INTO `topics` VALUES ('692', '南京三星', null, null, '1', null, '2', '1');
INSERT INTO `topics` VALUES ('693', '.net', null, null, '1', null, '5', '1');
INSERT INTO `topics` VALUES ('694', 'OTT', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('695', '小米', null, null, '1', null, '2', '1');
INSERT INTO `topics` VALUES ('696', '智能手环', null, null, '1', null, '2', '1');
INSERT INTO `topics` VALUES ('697', '数据挖掘', null, null, '1', null, '4', '1');
INSERT INTO `topics` VALUES ('698', '机器学习', null, null, '1', null, '4', '1');
INSERT INTO `topics` VALUES ('699', 'C语言', null, null, '2', null, '3', '1');
INSERT INTO `topics` VALUES ('700', '信息安全', null, null, '1', null, '3', '1');
INSERT INTO `topics` VALUES ('701', '友答网冰桶挑战', null, null, '7', '20150220/b56def41749a8156b64539fbddc96077_32_32.png', '4', '1');
INSERT INTO `topics` VALUES ('702', '英语六级CET6', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('703', '吴蒙教授', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('704', '杨庚教授', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('705', '荆晓远教授', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('706', '蒋国平教授', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('707', '微信', null, null, '4', null, '2', '1');
INSERT INTO `topics` VALUES ('708', 'QQ', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('709', '支付宝', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('710', '友问友答', null, null, '3', '20150220/a0deee25833a83e5f17b327a72ad152d_32_32.jpg', '4', '1');
INSERT INTO `topics` VALUES ('711', '电影', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('712', '视频摘要', null, null, '2', null, '1', '1');
INSERT INTO `topics` VALUES ('713', '周兆熊专栏', null, null, '12', '20150228/ab4a739e5a4201cfbb0359122d615f1f_32_32.jpg', '4', '1');
INSERT INTO `topics` VALUES ('714', '摆渡', null, null, '12', '20150228/1c6afb439043845c599962651b4cdc29_32_32.jpg', '2', '1');
INSERT INTO `topics` VALUES ('715', '郑海波频道', null, null, '2', '20150228/94bd42792ded340a3686f1e86a626023_32_32.jpg', '1', '1');
INSERT INTO `topics` VALUES ('716', '铁塔公司', null, null, '1', null, '1', '1');
INSERT INTO `topics` VALUES ('721', '鼎山女尸频道', null, null, '1', '20150303/b61c1e1c6929dfc8986b690dddd41964_32_32.png', '5', '1');
INSERT INTO `topics` VALUES ('722', '野草频道', null, null, '1', '20150303/67b0b6a60e182ab4a23d037ce09ee563_32_32.png', '1', '1');
INSERT INTO `topics` VALUES ('723', '爬虫', null, null, '1', null, '1', '1');

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `topic_focus`
=======
-- Table structure for topic_focus
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `topic_focus`;
CREATE TABLE `topic_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT,
  `focus_time` datetime NOT NULL,
  `topic_id` int(11),
  `user_id` int(11),
  PRIMARY KEY (`focus_id`),
  KEY `topic_focus_19b4d727` (`topic_id`),
  KEY `topic_focus_e8701ad4` (`user_id`),
  CONSTRAINT `topic_focus_topic_id_5284cd89_fk_topics_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`),
  CONSTRAINT `topic_focus_user_id_5791fb3c_fk_users_affiliate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_affiliate` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic_focus
-- ----------------------------
INSERT INTO `topic_focus` VALUES ('1', '2015-05-23 15:46:26', '1', '1');
INSERT INTO `topic_focus` VALUES ('3', '2015-05-23 15:47:09', '5', '1');
INSERT INTO `topic_focus` VALUES ('4', '2015-05-23 15:47:17', '9', '1');
INSERT INTO `topic_focus` VALUES ('7', '2015-05-23 15:52:22', '5', '2');
INSERT INTO `topic_focus` VALUES ('8', '2015-05-23 15:52:33', '1', '2');
INSERT INTO `topic_focus` VALUES ('9', '2015-05-23 17:24:38', '9', '2');

-- ----------------------------
<<<<<<< HEAD
-- Table structure for `users`
=======
-- Table structure for users
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `verify_email` int(11) DEFAULT NULL,
  `first_login` int(11) DEFAULT NULL,
  `cur_state` int(11) DEFAULT NULL,
  `head` varchar(100) NOT NULL,
  `rem_name` int(11) DEFAULT NULL,
  `auto_login` int(11) DEFAULT NULL,
  `introduction` varchar(255) NOT NULL,
  `message_num` int(11) DEFAULT NULL,
  `fans_num` int(11) DEFAULT NULL,
  `visit_num` int(11) DEFAULT NULL,
  `agree_num` int(11) DEFAULT NULL,
  `thanks_num` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `affiliate_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'apache', '123', '1', '1', '1724241758@qq.com', '1', '1', '1', '/static/image/head/tmp.jpg', '0', '0', '南京有点大学', '10', '10', '10', '40', '10', '200', '0');
<<<<<<< HEAD
INSERT INTO `users` VALUES ('2', 'tomcat', '123', '1', '1', '1724241758@qq.com', '1', '1', '1', '/static/image/head/tmp.jpg', '1', '0', '南京有点大学', '10', '10', '10', '40', '10', '200', '0');
INSERT INTO `users` VALUES ('3', 'JBoss', '123', '1', '1', '1724241758@qq.com', '1', '1', '1', '/static/image/head/tmp.jpg', '0', '0', '南京有点大学', '10', '10', '10', '40', '10', '200', '0');
INSERT INTO `users` VALUES ('4', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('5', 'tomcat', '', '0', '0', '', '0', '0', '1', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('6', 'tomcat', '', '0', '0', '', '0', '0', '1', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('7', 'tomcat', '', '0', '0', '', '0', '0', '1', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('8', 'tomcat', '', '0', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('9', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('10', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('11', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('12', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('13', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('14', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('15', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('16', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('17', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('18', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('19', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('20', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('21', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('22', 'tomcat', '', '1', '0', '', '0', '0', '2', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('23', 'tomcat', '', '0', '0', '', '0', '0', '1', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('24', 'tomcat', '', '0', '0', '', '0', '0', '1', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('25', 'tomcat', '', '0', '0', '', '0', '0', '1', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('26', 'tomcat', '', '0', '0', '', '0', '0', '1', '', '0', '0', '', null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('27', 'tomcat', '', '0', '0', '', '0', '0', '1', '', '0', '0', '', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `users_affiliate`
=======
INSERT INTO `users` VALUES ('2', 'tomcat', '123', '1', '1', '1724241758@qq.com', '1', '1', '1', '/static/image/head/tmp.jpg', '0', '0', '南京有点大学', '10', '10', '10', '40', '10', '200', '0');
INSERT INTO `users` VALUES ('3', 'JBoss', '123', '1', '1', '1724241758@qq.com', '1', '1', '1', '/static/image/head/tmp.jpg', '0', '0', '南京有点大学', '10', '10', '10', '40', '10', '200', '0');

-- ----------------------------
-- Table structure for users_affiliate
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `users_affiliate`;
CREATE TABLE `users_affiliate` (
  `user_id` int(11) NOT NULL,
  `email_state` int(11) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `qq_state` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `phone_state` int(11) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `website_state` int(11) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  `question_num` int(11) DEFAULT NULL,
  `answer_num` int(11) DEFAULT NULL,
  `attention_topic_num` int(11) DEFAULT NULL,
  `community_flag` int(11) DEFAULT NULL,
  `community_setting` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `users_affiliate_user_id_50767dc4_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_affiliate
-- ----------------------------
<<<<<<< HEAD
INSERT INTO `users_affiliate` VALUES ('1', null, '', null, '', null, '', null, '2015-05-22 16:58:06', '', null, null, null, null, null, '');
INSERT INTO `users_affiliate` VALUES ('2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('4', null, null, null, null, null, null, null, '2015-06-12 13:07:33', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('5', null, null, null, null, null, null, null, '2015-06-12 14:53:33', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('6', null, null, null, null, null, null, null, '2015-06-12 14:54:03', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('7', null, null, null, null, null, null, null, '2015-06-12 16:19:36', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('8', null, null, null, null, null, null, null, '2015-06-12 16:26:44', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('9', null, null, null, null, null, null, null, '2015-06-12 16:49:36', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('10', null, null, null, null, null, null, null, '2015-06-12 16:54:18', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('11', null, null, null, null, null, null, null, '2015-06-12 16:55:29', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('12', null, null, null, null, null, null, null, '2015-06-12 16:56:09', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('13', null, null, null, null, null, null, null, '2015-06-12 16:57:19', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('14', null, null, null, null, null, null, null, '2015-06-12 16:58:50', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('15', null, null, null, null, null, null, null, '2015-06-12 17:00:14', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('16', null, null, null, null, null, null, null, '2015-06-12 17:00:17', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('17', null, null, null, null, null, null, null, '2015-06-12 17:00:17', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('18', null, null, null, null, null, null, null, '2015-06-12 17:05:37', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('19', null, null, null, null, null, null, null, '2015-06-12 17:06:37', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('20', null, null, null, null, null, null, null, '2015-06-12 17:10:58', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('21', null, null, null, null, null, null, null, '2015-06-12 17:12:22', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('22', null, null, null, null, null, null, null, '2015-06-12 17:12:37', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('23', null, null, null, null, null, null, null, '2015-06-12 17:23:28', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('24', null, null, null, null, null, null, null, '2015-06-12 17:31:07', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('25', null, null, null, null, null, null, null, '2015-06-12 17:41:46', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('26', null, null, null, null, null, null, null, '2015-06-12 17:49:04', null, null, null, null, null, null, null);
INSERT INTO `users_affiliate` VALUES ('27', null, null, null, null, null, null, null, '2015-06-12 17:49:21', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `users_focus`
=======
INSERT INTO `users_affiliate` VALUES ('1', '1', '12345678', '1', '13901512321', '1', 'www.abc.com', '1', '2015-05-22 16:58:06', '192.168.1.1', '2015-05-25 11:52:53', '88', '66', '120', '1', '1');
INSERT INTO `users_affiliate` VALUES ('2', '0', '12568965', '1', '13902391212', '1', 'www.aaa.com', '0', '2015-05-25 11:53:58', '192.168.1.1', '2015-05-24 11:54:06', '78', '68', '110', '1', '1');
INSERT INTO `users_affiliate` VALUES ('3', '1', '12568965', '1', '13902391212', '1', 'www.aaa.com', '0', '2015-05-25 11:53:58', '192.168.1.1', '2015-05-24 11:54:06', '68', '68', '108', '1', '1');

-- ----------------------------
-- Table structure for users_focus
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `users_focus`;
CREATE TABLE `users_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT,
  `focus_time` datetime NOT NULL,
  `schoolmate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`focus_id`),
  KEY `users_focus_335aecba` (`schoolmate_id`),
  KEY `users_focus_e8701ad4` (`user_id`),
  CONSTRAINT `users_focus_schoolmate_id_2b862399_fk_users_user_id` FOREIGN KEY (`schoolmate_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `users_focus_user_id_40790d03_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_focus
-- ----------------------------
INSERT INTO `users_focus` VALUES ('1', '2015-05-23 14:16:59', '2', '1');
<<<<<<< HEAD
INSERT INTO `users_focus` VALUES ('2', '2015-06-10 15:40:16', '3', '1');

-- ----------------------------
-- Table structure for `user_jobs`
=======
INSERT INTO `users_focus` VALUES ('2', '2015-05-01 14:10:45', '3', '1');
INSERT INTO `users_focus` VALUES ('3', '2015-03-01 14:10:48', '2', '3');

-- ----------------------------
-- Table structure for user_jobs
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `user_jobs`;
CREATE TABLE `user_jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `position` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `entrance_time` varchar(20) DEFAULT NULL,
  `leave_time` varchar(20) DEFAULT NULL,
  `experience` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `user_jobs_e8701ad4` (`user_id`),
  CONSTRAINT `user_jobs_user_id_2bdcc37a_fk_users_affiliate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_affiliate` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_jobs
-- ----------------------------
<<<<<<< HEAD
INSERT INTO `user_jobs` VALUES ('1', '2', '2', '', '2015', '2014', '', '21');
INSERT INTO `user_jobs` VALUES ('2', '2', '2', '', '2015', '2014', '', '22');

-- ----------------------------
-- Table structure for `user_school`
=======

-- ----------------------------
-- Table structure for user_school
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
-- ----------------------------
DROP TABLE IF EXISTS `user_school`;
CREATE TABLE `user_school` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT,
  `academy` varchar(100) NOT NULL,
  `entrance_time` varchar(20) DEFAULT NULL,
  `education` int(11) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`primary_id`),
  KEY `user_school_5fc7164b` (`school_id`),
  KEY `user_school_e8701ad4` (`user_id`),
  CONSTRAINT `user_school_school_id_4e385b09_fk_schools_school_id` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`),
  CONSTRAINT `user_school_user_id_2f09fb84_fk_users_affiliate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_affiliate` (`user_id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
=======
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6

-- ----------------------------
-- Records of user_school
-- ----------------------------
INSERT INTO `user_school` VALUES ('1', '计算机学院', '2015-05-23 10:09:55', '1', '1', '2');
<<<<<<< HEAD
INSERT INTO `user_school` VALUES ('2', '计算机学院', '2015-05-23 10:09:59', '1', '1', '1');
INSERT INTO `user_school` VALUES ('3', '数量学院', '2015-05-24 18:38:39', '2', '2', '3');
INSERT INTO `user_school` VALUES ('4', '', null, null, '1', '6');
INSERT INTO `user_school` VALUES ('5', '', null, null, '1', '6');
INSERT INTO `user_school` VALUES ('6', '1', '2014', '2', '1', '7');
INSERT INTO `user_school` VALUES ('7', '2', '2013', '2', '1', '7');
=======
INSERT INTO `user_school` VALUES ('2', '计算机学院', '2015-05-23 10:09:59', '1', '2', '1');
INSERT INTO `user_school` VALUES ('3', '数量学院', '2015-05-24 18:38:39', '2', '2', '3');
INSERT INTO `user_school` VALUES ('4', '理学院', '2015-05-26 21:22:08', '2', '3', '1');
>>>>>>> ced474c4b23d60840efdb3ce87828732d6be26a6
