/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : dev_youda

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2015-05-20 22:05:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `answers`
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL,
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
  CONSTRAINT `answers_user_id_341d40d7_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `answers_question_id_5dc187fc_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answers
-- ----------------------------

-- ----------------------------
-- Table structure for `answers_comments`
-- ----------------------------
DROP TABLE IF EXISTS `answers_comments`;
CREATE TABLE `answers_comments` (
  `comment_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `time` datetime DEFAULT NULL,
  `comment_num` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `answers_comments_fb12e902` (`answer_id`),
  KEY `answers_comments_e8701ad4` (`user_id`),
  CONSTRAINT `answers_comments_user_id_21138b2b_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `answers_comments_answer_id_13738d0_fk_answers_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answers_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `article_id` int(11) NOT NULL,
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
  CONSTRAINT `articles_user_id_4cfda94e_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `articles_topic_id_7ce224c7_fk_topics_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------

-- ----------------------------
-- Table structure for `associations`
-- ----------------------------
DROP TABLE IF EXISTS `associations`;
CREATE TABLE `associations` (
  `ass_id` int(11) NOT NULL,
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
-- Table structure for `auth_group`
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
-- Table structure for `auth_group_permissions`
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
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
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
-- Table structure for `auth_user_user_permissions`
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
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
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
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2015-05-20 22:00:33');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2015-05-20 22:00:36');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2015-05-20 22:00:37');
INSERT INTO `django_migrations` VALUES ('4', 'apps', '0001_initial', '2015-05-20 22:01:02');
INSERT INTO `django_migrations` VALUES ('5', 'sessions', '0001_initial', '2015-05-20 22:01:03');

-- ----------------------------
-- Table structure for `django_session`
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

-- ----------------------------
-- Table structure for `invitation_users`
-- ----------------------------
DROP TABLE IF EXISTS `invitation_users`;
CREATE TABLE `invitation_users` (
  `invitation_id` int(11) NOT NULL,
  `send_user_name` varchar(10) NOT NULL,
  `receive_user_name` varchar(10) NOT NULL,
  `question_id` int(11) NOT NULL,
  `receive_user_id` int(11) NOT NULL,
  `send_user_id` int(11),
  PRIMARY KEY (`invitation_id`),
  KEY `invitation_users_7aa0f6ee` (`question_id`),
  KEY `invitation_users_6234ec5c` (`receive_user_id`),
  KEY `invitation_users_2df99390` (`send_user_id`),
  CONSTRAINT `invitation_users_send_user_id_51fe3301_fk_users_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `invitation_users_question_id_774cf272_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `invitation_users_receive_user_id_57d5adbd_fk_users_user_id` FOREIGN KEY (`receive_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invitation_users
-- ----------------------------

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
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
-- Table structure for `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
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
-- Table structure for `private_letters`
-- ----------------------------
DROP TABLE IF EXISTS `private_letters`;
CREATE TABLE `private_letters` (
  `letter_id` int(11) NOT NULL,
  `send_user_name` varchar(10) NOT NULL,
  `receive_user_name` varchar(10) NOT NULL,
  `content` varchar(255) NOT NULL,
  `receive_user_id` int(11) NOT NULL,
  `send_user_id` int(11) NOT NULL,
  PRIMARY KEY (`letter_id`),
  KEY `private_letters_6234ec5c` (`receive_user_id`),
  KEY `private_letters_2df99390` (`send_user_id`),
  CONSTRAINT `private_letters_send_user_id_1e540631_fk_users_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `private_letters_receive_user_id_19e60ced_fk_users_user_id` FOREIGN KEY (`receive_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of private_letters
-- ----------------------------

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------

-- ----------------------------
-- Table structure for `questions_focus`
-- ----------------------------
DROP TABLE IF EXISTS `questions_focus`;
CREATE TABLE `questions_focus` (
  `focus_id` int(11) NOT NULL,
  `focus_time` datetime NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11),
  PRIMARY KEY (`focus_id`),
  KEY `questions_focus_7aa0f6ee` (`question_id`),
  KEY `questions_focus_e8701ad4` (`user_id`),
  CONSTRAINT `questions_focus_user_id_965238e_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `questions_focus_question_id_187d3adf_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions_focus
-- ----------------------------

-- ----------------------------
-- Table structure for `questions_topic`
-- ----------------------------
DROP TABLE IF EXISTS `questions_topic`;
CREATE TABLE `questions_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questions_id` int(11) NOT NULL,
  `topics_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questions_id` (`questions_id`,`topics_id`),
  KEY `questions_topic_390f3732` (`questions_id`),
  KEY `questions_topic_5b4a14a9` (`topics_id`),
  CONSTRAINT `questions_topic_topics_id_57139228_fk_topics_topic_id` FOREIGN KEY (`topics_id`) REFERENCES `topics` (`topic_id`),
  CONSTRAINT `questions_topic_questions_id_11b14698_fk_questions_question_id` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `school_id` int(11) NOT NULL,
  `school_name` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `school_category` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------

-- ----------------------------
-- Table structure for `topics`
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `topic_id` int(11) NOT NULL,
  `topic_name` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `discuss_num` int(11) DEFAULT NULL,
  `topic_pic` varchar(255) NOT NULL,
  `focus_num` int(11) DEFAULT NULL,
  `topic_school_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topics_5d9d18f7` (`topic_school_id`),
  CONSTRAINT `topics_topic_school_id_72546c4c_fk_school_school_id` FOREIGN KEY (`topic_school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topics
-- ----------------------------

-- ----------------------------
-- Table structure for `topic_focus`
-- ----------------------------
DROP TABLE IF EXISTS `topic_focus`;
CREATE TABLE `topic_focus` (
  `focus_id` int(11) NOT NULL,
  `focus_time` datetime NOT NULL,
  `topic_id` int(11),
  `user_id` int(11),
  PRIMARY KEY (`focus_id`),
  KEY `topic_focus_19b4d727` (`topic_id`),
  KEY `topic_focus_e8701ad4` (`user_id`),
  CONSTRAINT `topic_focus_user_id_5791fb3c_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `topic_focus_topic_id_5284cd89_fk_topics_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic_focus
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `users_affiliate`
-- ----------------------------
DROP TABLE IF EXISTS `users_affiliate`;
CREATE TABLE `users_affiliate` (
  `user_id` int(11) NOT NULL,
  `email_state` int(11) DEFAULT NULL,
  `qq` varchar(15) NOT NULL,
  `qq_state` int(11) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `phone_state` int(11) DEFAULT NULL,
  `website` varchar(100) NOT NULL,
  `website_state` int(11) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  `last_ip` varchar(20) NOT NULL,
  `last_time` datetime DEFAULT NULL,
  `question_num` int(11) DEFAULT NULL,
  `answer_num` int(11) DEFAULT NULL,
  `attention_topic_num` int(11) DEFAULT NULL,
  `community_flag` int(11) DEFAULT NULL,
  `community_setting` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `users_affiliate_user_id_50767dc4_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_affiliate
-- ----------------------------

-- ----------------------------
-- Table structure for `users_focus`
-- ----------------------------
DROP TABLE IF EXISTS `users_focus`;
CREATE TABLE `users_focus` (
  `focus_id` int(11) NOT NULL,
  `focus_time` datetime NOT NULL,
  `schoolmate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`focus_id`),
  KEY `users_focus_335aecba` (`schoolmate_id`),
  KEY `users_focus_e8701ad4` (`user_id`),
  CONSTRAINT `users_focus_user_id_40790d03_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `users_focus_schoolmate_id_2b862399_fk_users_user_id` FOREIGN KEY (`schoolmate_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_focus
-- ----------------------------

-- ----------------------------
-- Table structure for `users_school`
-- ----------------------------
DROP TABLE IF EXISTS `users_school`;
CREATE TABLE `users_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `schools_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_id` (`users_id`,`schools_id`),
  KEY `users_school_df138c17` (`users_id`),
  KEY `users_school_668d6d48` (`schools_id`),
  CONSTRAINT `users_school_schools_id_577778c1_fk_school_school_id` FOREIGN KEY (`schools_id`) REFERENCES `school` (`school_id`),
  CONSTRAINT `users_school_users_id_65dbc914_fk_users_user_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_school
-- ----------------------------

-- ----------------------------
-- Table structure for `user_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `user_jobs`;
CREATE TABLE `user_jobs` (
  `job_id` int(11) NOT NULL,
  `position` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `entrance_time` datetime DEFAULT NULL,
  `leave_time` datetime DEFAULT NULL,
  `experience` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `user_jobs_e8701ad4` (`user_id`),
  CONSTRAINT `user_jobs_user_id_2bdcc37a_fk_users_affiliate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_affiliate` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `user_school`
-- ----------------------------
DROP TABLE IF EXISTS `user_school`;
CREATE TABLE `user_school` (
  `primary_id` int(11) NOT NULL,
  `academy` varchar(100) NOT NULL,
  `entrance_time` datetime DEFAULT NULL,
  `education` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`primary_id`),
  KEY `user_school_5fc7164b` (`school_id`),
  KEY `user_school_e8701ad4` (`user_id`),
  CONSTRAINT `user_school_user_id_2f09fb84_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_school_school_id_4e385b09_fk_school_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_school
-- ----------------------------
