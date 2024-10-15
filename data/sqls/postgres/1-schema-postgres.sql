CREATE SEQUENCE organization_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;
CREATE TABLE "organization" (
    "id" integer DEFAULT nextval('organization_id_seq') NOT NULL,
    "active" boolean NOT NULL,
    "company_name" character varying(50) NOT NULL,
    CONSTRAINT "organization_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "organization_unique" UNIQUE ("company_name")
) WITH (oids = false);

CREATE SEQUENCE permission_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 24 CACHE 1;
CREATE TABLE "permission" (
    "id" integer DEFAULT nextval('permission_id_seq') NOT NULL,
    "description" character varying(255) NOT NULL,
    "operation" character varying(50) NOT NULL,
    "resource_name" character varying(255) NOT NULL,
    CONSTRAINT "permission_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "permission_unique" UNIQUE ("operation","resource_name")
) WITH (oids = false);

CREATE SEQUENCE role_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 2 CACHE 1;
CREATE TABLE "role" (
    "id" integer DEFAULT nextval('role_id_seq') NOT NULL,
    "name" character varying(50) NOT NULL,
    CONSTRAINT "role_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "role_unique" UNIQUE ("name")
) WITH (oids = false);

CREATE TABLE "roles_permissions" (
    "permission_id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    CONSTRAINT "roles_permissions_pkey" PRIMARY KEY ("permission_id", "role_id")
) WITH (oids = false);

CREATE SEQUENCE team_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;
CREATE TABLE "team" (
    "id" integer DEFAULT nextval('team_id_seq') NOT NULL,
    "access_all_bpm_server" boolean,
    "access_all_selenium_server" boolean,
    "description" character varying(255),
    "team_name" character varying(50) NOT NULL,
    "organization_id" bigint,
    CONSTRAINT "team_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "team_unique" UNIQUE ("team_name")
) WITH (oids = false);

