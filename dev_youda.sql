/*
MySQL Backup
Source Server Version: 5.6.21
Source Database: youda_dev_4
Date: 2015/5/31 21:50:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `answers`
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `answers_comments`
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `articles`
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
  `topic_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `articles_19b4d727` (`topic_id`),
  KEY `articles_e8701ad4` (`user_id`),
  CONSTRAINT `articles_topic_id_7ce224c7_fk_topics_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`),
  CONSTRAINT `articles_user_id_4cfda94e_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `associations`
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
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_group_permissions`
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
--  Table structure for `auth_permission`
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
--  Table structure for `auth_user`
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
--  Table structure for `auth_user_groups`
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
--  Table structure for `auth_user_user_permissions`
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
--  Table structure for `django_admin_log`
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
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_content_type`
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
--  Table structure for `django_migrations`
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
--  Table structure for `django_session`
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
--  Table structure for `invitation_users`
-- ----------------------------
DROP TABLE IF EXISTS `invitation_users`;
CREATE TABLE `invitation_users` (
  `invitation_id` int(11) NOT NULL AUTO_INCREMENT,
  `send_user_name` varchar(10) NOT NULL,
  `receive_user_name` varchar(10) NOT NULL,
  `question_id` int(11) NOT NULL,
  `receive_user_id` int(11) NOT NULL,
  `send_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `invitation_users_7aa0f6ee` (`question_id`),
  KEY `invitation_users_6234ec5c` (`receive_user_id`),
  KEY `invitation_users_2df99390` (`send_user_id`),
  CONSTRAINT `invitation_users_question_id_774cf272_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `invitation_users_receive_user_id_57d5adbd_fk_users_user_id` FOREIGN KEY (`receive_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `invitation_users_send_user_id_51fe3301_fk_users_user_id` FOREIGN KEY (`send_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `operate_time` datetime DEFAULT NULL,
  `operate_command` varchar(20) NOT NULL,
  `from` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `logs_e8701ad4` (`user_id`),
  CONSTRAINT `logs_user_id_25ac125e_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `messages`
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
--  Table structure for `private_letters`
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
--  Table structure for `questions`
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `questions_focus`
-- ----------------------------
DROP TABLE IF EXISTS `questions_focus`;
CREATE TABLE `questions_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT,
  `focus_time` datetime NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`focus_id`),
  KEY `questions_focus_7aa0f6ee` (`question_id`),
  KEY `questions_focus_e8701ad4` (`user_id`),
  CONSTRAINT `questions_focus_question_id_187d3adf_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `questions_focus_user_id_965238e_fk_users_affiliate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_affiliate` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `questions_topic`
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
  CONSTRAINT `questions_topic_questions_id_11b14698_fk_questions_question_id` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `questions_topic_topics_id_57139228_fk_topics_topic_id` FOREIGN KEY (`topics_id`) REFERENCES `topics` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `schools`
-- ----------------------------
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(128) DEFAULT NULL,
  `region` varchar(128) DEFAULT NULL,
  `school_category` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `topics`
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
--  Table structure for `topic_focus`
-- ----------------------------
DROP TABLE IF EXISTS `topic_focus`;
CREATE TABLE `topic_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT,
  `focus_time` datetime NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`focus_id`),
  KEY `topic_focus_19b4d727` (`topic_id`),
  KEY `topic_focus_e8701ad4` (`user_id`),
  CONSTRAINT `topic_focus_topic_id_5284cd89_fk_topics_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`),
  CONSTRAINT `topic_focus_user_id_5791fb3c_fk_users_affiliate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_affiliate` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `users`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `users_affiliate`
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
--  Table structure for `users_focus`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `user_jobs`;
CREATE TABLE `user_jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
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
--  Table structure for `user_school`
-- ----------------------------
DROP TABLE IF EXISTS `user_school`;
CREATE TABLE `user_school` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT,
  `academy` varchar(100) NOT NULL,
  `entrance_time` datetime DEFAULT NULL,
  `education` int(11) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`primary_id`),
  KEY `user_school_5fc7164b` (`school_id`),
  KEY `user_school_e8701ad4` (`user_id`),
  CONSTRAINT `user_school_school_id_4e385b09_fk_schools_school_id` FOREIGN KEY (`school_id`) REFERENCES `schools` (`school_id`),
  CONSTRAINT `user_school_user_id_2f09fb84_fk_users_affiliate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_affiliate` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `answers` VALUES ('1','Test0','2015-05-23 14:53:31','10','0','0','2','1','2'), ('2','Test1','2015-05-23 14:53:31','11','0','0','3','2','2'), ('3','Test2','2015-05-23 14:53:31','12','0','0','4','3','2'), ('4','Test3','2015-05-23 14:53:31','13','0','0','5','4','2'), ('5','Test4','2015-05-23 14:53:31','14','0','0','6','5','2'), ('6','Test5','2015-05-23 14:53:31','15','0','0','7','6','2'), ('7','Test6','2015-05-23 14:53:31','16','0','0','8','7','2'), ('8','Test7','2015-05-23 14:53:31','17','0','0','9','8','2'), ('9','Test8','2015-05-23 14:53:31','18','0','0','10','9','2'), ('10','Test9','2015-05-23 14:53:31','19','0','0','11','10','2'), ('11','Test10','2015-05-23 14:54:33','10','1','0','2','1','1'), ('12','Test11','2015-05-23 14:54:33','11','1','0','3','2','1'), ('13','Test12','2015-05-23 14:54:34','12','1','0','4','3','1'), ('14','Test13','2015-05-23 14:54:34','13','1','0','5','4','1'), ('15','Test14','2015-05-23 14:54:34','14','1','0','6','5','1'), ('16','Test15','2015-05-23 14:54:34','15','1','0','7','6','1'), ('17','Test16','2015-05-23 14:54:34','16','1','0','8','7','1'), ('18','Test17','2015-05-23 14:54:34','17','1','0','9','8','1'), ('19','Test18','2015-05-23 14:54:34','18','1','0','10','9','1'), ('20','Test19','2015-05-23 14:54:34','19','1','0','11','10','1');
INSERT INTO `answers_comments` VALUES ('1','Test0','2015-05-23 15:08:08','1','0','1','2'), ('2','Test1','2015-05-23 15:08:08','2','0','2','2'), ('3','Test2','2015-05-23 15:08:08','3','0','3','2'), ('4','Test3','2015-05-23 15:08:08','4','0','4','2'), ('5','Test4','2015-05-23 15:08:09','5','0','5','2'), ('6','Test5','2015-05-23 15:08:09','6','0','6','2'), ('7','Test6','2015-05-23 15:08:09','7','0','7','2'), ('8','Test7','2015-05-23 15:08:09','8','0','8','2'), ('9','Test8','2015-05-23 15:08:09','9','0','9','2'), ('10','Test9','2015-05-23 15:08:09','10','0','10','2');
INSERT INTO `auth_permission` VALUES ('1','Can add log entry','1','add_logentry'), ('2','Can change log entry','1','change_logentry'), ('3','Can delete log entry','1','delete_logentry'), ('4','Can add permission','2','add_permission'), ('5','Can change permission','2','change_permission'), ('6','Can delete permission','2','delete_permission'), ('7','Can add group','3','add_group'), ('8','Can change group','3','change_group'), ('9','Can delete group','3','delete_group'), ('10','Can add user','4','add_user'), ('11','Can change user','4','change_user'), ('12','Can delete user','4','delete_user'), ('13','Can add content type','5','add_contenttype'), ('14','Can change content type','5','change_contenttype'), ('15','Can delete content type','5','delete_contenttype'), ('16','Can add session','6','add_session'), ('17','Can change session','6','change_session'), ('18','Can delete session','6','delete_session'), ('19','Can add answers','7','add_answers'), ('20','Can change answers','7','change_answers'), ('21','Can delete answers','7','delete_answers'), ('22','Can add answers comments','8','add_answerscomments'), ('23','Can change answers comments','8','change_answerscomments'), ('24','Can delete answers comments','8','delete_answerscomments'), ('25','Can add articles','9','add_articles'), ('26','Can change articles','9','change_articles'), ('27','Can delete articles','9','delete_articles'), ('28','Can add associations','10','add_associations'), ('29','Can change associations','10','change_associations'), ('30','Can delete associations','10','delete_associations'), ('31','Can add invitation users','11','add_invitationusers'), ('32','Can change invitation users','11','change_invitationusers'), ('33','Can delete invitation users','11','delete_invitationusers'), ('34','Can add user jobs','12','add_userjobs'), ('35','Can change user jobs','12','change_userjobs'), ('36','Can delete user jobs','12','delete_userjobs'), ('37','Can add logs','13','add_logs'), ('38','Can change logs','13','change_logs'), ('39','Can delete logs','13','delete_logs'), ('40','Can add messages','14','add_messages'), ('41','Can change messages','14','change_messages'), ('42','Can delete messages','14','delete_messages'), ('43','Can add private letters','15','add_privateletters'), ('44','Can change private letters','15','change_privateletters'), ('45','Can delete private letters','15','delete_privateletters'), ('46','Can add questions','16','add_questions'), ('47','Can change questions','16','change_questions'), ('48','Can delete questions','16','delete_questions'), ('49','Can add questions focus','17','add_questionsfocus'), ('50','Can change questions focus','17','change_questionsfocus'), ('51','Can delete questions focus','17','delete_questionsfocus'), ('52','Can add schools','18','add_schools'), ('53','Can change schools','18','change_schools'), ('54','Can delete schools','18','delete_schools'), ('55','Can add user school','19','add_userschool'), ('56','Can change user school','19','change_userschool'), ('57','Can delete user school','19','delete_userschool'), ('58','Can add topics','20','add_topics'), ('59','Can change topics','20','change_topics'), ('60','Can delete topics','20','delete_topics'), ('61','Can add topic focus','21','add_topicfocus'), ('62','Can change topic focus','21','change_topicfocus'), ('63','Can delete topic focus','21','delete_topicfocus'), ('64','Can add users','22','add_users'), ('65','Can change users','22','change_users'), ('66','Can delete users','22','delete_users'), ('67','Can add users focus','23','add_usersfocus'), ('68','Can change users focus','23','change_usersfocus'), ('69','Can delete users focus','23','delete_usersfocus'), ('70','Can add users affiliate','24','add_usersaffiliate'), ('71','Can change users affiliate','24','change_usersaffiliate'), ('72','Can delete users affiliate','24','delete_usersaffiliate');
INSERT INTO `django_content_type` VALUES ('1','log entry','admin','logentry'), ('2','permission','auth','permission'), ('3','group','auth','group'), ('4','user','auth','user'), ('5','content type','contenttypes','contenttype'), ('6','session','sessions','session'), ('7','answers','apps','answers'), ('8','answers comments','apps','answerscomments'), ('9','articles','apps','articles'), ('10','associations','apps','associations'), ('11','invitation users','apps','invitationusers'), ('12','user jobs','apps','userjobs'), ('13','logs','apps','logs'), ('14','messages','apps','messages'), ('15','private letters','apps','privateletters'), ('16','questions','apps','questions'), ('17','questions focus','apps','questionsfocus'), ('18','schools','apps','schools'), ('19','user school','apps','userschool'), ('20','topics','apps','topics'), ('21','topic focus','apps','topicfocus'), ('22','users','apps','users'), ('23','users focus','apps','usersfocus'), ('24','users affiliate','apps','usersaffiliate');
INSERT INTO `django_migrations` VALUES ('1','contenttypes','0001_initial','2015-05-22 15:40:34'), ('2','auth','0001_initial','2015-05-22 15:40:38'), ('3','admin','0001_initial','2015-05-22 15:40:39'), ('4','apps','0001_initial','2015-05-22 15:41:01'), ('5','sessions','0001_initial','2015-05-22 15:41:02'), ('6','apps','0002_auto_20150522_1543','2015-05-22 15:43:11'), ('7','apps','0003_auto_20150522_1627','2015-05-22 16:27:21'), ('8','apps','0004_auto_20150523_1058','2015-05-23 10:58:39'), ('9','apps','0005_auto_20150523_1105','2015-05-23 11:05:11'), ('10','apps','0006_auto_20150523_1551','2015-05-23 15:51:33');
INSERT INTO `questions` VALUES ('1','how to learn python0','which books should i to read?','2015-05-23 10:45:24','2015-05-23 10:45:24','100','0','20','20','5',NULL,'1','1'), ('2','how to learn python1','which books should i to read?','2015-05-23 10:45:25','2015-05-23 10:45:25','100','0','20','20','5',NULL,'1','1'), ('3','how to learn python2','which books should i to read?','2015-05-23 10:45:25','2015-05-23 10:45:25','100','0','20','20','5',NULL,'1','1'), ('4','how to learn python3','which books should i to read?','2015-05-23 10:45:25','2015-05-23 10:45:25','100','0','20','20','5',NULL,'1','1'), ('5','how to learn python4','which books should i to read?','2015-05-23 10:45:25','2015-05-23 10:45:25','100','0','20','20','5',NULL,'1','1'), ('6','how to learn python5','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','0','20','20','5',NULL,'1','1'), ('7','how to learn python6','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','0','20','20','5',NULL,'1','1'), ('8','how to learn python7','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','0','20','20','5',NULL,'1','1'), ('9','how to learn python8','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','0','20','20','5',NULL,'1','1'), ('10','how to learn python9','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','0','20','20','5',NULL,'1','1'), ('11','how to learn python10','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','20','20','20','5',NULL,'1','1'), ('12','how to learn python11','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','20','20','20','5',NULL,'1','1'), ('13','how to learn python12','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','20','20','20','5',NULL,'1','1'), ('14','how to learn python13','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','20','20','20','5',NULL,'1','1'), ('15','how to learn python14','which books should i to read?','2015-05-23 11:20:24','2015-05-23 11:20:24','100','20','20','20','5',NULL,'1','1'), ('16','how to learn python15','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('17','how to learn python16','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('18','how to learn python17','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('19','how to learn python18','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('20','how to learn python19','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('21','how to learn python20','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('22','how to learn python21','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('23','how to learn python22','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('24','how to learn python23','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('25','how to learn python24','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('26','how to learn python25','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('27','how to learn python26','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('28','how to learn python27','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('29','how to learn python28','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('30','how to learn python29','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('31','how to learn python30','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('32','how to learn python31','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('33','how to learn python32','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('34','how to learn python33','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('35','how to learn python34','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('36','how to learn python35','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('37','how to learn python36','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('38','how to learn python37','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('39','how to learn python38','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('40','how to learn python39','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('41','how to learn python40','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('42','how to learn python41','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('43','how to learn python42','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('44','how to learn python43','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('45','how to learn python44','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('46','how to learn python45','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('47','how to learn python46','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('48','how to learn python47','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('49','how to learn python48','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('50','how to learn python49','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('51','how to learn python50','which books should i to read?','2015-05-23 11:20:25','2015-05-23 11:20:25','100','20','20','20','5',NULL,'1','1'), ('52','how to learn python51','which books should i to read?','2015-05-23 11:20:26','2015-05-23 11:20:26','100','20','20','20','5',NULL,'1','1'), ('53','how to learn python52','which books should i to read?','2015-05-23 11:20:26','2015-05-23 11:20:26','100','20','20','20','5',NULL,'1','1'), ('54','how to learn python53','which books should i to read?','2015-05-23 11:20:26','2015-05-23 11:20:26','100','20','20','20','5',NULL,'1','1'), ('55','how to learn python54','which books should i to read?','2015-05-23 11:20:26','2015-05-23 11:20:26','100','20','20','20','5',NULL,'1','1'), ('56','how to learn python55','which books should i to read?','2015-05-23 11:21:57','2015-05-23 11:21:57','10','10','5','2','50',NULL,'1','1'), ('57','how to learn python56','which books should i to read?','2015-05-23 11:21:57','2015-05-23 11:21:57','10','10','5','2','50',NULL,'1','1'), ('58','how to learn python57','which books should i to read?','2015-05-23 11:21:57','2015-05-23 11:21:57','10','10','5','2','50',NULL,'1','1'), ('59','how to learn python58','which books should i to read?','2015-05-23 11:21:57','2015-05-23 11:21:57','10','10','5','2','50',NULL,'1','1'), ('60','how to learn python59','which books should i to read?','2015-05-23 11:21:57','2015-05-23 11:21:57','10','10','5','2','50',NULL,'1','1'), ('61','how to learn python60','which books should i to read?','2015-05-23 11:21:57','2015-05-23 11:21:57','10','10','5','2','50',NULL,'1','1'), ('62','how to learn python61','which books should i to read?','2015-05-23 11:21:57','2015-05-23 11:21:57','10','10','5','2','50',NULL,'1','1'), ('63','how to learn python62','which books should i to read?','2015-05-23 11:21:58','2015-05-23 11:21:58','10','10','5','2','50',NULL,'1','1'), ('64','how to learn python63','which books should i to read?','2015-05-23 11:21:58','2015-05-23 11:21:58','10','10','5','2','50',NULL,'1','1'), ('65','how to learn python64','which books should i to read?','2015-05-23 11:21:58','2015-05-23 11:21:58','10','10','5','2','50',NULL,'1','1'), ('66','how to learn python55','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2'), ('67','how to learn python56','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2'), ('68','how to learn python57','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2'), ('69','how to learn python58','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2'), ('70','how to learn python59','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2'), ('71','how to learn python60','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2'), ('72','how to learn python61','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2'), ('73','how to learn python62','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2'), ('74','how to learn python63','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2'), ('75','how to learn python64','which books should i to read?','2015-05-23 14:30:35','2015-05-23 14:30:35','10','10','5','2','50',NULL,'1','2');
INSERT INTO `questions_focus` VALUES ('1','2015-05-23 11:17:08','1','1'), ('2','2015-05-23 11:17:08','2','1'), ('3','2015-05-23 11:17:08','3','1'), ('4','2015-05-23 11:17:08','4','1'), ('5','2015-05-23 11:17:08','5','1'), ('6','2015-05-23 11:25:21','5','1'), ('7','2015-05-23 11:25:21','6','1'), ('8','2015-05-23 11:25:21','7','1'), ('9','2015-05-23 11:25:21','8','1'), ('10','2015-05-23 11:25:21','9','1'), ('11','2015-05-23 11:25:39','10','1'), ('12','2015-05-23 11:25:39','11','1'), ('13','2015-05-23 11:25:39','12','1'), ('14','2015-05-23 11:25:39','13','1'), ('15','2015-05-23 11:25:39','14','1'), ('16','2015-05-23 14:30:35','10','1'), ('17','2015-05-23 14:30:35','11','1'), ('18','2015-05-23 14:30:35','12','1'), ('19','2015-05-23 14:30:35','13','1'), ('20','2015-05-23 14:30:35','14','1');
INSERT INTO `questions_topic` VALUES ('1','1','1'), ('3','1','4'), ('5','2','1'), ('2','2','5'), ('11','3','2'), ('7','3','9'), ('10','3','10'), ('12','4','1');
INSERT INTO `schools` VALUES ('1','南京邮电大学','南京',NULL), ('2','南京邮电大学','南京',NULL), ('3','北京邮电大学','南京',NULL);
INSERT INTO `topics` VALUES ('1','我提意见','0',NULL,NULL,NULL,NULL,'1'), ('2','运营商','9','2015-05-03 09:47:40','1','我提意见','0','1'), ('4','互联网','12','2015-05-03 09:47:48','5','应聘深造','0','1'), ('5','应聘深造','0',NULL,NULL,NULL,NULL,'1'), ('9','邮子生活','0',NULL,NULL,NULL,NULL,'1'), ('10','索尼中国','150','2015-04-30 20:52:58','9','邮子生活','0','1'), ('12','实习','1','2015-04-30 21:14:34','41','科技学术','0','1'), ('41','科技学术','0',NULL,NULL,NULL,NULL,'1'), ('60','漫漫邮子路','0',NULL,NULL,NULL,NULL,'1'), ('113','职场疑云','0',NULL,NULL,NULL,NULL,'1'), ('139','求职应聘','5',NULL,NULL,NULL,NULL,'2'), ('140','出国留学','5',NULL,NULL,NULL,NULL,'2'), ('141','考研保研','5',NULL,NULL,NULL,NULL,'2'), ('142','我要实习','5',NULL,NULL,NULL,NULL,'2'), ('144','考公务员','5',NULL,NULL,NULL,NULL,'2'), ('145','南邮轶事','9',NULL,NULL,NULL,NULL,'2'), ('146','社会百态','9',NULL,NULL,NULL,NULL,'2'), ('147','怦然心动','9',NULL,NULL,NULL,NULL,'2'), ('148','兴趣社团','9',NULL,NULL,NULL,NULL,'2'), ('149','闲谈人生','9',NULL,NULL,NULL,NULL,'2'), ('150','学术研究','41',NULL,NULL,NULL,NULL,'2'), ('152','创新竞赛','41',NULL,NULL,NULL,NULL,'3'), ('153','行业内幕','113',NULL,NULL,NULL,NULL,'3'), ('155','岗位交流','113',NULL,NULL,NULL,NULL,'3'), ('157','跳槽求职','113',NULL,NULL,NULL,NULL,'3'), ('158','合伙创业','113',NULL,NULL,NULL,NULL,'1'), ('159','Offer专业户','60',NULL,NULL,NULL,NULL,'3'), ('160','考研达人','60',NULL,NULL,NULL,NULL,'3'), ('161','前辈寄语','60',NULL,NULL,NULL,NULL,'3'), ('162','北邮榜样','60',NULL,NULL,NULL,NULL,'3'), ('172','硬件技术','41',NULL,NULL,NULL,NULL,'3'), ('173','其他','41',NULL,NULL,NULL,NULL,'3'), ('174','资料共享','0',NULL,NULL,NULL,NULL,'3'), ('175','内推发布','0',NULL,NULL,NULL,NULL,'3'), ('176','硕博生活','9',NULL,NULL,NULL,NULL,'3'), ('177','软件开发','41',NULL,NULL,NULL,NULL,'3'), ('178','产品设计','41',NULL,NULL,NULL,NULL,'3'), ('179','产品运营','41',NULL,NULL,NULL,NULL,'1'), ('181','其他','113',NULL,NULL,NULL,NULL,'1'), ('183','冰桶挑战','60',NULL,NULL,NULL,NULL,'1'), ('184','校友频道','0',NULL,NULL,NULL,NULL,'1'), ('185','周兆熊频道','184',NULL,NULL,NULL,NULL,'1'), ('186','郑海波频道','184',NULL,NULL,NULL,NULL,'1'), ('187','梁绮莹频道','184',NULL,NULL,NULL,NULL,'1'), ('188','萌主频道','184',NULL,NULL,NULL,NULL,'1'), ('189','鼎山女尸频道','184',NULL,NULL,NULL,NULL,'1'), ('191','小胖频道','184',NULL,NULL,NULL,NULL,'1'), ('192','南京地区','175',NULL,NULL,NULL,NULL,'1'), ('193','上海地区','175',NULL,NULL,NULL,NULL,'1'), ('194','杭州地区','175',NULL,NULL,NULL,NULL,'1'), ('195','考研复试','174',NULL,NULL,NULL,NULL,'1'), ('196','期末笔记','174',NULL,NULL,NULL,NULL,'1'), ('197','面试宝典','174',NULL,NULL,NULL,NULL,'1'), ('198','其他','174',NULL,NULL,NULL,NULL,'1'), ('199','其他地区','175',NULL,NULL,NULL,NULL,'1'), ('200','于公子频道','184',NULL,NULL,NULL,NULL,'1'), ('201','苏州地区','175',NULL,NULL,NULL,NULL,'1'), ('202','北京地区','175',NULL,NULL,NULL,NULL,'1'), ('203','广东地区','175',NULL,NULL,NULL,NULL,'1'), ('204','野草频道','184',NULL,NULL,NULL,NULL,'1'), ('528','运营商','1','2015-04-30 15:09:37','11','20141113/c1585b81a562260b78c41cbbf6973538_32_32.jpg','44','1'), ('529','互联网','1','2015-04-30 15:09:41','18','20141113/2c189ea872fc0be5bc6d68d033c44ef8_32_32.jpg','68','1'), ('530','索尼中国','150','2015-04-30 16:36:19','2','20141114/84a9040eba6f7dbda97c6ee09fee83ff_32_32.jpg','7','1'), ('531','实习','150','2015-04-30 16:41:04','9','20141117/302bdb6e37aa707be7da919fc9880b66_32_32.jpg','27','1'), ('532','保研','2','2015-04-30 19:08:32','5','20140825/f8c9ad81d1c1a188e83ae912ec1b054f_32_32.jpg','14','1'), ('533','华为','4','2015-04-30 19:08:34','9','20141114/3f8959196e514902fb013a5dac2bfee0_32_32.jpg','35','1'), ('534','阿里巴巴',NULL,NULL,'5','20140825/fd529f7f7b6d14a5f3ce13dc5ecc1c9e_32_32.jpg','40','1'), ('535','广东移动',NULL,NULL,'1','20141020/0d2320ad8b807f7899063dd69824625d_32_32.png','10','1'), ('536','百度',NULL,NULL,'10','20141020/fbe92ff87db65f656732c871e930c06f_32_32.jpg','27','1'), ('537','腾讯',NULL,NULL,'7','20141020/b21608ece71da13863a860cda6b6e842_32_32.png','34','1'), ('538','微软',NULL,NULL,'2','20141020/d60b6a928f0c227b3aa7bd3c9f6761f5_32_32.jpg','22','1'), ('539','论文',NULL,NULL,'3','20141021/d5c615d8d45766eee202a4e2d493ad5f_32_32.jpg','20','1'), ('540','研发',NULL,NULL,'10','20141117/6ee99c59ee21c3bce3dfe188a723b53f_32_32.jpg','29','1'), ('541','大众点评',NULL,NULL,'1','20141021/33ae6ef3c919d43085cd69b2a9de9970_32_32.jpg','14','1'), ('542','美团',NULL,NULL,'1','20141021/f143506e970173a886ceceb95bdf5114_32_32.jpg','14','1'), ('543','留学',NULL,NULL,'7','20141022/4a093af2a33a653b60ba93515a43ca90_32_32.jpg','18','1'), ('544','图像处理',NULL,NULL,'3','20141022/2bf5dc5f19c9c59d6770e8df76d66637_32_32.jpg','14','1'), ('545','人脸识别',NULL,NULL,'1','20141022/1c8836a0bd8ec32f88f84613cfba8705_32_32.jpg','12','1'), ('546','STITP',NULL,NULL,'3','20141113/942005961221907b46cf74a1686c9d09_32_32.png','11','1'), ('547','读书',NULL,NULL,'3','20141113/505eb0961c28f98e74b90360cd641a7a_32_32.jpg','16','1'), ('548','友答网',NULL,NULL,'12','20141113/07b70d6e974299164a885bbec166a021_32_32.jpg','25','1'), ('549','产品经理',NULL,NULL,'11','20141113/1570ade1b38742369ed9588d754ddcee_32_32.jpg','41','1'), ('550','联想',NULL,NULL,'1','20141113/0b64498cd9660fc2e15614e6993b901f_32_32.jpg','6','1'), ('551','中国移动',NULL,NULL,'11','20141113/41c33504d7814bdfdbf5122716d77e82_32_32.jpg','17','1'), ('552','考研',NULL,NULL,'8','20141113/5d90c046a1ae6e4714abe6797a897b7a_32_32.jpg','14','1'), ('553','创业',NULL,NULL,'16','20141114/1e3546730e6daa660773d9efd798acfd_32_32.jpg','37','1'), ('554','找工作',NULL,NULL,'6','20150118/794d856a5b8762cda319de82020c743f_32_32.jpg','19','1'), ('555','外企',NULL,NULL,'2','20141116/bd3e221f3329843e99043c05fd45a013_32_32.jpg','16','1'), ('556','思杰Citrix',NULL,NULL,'3','20141116/391e77b0ff850a75fa9ba4b5367b10b4_32_32.jpg','11','1'), ('557','中兴',NULL,NULL,'5','20141116/70195b93411a3ea0ecd64c8c3443465c_32_32.jpg','13','1'), ('558','绩点',NULL,NULL,'2','20141116/e29f387743c822547d53decbe3cbb22a_32_32.jpg','8','1'), ('559','毕业论文',NULL,NULL,'2','20141116/ad91f556110f1115909c0057bcc56724_32_32.jpg','8','1'), ('560','答辩',NULL,NULL,'1','20150118/5d4631824eb42eb2016c711e61460476_32_32.png','4','1'), ('561','小状元教育',NULL,NULL,'1','20141117/53afcd405ef288aa4bfc1b5e79b7d488_32_32.jpg','7','1'), ('562','APP',NULL,NULL,'3','20141116/34646afa7c21b4b79c05c7c663163a3e_32_32.jpg','18','1'), ('563','MobCtrl万能遥控',NULL,NULL,'1','20141116/cd78898f275341650a6f5293ce16748d_32_32.jpg','3','1'), ('564','Android',NULL,NULL,'11','20141116/e0ff9371f210e4441a5e5512ae2fd23f_32_32.jpg','28','1'), ('565','Yahoo',NULL,NULL,'1','20141117/68a3840a557a474caa9ce06ffc45827b_32_32.jpg','6','1'), ('566','卡耐基梅隆CMU',NULL,NULL,'1','20141117/415be73ffd0acc34125eae88556e8e9a_32_32.jpg','7','1'), ('567','因特尔Intel',NULL,NULL,'1','20141117/b75c22b3ae9541797ea815b8a509c6bf_32_32.jpg','8','1');
INSERT INTO `topics` VALUES ('568','高通Qualcomm',NULL,NULL,'1','20141117/840c39bc4d6c0a390d7a1c5a23dee72e_32_32.jpg','7','1'), ('569','英伟达nvidia',NULL,NULL,'1','20141117/435c32d533dea6647a6294591d006aaf_32_32.jpg','7','1'), ('570','半导体','150','2015-04-30 16:45:46','1','20141117/5534159fd9bf26bbda94cf833b784bae_32_32.jpg','3','1'), ('571','简历','150','2015-04-30 16:45:49','3','20141117/d79b3a5382a3f451350ead3c61be9abd_32_32.jpg','18','1'), ('572','思杰',NULL,NULL,'0','20150118/0420845c142f969536f0f1c574d82882_32_32.jpg','3','1'), ('573','大数据',NULL,NULL,'3','20141121/dfb720adf3445fe639b39f78460b7704_32_32.gif','35','1'), ('574','云计算',NULL,NULL,'2','20141121/b039feb16f5365fd3c3245fe51695793_32_32.jpg','19','1'), ('575','中国移动互联网公司',NULL,NULL,'3','20141121/2cda484f76562caee44d62284f6573ae_32_32.jpg','12','1'), ('576','移动MM',NULL,NULL,'1','20141121/ca82225d7ed206172143ec01fa42ee1c_32_32.jpg','7','1'), ('577','o2o',NULL,NULL,'4','20141122/5e3461f57c58e2aaba00cb7982298d16_32_32.jpg','10','1'), ('578','安徽微腾科技股份有限公司',NULL,NULL,'1','20141122/011e41b80644b218de07bd908fc33b78_32_32.jpg','2','1'), ('579','京东',NULL,NULL,'0','20150117/718c235fc01336b22410dc287101f05c_32_32.png','3','1'), ('580','漫漫邮子路',NULL,NULL,'10','20141122/feb65e9cbcf0d6572b9664132c02e959_32_32.jpg','20','1'), ('581','前端开发',NULL,NULL,'5','20141125/c2da84540a227703d748b01bd0b0963c_32_32.jpg','10','1'), ('582','托福',NULL,NULL,'1','20141125/b4b3aefdfa4ba9a68ac8ec4762a73361_32_32.jpg','6','1'), ('583','GRE',NULL,NULL,'1','20141125/0519d011d3a90cab62066449295a63be_32_32.jpg','5','1'), ('584','计算机视觉CV',NULL,NULL,'7','20141125/76ccfd6214615444be5e2879de8fa7dc_32_32.jpg','4','1'), ('585','5G',NULL,NULL,'2','20141125/83c297a1ada5b3e060cd4e1eee0ad340_32_32.jpg','14','1'), ('586','众筹',NULL,NULL,'2','20141125/b8fe38d594c4a15fc55d063d348ea76f_32_32.jpg','8','1'), ('587','互联网金融',NULL,NULL,'2','20141125/bcc173955f54bdd0bd7d32d1492c7298_32_32.jpg','19','1'), ('588','追梦网',NULL,NULL,'3','20141125/ca549fef5193b29578b269d3623e8582_32_32.jpg','13','1'), ('589','JAVA',NULL,NULL,'4','20141128/6454b6caa05fb16e0df4bc21bcb5efd5_32_32.jpg','19','1'), ('590','新浪',NULL,NULL,'0',NULL,'3','1'), ('591','字符识别OCR',NULL,NULL,'1','20141130/ba87702dcce151d297da05f3436f5bc2_32_32.jpg','4','1'), ('592','C/C++',NULL,NULL,'1','20141129/151e062933f6353d103838c70a946a84_32_32.jpg','17','1'), ('593','北邮',NULL,NULL,'4',NULL,'6','1'), ('594','南京邮电大学',NULL,NULL,'0','20150118/ab14d67445c069a50efdcf654aa1e144_32_32.png','7','1'), ('595','销售工程师',NULL,NULL,'1','20150118/97082deb5b2dad2a8b84f4885d2fcc3e_32_32.png','6','1'), ('596','飞思卡尔',NULL,NULL,'2','20150117/590a943c9f10950f7462d5f2e487048b_32_32.jpg','3','1'), ('597','中兴软创',NULL,NULL,'2','20150117/f4496d0cd772874ab91a5518e392470e_32_32.gif','9','1'), ('598','德州仪器TI',NULL,NULL,'1','20150117/a69510139ac7459f3a7c2109270ffc0a_32_32.jpg','1','1'), ('599','贝尔英才学院',NULL,NULL,'2','20150118/9c010a71aa0e2f8c21cc3e44953d33cd_32_32.gif','6','1'), ('600','计算机学院',NULL,NULL,'0','20150118/660294d3d76d09a344371d6d6afc16c0_32_32.jpg','7','1'), ('601','算法',NULL,NULL,'4','20150118/57babbd53790532909d8ea89406f929a_32_32.jpg','15','1'), ('602','操作系统',NULL,NULL,'2','20150118/5a958434ce515c78e0f0fc42662f9428_32_32.jpg','11','1'), ('603','PHP',NULL,NULL,'1','20150118/a96f878a51799b4484af175b4b11f583_32_32.jpg','6','1'), ('604','python',NULL,NULL,'4','20150118/f487d4da3fed238029db1b8042a45fa6_32_32.jpg','11','1'), ('605','perl',NULL,NULL,'1','20150118/531ed4fade858bd988a8a989398183e8_32_32.png','2','1'), ('606','C++',NULL,NULL,'3','20150118/9b996f44ecf811f7077381b4ee07b750_32_32.jpg','12','1'), ('607','C#',NULL,NULL,'1','20150118/4e66142dd412befcfb179b076e979442_32_32.jpg','2','1'), ('608','C',NULL,NULL,'1','20150118/bd26c2440a96eff35f76c50ea285da29_32_32.png','9','1'), ('609','南洋理工NTU',NULL,NULL,'2','20150118/7c21e0444b7b372ccf4cc4d082356bdd_32_32.jpg','2','1'), ('610','联通',NULL,NULL,'1','20150118/46dfa7908ab3d57933b11fe5a2d208bd_32_32.jpg','4','1'), ('611','江苏省电信',NULL,NULL,'3','20150118/dfdf7a257da86275b7407abe05e86d4f_32_32.jpg','7','1'), ('612','南邮',NULL,NULL,'3','20150118/364ff6add5abf18873f86774319a5f87_32_32.jpg','12','1'), ('613','电院',NULL,NULL,'0',NULL,'2','1'), ('614','自动化',NULL,NULL,'0','20150118/b6f9ccfbf56878b2e6c8a018e995009c_32_32.png','2','1'), ('615','浙江大学',NULL,NULL,'1','20150118/e101f39d4c99810c2872b57b7dc02ae8_32_32.png','2','1'), ('616','同济大学',NULL,NULL,'1','20150118/403e645d5c11740dc1577463f76fdd45_32_32.png','3','1'), ('617','东南大学',NULL,NULL,'1','20150118/e073a6ad916f05b9a8ae99a9131b9406_32_32.png','3','1'), ('618','上海交大',NULL,NULL,'1','20150117/9086ad0ab62900a92e4f9c16744eae29_32_32.jpg','3','1'), ('619','计算机工程学院',NULL,NULL,'0','20150118/cd7c00193872f5877b96588c3ec5a238_32_32.jpg','5','1'), ('620','公务员',NULL,NULL,'1','20150118/d215ff0d3d0b365f12751ff9f0f61ee0_32_32.png','6','1'), ('621','中国电信',NULL,NULL,'4','20150118/6a12cf80235727f1a41a0be5b4c1421d_32_32.jpg','7','1'), ('622','中国联通',NULL,NULL,'4','20150118/0c5d0ded9bd780d7a944d3223552d692_32_32.png','2','1'), ('623','规划设计',NULL,NULL,'1','20150118/2efe8b84dfa52fd41a3794bd3297cc6c_32_32.png','4','1'), ('624','网络优化',NULL,NULL,'1','20150118/764914f928aea2d5338fad163695a797_32_32.png','7','1'), ('625','客户经理',NULL,NULL,'2','20141215/def75c4300f25dc13cb49936c21f9550_32_32.jpg','6','1'), ('626','朱琦教授',NULL,NULL,'4','20141216/b43ce186337002d68116afcbb7d339ba_32_32.jpg','11','1'), ('627','通信与信息工程学院',NULL,NULL,'0','20150118/b0560f410c1f18f91bb2370534d4e23c_32_32.jpg','6','1'), ('628','南邮SCDA',NULL,NULL,'2','20141216/a71efbb29ebcc4358cecdad34a9ffc4d_32_32.jpg','3','1'), ('629','技术支持',NULL,NULL,'4','20150118/8f9ef5d82a935a66a3c7c2fe9d1c0cef_32_32.jpg','9','1'), ('630','通信工程',NULL,NULL,'1','20150118/538dcd0513435ee449aae5c00dcaef8c_32_32.png','2','1'), ('631','香港城市大学',NULL,NULL,'1','20150118/676cfd93c82d98ed98580ce5aeae65ad_32_32.png','3','1'), ('632','Electronic Engineering',NULL,NULL,'0','20150118/0a819814f4df7a831bc4888bb34f9200_32_32.png','4','1'), ('633','趋势科技',NULL,NULL,'2','20141231/e318cd293a60e427f4e31464bc858b53_32_32.jpg','6','1'), ('634','虹软',NULL,NULL,'1','20141231/481d64334568e9045a94257ae310fe93_32_32.png','5','1'), ('635','南京爱立信熊猫通信有限公司',NULL,NULL,'1','20150118/aa9b5b577c35164c68eb72cc53d01f89_32_32.jpg','1','1'), ('636','内部创业',NULL,NULL,'1',NULL,'6','1'), ('637','郑荣翔闲扯',NULL,NULL,'4','20150102/9b6addf66d1573ff06bfc514d4b53bf7_32_32.jpg','5','1'), ('638','ACM',NULL,NULL,'4','20150118/bab701b68d58889e29276a26ca6dcc5a_32_32.png','4','1'), ('639','通信与信息系统',NULL,NULL,'0','20150118/6d4256772669178677a0e06b3aac6d47_32_32.png','2','1'), ('640','小米通讯技术有限公司',NULL,NULL,'2','20150118/2a133e086f83bfbe00e1b4b2b7513a0e_32_32.png','5','1'), ('641','IBM',NULL,NULL,'1','20150118/4942626f6c367d10762968d77c89b9ce_32_32.jpg','3','1'), ('642','香港科技大学',NULL,NULL,'1','20150118/f7154dbb81d20fafdf9569e3c7d518dc_32_32.png','1','1'), ('643','跳槽',NULL,NULL,'2','20150118/f1ed9d78352cb98a02bfb1673c7cdaa5_32_32.png','2','1'), ('644','上海移动',NULL,NULL,'1','20150118/1a64d836213318919cc04b033f8d3a69_32_32.png','2','1'), ('645','中国邮政——南京',NULL,NULL,'1','20150118/78454bfa4f33c5cacd126412755011a6_32_32.png','2','1'), ('646','offer比较',NULL,NULL,'1',NULL,'6','1'), ('647','自动化测试',NULL,NULL,'1','20150118/216b0dce9c7f9b216b7055389972ec66_32_32.jpg','2','1'), ('648','职业规划',NULL,NULL,'5','20150118/2a4ff78fd021b29cb4a025a17a9297cd_32_32.png','6','1'), ('649','网易',NULL,NULL,'1','20150118/e07fdcf783de899ffd4341d9e80fe4ae_32_32.png','4','1'), ('650','CSDN南邮',NULL,NULL,'1','20150118/cb0fda472236b06dd312109cfaa30cb7_32_32.jpg','5','1'), ('651','博士',NULL,NULL,'4','20150118/58568f44bb0389060594939e5a550a14_32_32.png','4','1'), ('652','淘宝',NULL,NULL,'1','20150118/aa45ff6ba7a518a66d2625ec5eb94bc9_32_32.jpg','3','1'), ('653','Oracle',NULL,NULL,'1','20150118/5d055594a51335e0af66f32fb03201be_32_32.jpg','4','1'), ('654','linux',NULL,NULL,'1','20150118/f72b1fade6b0ee079ac510df6d3366c9_32_32.png','5','1'), ('655','数据库',NULL,NULL,'1','20150118/5c82f464dd2642a49da779cc303f77eb_32_32.jpg','5','1'), ('656','生物医学工程',NULL,NULL,'1','20150118/57aad0e32cc05809ec47d551094e5c1d_32_32.png','2','1'), ('657','地生院',NULL,NULL,'1','20150118/47fc5d920225bae2fe9aded13d2e7a37_32_32.png','2','1'), ('658','校科协',NULL,NULL,'1',NULL,'8','1'), ('659','校学生会',NULL,NULL,'1',NULL,'3','1'), ('660','南邮创业协会',NULL,NULL,'1',NULL,'6','1'), ('661','学通社',NULL,NULL,'1',NULL,'3','1'), ('662','科研',NULL,NULL,'1',NULL,'2','1'), ('663','笔试 ',NULL,NULL,'2',NULL,'2','1'), ('664','面试',NULL,NULL,'3',NULL,'2','1'), ('665','国电南瑞',NULL,NULL,'1',NULL,'3','1'), ('666','群面',NULL,NULL,'1',NULL,'2','1'), ('667','婚姻 ',NULL,NULL,'1',NULL,'1','1');
INSERT INTO `topics` VALUES ('668','两性',NULL,NULL,'2',NULL,'1','1'), ('669','家庭',NULL,NULL,'1',NULL,'1','1'), ('670','数学建模',NULL,NULL,'1',NULL,'4','1'), ('671','研究生',NULL,NULL,'4',NULL,'4','1'), ('672','可穿戴设备',NULL,NULL,'2',NULL,'3','1'), ('673','语音识别',NULL,NULL,'1',NULL,'3','1'), ('674','手势识别',NULL,NULL,'1',NULL,'1','1'), ('675','虚拟现实',NULL,NULL,'1',NULL,'2','1'), ('676','金融',NULL,NULL,'2',NULL,'2','1'), ('677','工作',NULL,NULL,'2',NULL,'2','1'), ('678','毕业',NULL,NULL,'2',NULL,'3','1'), ('679','杨震',NULL,NULL,'2','20150127/2e4c04857ab88cf809804fa4edaae9d4_32_32.jpg','5','1'), ('680','教师点评',NULL,NULL,'2',NULL,'2','1'), ('681','程序员',NULL,NULL,'2',NULL,'9','1'), ('682','爱情',NULL,NULL,'1',NULL,'2','1'), ('683','孙放',NULL,NULL,'4','20150130/f6d9b9be1a5c5b1cac65c286cef664a4_32_32.png','6','1'), ('684','南邮摄影协会',NULL,NULL,'1',NULL,'1','1'), ('685','摄影',NULL,NULL,'1',NULL,'2','1'), ('686','交友',NULL,NULL,'1',NULL,'1','1'), ('687','职场',NULL,NULL,'1',NULL,'2','1'), ('688','IOS',NULL,NULL,'2',NULL,'2','1'), ('689','融合通信',NULL,NULL,'1','20150202/e759d598fdad9187f6c8d64ab0a50779_32_32.png','1','1'), ('690','移动互联网',NULL,NULL,'1',NULL,'4','1'), ('691','公益',NULL,NULL,'2',NULL,'1','1'), ('692','南京三星',NULL,NULL,'1',NULL,'2','1'), ('693','.net',NULL,NULL,'1',NULL,'5','1'), ('694','OTT',NULL,NULL,'1',NULL,'1','1'), ('695','小米',NULL,NULL,'1',NULL,'2','1'), ('696','智能手环',NULL,NULL,'1',NULL,'2','1'), ('697','数据挖掘',NULL,NULL,'1',NULL,'4','1'), ('698','机器学习',NULL,NULL,'1',NULL,'4','1'), ('699','C语言',NULL,NULL,'2',NULL,'3','1'), ('700','信息安全',NULL,NULL,'1',NULL,'3','1'), ('701','友答网冰桶挑战',NULL,NULL,'7','20150220/b56def41749a8156b64539fbddc96077_32_32.png','4','1'), ('702','英语六级CET6',NULL,NULL,'1',NULL,'1','1'), ('703','吴蒙教授',NULL,NULL,'1',NULL,'1','1'), ('704','杨庚教授',NULL,NULL,'1',NULL,'1','1'), ('705','荆晓远教授',NULL,NULL,'1',NULL,'1','1'), ('706','蒋国平教授',NULL,NULL,'1',NULL,'1','1'), ('707','微信',NULL,NULL,'4',NULL,'2','1'), ('708','QQ',NULL,NULL,'1',NULL,'1','1'), ('709','支付宝',NULL,NULL,'1',NULL,'1','1'), ('710','友问友答',NULL,NULL,'3','20150220/a0deee25833a83e5f17b327a72ad152d_32_32.jpg','4','1'), ('711','电影',NULL,NULL,'1',NULL,'1','1'), ('712','视频摘要',NULL,NULL,'2',NULL,'1','1'), ('713','周兆熊专栏',NULL,NULL,'12','20150228/ab4a739e5a4201cfbb0359122d615f1f_32_32.jpg','4','1'), ('714','摆渡',NULL,NULL,'12','20150228/1c6afb439043845c599962651b4cdc29_32_32.jpg','2','1'), ('715','郑海波频道',NULL,NULL,'2','20150228/94bd42792ded340a3686f1e86a626023_32_32.jpg','1','1'), ('716','铁塔公司',NULL,NULL,'1',NULL,'1','1'), ('721','鼎山女尸频道',NULL,NULL,'1','20150303/b61c1e1c6929dfc8986b690dddd41964_32_32.png','5','1'), ('722','野草频道',NULL,NULL,'1','20150303/67b0b6a60e182ab4a23d037ce09ee563_32_32.png','1','1'), ('723','爬虫',NULL,NULL,'1',NULL,'1','1');
INSERT INTO `topic_focus` VALUES ('1','2015-05-23 15:46:26','1','1'), ('3','2015-05-23 15:47:09','5','1'), ('4','2015-05-23 15:47:17','9','1'), ('7','2015-05-23 15:52:22','5','2'), ('8','2015-05-23 15:52:33','1','2'), ('9','2015-05-23 17:24:38','9','2');
INSERT INTO `users` VALUES ('1','apache','123','1','1','1724241758@qq.com','1','1','1','/static/image/head/tmp.jpg','0','0','南京有点大学','10','10','10','40','10','200','0'), ('2','tomcat','123','1','1','1724241758@qq.com','1','1','1','/static/image/head/tmp.jpg','0','0','南京有点大学','10','10','10','40','10','200','0'), ('3','JBoss','123','1','1','1724241758@qq.com','1','1','1','/static/image/head/tmp.jpg','0','0','南京有点大学','10','10','10','40','10','200','0');
INSERT INTO `users_affiliate` VALUES ('1','1','12345678','1','13901512321','1','www.abc.com','1','2015-05-22 16:58:06','192.168.1.1','2015-05-25 11:52:53','88','66','120','1','1'), ('2','0','12568965','1','13902391212','1','www.aaa.com','0','2015-05-25 11:53:58','192.168.1.1','2015-05-24 11:54:06','78','68','110','1','1'), ('3','1','12568965','1','13902391212','1','www.aaa.com','0','2015-05-25 11:53:58','192.168.1.1','2015-05-24 11:54:06','68','68','108','1','1');
INSERT INTO `users_focus` VALUES ('1','2015-05-23 14:16:59','2','1');
INSERT INTO `user_school` VALUES ('1','计算机学院','2015-05-23 10:09:55','1','1','2'), ('2','计算机学院','2015-05-23 10:09:59','1','2','1'), ('3','数量学院','2015-05-24 18:38:39','2','2','3'), ('4','理学院','2015-05-26 21:22:08','2','3','1');
