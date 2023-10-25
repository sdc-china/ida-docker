/*init data***/
INSERT INTO organization (company_name, active)
VALUES
('IDA', true);

INSERT INTO role(name)
VALUES
('Admin'),
('User');

INSERT INTO permission (resource_name, operation, description)
VALUES
('Testing', 'T_VIEW', 'View/Export Test Project'),
('Testing', 'T_EDIT','Create/Edit/Synchronize/Delete/Run Test Project'),
('Testing', 'T_CUSTOM','Custom Record/Logging Configuration/Custom Java Command'),
('Checkstyle', 'CS_ALL','View/Run Checkstyle'),
('CodeReview', 'CR_ALL','View/Run CodeReview'),
('OperationsTool', 'OT_SNAPSHOT','View/Run Clean Snapshot'),
('OperationsTool', 'OT_INSTANCE','View/Run Manage Instance'),
('Configuration', 'CONF_BS_VIEW','View/Test BPM Servers'),
('Configuration', 'CONF_BS_EDIT','Create/Edit/Delete BPM Servers'),
('Configuration', 'CONF_BU_ALL','View/Create/Edit/Delete BPM Users'),
('Configuration', 'CONF_USER_ALL','View/Create/Edit/Delete User management'),
('Configuration', 'CONF_SG_ALL','View/Create/Edit/Delete Selenium Grid management'),
('Configuration', 'CONF_TEAM_ALL','View/Create/Edit/Delete Team management'),
('Configuration', 'CONF_CHECKSTYLE_ALL','View/Enable/Disable Checkstyle rules'),
('Configuration', 'CONF_USER_ROLE','Edit user role'),
('Configuration', 'CONF_SSHKEY_ALL','Create/Edit/Delete BPM Config SSH Key'),
('Configuration', 'CONF_LOG_LEVEL','Config logging Trace Level'),
('pipeline', 'P_VIEW','View Pipeline'),
('pipeline', 'P_EDIT','Edit steps except deployment Pipeline'),
('pipeline', 'P_CREATE_DELETE','Create Pipeline/Delete Pipeline'),
('pipeline', 'P_RUN','Run Pipeline'),
('pipeline', 'P_DEPLOY_ALL','Create/Edit/Delete deployment step and all stages'),
('pipeline', 'P_RUN_DEPLOY','Run Deployment Pipeline(with script/snapshot/deployment steps)'),
('pipeline', 'P_MANAGE_TEMPLATE','Create/Delete pipeline template'),
('CleanDiskCache', 'CLEAN_VIEW','View Clean Disk Cache'),
('CleanDiskCache', 'CLEAN_ALL','View/Operation Clean Disk Cache');

INSERT INTO roles_permissions (role_id, permission_id)
VALUES
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'T_VIEW')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'T_EDIT')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'T_CUSTOM')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CS_ALL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CR_ALL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'OT_SNAPSHOT')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'OT_INSTANCE')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CONF_BS_VIEW')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CONF_BS_EDIT')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CONF_BU_ALL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CONF_USER_ALL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CONF_SG_ALL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CONF_TEAM_ALL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CONF_CHECKSTYLE_ALL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CONF_LOG_LEVEL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'P_VIEW')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'P_EDIT')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'P_CREATE_DELETE')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'P_RUN')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'P_RUN_DEPLOY')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'P_DEPLOY_ALL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'P_MANAGE_TEMPLATE')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CLEAN_VIEW')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CLEAN_ALL')),
((SELECT id FROM role where name = 'Admin'), (SELECT id FROM permission where operation = 'CONF_SSHKEY_ALL')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'OT_SNAPSHOT')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'T_VIEW')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'T_EDIT')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'CS_ALL')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'CR_ALL')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'P_VIEW')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'P_EDIT')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'P_CREATE_DELETE')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'P_RUN')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'CONF_BS_VIEW')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'CONF_BU_ALL')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'P_RUN_DEPLOY')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'P_DEPLOY_ALL')),
((SELECT id FROM role where name = 'User'), (SELECT id FROM permission where operation = 'P_MANAGE_TEMPLATE'));