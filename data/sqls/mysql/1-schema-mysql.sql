drop table IF EXISTS `teams_users`;
drop table IF EXISTS `teams_seleniumgrids`;
drop table IF EXISTS `teams_bpmservers`;
drop table IF EXISTS `teams_processapps`;
drop table IF EXISTS `roles_permissions`;

drop table IF EXISTS `test_step`;
drop table IF EXISTS `snapshot_step`;
drop table IF EXISTS `update_dependency_step`;
drop table IF EXISTS `checkstyle_step`;
drop table IF EXISTS `deployment_step`;
drop table IF EXISTS `script_step`;
drop table IF EXISTS `pipeline_step`;

drop table IF EXISTS `test_build_step`;
drop table IF EXISTS `snapshot_build_step`;
drop table IF EXISTS `checkstyle_build_step`;
drop table IF EXISTS `deployment_build_step`;
drop table IF EXISTS `update_dependency_build_step`;
drop table IF EXISTS `script_build_step`;
drop table IF EXISTS `build_step`;
drop table IF EXISTS `build_stage`;
drop table IF EXISTS `build`;

drop table IF EXISTS `stage`;
drop table IF EXISTS `pipeline`;

drop table IF EXISTS `test_step_info`;
drop table IF EXISTS `human_task_data`;
drop table IF EXISTS `service_data`;
drop table IF EXISTS `rest_api_data`;
drop table IF EXISTS `process_instance_data`;
drop table IF EXISTS `test_case_info`;
drop table IF EXISTS `case_solution_data`;
drop table IF EXISTS `case_activity_data`;
drop table IF EXISTS `test_suite_info`;
drop table IF EXISTS `test_result`;
drop table IF EXISTS `svg`;
drop table IF EXISTS `artifact_data`;
drop table IF EXISTS `command_parameter`;
drop table IF EXISTS `custom_command`;
drop table IF EXISTS `case_step`;
drop table IF EXISTS `command`;
drop table IF EXISTS `category`;
drop table IF EXISTS `bpm_user`;
drop table IF EXISTS `case_object_store`;
drop table IF EXISTS `project_collaborators`;
drop table IF EXISTS `project_bpm_configs`;
drop table IF EXISTS `process_app`;
drop table IF EXISTS `bpm_config`;
drop table IF EXISTS `test_case`;
drop table IF EXISTS `test_suite`;
drop table IF EXISTS `project`;

drop table IF EXISTS `component_entity`;
drop table IF EXISTS `monitor`;
drop table IF EXISTS `bpm_event`;
drop table IF EXISTS `external_test_data`;
drop table IF EXISTS `performance_test_data`;
drop table IF EXISTS `testing_configuration_multiple_selenium_gird_config`;

drop table IF EXISTS `testing_configuration`;
drop table IF EXISTS `selenium_grid_config`;
drop table IF EXISTS `custom_recorder`;
drop table IF EXISTS `IDA_USER`;
drop table IF EXISTS `users_pipelines`;
drop table IF EXISTS `users_projects`;

drop table IF EXISTS `role`;
drop table IF EXISTS `users_roles`;
drop table IF EXISTS `permission`;
drop table IF EXISTS `team`;

drop table IF EXISTS `organization`;
drop table IF EXISTS `test_case_history`;
drop table IF EXISTS `settings`;
drop table IF EXISTS `pipeline_template`;
drop table IF EXISTS `case_step_image_compare`;

drop table IF EXISTS `user_settings`;

--
-- Table structure for table `organization`
--