CREATE SEQUENCE ida_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 2 CACHE 1;
CREATE TABLE "ida_user" (
    "id" integer DEFAULT nextval('ida_user_id_seq') NOT NULL,
    "active" boolean NOT NULL,
    "avatar" text,
    "email" character varying(100),
    "password" character varying(50) NOT NULL,
    "token" character varying(255),
    "user_name" character varying(50) NOT NULL,
    "user_source" character varying(255),
    "organization_id" bigint,
    CONSTRAINT "ida_user_unique" UNIQUE ("user_name"),
    CONSTRAINT "ida_user_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE user_settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "user_settings" (
    "id" integer DEFAULT nextval('user_settings_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "val" character varying(255) NOT NULL,
    "user_id" bigint,
    CONSTRAINT "user_settings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "users_roles" (
    "role_id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    CONSTRAINT "users_roles_pkey" PRIMARY KEY ("role_id", "user_id")
) WITH (oids = false);

CREATE TABLE "teams_users" (
    "team_id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    CONSTRAINT "teams_users_pkey" PRIMARY KEY ("team_id", "user_id")
) WITH (oids = false);

CREATE SEQUENCE selenium_grid_config_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 8 CACHE 1;
CREATE TABLE "selenium_grid_config" (
    "id" integer DEFAULT nextval('selenium_grid_config_id_seq') NOT NULL,
    "browser" character varying(50) NOT NULL,
    "max_node_number" integer,
    "min_node_number" integer,
    "selenium_grid_type" character varying(50),
    "session_wait_timeout" character varying(8),
    "grid_timeout" character varying(8),
    "selenium_grid_server_name" character varying(50) NOT NULL,
    "selenium_grid_url" character varying(1024) NOT NULL,
    "selenium_grid_internal_url" character varying(1024),
    "organization_id" bigint,
    "selenium_grid_options" character varying(1024),
    "version" character varying(30),
    CONSTRAINT "selenium_grid_config_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "selenium_grid_config_unique" UNIQUE ("selenium_grid_server_name")
) WITH (oids = false);

CREATE TABLE "teams_seleniumgrids" (
    "selenium_grid_id" bigint NOT NULL,
    "team_id" bigint NOT NULL,
    CONSTRAINT "teams_seleniumgrids_pkey" PRIMARY KEY ("selenium_grid_id", "team_id")
) WITH (oids = false);

CREATE SEQUENCE checkstyle_rules_configuration_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 15 CACHE 1;
CREATE TABLE "checkstyle_rules_configuration" (
    "id" integer DEFAULT nextval('checkstyle_rules_configuration_id_seq') NOT NULL,
    "name" character varying(50) NOT NULL,
    "description" character varying(255),
    "content" text,
    CONSTRAINT "checkstyle_rules_configuration_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE bpm_config_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 15 CACHE 1;
CREATE TABLE "bpm_config" (
    "id" integer DEFAULT nextval('bpm_config_id_seq') NOT NULL,
    "bpm_version" character varying(30),
    "bpm_config_name" character varying(255) NOT NULL,
    "connected_server_name" character varying(50),
    "rest_uri" character varying(50) NOT NULL,
    "rest_service_user_name" character varying(100),
    "rest_service_user_password" character varying(255),
    "server_host" character varying(100),
    "server_url" character varying(255) NOT NULL,
    "cpe_server_url" character varying(255),
    "cc_server_url" character varying(255),
    "app_server_url" character varying(255),
    "soap_port" character varying(30),
    "server_type" character varying(20) NOT NULL,
    "was_admin_user_name" character varying(100),
    "was_admin_user_password" character varying(255),
    "ssh_user" character varying(100),
    "ssh_key" text,
    "was_admin_command" character varying(1024),
    "systemid" character varying(64),
    "organization_id" bigint,
    "bpm_doc" text,
    "ops_doc" text,
	"auth_command" character varying(255),
	"auth_method" character varying(50),
	CONSTRAINT "bpm_config_unique" UNIQUE ("bpm_config_name"),
    CONSTRAINT "bpm_config_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE process_app_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "process_app" (
    "id" integer DEFAULT nextval('process_app_id_seq') NOT NULL,
    "app_id" character varying(255) NOT NULL,
    "process_app_name" character varying(255) NOT NULL,
    "short_name" character varying(255) NOT NULL,
    "is_toolkit" boolean NOT NULL,
    "bpm_configuration_id" bigint,
    CONSTRAINT "process_app_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "teams_processapps" (
    "process_app_id" bigint NOT NULL,
    "team_id" bigint NOT NULL,
    CONSTRAINT "teams_processapps_pkey" PRIMARY KEY ("process_app_id", "team_id")
) WITH (oids = false);

CREATE TABLE "teams_bpmservers" (
    "bpm_server_id" bigint NOT NULL,
    "team_id" bigint NOT NULL,
    CONSTRAINT "teams_bpmservers_pkey" PRIMARY KEY ("bpm_server_id", "team_id")
) WITH (oids = false);

CREATE SEQUENCE custom_recorder_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "custom_recorder" (
    "id" integer DEFAULT nextval('custom_recorder_id_seq') NOT NULL,
    "record_script" text,
    "util_script" text,
    "organization_id" bigint,
    CONSTRAINT "custom_recorder_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE testing_configuration_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "testing_configuration" (
    "id" integer DEFAULT nextval('testing_configuration_id_seq') NOT NULL,
    "selenium_gird_config_id" bigint NOT NULL,
    CONSTRAINT "testing_configuration_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE bpm_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 25 CACHE 1;
CREATE TABLE "bpm_user" (
    "id" integer DEFAULT nextval('bpm_user_id_seq') NOT NULL,
    "bpm_display_name" character varying(255) NOT NULL,
    "is_rest_user" boolean,
    "bpm_role" character varying(255),
    "is_ums_admin_user" boolean,
    "bpm_user_name" character varying(100) NOT NULL,
    "bpm_user_password" character varying(255) NOT NULL,
    "bpm_configuration_id" bigint,
    "selenium_grid_configuration_id" bigint,
    CONSTRAINT "bpm_user_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "unq_bpm_user_0" UNIQUE ("bpm_user_name", "bpm_configuration_id"),
    CONSTRAINT "unq_bpm_user_1" UNIQUE ("bpm_display_name", "bpm_configuration_id")
) WITH (oids = false);

CREATE SEQUENCE case_object_store_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 8 CACHE 1;
CREATE TABLE "case_object_store" (
    "id" integer DEFAULT nextval('case_object_store_id_seq') NOT NULL,
    "connection_point" character varying(100) NOT NULL,
    "design_object_store" character varying(100) NOT NULL,
    "display_name" character varying(255) NOT NULL,
    "target_environment_name" character varying(255),
    "target_object_store" character varying(100) NOT NULL,
    "bpm_configuration_id" bigint,
    CONSTRAINT "case_object_store_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "unq_case_object_store_0" UNIQUE ("display_name", "bpm_configuration_id")
) WITH (oids = false);

CREATE SEQUENCE project_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "project" (
    "id" integer DEFAULT nextval('project_id_seq') NOT NULL,
    "active" boolean,
    "description" text,
    "name" character varying(100) NOT NULL,
    "process_app_data_xml" text,
    "owner_id" bigint,
    "team_id" bigint,
    "bpm_user_id" bigint,
    "testing_config_id" bigint,
    "app_id" character varying(100),
    "app_name" character varying(100),
    "app_short_name" character varying(20),
    "branch_id" character varying(100),
    "branch_name" character varying(100),
    "snapshot_id" character varying(100),
    "snapshot_name" character varying(100),
    "tip" boolean,
    "toolkit" boolean,
    "creation_date" timestamp,
    "update_date" timestamp,
    "updater_id" bigint,
    "engine_properties" character varying(255),
    "case_object_store_id" bigint,
    CONSTRAINT "project_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "users_projects" (
    "user_id" bigint NOT NULL,
    "project_id" bigint NOT NULL,
    CONSTRAINT "users_projects_pkey" PRIMARY KEY ("user_id", "project_id")
) WITH (oids = false);

CREATE SEQUENCE test_suite_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "test_suite" (
    "id" integer DEFAULT nextval('test_suite_id_seq') NOT NULL,
    "test_suit_name" character varying(100) NOT NULL,
    "test_suit_type" character varying(100) NOT NULL,
    "project_id" bigint,
    CONSTRAINT "test_suite_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE external_test_data_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "external_test_data" (
    "id" integer DEFAULT nextval('external_test_data_id_seq') NOT NULL,
    "file_content" text,
    "file_name" character varying(100) NOT NULL,
    "file_type" character varying(255),
    "project_id" bigint,
    CONSTRAINT "external_test_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE performance_test_data_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "performance_test_data" (
    "id" integer DEFAULT nextval('performance_test_data_id_seq') NOT NULL,
    "network_information" text,
    "report_path" character varying(255),
    "strategy_information" character varying(255),
    "update_date" timestamp,
    "version" integer NOT NULL,
    CONSTRAINT "performance_test_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE test_case_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "test_case" (
    "id" integer DEFAULT nextval('test_case_id_seq') NOT NULL,
    "case_name" character varying(100) NOT NULL,
    "case_type" character varying(10) NOT NULL,
    "case_description" character varying(4000),
    "creation_date" timestamp,
    "exec_status" character varying(20),
    "exec_error_message" text,
    "case_flow" text,
    "process_name" character varying(100),
    "process_type" character varying(30),
    "update_date" timestamp,
    "creator_id" bigint,
    "project_id" bigint,
    "test_suite_id" bigint,
    "updater_id" bigint,
    "editor_id" bigint,
    "executor_id" bigint,
    "external_test_data_id" bigint,
    "locker" character varying(100),
    "case_labels" text,
    "performance_test_data_id" bigint,
    CONSTRAINT "test_case_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "project_bpm_configs" (
    "project_id" bigint NOT NULL,
    "bpm_configs_id" bigint NOT NULL,
    CONSTRAINT "project_bpm_configs_pkey" PRIMARY KEY ("project_id", "bpm_configs_id")
) WITH (oids = false);

CREATE TABLE "project_collaborators" (
    "project_id" bigint NOT NULL,
    "collaborators_id" bigint NOT NULL,
    CONSTRAINT "project_collaborators_pkey" PRIMARY KEY ("project_id", "collaborators_id")
) WITH (oids = false);

CREATE SEQUENCE category_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 9 CACHE 1;
CREATE TABLE "category" (
    "id" integer DEFAULT nextval('category_id_seq') NOT NULL,
    "category_type" character varying(20) NOT NULL,
    "creation_date" timestamp,
    "description" character varying(255),
    "name" character varying(30) NOT NULL,
    "sort" integer,
    "update_date" timestamp,
    "parent" bigint,
    CONSTRAINT "category_name_key" UNIQUE ("name"),
    CONSTRAINT "category_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE command_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 98 CACHE 1;
CREATE TABLE "command" (
    "id" integer DEFAULT nextval('command_id_seq') NOT NULL,
    "creation_date" timestamp,
    "description" character varying(1024),
    "name" character varying(100) NOT NULL,
    "update_date" timestamp,
    "verbalization" character varying(255),
    "category_id" bigint,
    "creator_id" bigint,
    "updater_id" bigint,
    "project_id" bigint,
    "takescreenshot" boolean NOT NULL,
    "execution_type" character varying(20),
    "class_name" character varying(1024),
    "jar_file" character varying(100),
    "doc_link" character varying(255),
    "script" text,
    CONSTRAINT "command_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "unq_command_0" UNIQUE ("name", "category_id", "project_id")
) WITH (oids = false);

CREATE SEQUENCE case_step_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "case_step" (
    "id" integer DEFAULT nextval('case_step_id_seq') NOT NULL,
    "case_data" text,
    "comment_val" character varying(512),
    "description" text,
    "case_step_index" integer,
    "parameters" text,
    "script" text,
    "test_result" text,
    "bpm_user_id" bigint,
    "command_id" bigint,
    "group_command_id" bigint,
    "test_case_id" bigint,
    "post_script_toggle" boolean,
    "condition_id" bigint,
    "disabled" boolean,
    CONSTRAINT "case_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE test_case_history_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "test_case_history" (
    "id" integer DEFAULT nextval('test_case_history_id_seq') NOT NULL,
    "binary_content" bytea,
    "comment_val" character varying(512),
    "content" text,
    "creation_date" timestamp NOT NULL,
    "version" integer NOT NULL,
    "creator_id" bigint,
    "test_case_id" bigint,
    "change_reason" character varying(255),
    CONSTRAINT "test_case_history_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE command_parameter_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 284 CACHE 1;
CREATE TABLE "command_parameter" (
    "id" integer DEFAULT nextval('command_parameter_id_seq') NOT NULL,
    "checked" character varying(30),
    "creation_date" timestamp,
    "display_name" character varying(255) NOT NULL,
    "hidden" character varying(30),
    "parameter_name" character varying(100) NOT NULL,
    "param_regexp" character varying(255),
    "param_source" character varying(255),
    "title" character varying(255),
    "parameter_type" character varying(30) NOT NULL,
    "unchecked" character varying(30),
    "update_date" timestamp,
    "command_id" bigint,
    CONSTRAINT "command_parameter_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "unq_command_parameter_0" UNIQUE ("parameter_name", "command_id")
) WITH (oids = false);

CREATE SEQUENCE test_result_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "test_result" (
    "id" integer DEFAULT nextval('test_result_id_seq') NOT NULL,
    "build_id" bigint,
    "duration" character varying(10),
    "end_date" timestamp,
    "environment" character varying(50),
    "exec_status" character varying(10),
    "fail_number" integer,
    "folder" character varying(255),
    "logs_path" character varying(255),
    "process_app_name" character varying(100),
    "project_id" bigint,
    "server_url" character varying(100),
    "snapshot_name" character varying(100),
    "start_date" timestamp,
    "success_number" integer,
    "success_rate" character varying(10),
    "tip" boolean NOT NULL,
    "total" integer,
    CONSTRAINT "test_result_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE test_suite_info_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "test_suite_info" (
    "id" integer DEFAULT nextval('test_suite_info_id_seq') NOT NULL,
    "duration" character varying(10),
    "exec_status" character varying(10),
    "fail_number" integer,
    "suite_name" character varying(100),
    "success_number" integer,
    "success_rate" character varying(10),
    "total" integer,
    "test_result_id" bigint,
    CONSTRAINT "test_suite_info_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE case_solution_data_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "case_solution_data" (
    "id" integer DEFAULT nextval('case_solution_data_id_seq') NOT NULL,
    "case_folder_id" character varying(100),
    "case_identifier" character varying(100),
    "case_title_property" character varying(100),
    "case_type" character varying(100),
    "description" text,
    "display_name" character varying(100),
    "properties" text,
    "state" character varying(30),
    "case_object_store_id" bigint,
    CONSTRAINT "case_solution_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE case_activity_data_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "case_activity_data" (
    "id" integer DEFAULT nextval('case_activity_data_id_seq') NOT NULL,
    "disabled_state" character varying(30),
    "launch_mode" character varying(30),
    "name" character varying(255),
    "process_instance_id" character varying(100),
    "properties" text,
    "required_state" character varying(30),
    "roster_name" character varying(255),
    "state" character varying(30),
    "task_id" character varying(100),
    "task_type" character varying(30),
    "case_solution_data_id" bigint,
    CONSTRAINT "case_activity_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE test_case_info_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "test_case_info" (
    "id" integer DEFAULT nextval('test_case_info_id_seq') NOT NULL,
    "actual_lines_xml" text,
    "browser" character varying(100),
    "case_type" character varying(20),
    "dataset_content" text,
    "dataset_name" character varying(200),
    "duration" character varying(10),
    "end_date" timestamp,
    "exec_status" character varying(10),
    "case_name" character varying(512),
    "start_date" timestamp,
    "test_case_id" bigint,
    "case_solution_data_id" bigint,
    "test_suite_info_id" bigint,
    CONSTRAINT "test_case_info_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE test_step_info_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "test_step_info" (
    "id" integer DEFAULT nextval('test_step_info_id_seq') NOT NULL,
    "test_step_id" bigint,
    "category" character varying(30),
    "command" character varying(100),
    "comment_val" character varying(512),
    "condition_id" bigint,
    "cropped_img_compare_result" character varying(255),
    "description" text,
    "disabled" boolean,
    "exception_trace" text,
    "exec_status" character varying(10),
    "expected_image_path" character varying(255),
    "full_index" character varying(30),
    "test_step_index" integer,
    "is_group_command_step" boolean,
    "test_step_name" character varying(100),
    "parameters" text,
    "test_step_parent" bigint,
    "parent_index" character varying(30),
    "screenshot_path" character varying(255),
    "test_case_info_id" bigint,
    "duration" character varying(10),
    "test_result" text,
    CONSTRAINT "test_step_info_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE artifact_data_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "artifact_data" (
    "id" integer DEFAULT nextval('artifact_data_id_seq') NOT NULL,
    "artifact_type" character varying(20),
    "artifact_id" character varying(50),
    "artifact_data" text,
    "duration" character varying(30),
    "end_date" timestamp,
    "error" text,
    "artifact_input" text,
    "data_name" character varying(255),
    "start_date" timestamp,
    CONSTRAINT "artifact_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE svg_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "svg" (
    "id" integer DEFAULT nextval('svg_id_seq') NOT NULL,
    "content" text,
    "svg_name" character varying(255),
    "svg_type" character varying(50),
    "artifact_data_id" bigint,
    "unique_parent_node_name" character varying(255),
    "instance_id" character varying(50),
    CONSTRAINT "svg_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "process_instance_data" (
    "id" bigint NOT NULL,
    "test_case_info_id" bigint,
    CONSTRAINT "process_instance_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE human_task_data_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "human_task_data" (
    "id" integer DEFAULT nextval('human_task_data_id_seq') NOT NULL,
    "human_task_data" text,
    "duration" character varying(30),
    "task_name" character varying(255),
    "task_type" character varying(50),
    "process_instance_data_id" bigint,
    "task_index" integer,
    CONSTRAINT "human_task_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "rest_api_data" (
    "id" bigint NOT NULL,
    "test_case_info_id" bigint,
    CONSTRAINT "rest_api_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "service_data" (
    "id" bigint NOT NULL,
    "test_case_info_id" bigint,
    CONSTRAINT "service_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE pipeline_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "pipeline" (
    "id" integer DEFAULT nextval('pipeline_id_seq') NOT NULL,
    "active" boolean NOT NULL,
    "creation_date" timestamp,
    "error_script" text,
    "last_trigger_by_snapshot_time" timestamp,
    "name" character varying(100) NOT NULL,
    "post_script" text,
    "recipients" character varying(255),
    "schedule_time" character varying(10),
    "schedule_type" character varying(30),
    "trigger_by_snapshot" boolean,
    "trigger_by_time" boolean,
    "schedule_start_time" timestamp,
    "schedule_end_time" timestamp,
    "update_date" timestamp,
    "creator_id" bigint,
    "team_id" bigint,
    "updater_id" bigint,
    CONSTRAINT "pipeline_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE pipeline_template_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 5 CACHE 1;
CREATE TABLE "pipeline_template" (
    "id" integer DEFAULT nextval('pipeline_template_id_seq') NOT NULL,
    "code" character varying(50),
    "content" text,
    "image" text,
    "name" character varying(255),
    CONSTRAINT "pipeline_template_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "users_pipelines" (
    "user_id" bigint NOT NULL,
    "pipeline_id" bigint NOT NULL,
    CONSTRAINT "users_pipelines_pkey" PRIMARY KEY ("user_id", "pipeline_id")
) WITH (oids = false);

CREATE SEQUENCE stage_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "stage" (
    "id" integer DEFAULT nextval('stage_id_seq') NOT NULL,
    "branch_id" character varying(50),
    "stage_index" integer,
    "name" character varying(100) NOT NULL,
    "process_app_id" character varying(50),
    "snapshot_id" character varying(50),
    "toolkit" boolean,
    "stage_type" character varying(10) NOT NULL,
    "bpm_configuration_id" bigint,
    "pipeline_id" bigint,
    "subpipeline_id" bigint,
    "approval_required" boolean,
    CONSTRAINT "stage_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "pipeline_stage_approvers" (
    "stage_id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    CONSTRAINT "pipeline_stage_approvers_pkey" PRIMARY KEY ("stage_id", "user_id")
) WITH (oids = false);

CREATE SEQUENCE pipeline_step_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "pipeline_step" (
    "id" integer DEFAULT nextval('pipeline_step_id_seq') NOT NULL,
    "step_type" character varying(20),
    "active" boolean NOT NULL,
    "pipeline_step_index" integer,
    "name" character varying(100) NOT NULL,
    "stage_id" bigint,
    "halt_on_failure" boolean NOT NULL DEFAULT TRUE,
    CONSTRAINT "pipeline_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "test_step" (
    "id" bigint NOT NULL,
    "exclude_test_cases" boolean NOT NULL,
    "is_tip" boolean NOT NULL,
    "selected_selenium_hub_ids" character varying(1024),
    "selected_test_case_ids" character varying(1024),
    "selected_test_case_labels" character varying(1024),
    "project_id" bigint,
    CONSTRAINT "test_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "snapshot_step" (
    "id" bigint NOT NULL,
    "naming_convention" character varying(100) NOT NULL,
    CONSTRAINT "snapshot_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "update_dependency_step" (
    "id" bigint NOT NULL,
    "toolkit_id" character varying(50) NOT NULL,
    CONSTRAINT "update_dependency_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "checkstyle_step" (
    "id" bigint NOT NULL,
    "halt_on_failure" boolean NOT NULL,
    "health_score_threshold" integer NOT NULL,
    "ignore_doc_check" boolean NOT NULL,
    "ignore_js_check" boolean NOT NULL,
    "ignore_toolkits_check" boolean NOT NULL,
    "is_tip" boolean NOT NULL,
    "warnings_threshold" integer NOT NULL,
    CONSTRAINT "checkstyle_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "deployment_step" (
    "id" bigint NOT NULL,
    "clean_old_snapshots" boolean NOT NULL,
    "deploy_from_local_file_system" boolean,
    "ignore_validation_error" boolean NOT NULL,
    "migrate_instances" boolean NOT NULL,
    "custom_policy" boolean NOT NULL,
    "offline_install" boolean NOT NULL,
    "sync_envs" boolean NOT NULL,
    "sync_epvs" boolean NOT NULL,
    "sync_teams" boolean NOT NULL,
    "twx_path" character varying(255),
    CONSTRAINT "deployment_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "script_step" (
    "id" bigint NOT NULL,
    "script" text NOT NULL,
    CONSTRAINT "script_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE build_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "build" (
    "id" integer DEFAULT nextval('build_id_seq') NOT NULL,
    "duration" integer,
    "end_date" timestamp,
    "exception_trace" text,
    "name" character varying(50) NOT NULL,
    "start_date" timestamp NOT NULL,
    "status" character varying(10),
    "status_description" character varying(1024),
    "triggering_snapshot_acronym" character varying(50),
    "pipeline_id" bigint,
    "trigger_by" bigint,
    "rest_input" text,
    "exec_params" text,
    "post_script" text,
    "error_script" text,
    CONSTRAINT "build_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE SEQUENCE build_stage_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "build_stage" (
    "id" integer DEFAULT nextval('build_stage_id_seq') NOT NULL,
    "branch_id" character varying(50),
    "branch_name" character varying(255),
    "stage_index" integer,
    "build_stage_index" integer,
    "name" character varying(100) NOT NULL,
    "process_app_id" character varying(50),
    "process_app_acronym" character varying(50),
    "bpm_configuration_id" bigint,
    "server_name" character varying(255),
    "snapshot_id" character varying(50),
    "snapshot_acronym" character varying(50),
    "stage_type" character varying(10) NOT NULL,
    "build_id" bigint,
    "subpipeline_id" bigint,
    "status" character varying(10),
    "toolkit" boolean,
    "approval_required" boolean,
    "approver_id" bigint,
    "rejecter_id" bigint,
    "comment_val" character varying(512),
    CONSTRAINT "build_stage_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "pipeline_build_stage_approvers" (
    "build_stage_id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    CONSTRAINT "pipeline_build_stage_approvers_pkey" PRIMARY KEY ("build_stage_id", "user_id")
) WITH (oids = false);

CREATE SEQUENCE build_step_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "build_step" (
    "id" integer DEFAULT nextval('build_step_id_seq') NOT NULL,
    "step_type" character varying(20),
    "duration" integer,
    "end_date" timestamp,
    "exception_trace" text,
    "build_step_index" integer,
    "name" character varying(50),
    "start_date" timestamp,
    "status" character varying(10) NOT NULL,
    "stage_id" bigint,
    "halt_on_failure" boolean NOT NULL DEFAULT TRUE,
    "resumer_id" bigint,
    "comment_val" character varying(512),
    CONSTRAINT "build_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "test_build_step" (
    "id" bigint NOT NULL,
    "test_result_id" bigint,
    "exclude_test_cases" boolean NOT NULL,
    "is_tip" boolean NOT NULL,
    "selected_selenium_hub_ids" character varying(1024),
    "selected_test_case_ids" character varying(1024),
    "selected_test_case_labels" character varying(1024),
    "project_id" bigint,
    CONSTRAINT "test_build_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "snapshot_build_step" (
    "id" bigint NOT NULL,
    "bpm_snapshot_id" character varying(50),
    "bpm_snapshot_name" character varying(255),
    "naming_convention" character varying(100) NOT NULL,
    CONSTRAINT "snapshot_build_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "update_dependency_build_step" (
    "id" bigint NOT NULL,
    "toolkit_id" character varying(50) NOT NULL,
    CONSTRAINT "update_dependency_build_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "checkstyle_build_step" (
    "id" bigint NOT NULL,
    "health_score_threshold" integer NOT NULL,
    "ignore_doc_check" boolean NOT NULL,
    "ignore_js_check" boolean NOT NULL,
    "ignore_toolkits_check" boolean NOT NULL,
    "is_tip" boolean NOT NULL,
    "warnings_threshold" integer NOT NULL,
    "artifacts" integer,
    "report_data" text,
    "report_folder" character varying(255),
    "score" integer,
    "warnings" integer,
    CONSTRAINT "checkstyle_build_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "deployment_build_step" (
    "id" bigint NOT NULL,
    "clean_old_snapshots" boolean NOT NULL,
    "deploy_from_local_file_system" boolean,
    "ignore_validation_error" boolean NOT NULL,
    "migrate_instances" boolean NOT NULL,
    "custom_policy" boolean NOT NULL,
    "offline_install" boolean NOT NULL,
    "sync_envs" boolean NOT NULL,
    "sync_epvs" boolean NOT NULL,
    "sync_teams" boolean NOT NULL,
    "twx_path" character varying(255),
    "install_file_path" character varying(255),
    "migration_policy_file_path" character varying(255),
    "previous_default_snapshot_acronym" character varying(50),
    CONSTRAINT "deployment_build_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "script_build_step" (
    "id" bigint NOT NULL,
    "result" text,
    "script" text,
    CONSTRAINT "script_build_step_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "testing_configuration_multiple_selenium_gird_config" (
    "testing_configuration_id" bigint NOT NULL,
    "multiple_selenium_gird_config_id" bigint NOT NULL,
    CONSTRAINT "testing_configuration_multiple_selenium_gird_config_pkey" PRIMARY KEY ("testing_configuration_id", "multiple_selenium_gird_config_id")
) WITH (oids = false);

CREATE TABLE "settings" (
    "name" character varying(255) NOT NULL,
    "val" text NOT NULL,
    CONSTRAINT "settings_pkey" PRIMARY KEY ("name")
) WITH (oids = false);

CREATE SEQUENCE case_step_image_compare_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "case_step_image_compare" (
    "id" integer DEFAULT nextval('case_step_image_compare_id_seq') NOT NULL,
    "crop_height" character varying(32),
    "crop_origin_x_axis" character varying(32),
    "crop_origin_y_axis" character varying(32),
    "crop_width" character varying(32),
    "enabled" boolean,
    "result_image_path" character varying(255),
    "source_image_path" character varying(255),
    "test_case_id" bigint,
    "case_step_id" bigint,
    CONSTRAINT "case_step_image_compare_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "case_step_image_compare_unique" UNIQUE ("test_case_id","case_step_id")
) WITH (oids = false);

CREATE SEQUENCE pipeline_email_notification_config_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;
CREATE TABLE "pipeline_email_notification_config" (
    "id" integer DEFAULT nextval('pipeline_email_notification_config_id_seq') NOT NULL,
    "enabled" boolean,
    "config_type" character varying(10) NOT NULL,
    "subject" character varying(255) NOT NULL,
    "to_recipients" character varying(1024),
    "cc" character varying(255),
    "bcc" character varying(255),
    "message" text NOT NULL,
    "pipeline_id" bigint,
    CONSTRAINT "pipeline_email_notification_config_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

ALTER TABLE ONLY "bpm_config" ADD CONSTRAINT "fk_bpm_config_organization_id" FOREIGN KEY (organization_id) REFERENCES organization(id) NOT DEFERRABLE;

ALTER TABLE ONLY "bpm_user" ADD CONSTRAINT "fk_bpm_user_bpm_configuration_id" FOREIGN KEY (bpm_configuration_id) REFERENCES bpm_config(id) NOT DEFERRABLE;
ALTER TABLE ONLY "bpm_user" ADD CONSTRAINT "fk_bpm_user_selenium_grid_configuration_id" FOREIGN KEY (selenium_grid_configuration_id) REFERENCES selenium_grid_config(id) NOT DEFERRABLE;

ALTER TABLE ONLY "build" ADD CONSTRAINT "fk_build_pipeline_id" FOREIGN KEY (pipeline_id) REFERENCES pipeline(id) NOT DEFERRABLE;
ALTER TABLE ONLY "build" ADD CONSTRAINT "fk_build_trigger_by" FOREIGN KEY (trigger_by) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "build_stage" ADD CONSTRAINT "fk_build_stage_build_id" FOREIGN KEY (build_id) REFERENCES build(id) NOT DEFERRABLE;
ALTER TABLE ONLY "build_stage" ADD CONSTRAINT "fk_build_stage_subpipeline_id" FOREIGN KEY (subpipeline_id) REFERENCES pipeline(id) NOT DEFERRABLE;
ALTER TABLE ONLY "build_stage" ADD CONSTRAINT "fk_build_stage_bpm_configuration_id" FOREIGN KEY (bpm_configuration_id) REFERENCES bpm_config(id) NOT DEFERRABLE;
ALTER TABLE ONLY "build_stage" ADD CONSTRAINT "fk_build_stage_approver_id" FOREIGN KEY (approver_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "build_stage" ADD CONSTRAINT "fk_build_stage_rejecter_id" FOREIGN KEY (rejecter_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "build_step" ADD CONSTRAINT "fk_build_step_stage_id" FOREIGN KEY (stage_id) REFERENCES build_stage(id) NOT DEFERRABLE;
ALTER TABLE ONLY "build_step" ADD CONSTRAINT "fk_build_step_resumer_id" FOREIGN KEY (resumer_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "case_activity_data" ADD CONSTRAINT "fk_case_activity_data_case_solution_data_id" FOREIGN KEY (case_solution_data_id) REFERENCES case_solution_data(id) NOT DEFERRABLE;

ALTER TABLE ONLY "case_object_store" ADD CONSTRAINT "fk_case_object_store_bpm_configuration_id" FOREIGN KEY (bpm_configuration_id) REFERENCES bpm_config(id) NOT DEFERRABLE;

ALTER TABLE ONLY "case_solution_data" ADD CONSTRAINT "fk_case_solution_data_case_object_store_id" FOREIGN KEY (case_object_store_id) REFERENCES case_object_store(id) NOT DEFERRABLE;

ALTER TABLE ONLY "case_step" ADD CONSTRAINT "fk_case_step_bpm_user_id" FOREIGN KEY (bpm_user_id) REFERENCES bpm_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "case_step" ADD CONSTRAINT "fk_case_step_command_id" FOREIGN KEY (command_id) REFERENCES command(id) NOT DEFERRABLE;
ALTER TABLE ONLY "case_step" ADD CONSTRAINT "fk_case_step_group_command_id" FOREIGN KEY (group_command_id) REFERENCES command(id) NOT DEFERRABLE;
ALTER TABLE ONLY "case_step" ADD CONSTRAINT "fk_case_step_test_case_id" FOREIGN KEY (test_case_id) REFERENCES test_case(id) NOT DEFERRABLE;

ALTER TABLE ONLY "case_step_image_compare" ADD CONSTRAINT "fk_case_step_image_compare_case_step_id" FOREIGN KEY (case_step_id) REFERENCES case_step(id) NOT DEFERRABLE;
ALTER TABLE ONLY "case_step_image_compare" ADD CONSTRAINT "fk_case_step_image_compare_test_case_id" FOREIGN KEY (test_case_id) REFERENCES test_case(id) NOT DEFERRABLE;

ALTER TABLE ONLY "category" ADD CONSTRAINT "fk_category_parent" FOREIGN KEY (parent) REFERENCES category(id) NOT DEFERRABLE;

ALTER TABLE ONLY "checkstyle_build_step" ADD CONSTRAINT "fk_checkstyle_build_step_id" FOREIGN KEY (id) REFERENCES build_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "checkstyle_step" ADD CONSTRAINT "fk_checkstyle_step_id" FOREIGN KEY (id) REFERENCES pipeline_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "command" ADD CONSTRAINT "fk_command_category_id" FOREIGN KEY (category_id) REFERENCES category(id) NOT DEFERRABLE;
ALTER TABLE ONLY "command" ADD CONSTRAINT "fk_command_creator_id" FOREIGN KEY (creator_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "command" ADD CONSTRAINT "fk_command_project_id" FOREIGN KEY (project_id) REFERENCES project(id) NOT DEFERRABLE;

ALTER TABLE ONLY "command_parameter" ADD CONSTRAINT "fk_command_parameter_command_id" FOREIGN KEY (command_id) REFERENCES command(id) NOT DEFERRABLE;

ALTER TABLE ONLY "custom_recorder" ADD CONSTRAINT "fk_custom_recorder_organization_id" FOREIGN KEY (organization_id) REFERENCES organization(id) NOT DEFERRABLE;

ALTER TABLE ONLY "deployment_build_step" ADD CONSTRAINT "fk_deployment_build_step_id" FOREIGN KEY (id) REFERENCES build_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "deployment_step" ADD CONSTRAINT "fk_deployment_step_id" FOREIGN KEY (id) REFERENCES pipeline_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "external_test_data" ADD CONSTRAINT "fk_external_test_data_project_id" FOREIGN KEY (project_id) REFERENCES project(id) NOT DEFERRABLE;

ALTER TABLE ONLY "human_task_data" ADD CONSTRAINT "fk_human_task_data_process_instance_data_id" FOREIGN KEY (process_instance_data_id) REFERENCES artifact_data(id) NOT DEFERRABLE;

ALTER TABLE ONLY "ida_user" ADD CONSTRAINT "fk_ida_user_organization_id" FOREIGN KEY (organization_id) REFERENCES organization(id) NOT DEFERRABLE;

ALTER TABLE ONLY "pipeline" ADD CONSTRAINT "fk_pipeline_creator_id" FOREIGN KEY (creator_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "pipeline" ADD CONSTRAINT "fk_pipeline_team_id" FOREIGN KEY (team_id) REFERENCES team(id) NOT DEFERRABLE;
ALTER TABLE ONLY "pipeline" ADD CONSTRAINT "fk_pipeline_updater_id" FOREIGN KEY (updater_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "pipeline_step" ADD CONSTRAINT "fk_pipeline_step_stage_id" FOREIGN KEY (stage_id) REFERENCES stage(id) NOT DEFERRABLE;

ALTER TABLE ONLY "process_app" ADD CONSTRAINT "fk_process_app_bpm_configuration_id" FOREIGN KEY (bpm_configuration_id) REFERENCES bpm_config(id) NOT DEFERRABLE;

ALTER TABLE ONLY "process_instance_data" ADD CONSTRAINT "fk_process_instance_data_id" FOREIGN KEY (id) REFERENCES artifact_data(id) NOT DEFERRABLE;
ALTER TABLE ONLY "process_instance_data" ADD CONSTRAINT "fk_process_instance_data_test_case_info_id" FOREIGN KEY (test_case_info_id) REFERENCES test_case_info(id) NOT DEFERRABLE;

ALTER TABLE ONLY "project" ADD CONSTRAINT "fk_project_bpm_user_id" FOREIGN KEY (bpm_user_id) REFERENCES bpm_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "project" ADD CONSTRAINT "fk_project_case_object_store_id" FOREIGN KEY (case_object_store_id) REFERENCES case_object_store(id) NOT DEFERRABLE;
ALTER TABLE ONLY "project" ADD CONSTRAINT "fk_project_owner_id" FOREIGN KEY (owner_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "project" ADD CONSTRAINT "fk_project_team_id" FOREIGN KEY (team_id) REFERENCES team(id) NOT DEFERRABLE;
ALTER TABLE ONLY "project" ADD CONSTRAINT "fk_project_testing_config_id" FOREIGN KEY (testing_config_id) REFERENCES testing_configuration(id) NOT DEFERRABLE;
ALTER TABLE ONLY "project" ADD CONSTRAINT "fk_project_updater_id" FOREIGN KEY (updater_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "project_bpm_configs" ADD CONSTRAINT "fk_project_bpm_configs_bpm_configs_id" FOREIGN KEY (bpm_configs_id) REFERENCES bpm_config(id) NOT DEFERRABLE;
ALTER TABLE ONLY "project_bpm_configs" ADD CONSTRAINT "fk_project_bpm_configs_project_id" FOREIGN KEY (project_id) REFERENCES project(id) NOT DEFERRABLE;

ALTER TABLE ONLY "project_collaborators" ADD CONSTRAINT "fk_project_collaborators_collaborators_id" FOREIGN KEY (collaborators_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "project_collaborators" ADD CONSTRAINT "fk_project_collaborators_project_id" FOREIGN KEY (project_id) REFERENCES project(id) NOT DEFERRABLE;

ALTER TABLE ONLY "rest_api_data" ADD CONSTRAINT "fk_rest_api_data_id" FOREIGN KEY (id) REFERENCES artifact_data(id) NOT DEFERRABLE;
ALTER TABLE ONLY "rest_api_data" ADD CONSTRAINT "fk_rest_api_data_test_case_info_id" FOREIGN KEY (test_case_info_id) REFERENCES test_case_info(id) NOT DEFERRABLE;

ALTER TABLE ONLY "roles_permissions" ADD CONSTRAINT "fk_roles_permissions_permission_id" FOREIGN KEY (permission_id) REFERENCES permission(id) NOT DEFERRABLE;
ALTER TABLE ONLY "roles_permissions" ADD CONSTRAINT "fk_roles_permissions_role_id" FOREIGN KEY (role_id) REFERENCES role(id) NOT DEFERRABLE;

ALTER TABLE ONLY "script_build_step" ADD CONSTRAINT "fk_script_build_step_id" FOREIGN KEY (id) REFERENCES build_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "script_step" ADD CONSTRAINT "fk_script_step_id" FOREIGN KEY (id) REFERENCES pipeline_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "selenium_grid_config" ADD CONSTRAINT "fk_selenium_grid_config_organization_id" FOREIGN KEY (organization_id) REFERENCES organization(id) NOT DEFERRABLE;

ALTER TABLE ONLY "service_data" ADD CONSTRAINT "fk_service_data_id" FOREIGN KEY (id) REFERENCES artifact_data(id) NOT DEFERRABLE;
ALTER TABLE ONLY "service_data" ADD CONSTRAINT "fk_service_data_test_case_info_id" FOREIGN KEY (test_case_info_id) REFERENCES test_case_info(id) NOT DEFERRABLE;

ALTER TABLE ONLY "snapshot_build_step" ADD CONSTRAINT "fk_snapshot_build_step_id" FOREIGN KEY (id) REFERENCES build_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "snapshot_step" ADD CONSTRAINT "fk_snapshot_step_id" FOREIGN KEY (id) REFERENCES pipeline_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "stage" ADD CONSTRAINT "fk_stage_bpm_configuration_id" FOREIGN KEY (bpm_configuration_id) REFERENCES bpm_config(id) NOT DEFERRABLE;
ALTER TABLE ONLY "stage" ADD CONSTRAINT "fk_stage_pipeline_id" FOREIGN KEY (pipeline_id) REFERENCES pipeline(id) NOT DEFERRABLE;
ALTER TABLE ONLY "stage" ADD CONSTRAINT "fk_stage_subpipeline_id" FOREIGN KEY (subpipeline_id) REFERENCES pipeline(id) NOT DEFERRABLE;

ALTER TABLE ONLY "svg" ADD CONSTRAINT "fk_svg_artifact_data_id" FOREIGN KEY (artifact_data_id) REFERENCES artifact_data(id) NOT DEFERRABLE;

ALTER TABLE ONLY "team" ADD CONSTRAINT "fk_team_organization_id" FOREIGN KEY (organization_id) REFERENCES organization(id) NOT DEFERRABLE;

ALTER TABLE ONLY "teams_bpmservers" ADD CONSTRAINT "fk_teams_bpmservers_bpm_server_id" FOREIGN KEY (bpm_server_id) REFERENCES bpm_config(id) NOT DEFERRABLE;
ALTER TABLE ONLY "teams_bpmservers" ADD CONSTRAINT "fk_teams_bpmservers_team_id" FOREIGN KEY (team_id) REFERENCES team(id) NOT DEFERRABLE;

ALTER TABLE ONLY "teams_processapps" ADD CONSTRAINT "fk_teams_processapps_process_app_id" FOREIGN KEY (process_app_id) REFERENCES process_app(id) NOT DEFERRABLE;
ALTER TABLE ONLY "teams_processapps" ADD CONSTRAINT "fk_teams_processapps_team_id" FOREIGN KEY (team_id) REFERENCES team(id) NOT DEFERRABLE;

ALTER TABLE ONLY "teams_seleniumgrids" ADD CONSTRAINT "fk_teams_seleniumgrids_selenium_grid_id" FOREIGN KEY (selenium_grid_id) REFERENCES selenium_grid_config(id) NOT DEFERRABLE;
ALTER TABLE ONLY "teams_seleniumgrids" ADD CONSTRAINT "fk_teams_seleniumgrids_team_id" FOREIGN KEY (team_id) REFERENCES team(id) NOT DEFERRABLE;

ALTER TABLE ONLY "teams_users" ADD CONSTRAINT "fk_teams_users_team_id" FOREIGN KEY (team_id) REFERENCES team(id) NOT DEFERRABLE;
ALTER TABLE ONLY "teams_users" ADD CONSTRAINT "fk_teams_users_user_id" FOREIGN KEY (user_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "test_build_step" ADD CONSTRAINT "fk_test_build_step_id" FOREIGN KEY (id) REFERENCES build_step(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_build_step" ADD CONSTRAINT "fk_test_build_step_test_result_id" FOREIGN KEY (test_result_id) REFERENCES test_result(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_build_step" ADD CONSTRAINT "fk_test_build_step_project_id" FOREIGN KEY (project_id) REFERENCES project(id) NOT DEFERRABLE;

ALTER TABLE ONLY "test_case" ADD CONSTRAINT "fk_test_case_creator_id" FOREIGN KEY (creator_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case" ADD CONSTRAINT "fk_test_case_editor_id" FOREIGN KEY (editor_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case" ADD CONSTRAINT "fk_test_case_executor_id" FOREIGN KEY (executor_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case" ADD CONSTRAINT "fk_test_case_external_test_data_id" FOREIGN KEY (external_test_data_id) REFERENCES external_test_data(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case" ADD CONSTRAINT "fk_test_case_performance_test_data_id" FOREIGN KEY (performance_test_data_id) REFERENCES performance_test_data(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case" ADD CONSTRAINT "fk_test_case_project_id" FOREIGN KEY (project_id) REFERENCES project(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case" ADD CONSTRAINT "fk_test_case_test_suite_id" FOREIGN KEY (test_suite_id) REFERENCES test_suite(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case" ADD CONSTRAINT "fk_test_case_updater_id" FOREIGN KEY (updater_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "test_case_history" ADD CONSTRAINT "fk_test_case_history_creator_id" FOREIGN KEY (creator_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case_history" ADD CONSTRAINT "fk_test_case_history_test_case_id" FOREIGN KEY (test_case_id) REFERENCES test_case(id) NOT DEFERRABLE;

ALTER TABLE ONLY "test_case_info" ADD CONSTRAINT "fk_test_case_info_case_solution_data_id" FOREIGN KEY (case_solution_data_id) REFERENCES case_solution_data(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case_info" ADD CONSTRAINT "fk_test_case_info_test_case_id" FOREIGN KEY (test_case_id) REFERENCES test_case(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_case_info" ADD CONSTRAINT "fk_test_case_info_test_suite_info_id" FOREIGN KEY (test_suite_info_id) REFERENCES test_suite_info(id) NOT DEFERRABLE;

ALTER TABLE ONLY "test_step" ADD CONSTRAINT "fk_test_step_id" FOREIGN KEY (id) REFERENCES pipeline_step(id) NOT DEFERRABLE;
ALTER TABLE ONLY "test_step" ADD CONSTRAINT "fk_test_step_project_id" FOREIGN KEY (project_id) REFERENCES project(id) NOT DEFERRABLE;

ALTER TABLE ONLY "test_step_info" ADD CONSTRAINT "fk_test_step_info_test_case_info_id" FOREIGN KEY (test_case_info_id) REFERENCES test_case_info(id) NOT DEFERRABLE;

ALTER TABLE ONLY "test_suite" ADD CONSTRAINT "fk_test_suite_project_id" FOREIGN KEY (project_id) REFERENCES project(id) NOT DEFERRABLE;

ALTER TABLE ONLY "test_suite_info" ADD CONSTRAINT "fk_test_suite_info_test_result_id" FOREIGN KEY (test_result_id) REFERENCES test_result(id) NOT DEFERRABLE;

ALTER TABLE ONLY "testing_configuration" ADD CONSTRAINT "fk_testing_configuration_selenium_gird_config_id" FOREIGN KEY (selenium_gird_config_id) REFERENCES selenium_grid_config(id) NOT DEFERRABLE;

ALTER TABLE ONLY "testing_configuration_multiple_selenium_gird_config" ADD CONSTRAINT "tstngcnfgrationmultipleseleniumgirdconfigmltplslnumgirdconfigid" FOREIGN KEY (multiple_selenium_gird_config_id) REFERENCES selenium_grid_config(id) NOT DEFERRABLE;
ALTER TABLE ONLY "testing_configuration_multiple_selenium_gird_config" ADD CONSTRAINT "tstngcnfigurationmultipleseleniumgirdconfigtstngconfigurationid" FOREIGN KEY (testing_configuration_id) REFERENCES testing_configuration(id) NOT DEFERRABLE;

ALTER TABLE ONLY "update_dependency_build_step" ADD CONSTRAINT "fk_update_dependency_build_step_id" FOREIGN KEY (id) REFERENCES build_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "update_dependency_step" ADD CONSTRAINT "fk_update_dependency_step_id" FOREIGN KEY (id) REFERENCES pipeline_step(id) NOT DEFERRABLE;

ALTER TABLE ONLY "user_settings" ADD CONSTRAINT "fk_user_settings_user_id" FOREIGN KEY (user_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "users_pipelines" ADD CONSTRAINT "fk_users_pipelines_pipeline_id" FOREIGN KEY (pipeline_id) REFERENCES pipeline(id) NOT DEFERRABLE;
ALTER TABLE ONLY "users_pipelines" ADD CONSTRAINT "fk_users_pipelines_user_id" FOREIGN KEY (user_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "users_projects" ADD CONSTRAINT "fk_users_projects_project_id" FOREIGN KEY (project_id) REFERENCES project(id) NOT DEFERRABLE;
ALTER TABLE ONLY "users_projects" ADD CONSTRAINT "fk_users_projects_user_id" FOREIGN KEY (user_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "users_roles" ADD CONSTRAINT "fk_users_roles_role_id" FOREIGN KEY (role_id) REFERENCES role(id) NOT DEFERRABLE;
ALTER TABLE ONLY "users_roles" ADD CONSTRAINT "fk_users_roles_user_id" FOREIGN KEY (user_id) REFERENCES ida_user(id) NOT DEFERRABLE;

ALTER TABLE ONLY "pipeline_stage_approvers" ADD CONSTRAINT "fk_pipeline_stage_approvers_stage_id" FOREIGN KEY (stage_id) REFERENCES stage(id) NOT DEFERRABLE;
ALTER TABLE ONLY "pipeline_stage_approvers" ADD CONSTRAINT "fk_pipeline_stage_approvers_user_id" FOREIGN KEY (user_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "pipeline_build_stage_approvers" ADD CONSTRAINT "fk_pipeline_build_stage_approvers_build_stage_id" FOREIGN KEY (build_stage_id) REFERENCES build_stage(id) NOT DEFERRABLE;
ALTER TABLE ONLY "pipeline_build_stage_approvers" ADD CONSTRAINT "fk_pipeline_build_stage_approvers_user_id" FOREIGN KEY (user_id) REFERENCES ida_user(id) NOT DEFERRABLE;
ALTER TABLE ONLY "pipeline_email_notification_config" ADD CONSTRAINT "fk_email_pipeline_id" FOREIGN KEY (pipeline_id) REFERENCES pipeline(id) NOT DEFERRABLE;

CREATE INDEX BUILD_PIPELINE_ID_IDX ON BUILD (PIPELINE_ID);
CREATE INDEX BUILD_STAGE_BUILD_ID_IDX ON BUILD_STAGE (BUILD_ID);
CREATE INDEX BUILD_STAGE_SUBPIPELINE_ID_IDX ON BUILD_STAGE (SUBPIPELINE_ID);
CREATE INDEX BUILD_STEP_STAGE_ID_IDX ON BUILD_STEP (STAGE_ID);
CREATE INDEX HUMAN_TASK_DATA_PROCESS_INSTANCE_DATA_ID_IDX ON HUMAN_TASK_DATA (PROCESS_INSTANCE_DATA_ID);
CREATE INDEX PROCESS_INSTANCE_DATA_TEST_CASE_INFO_ID_IDX ON PROCESS_INSTANCE_DATA (TEST_CASE_INFO_ID);
CREATE INDEX REST_API_DATA_TEST_CASE_INFO_ID_IDX ON REST_API_DATA (TEST_CASE_INFO_ID);
CREATE INDEX SERVICE_DATA_TEST_CASE_INFO_ID_IDX ON SERVICE_DATA (TEST_CASE_INFO_ID);
CREATE INDEX SVG_ARTIFACT_DATA_ID_IDX ON SVG (ARTIFACT_DATA_ID);
CREATE INDEX TEST_CASE_HISTORY_TEST_CASE_ID_IDX ON TEST_CASE_HISTORY (TEST_CASE_ID);
CREATE INDEX TEST_CASE_INFO_TEST_CASE_ID_IDX ON TEST_CASE_INFO (TEST_CASE_ID);
CREATE INDEX TEST_CASE_INFO_TEST_SUITE_INFO_ID_IDX ON TEST_CASE_INFO (TEST_SUITE_INFO_ID);
CREATE INDEX TEST_STEP_INFO_TEST_CASE_INFO_ID_IDX ON TEST_STEP_INFO (TEST_CASE_INFO_ID);
CREATE INDEX TEST_SUITE_INFO_TEST_RESULT_ID_IDX ON TEST_SUITE_INFO (TEST_RESULT_ID);

CREATE TABLE QRTZ_JOB_DETAILS
(
  SCHED_NAME        VARCHAR(120) NOT NULL,
  JOB_NAME          VARCHAR(200) NOT NULL,
  JOB_GROUP         VARCHAR(200) NOT NULL,
  DESCRIPTION       VARCHAR(250) NULL,
  JOB_CLASS_NAME    VARCHAR(250) NOT NULL,
  IS_DURABLE        BOOL         NOT NULL,
  IS_NONCONCURRENT  BOOL         NOT NULL,
  IS_UPDATE_DATA    BOOL         NOT NULL,
  REQUESTS_RECOVERY BOOL         NOT NULL,
  JOB_DATA          BYTEA        NULL,
  PRIMARY KEY (SCHED_NAME, JOB_NAME, JOB_GROUP)
);

CREATE TABLE QRTZ_TRIGGERS
(
  SCHED_NAME     VARCHAR(120) NOT NULL,
  TRIGGER_NAME   VARCHAR(200) NOT NULL,
  TRIGGER_GROUP  VARCHAR(200) NOT NULL,
  JOB_NAME       VARCHAR(200) NOT NULL,
  JOB_GROUP      VARCHAR(200) NOT NULL,
  DESCRIPTION    VARCHAR(250) NULL,
  NEXT_FIRE_TIME BIGINT       NULL,
  PREV_FIRE_TIME BIGINT       NULL,
  PRIORITY       INTEGER      NULL,
  TRIGGER_STATE  VARCHAR(16)  NOT NULL,
  TRIGGER_TYPE   VARCHAR(8)   NOT NULL,
  START_TIME     BIGINT       NOT NULL,
  END_TIME       BIGINT       NULL,
  CALENDAR_NAME  VARCHAR(200) NULL,
  MISFIRE_INSTR  SMALLINT     NULL,
  JOB_DATA       BYTEA        NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, JOB_NAME, JOB_GROUP)
  REFERENCES QRTZ_JOB_DETAILS (SCHED_NAME, JOB_NAME, JOB_GROUP)
);

CREATE TABLE QRTZ_SIMPLE_TRIGGERS
(
  SCHED_NAME      VARCHAR(120) NOT NULL,
  TRIGGER_NAME    VARCHAR(200) NOT NULL,
  TRIGGER_GROUP   VARCHAR(200) NOT NULL,
  REPEAT_COUNT    BIGINT       NOT NULL,
  REPEAT_INTERVAL BIGINT       NOT NULL,
  TIMES_TRIGGERED BIGINT       NOT NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  REFERENCES QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE QRTZ_CRON_TRIGGERS
(
  SCHED_NAME      VARCHAR(120) NOT NULL,
  TRIGGER_NAME    VARCHAR(200) NOT NULL,
  TRIGGER_GROUP   VARCHAR(200) NOT NULL,
  CRON_EXPRESSION VARCHAR(120) NOT NULL,
  TIME_ZONE_ID    VARCHAR(80),
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  REFERENCES QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE QRTZ_SIMPROP_TRIGGERS
(
  SCHED_NAME    VARCHAR(120)   NOT NULL,
  TRIGGER_NAME  VARCHAR(200)   NOT NULL,
  TRIGGER_GROUP VARCHAR(200)   NOT NULL,
  STR_PROP_1    VARCHAR(512)   NULL,
  STR_PROP_2    VARCHAR(512)   NULL,
  STR_PROP_3    VARCHAR(512)   NULL,
  INT_PROP_1    INT            NULL,
  INT_PROP_2    INT            NULL,
  LONG_PROP_1   BIGINT         NULL,
  LONG_PROP_2   BIGINT         NULL,
  DEC_PROP_1    NUMERIC(13, 4) NULL,
  DEC_PROP_2    NUMERIC(13, 4) NULL,
  BOOL_PROP_1   BOOL           NULL,
  BOOL_PROP_2   BOOL           NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  REFERENCES QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE QRTZ_BLOB_TRIGGERS
(
  SCHED_NAME    VARCHAR(120) NOT NULL,
  TRIGGER_NAME  VARCHAR(200) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  BLOB_DATA     BYTEA        NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  REFERENCES QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE QRTZ_CALENDARS
(
  SCHED_NAME    VARCHAR(120) NOT NULL,
  CALENDAR_NAME VARCHAR(200) NOT NULL,
  CALENDAR      BYTEA        NOT NULL,
  PRIMARY KEY (SCHED_NAME, CALENDAR_NAME)
);


CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS
(
  SCHED_NAME    VARCHAR(120) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_GROUP)
);

CREATE TABLE QRTZ_FIRED_TRIGGERS
(
  SCHED_NAME        VARCHAR(120) NOT NULL,
  ENTRY_ID          VARCHAR(95)  NOT NULL,
  TRIGGER_NAME      VARCHAR(200) NOT NULL,
  TRIGGER_GROUP     VARCHAR(200) NOT NULL,
  INSTANCE_NAME     VARCHAR(200) NOT NULL,
  FIRED_TIME        BIGINT       NOT NULL,
  SCHED_TIME        BIGINT       NOT NULL,
  PRIORITY          INTEGER      NOT NULL,
  STATE             VARCHAR(16)  NOT NULL,
  JOB_NAME          VARCHAR(200) NULL,
  JOB_GROUP         VARCHAR(200) NULL,
  IS_NONCONCURRENT  BOOL         NULL,
  REQUESTS_RECOVERY BOOL         NULL,
  PRIMARY KEY (SCHED_NAME, ENTRY_ID)
);

CREATE TABLE QRTZ_SCHEDULER_STATE
(
  SCHED_NAME        VARCHAR(120) NOT NULL,
  INSTANCE_NAME     VARCHAR(200) NOT NULL,
  LAST_CHECKIN_TIME BIGINT       NOT NULL,
  CHECKIN_INTERVAL  BIGINT       NOT NULL,
  PRIMARY KEY (SCHED_NAME, INSTANCE_NAME)
);

CREATE TABLE QRTZ_LOCKS
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  LOCK_NAME  VARCHAR(40)  NOT NULL,
  PRIMARY KEY (SCHED_NAME, LOCK_NAME)
);

CREATE INDEX IDX_QRTZ_J_REQ_RECOVERY
  ON QRTZ_JOB_DETAILS (SCHED_NAME, REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_J_GRP
  ON QRTZ_JOB_DETAILS (SCHED_NAME, JOB_GROUP);

CREATE INDEX IDX_QRTZ_T_J
  ON QRTZ_TRIGGERS (SCHED_NAME, JOB_NAME, JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_JG
  ON QRTZ_TRIGGERS (SCHED_NAME, JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_C
  ON QRTZ_TRIGGERS (SCHED_NAME, CALENDAR_NAME);
CREATE INDEX IDX_QRTZ_T_G
  ON QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_T_STATE
  ON QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_STATE
  ON QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_G_STATE
  ON QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_GROUP, TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NEXT_FIRE_TIME
  ON QRTZ_TRIGGERS (SCHED_NAME, NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST
  ON QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_STATE, NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_MISFIRE
  ON QRTZ_TRIGGERS (SCHED_NAME, MISFIRE_INSTR, NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE
  ON QRTZ_TRIGGERS (SCHED_NAME, MISFIRE_INSTR, NEXT_FIRE_TIME, TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE_GRP
  ON QRTZ_TRIGGERS (SCHED_NAME, MISFIRE_INSTR, NEXT_FIRE_TIME, TRIGGER_GROUP, TRIGGER_STATE);

CREATE INDEX IDX_QRTZ_FT_TRIG_INST_NAME
  ON QRTZ_FIRED_TRIGGERS (SCHED_NAME, INSTANCE_NAME);
CREATE INDEX IDX_QRTZ_FT_INST_JOB_REQ_RCVRY
  ON QRTZ_FIRED_TRIGGERS (SCHED_NAME, INSTANCE_NAME, REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_FT_J_G
  ON QRTZ_FIRED_TRIGGERS (SCHED_NAME, JOB_NAME, JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_JG
  ON QRTZ_FIRED_TRIGGERS (SCHED_NAME, JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_T_G
  ON QRTZ_FIRED_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_FT_TG
  ON QRTZ_FIRED_TRIGGERS (SCHED_NAME, TRIGGER_GROUP);
  
CREATE INDEX CASE_STEP_TEST_CASE_ID_IDX ON CASE_STEP (TEST_CASE_ID);
CREATE INDEX CASE_STEP_GROUP_COMMAND_ID_IDX ON CASE_STEP (GROUP_COMMAND_ID);
CREATE INDEX CASE_STEP_COMMAND_ID_IDX ON CASE_STEP (COMMAND_ID);
CREATE INDEX CASE_STEP_BPM_USER_ID_IDX ON CASE_STEP (BPM_USER_ID);
CREATE INDEX TEST_CASE_PROJECT_ID_IDX ON TEST_CASE (PROJECT_ID);