create TABLE `organization` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`active` bit(1) NOT NULL,
`company_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `permission`
--

create TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
`resource` varchar(255) NOT NULL,
`operation` varchar(50) NOT NULL,
`description` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `role`
--
create TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `roles_permissions`
--
create TABLE `roles_permissions` (
  `role_id` bigint(20) NOT NULL,
`permission_id` bigint(20) NOT NULL,
PRIMARY KEY (`role_id`,`permission_id`),
CONSTRAINT `ROLES_PERMISSIONS_ROLE_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
CONSTRAINT `ROLES_PERMISSIONS_PERMISSION_FK` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `team`
--
create TABLE `team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
`description` varchar(255) DEFAULT NULL,
`team_name` varchar(50) NOT NULL,
`organization_id` bigint(20) DEFAULT NULL,
`access_all_bpm_server` bit(1),
`access_all_selenium_server` bit(1),
PRIMARY KEY (`id`),
CONSTRAINT `TEAM_ORGANIZATION_FK` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `IDA_USER`
--

create TABLE `IDA_USER` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
`active` tinyint(1) NOT NULL DEFAULT '0',
`email` varchar(100) DEFAULT NULL,
`password` varchar(50) NOT NULL,
`token` varchar(255) DEFAULT NULL,
`avatar` mediumtext DEFAULT NULL,
`user_name` varchar(50) NOT NULL,
`organization_id` bigint(20) DEFAULT NULL,
`user_source` varchar(255) DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `USER_ORGANIZATION_FK` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `USER_SETTINGS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `val` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `USER_FK` FOREIGN KEY (`user_id`) REFERENCES `IDA_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `users_roles`
--

create TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
`role_id` bigint(20) NOT NULL,
PRIMARY KEY (`user_id`,`role_id`),
CONSTRAINT `USERS_ROLES_USER_FK` FOREIGN KEY (`user_id`) REFERENCES `IDA_USER` (`id`),
CONSTRAINT `USERS_ROLES_ROLE_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `teams_users`
--
create TABLE `teams_users` (
  `team_id` bigint(20) NOT NULL,
`user_id` bigint(20) NOT NULL,
PRIMARY KEY (`team_id`,`user_id`),
CONSTRAINT `TEAMS_USERS_TEAM_FK` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
CONSTRAINT `TEAMS_USERS_USER_FK` FOREIGN KEY (`user_id`) REFERENCES `IDA_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `selenium_grid_config`
--


create TABLE `selenium_grid_config` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`browser` varchar(50) NOT NULL,
`node_number` int(11),
`max_node_number` int(11),
`min_node_number` int(11),
`selenium_grid_type` varchar(50),
`session_wait_timeout` varchar(8),
`browser_timeout` varchar(8),
`grid_timeout` varchar(8),
`selenium_grid_server_name` varchar(50) NOT NULL,
`selenium_grid_url` varchar(100) NOT NULL,
`organization_id` bigint(20) NOT NULL,
`selenium_grid_options` varchar(1024),
CONSTRAINT `SELENUIM_GRID_CONFIG_ORGANIZATION_FK` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `teams_seleniumgrids`
--

create TABLE `teams_seleniumgrids` (
  `team_id` bigint(20) NOT NULL,
`selenium_grid_id` bigint(20) NOT NULL,
PRIMARY KEY (`team_id`,`selenium_grid_id`),
CONSTRAINT `TEAMS_SELENIUMGRIDS_SELENIUM_GRID_FK` FOREIGN KEY (`selenium_grid_id`) REFERENCES `selenium_grid_config` (`id`),
CONSTRAINT `TEAMS_SELENIUMGRIDS_TEAM_FK` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bpm_config`
--


create TABLE `bpm_config` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`bpm_version` varchar(30) DEFAULT NULL,
`bpm_config_name` varchar(255) NOT NULL,
`connected_server_name` varchar(50) DEFAULT NULL,
`rest_uri` varchar(50) NOT NULL,
`rest_service_user_name` varchar(100),
`rest_service_user_password` varchar(255),
`server_host` varchar(100) DEFAULT NULL,
`server_url` varchar(255) NOT NULL,
`cpe_server_url` varchar(255) DEFAULT NULL,
`cc_server_url` varchar(255) DEFAULT NULL,
`soap_port` varchar(30) DEFAULT NULL,
`server_type` varchar(20) NOT NULL,
`was_admin_user_name` varchar(100) DEFAULT NULL,
`was_admin_user_password` varchar(255) DEFAULT NULL,
`ssh_user` varchar(100) DEFAULT NULL,
`ssh_key` text DEFAULT NULL,
`was_admin_command` varchar(1024) DEFAULT NULL,
`systemId` varchar(64) ,
`organization_id` bigint(20) NOT NULL,
`bpm_doc` mediumtext,
`ops_doc` mediumtext,
CONSTRAINT `BPM_CONFIG_ORGANIZATION_FK` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `process_app`
--

create TABLE `process_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
`app_id` varchar(255) NOT NULL,
`is_toolkit` tinyint(1) NOT NULL DEFAULT '0',
`process_app_name` varchar(255) NOT NULL,
`short_name` varchar(255) NOT NULL,
`bpm_configuration_id` bigint(20) DEFAULT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `PROCESS_APP_BPM_CONFIG_FK` FOREIGN KEY (`bpm_configuration_id`) REFERENCES `bpm_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `teams_processapps`
--
create TABLE `teams_processapps` (
  `team_id` bigint(20) NOT NULL,
`process_app_id` bigint(20) NOT NULL,
PRIMARY KEY (`team_id`,`process_app_id`),
CONSTRAINT `TEAMS_PROCESSAPPS_PROCESS_APP_FK` FOREIGN KEY (`process_app_id`) REFERENCES `process_app` (`id`),
CONSTRAINT `TEAMS_PROCESSAPPS_TEAM_FK` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



create TABLE `teams_bpmservers` (
  `team_id` bigint(20) NOT NULL,
`bpm_server_id` bigint(20) NOT NULL,
PRIMARY KEY (`team_id`,`bpm_server_id`),
CONSTRAINT `TEAMS_BPMSERVERS_BPM_CONFIG_FK` FOREIGN KEY (`bpm_server_id`) REFERENCES `bpm_config` (`id`),
CONSTRAINT `TEAMS_BPMSERVERS_TEAM_FK` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `custom_recorder`
--
create TABLE `custom_recorder` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`script` text,
`organization_id` bigint(20) NOT NULL,
CONSTRAINT `CUSTOM_RECORDER_ORGANIZATION_FK` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `testing_configuration`
--

create TABLE `testing_configuration` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`selenium_gird_config_id` bigint(20) DEFAULT NULL,
CONSTRAINT `TESTING_CONFIG_SELENUIM_GRID_CONFIG_FK` FOREIGN KEY (`selenium_gird_config_id`) REFERENCES `selenium_grid_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `bpm_user`
--


create TABLE `bpm_user` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`bpm_display_name` varchar(255) NOT NULL,
`bpm_role` varchar(255) DEFAULT NULL,
`bpm_user_name` varchar(100) NOT NULL,
`bpm_user_password` varchar(255) NOT NULL,
`bpm_configuration_id` bigint(20) DEFAULT NULL,
`is_rest_user` tinyint(1) NOT NULL DEFAULT '0',
`is_ums_admin_user` tinyint(1) NOT NULL DEFAULT '0',
`selenium_grid_configuration_id` bigint(20) DEFAULT NULL,
CONSTRAINT `BPM_USER_UNIQUE` UNIQUE (`bpm_user_name`, `bpm_configuration_id`),
CONSTRAINT `BPM_DISPLAYNAME_UNIQUE` UNIQUE (`bpm_display_name`, `bpm_configuration_id`),
CONSTRAINT `BPM_USER_BPM_CONFIGURATION_FK` FOREIGN KEY (`bpm_configuration_id`) REFERENCES `bpm_config` (`id`),
CONSTRAINT `BPM_USER_SELENIUM_GRID_CONFIGURATION_FK` FOREIGN KEY (`selenium_grid_configuration_id`) REFERENCES `selenium_grid_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `case_object_store`
--


create TABLE `case_object_store` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`design_object_store` varchar(100) NOT NULL,
`target_object_store` varchar(100) NOT NULL,
`connection_point` varchar(100) NOT NULL,
`target_environment_name` varchar(255),
`display_name` varchar(255) NOT NULL,
`bpm_configuration_id` bigint(20) DEFAULT NULL,
CONSTRAINT `DISPLAY_NAME_UNIQUE` UNIQUE (`display_name`, `bpm_configuration_id`),
CONSTRAINT `CASE_OBJECT_STORE_BPM_CONFIGURATION_FK` FOREIGN KEY (`bpm_configuration_id`) REFERENCES `bpm_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `project`
--

create TABLE `project` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`active` bit(1) NOT NULL,
`description` text,
`name` varchar(100) NOT NULL,
`process_app_data_xml` longtext,
`owner_id` bigint(20) NOT NULL,
`team_id` bigint(20) DEFAULT NULL,
`bpm_user_id` bigint(20) DEFAULT NULL,
`testing_config_id` bigint(20) DEFAULT NULL,
`app_id` varchar(100),
`app_name` varchar(100),
`app_short_name` varchar(20),
`branch_id` varchar(100),
`branch_name` varchar(100),
`snapshot_id` varchar(100),
`snapshot_name` varchar(100),
`tip` tinyint(1) NOT NULL DEFAULT '0',
`toolkit` tinyint(1) NOT NULL DEFAULT '0',
`creation_date` datetime DEFAULT NULL,
`update_date` datetime DEFAULT NULL,
`updater_id` bigint(20) DEFAULT NULL,
`engine_properties` varchar(255),
`case_object_store_id` bigint(20),
CONSTRAINT `PROJECT_TESTING_CONFIG_FK` FOREIGN KEY (`testing_config_id`) REFERENCES `testing_configuration` (`id`),
CONSTRAINT `PROJECT_OWNER_FK` FOREIGN KEY (`owner_id`) REFERENCES `IDA_USER` (`id`),
CONSTRAINT `PROJECT_TEAM_FK` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
CONSTRAINT `PROJECT_BPM_USER_FK` FOREIGN KEY (`bpm_user_id`) REFERENCES `bpm_user` (`id`),
CONSTRAINT `PROJECT_UPDATER_FK` FOREIGN KEY (`updater_id`) REFERENCES `IDA_USER` (`id`),
CONSTRAINT `PROJECT_CASE_OBJECT_STORE_FK` FOREIGN KEY (`case_object_store_id`) REFERENCES `case_object_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `users_projects`
--
create TABLE `users_projects` (
  `user_id` bigint(20) NOT NULL,
`project_id` bigint(20) NOT NULL,
PRIMARY KEY (`user_id`,`project_id`),
CONSTRAINT `USERS_PROJECTS_PROJECT_FK` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
CONSTRAINT `USERS_PROJECTS_USER_FK` FOREIGN KEY (`user_id`) REFERENCES `IDA_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `test_suite`
--

create TABLE `test_suite` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`test_suit_name` varchar(100) NOT NULL,
`test_suit_type` varchar(100) NOT NULL,
`project_id` bigint(20) DEFAULT NULL,
CONSTRAINT `TEST_SUITE_PROJECT_FK` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `external_test_data`
--

create TABLE `external_test_data` (
	`id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`file_content` mediumtext,
`file_name` varchar(100) not null,
`file_type` varchar(255),
`project_id` bigint(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `performance_test_data`
--

create TABLE `performance_test_data` (
	`id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`version` bigint(20) NOT NULL,
	`report_path` varchar(255) DEFAULT NULL,
	`network_information` mediumtext DEFAULT NULL,
	`strategy_information` varchar(255) DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `test_case`
--

create TABLE `test_case` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`case_name` varchar(100) NOT NULL,
`case_type` varchar(10) NOT NULL,
`case_description` text,
`creation_date` datetime DEFAULT NULL,
`exec_status` varchar(10) DEFAULT NULL,
`exec_error_message` text, 
`case_flow` mediumtext,
`process_name` varchar(100) DEFAULT NULL,
`process_type` varchar(30) DEFAULT NULL,
`update_date` datetime DEFAULT NULL,
`creator_id` bigint(20) NOT NULL,
`project_id` bigint(20) NOT NULL,
`test_suite_id` bigint(20) NOT NULL,
`updater_id` bigint(20) DEFAULT NULL,
`editor_id` bigint(20) DEFAULT NULL,
`executor_id` bigint(20) DEFAULT NULL,
`external_test_data_id` bigint(20) DEFAULT NULL,
`locker` varchar(100) DEFAULT NULL,
`case_labels` text,
`performance_test_data_id` bigint(20) DEFAULT NULL,
`performance` tinyint(1) NOT NULL DEFAULT '0',
CONSTRAINT `TESTCASE_UPDATER_FK` FOREIGN KEY (`updater_id`) REFERENCES `IDA_USER` (`id`),
CONSTRAINT `TESTCASE_TESTSUITE_FK` FOREIGN KEY (`test_suite_id`) REFERENCES `test_suite` (`id`),
CONSTRAINT `TESTCASE_PROJECT_FK` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
CONSTRAINT `TESTCASE_CREATOR_FK` FOREIGN KEY (`creator_id`) REFERENCES `IDA_USER` (`id`),
CONSTRAINT `TESTCASE_EDITOR_FK` FOREIGN KEY (`editor_id`) REFERENCES `IDA_USER` (`id`),
CONSTRAINT `TESTCASE_EXECUTOR_FK` FOREIGN KEY (`executor_id`) REFERENCES `IDA_USER` (`id`),
CONSTRAINT `TESTCASE_TESTDATA_FK` FOREIGN KEY (`external_test_data_id`) REFERENCES `external_test_data` (`id`),
CONSTRAINT `TESTCASE_PERFORMANCE_TEST_DATA_FK` FOREIGN KEY (`performance_test_data_id`) REFERENCES `performance_test_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `project_bpm_configs`
--

create TABLE `project_bpm_configs` (
  `project_id` bigint(20) NOT NULL,
`bpm_configs_id` bigint(20) NOT NULL,
CONSTRAINT `PROJECT_BPM_CONFIG_FK` FOREIGN KEY (`bpm_configs_id`) REFERENCES `bpm_config` (`id`),
CONSTRAINT `BPM_CONFIG_PROJECT_FK` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `project_collaborators`
--

create TABLE `project_collaborators` (
  `project_id` bigint(20) NOT NULL,
`collaborators_id` bigint(20) NOT NULL,
CONSTRAINT `PROJECT_COLLABORATORS_FK` FOREIGN KEY (`collaborators_id`) REFERENCES `IDA_USER` (`id`),
CONSTRAINT `COLLABORATORS_PROJECT_FK` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `category`
--


create TABLE `category` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`category_type` varchar(20) NOT NULL,
`creation_date` datetime DEFAULT NULL,
`description` varchar(255) DEFAULT NULL,
`name` varchar(30) UNIQUE NOT NULL,
`sort` int(11) DEFAULT NULL,
`update_date` datetime DEFAULT NULL,
`parent` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `command`
--


create TABLE `command` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`creation_date` datetime DEFAULT NULL,
`description` varchar(1024) DEFAULT NULL,
`name` varchar(100) NOT NULL,
`update_date` datetime DEFAULT NULL,
`verbalization` varchar(255) DEFAULT NULL,
`category_id` bigint(20) DEFAULT NULL,
`creator_id` bigint(20) DEFAULT NULL,
`project_id` bigint(20) DEFAULT NULL,
`takescreenshot` boolean NOT NULL,
`execution_type` varchar(20) DEFAULT NULL,
`scope` varchar(64) DEFAULT NULL,
`class_name` varchar(1024) DEFAULT NULL,
`jar_file` varchar(100) DEFAULT NULL,
`doc_link` varchar(255) DEFAULT NULL,
`script` text DEFAULT NULL,
CONSTRAINT `COMMAND_UNIQUE` UNIQUE (`name`, `category_id`, `project_id`),
CONSTRAINT `COMMAND_PROJECT_FK` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
CONSTRAINT `COMMAND_CATEGROY_FK` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
CONSTRAINT `COMMAND_CREATOR_FK` FOREIGN KEY (`creator_id`) REFERENCES `IDA_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `case_step`
--

create TABLE `case_step` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`case_data` text,
`comment` varchar(255) DEFAULT NULL,
`description` text DEFAULT NULL,
`exception_trace` text,
`exec_status` varchar(10) DEFAULT NULL,
`case_step_index` int(11)DEFAULT NULL,
`parameters` mediumtext,
`screenshot_path` varchar(255)DEFAULT NULL,
`script` text,
`test_result` mediumtext,
`bpm_user_id` bigint(20)DEFAULT NULL,
`command_id` bigint(20)DEFAULT NULL,
`group_command_id` bigint(20)DEFAULT NULL,
`test_case_id` bigint(20)DEFAULT NULL,
`post_script_toggle` boolean DEFAULT FALSE,
`condition_id` bigint(20)DEFAULT NULL,
CONSTRAINT `CASE_STEP_TEST_CASE_FK` FOREIGN KEY(`test_case_id`)REFERENCES `test_case`(`id`),
CONSTRAINT `CASE_STEP_GROUP_COMMAND_FK` FOREIGN KEY(`group_command_id`)REFERENCES `command`(`id`),
CONSTRAINT `CASE_STEP_COMMAND_FK` FOREIGN KEY(`command_id`)REFERENCES `command`(`id`),
CONSTRAINT `CASE_STEP_BPM_USER_FK` FOREIGN KEY(`bpm_user_id`)REFERENCES `bpm_user`(`id`)
)ENGINE = InnoDB DEFAULT CHARSET = utf8
;


create TABLE `test_case_history` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`comment` text DEFAULT NULL,
`content` mediumtext DEFAULT NULL,
`binary_content` mediumblob DEFAULT NULL,
`creation_date` datetime NOT NULL,
`version` bigint(20) NOT NULL,
`creator_id` bigint(20) NOT NULL,
`test_case_id` bigint(20) NOT NULL,
CONSTRAINT `TEST_CASE_HISTORY_TESTCASE_FK` FOREIGN KEY (`test_case_id`) REFERENCES `test_case` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `parameter`
--


create TABLE `command_parameter` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`checked` varchar(30) DEFAULT NULL,
`creation_date` datetime DEFAULT NULL,
`display_name` varchar(255) NOT NULL,
`hidden` varchar(30) DEFAULT NULL,
`parameter_name` varchar(100) NOT NULL,
`param_regexp` varchar(255) DEFAULT NULL,
`param_source` varchar(255) DEFAULT NULL,
`parameter_type` varchar(30) NOT NULL,
`unchecked` varchar(30) DEFAULT NULL,
`update_date` datetime DEFAULT NULL,
`command_id` bigint(20) NOT NULL,
`title` varchar(255) DEFAULT NULL,
CONSTRAINT `PARAMETER_UNIQUE` UNIQUE (`parameter_name`, `command_id`),
CONSTRAINT `PARAMETER_COMMAND_FK` FOREIGN KEY (`command_id`) REFERENCES `command` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `test_result`
--


create TABLE `test_result` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`build_id` bigint(20) DEFAULT NULL,
`duration` varchar(10) DEFAULT NULL,
`end_date` datetime DEFAULT NULL,
`environment` varchar(50) DEFAULT NULL,
`exec_status` varchar(10) DEFAULT NULL,
`fail_number` int(11) DEFAULT NULL,
`folder` varchar(255) DEFAULT NULL,
`logs_path` varchar(255) DEFAULT NULL,
`process_app_name` varchar(100) DEFAULT NULL,
`project_id` bigint(20) DEFAULT NULL,
`server_url` varchar(100) DEFAULT NULL,
`snapshot_name` varchar(100) DEFAULT NULL,
`start_date` datetime DEFAULT NULL,
`success_number` int(11) DEFAULT NULL,
`success_rate` varchar(10) DEFAULT NULL,
`tip` boolean DEFAULT FALSE,
`total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `test_suite_info`
--


create TABLE `test_suite_info` (
  `id` bigint(20) NOT NULL PRIMARY KEY  AUTO_INCREMENT,
`duration` varchar(10) DEFAULT NULL,
`exec_status` varchar(10) DEFAULT NULL,
`fail_number` int(11) DEFAULT NULL,
`suite_name` varchar(100) DEFAULT NULL,
`success_number` int(11) DEFAULT NULL,
`success_rate` varchar(10) DEFAULT NULL,
`total` int(11) DEFAULT NULL,
`test_result_id` bigint(20) DEFAULT NULL,
CONSTRAINT `TEST_SUITE_INFO_TEST_RESULT_FK` FOREIGN KEY (`test_result_id`) REFERENCES `test_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `case_solution_data`
--


create TABLE `case_solution_data` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `case_folder_id` varchar(100) DEFAULT NULL,
  `case_identifier` varchar(100) DEFAULT NULL,
  `case_title_property` varchar(100) DEFAULT NULL,
  `case_type` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `case_object_store_id` bigint(20) DEFAULT NULL,
  `properties` text DEFAULT NULL,
CONSTRAINT `CASE_SOLUTION_DATA_CASE_OBJECT_STORE_FK` FOREIGN KEY (`case_object_store_id`) REFERENCES `case_object_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `case_activity_data`
--


create TABLE `case_activity_data` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `task_id` varchar(100) DEFAULT NULL,
  `roster_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `process_instance_id` varchar(100) DEFAULT NULL,
  `task_type` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `disabled_state` varchar(30) DEFAULT NULL,
  `required_state` varchar(30) DEFAULT NULL,
  `launch_mode` varchar(30) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `case_solution_data_id` bigint(20),
CONSTRAINT `CASE_ACTIVITY_DATA_CASE_SOLUTION_DATA_FK` FOREIGN KEY (`case_solution_data_id`) REFERENCES `case_solution_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `test_case_info`
--

create TABLE `test_case_info` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`case_type` varchar(20) DEFAULT NULL,
`duration` varchar(10) DEFAULT NULL,
`end_date` datetime DEFAULT NULL,
`exec_status` varchar(10) DEFAULT NULL,
`case_name` varchar(100) DEFAULT NULL,
`start_date` datetime DEFAULT NULL,
`browser` varchar(100) DEFAULT NULL,
`test_suite_info_id` bigint(20) DEFAULT NULL,
`test_case_id` bigint(20) DEFAULT NULL,
`case_solution_data_id` bigint(20) DEFAULT NULL,
`actual_lines_xml` mediumtext,
`dataset_name` varchar(200) DEFAULT NULL,
`dataset_content` mediumtext,
CONSTRAINT `TEST_CASE_INFO_TEST_CASE_FK` FOREIGN KEY (`test_case_id`) REFERENCES `test_case` (`id`),
CONSTRAINT `TEST_CASE_INFO_TEST_SUITE_INFO_FK` FOREIGN KEY (`test_suite_info_id`) REFERENCES `test_suite_info` (`id`),
CONSTRAINT `TEST_CASE_INFO_CASE_SOLUTION_DATA_FK` FOREIGN KEY (`case_solution_data_id`) REFERENCES `case_solution_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `test_step_info`
--


create TABLE `test_step_info` (
  `id` bigint(20) NOT NULL PRIMARY KEY  AUTO_INCREMENT,
`category` varchar(30) DEFAULT NULL,
`command` varchar(100) DEFAULT NULL,
`comment` varchar(255) DEFAULT NULL,
`description` text,
`exception_trace` text,
`exec_status` varchar(10) DEFAULT NULL,
`test_step_name` varchar(100) DEFAULT NULL,
`test_step_id` bigint(20) DEFAULT NULL,
`test_step_index` int(11) DEFAULT NULL,
`test_step_parent` bigint(20) DEFAULT NULL,
`parameters` mediumtext,
`screenshot_path` varchar(255) DEFAULT NULL,
`cropped_img_compare_result` varchar(255) DEFAULT NULL,
`expected_image_path` varchar(255) DEFAULT NULL,
`test_case_info_id` bigint(20) DEFAULT NULL,
`full_index` varchar(30) DEFAULT NULL,
`parent_index` varchar(30) DEFAULT NULL,
`is_group_command_step` boolean,
`condition_id` bigint(20) DEFAULT NULL,
CONSTRAINT `TEST_STEP_INFO_TEST_CASE_INFO_FK` FOREIGN KEY (`test_case_info_id`) REFERENCES `test_case_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `artifact_data`
--

create TABLE `artifact_data` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`artifact_id` varchar(50) DEFAULT NULL,
`artifact_data` mediumtext,
`artifact_input` mediumtext,
`artifact_type` varchar(20) NOT NULL,
`duration` varchar(30) DEFAULT NULL,
`end_date` datetime DEFAULT NULL,
`error` text,
`data_name` varchar(255) DEFAULT NULL,
`start_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `svg`
--

create TABLE `svg` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`content` mediumtext,
`svg_name` varchar(255) DEFAULT NULL,
`svg_type` varchar(50) DEFAULT NULL,
`artifact_data_id` bigint(20) DEFAULT NULL,
CONSTRAINT `SVG_ARTIFACT_DATA_ID` FOREIGN KEY (`artifact_data_id`) REFERENCES `artifact_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `process_instance_data`
--

create TABLE `process_instance_data` (
  `id` bigint(20) PRIMARY KEY  NOT NULL,
`test_case_info_id` bigint(20) DEFAULT NULL,
CONSTRAINT `PROCESS_INSTANCE_DATA_ARTIFACT_DATA_FK` FOREIGN KEY (`id`) REFERENCES `artifact_data` (`id`),
CONSTRAINT `PROCESS_INSTANCE_DATA_TEST_CASE_INFO_FK` FOREIGN KEY (`test_case_info_id`) REFERENCES `test_case_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `human_task_data`
--

create TABLE `human_task_data` (
  `id` bigint(20) NOT NULL PRIMARY KEY  AUTO_INCREMENT,
`human_task_data` mediumtext,
`duration` varchar(30) DEFAULT NULL,
`task_name` varchar(255) DEFAULT NULL,
`task_type` varchar(50) DEFAULT NULL,
`process_instance_data_id` bigint(20) DEFAULT NULL,
CONSTRAINT `HUMAN_TASK_DATA_PROCESS_INSTANCE_DATA_FK` FOREIGN KEY (`process_instance_data_id`) REFERENCES `process_instance_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rest_api_data`
--

create TABLE `rest_api_data` (
  `id` bigint(20) PRIMARY KEY NOT NULL,
`test_case_info_id` bigint(20) DEFAULT NULL,
CONSTRAINT `REST_API_DATA_ARTIFACT_DATA_FK` FOREIGN KEY (`id`) REFERENCES `artifact_data` (`id`),
CONSTRAINT `REST_API_DATA_TEST_CASE_INFO_FK` FOREIGN KEY (`test_case_info_id`) REFERENCES `test_case_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `service_data`
--

create TABLE `service_data` (
  `id` bigint(20) PRIMARY KEY NOT NULL,
`test_case_info_id` bigint(20) DEFAULT NULL,
CONSTRAINT `SERVICE_DATA_ARTIFACT_DATA_FK` FOREIGN KEY (`id`) REFERENCES `artifact_data` (`id`),
CONSTRAINT `SERVICE_DATA_TEST_CASE_INFO_FK` FOREIGN KEY (`test_case_info_id`) REFERENCES `test_case_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `pipeline` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`active` bit(1) NOT NULL,
`creation_date` datetime DEFAULT NULL,
`name` varchar(100) NOT NULL,
`recipients` varchar(255) DEFAULT NULL,
`schedule_time` varchar(10) DEFAULT NULL,
`schedule_type` varchar(30) DEFAULT NULL,
`update_date` datetime DEFAULT NULL,
`creator_id` bigint(20) NOT NULL,
`updater_id` bigint(20) DEFAULT NULL,
`post_script` mediumtext DEFAULT NULL,
`error_script` mediumtext DEFAULT NULL,
`team_id` bigint(20) DEFAULT NULL,
`trigger_by_time` bit(1),
`trigger_by_snapshot` bit(1),
`last_trigger_by_snapshot_time` datetime,
CONSTRAINT `PIPELINE_USER_FK` FOREIGN KEY (`creator_id`) REFERENCES `IDA_USER` (`id`),
CONSTRAINT `PIPELINE_TEAM_FK` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
CONSTRAINT `PIPELINE_UPDATER_FK` FOREIGN KEY (`updater_id`) REFERENCES `IDA_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `pipeline_template` (
  	`id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(255),
`code` VARCHAR(50),
`content` text,
`image` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Table structure for table `users_pipelines`
--
create TABLE `users_pipelines` (
  `user_id` bigint(20) NOT NULL,
`pipeline_id` bigint(20) NOT NULL,
PRIMARY KEY (`user_id`,`pipeline_id`),
CONSTRAINT `USERS_PIPELINES_PIPELINE_FK` FOREIGN KEY (`pipeline_id`) REFERENCES `pipeline` (`id`),
CONSTRAINT `USERS_PIPELINES_USER_FK` FOREIGN KEY (`user_id`) REFERENCES `IDA_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `stage` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` varchar(100) NOT NULL,
`stage_type` varchar(10) NOT NULL,
`stage_index` int(11) DEFAULT NULL,
`branch_id` varchar(50) DEFAULT NULL,
`process_app_id` varchar(50) DEFAULT NULL,
`toolkit` tinyint(1) NOT NULL DEFAULT '0',
`snapshot_id` varchar(50) DEFAULT NULL,
`bpm_configuration_id` bigint(20) DEFAULT NULL,
`pipeline_id` bigint(20) NOT NULL,
`subpipeline_id` bigint(20) DEFAULT NULL,
CONSTRAINT `STG_PIPELINE_FK` FOREIGN KEY (`pipeline_id`) REFERENCES `pipeline` (`id`),
CONSTRAINT `STG_SUBPIPELINE_FK` FOREIGN KEY (`subpipeline_id`) REFERENCES `pipeline` (`id`),
CONSTRAINT `STG_BPMSERVER_FK` FOREIGN KEY (`bpm_configuration_id`) REFERENCES `bpm_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `pipeline_step` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` varchar(100) NOT NULL,
`active` bit(1) NOT NULL,
`step_type` varchar(20) NOT NULL,
`pipeline_step_index` int(11) DEFAULT NULL,
`stage_id` bigint(20) DEFAULT NULL,
CONSTRAINT `STEP_STG_FK` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `test_step` (
  `id` bigint(20) NOT NULL PRIMARY KEY,
`is_tip` bit(1) DEFAULT NULL,
`project_id` bigint(20) DEFAULT NULL,
`selected_test_case_ids` varchar(1024) DEFAULT NULL,
`selected_test_case_labels` varchar(1024) DEFAULT NULL,
`selected_selenium_hub_ids` varchar(1024) DEFAULT NULL,
`exclude_test_cases` bit(1) DEFAULT NULL,
CONSTRAINT `TEST_STEP_FK` FOREIGN KEY (`id`) REFERENCES `pipeline_step` (`id`),
CONSTRAINT `TEST_STEP_PROJECT_FK` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `snapshot_step` (
  `naming_convention` varchar(100) NOT NULL,
  `id` bigint(20) NOT NULL PRIMARY KEY,
CONSTRAINT `SNAPSHOT_STEP_FK` FOREIGN KEY (`id`) REFERENCES `pipeline_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `update_dependency_step` (
  `toolkit_id` varchar(50) NOT NULL,
  `id` bigint(20) NOT NULL PRIMARY KEY,
CONSTRAINT `UPDATE_DEPENDENCY_STEP_FK` FOREIGN KEY (`id`) REFERENCES `pipeline_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `checkstyle_step` (
  `ignore_doc_check` boolean NOT NULL,
  `ignore_js_check` boolean NOT NULL,
  `ignore_toolkits_check` boolean NOT NULL,
  `halt_on_failure` boolean NOT NULL,
  `health_score_threshold` bigint(20) NOT NULL default 20,
`warnings_threshold` bigint(20) NOT NULL default 200,
`is_tip` bit(1) DEFAULT NULL,
`id` bigint(20) NOT NULL PRIMARY KEY,
CONSTRAINT `CS_STEP_FK` FOREIGN KEY (`id`) REFERENCES `pipeline_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `deployment_step` (
  `ignore_validation_error` boolean NOT NULL DEFAULT TRUE,
  `offline_install` boolean NOT NULL DEFAULT FALSE,
  `twx_path` varchar(255) DEFAULT NULL,
  `deploy_from_local_file_system` boolean NOT NULL DEFAULT FALSE,
  `id` bigint(20) NOT NULL PRIMARY KEY,

CONSTRAINT `DEPLOYMENT_STEP_FK` FOREIGN KEY (`id`) REFERENCES `pipeline_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `script_step` (
  `script` text NOT NULL,
  `id` bigint(20) NOT NULL PRIMARY KEY,
CONSTRAINT `SCRIPT_STEP_FK` FOREIGN KEY (`id`) REFERENCES `pipeline_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `build` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`duration` int DEFAULT NULL,
`end_date` datetime DEFAULT NULL,
`name` varchar(50) NOT NULL,
`exception_trace` text,
`start_date` datetime NOT NULL,
`status` varchar(10) DEFAULT NULL,
`pipeline_id` bigint(20) NOT NULL,
`trigger_by` bigint(20),
`triggering_snapshot_acronym` varchar(50),
CONSTRAINT `BUILD_PIPELINE_FK` FOREIGN KEY (`pipeline_id`) REFERENCES `pipeline` (`id`),
CONSTRAINT `TRIGGER_BY_USER_FK` FOREIGN KEY (`trigger_by`) REFERENCES `IDA_USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `build_stage` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` varchar(100) NOT NULL,
`stage_type` varchar(10) NOT NULL,
`stage_index` int(11) DEFAULT NULL,
`build_id` bigint(20) NOT NULL,
`server_name` varchar(255) DEFAULT NULL,
`process_app_acronym` varchar(255) DEFAULT NULL,
`branch_name` varchar(255) DEFAULT NULL,
`snapshot_acronym` varchar(255) DEFAULT NULL,
`subpipeline_id` bigint(20) DEFAULT NULL,
CONSTRAINT `BUILD_STAGE_SUBPIPELINE_FK` FOREIGN KEY (`subpipeline_id`) REFERENCES `pipeline` (`id`),
CONSTRAINT `BUILD_STAGE_FK` FOREIGN KEY (`build_id`) REFERENCES `build` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create TABLE `build_step` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`duration` int DEFAULT NULL,
`end_date` datetime DEFAULT NULL,
`name` varchar(50) DEFAULT NULL,
`build_step_index` int(11) DEFAULT NULL,
`start_date` datetime DEFAULT NULL,
`status` varchar(10) NOT NULL,
`exception_trace` text,
`step_type` varchar(20) NOT NULL,
`stage_id` bigint(20) NOT NULL,
CONSTRAINT `BUILD_STEP_FK` FOREIGN KEY (`stage_id`) REFERENCES `build_stage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create TABLE `test_build_step` (
  `id` bigint(20) NOT NULL PRIMARY KEY ,
`test_result_id` bigint(20) DEFAULT NULL,
CONSTRAINT `UT_BUILD_STEP_RESULT_FK` FOREIGN KEY (`test_result_id`) REFERENCES `test_result` (`id`),
CONSTRAINT `UT_BUILD_STEP_FK` FOREIGN KEY (`id`) REFERENCES `build_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `snapshot_build_step` (
  `bpm_snapshot_id` varchar(50) DEFAULT NULL,
  `bpm_snapshot_name` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL PRIMARY KEY,
CONSTRAINT `SNAPSHOT_BUILD_STEP_FK` FOREIGN KEY (`id`) REFERENCES `build_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `update_dependency_build_step` (
  `id` bigint(20) NOT NULL PRIMARY KEY,
CONSTRAINT `UPDATE_DEPENDENCY_STEP_BUILD_FK` FOREIGN KEY (`id`) REFERENCES `build_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `checkstyle_build_step` (
  `artifacts` int(11) DEFAULT NULL,
`report_data` longtext,
`report_folder` varchar(255) DEFAULT NULL,
`score` int(11) DEFAULT NULL,
`warnings` int(11) DEFAULT NULL,
`id` bigint(20) NOT NULL PRIMARY KEY,
CONSTRAINT `CS_BUILD_STEP_FK` FOREIGN KEY (`id`) REFERENCES `build_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create TABLE `deployment_build_step` (
  `id` bigint(20) NOT NULL PRIMARY KEY,
CONSTRAINT `DEPLOYMENT_BUILD_STEP_FK` FOREIGN KEY (`id`) REFERENCES `build_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `script_build_step` (
  `id` bigint(20) NOT NULL PRIMARY KEY,
`result` text DEFAULT NULL,
`script` text DEFAULT NULL,
CONSTRAINT `SCRIPT_BUILD_STEP_FK` FOREIGN KEY (`id`) REFERENCES `build_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create TABLE `monitor`(
   `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` varchar(100) not null,
`descrption` varchar(225),
`server` varchar(64) DEFAULT null,
`process_app` varchar(64) DEFAULT NULL,
`branch` varchar(64) DEFAULT NULL,
`failed_instance_notification_to` varchar(128) DEFAULT NULL,
`default_execution_timeout` int not null,
`timeout_notification_to` varchar(128) DEFAULT NULL,
`creator` varchar(64) not null,
`snapshot` varchar(64) DEFAULT NULL,
`monitor_failed_instance` boolean DEFAULT FALSE,
`enable` boolean DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `component_entity` (
	`id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`component_name` varchar(200) not null,
`execution_timeout` int DEFAULT 0,
`checked` boolean DEFAULT FALSE,
`monitor_id` bigint(20),
CONSTRAINT `MONITOR_ID_FK` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `bpm_event` (
	`id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`systemid` varchar(225),
`correlationid` varchar(225),
`occurancetime` varchar(225),
`instanceid` varchar(225),
`taskid` varchar(225),
`instancestatus` varchar(225),
`taskstatus` varchar(225),
`sequenceid` varchar(225),
`appname` varchar(225),
`appid` varchar(225),
`appversion` varchar(225),
`componenttype` varchar(225),
`componentname` varchar(225),
`elementtype` varchar(225),
`elementname` varchar(225),
`eventtype` varchar(225),
`duration` varchar(225),
`executiontime` varchar(225),
`waittime` varchar(225),
`starttime` varchar(225),
`endtime` varchar(225),
`errortrace` varchar(225),
`envname` varchar(225)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `testing_configuration_multiple_selenium_gird_config`
--

create TABLE `testing_configuration_multiple_selenium_gird_config` (
	`testing_configuration_id` bigint(20) NOT NULL,
`multiple_selenium_gird_config_id` bigint(20) NOT NULL,
CONSTRAINT `TESTING_CONFIGURATION_MULTIPLE_SELENIUM_GIRD_CONFIG_FK` FOREIGN KEY (`multiple_selenium_gird_config_id`) REFERENCES `selenium_grid_config` (`id`),
CONSTRAINT `MULTIPLE_SELENIUM_GIRD_CONFIG_TESTING_CONFIGURATION_FK` FOREIGN KEY (`testing_configuration_id`) REFERENCES `testing_configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create TABLE `settings` (
	`name` VARCHAR(255) NOT NULL PRIMARY KEY ,
	`val` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `case_step_image_compare`
--

create TABLE `case_step_image_compare` (
	`id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`enabled` boolean,
`source_image_path` varchar(255),
`result_image_path` varchar(255),
`crop_origin_x_axis` varchar(32),
`crop_origin_y_axis` varchar(32),
`crop_width` varchar(32),
`crop_height` varchar(32),
`test_case_id` bigint(20),
`case_step_id` bigint(20),
CONSTRAINT `CASE_STEP_IMAGE_COMPARE_TEST_CASE_FK` FOREIGN KEY (`test_case_id`) REFERENCES `test_case` (`id`),
CONSTRAINT `CASE_STEP_IMAGE_COMPARE_CASE_STEP_FK` FOREIGN KEY (`case_step_id`) REFERENCES `case_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
