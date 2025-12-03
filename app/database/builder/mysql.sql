CREATE TABLE calendario( 
      `id`  INT  AUTO_INCREMENT    NOT NULL  , 
      `horario_inicial` datetime   NOT NULL  , 
      `horario_final` datetime   NOT NULL  , 
      `titulo` text   , 
      `cor` text   , 
      `observacao` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE customers( 
      `id`  INT  AUTO_INCREMENT    NOT NULL  , 
      `name` varchar  (255)   NOT NULL  , 
      `identifier` varchar  (255)   NOT NULL  , 
      `phone` varchar  (25)   , 
      `deleted_at` datetime   , 
      `created_at` datetime   NOT NULL  , 
      `updated_at` datetime   NOT NULL  , 
      `updated_by` int   , 
      `created_by` int   NOT NULL  , 
      `system_unit_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE reservations( 
      `id`  INT  AUTO_INCREMENT    NOT NULL  , 
      `customer_id` int   NOT NULL  , 
      `status` varchar  (255)   NOT NULL  , 
      `notes` text   NOT NULL  , 
      `reservation_datetime` datetime   NOT NULL  , 
      `deleted_at` datetime   , 
      `created_at` datetime   NOT NULL  , 
      `updated_at` datetime   NOT NULL  , 
      `updated_by` int   , 
      `created_by` int   NOT NULL  , 
      `system_unit_id` int   NOT NULL  , 
      `restaurant_tables_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE restaurant_tables( 
      `id`  INT  AUTO_INCREMENT    NOT NULL  , 
      `name` varchar  (255)   NOT NULL  , 
      `capacity` int   NOT NULL  , 
      `deleted_at` datetime   , 
      `created_at` datetime   NOT NULL  , 
      `updated_at` datetime   NOT NULL  , 
      `indice` int   NOT NULL    DEFAULT 1, 
      `updated_by` int   , 
      `created_by` int   NOT NULL  , 
      `system_unit_id` int   NOT NULL  , 
      `width` int   NOT NULL  , 
      `height` int   NOT NULL  , 
      `params` text   , 
      `status_id` int   NOT NULL    DEFAULT 1, 
      `notes` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE status_table( 
      `id`  INT  AUTO_INCREMENT    NOT NULL  , 
      `name` varchar  (255)   NOT NULL  , 
      `style_class` varchar  (255)   NOT NULL  , 
      `description` text   , 
      `created_at` datetime   , 
      `system_unit_id` int   , 
      `created_by` int   , 
      `updated_by` int   , 
      `deleted_at` datetime   , 
      `updated_at` datetime   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_document( 
      `id` int   NOT NULL  , 
      `category_id` int   NOT NULL  , 
      `system_user_id` int   , 
      `title` text   NOT NULL  , 
      `description` text   , 
      `submission_date` date   , 
      `archive_date` date   , 
      `filename` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_document_category( 
      `id` int   NOT NULL  , 
      `name` text   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_document_group( 
      `id` int   NOT NULL  , 
      `document_id` int   NOT NULL  , 
      `system_group_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_document_user( 
      `id` int   NOT NULL  , 
      `document_id` int   NOT NULL  , 
      `system_user_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_group( 
      `id` int   NOT NULL  , 
      `name` text   NOT NULL  , 
      `uuid` varchar  (36)   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_group_program( 
      `id` int   NOT NULL  , 
      `system_group_id` int   NOT NULL  , 
      `system_program_id` int   NOT NULL  , 
      `actions` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_message( 
      `id` int   NOT NULL  , 
      `system_user_id` int   NOT NULL  , 
      `system_user_to_id` int   NOT NULL  , 
      `subject` text   NOT NULL  , 
      `message` text   , 
      `dt_message` datetime   , 
      `checked` char  (1)   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_notification( 
      `id` int   NOT NULL  , 
      `system_user_id` int   NOT NULL  , 
      `system_user_to_id` int   NOT NULL  , 
      `subject` text   , 
      `message` text   , 
      `dt_message` datetime   , 
      `action_url` text   , 
      `action_label` text   , 
      `icon` text   , 
      `checked` char  (1)   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_preference( 
      `id` varchar  (255)   NOT NULL  , 
      `preference` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_program( 
      `id` int   NOT NULL  , 
      `name` text   NOT NULL  , 
      `controller` text   NOT NULL  , 
      `actions` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_unit( 
      `id` int   NOT NULL  , 
      `name` text   NOT NULL  , 
      `connection_name` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_unit_settings( 
      `id`  INT  AUTO_INCREMENT    NOT NULL  , 
      `created_at` datetime   NOT NULL  , 
      `deleted_at` datetime   , 
      `updated_at` datetime   NOT NULL  , 
      `updated_by` int   , 
      `created_by` int   NOT NULL  , 
      `system_unit_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_user_group( 
      `id` int   NOT NULL  , 
      `system_user_id` int   NOT NULL  , 
      `system_group_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_user_program( 
      `id` int   NOT NULL  , 
      `system_user_id` int   NOT NULL  , 
      `system_program_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_users( 
      `id` int   NOT NULL  , 
      `name` text   NOT NULL  , 
      `login` text   NOT NULL  , 
      `password` text   NOT NULL  , 
      `email` text   , 
      `frontpage_id` int   , 
      `system_unit_id` int   , 
      `active` char  (1)   , 
      `accepted_term_policy_at` text   , 
      `accepted_term_policy` char  (1)   , 
      `two_factor_enabled` char  (1)     DEFAULT 'N', 
      `two_factor_type` varchar  (100)   , 
      `two_factor_secret` varchar  (255)   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE system_user_unit( 
      `id` int   NOT NULL  , 
      `system_user_id` int   NOT NULL  , 
      `system_unit_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE table_reservations( 
      `id`  INT  AUTO_INCREMENT    NOT NULL  , 
      `created_at` datetime   NOT NULL  , 
      `deleted_at` datetime   , 
      `updated_by` int   , 
      `updated_at` datetime   , 
      `system_unit_id` int   NOT NULL  , 
      `created_by` int   NOT NULL  , 
      `table_id` int   NOT NULL  , 
      `reservation_date` date   NOT NULL  , 
      `start_time` time   NOT NULL  , 
      `end_time` time   NOT NULL  , 
      `status` varchar  (255)   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE working_hours( 
      `id`  INT  AUTO_INCREMENT    NOT NULL  , 
      `day_of_week` int   NOT NULL  , 
      `closed_all_day` boolean   NOT NULL    DEFAULT false, 
      `open_hour` int   NOT NULL  , 
      `open_minutes` int   NOT NULL  , 
      `close_hour` int   NOT NULL  , 
      `close_minutes` int   NOT NULL  , 
      `deleted_at` datetime   , 
      `created_at` datetime   NOT NULL  , 
      `updated_at` datetime   NOT NULL  , 
      `updated_by` int   , 
      `created_by` int   NOT NULL  , 
      `system_unit_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE working_hours_clone_10179168ca2cf32822d( 
      `id`  INT  AUTO_INCREMENT    NOT NULL  , 
      `deleted_at` datetime   , 
      `created_at` datetime   NOT NULL  , 
      `updated_at` datetime   NOT NULL  , 
      `updated_by` int   , 
      `created_by` int   NOT NULL  , 
      `system_unit_id` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

 
 ALTER TABLE working_hours ADD UNIQUE (system_unit_id);
  
 ALTER TABLE customers ADD CONSTRAINT fk_customers_1 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE customers ADD CONSTRAINT fk_customers_2 FOREIGN KEY (updated_by) references system_users(id); 
ALTER TABLE customers ADD CONSTRAINT fk_customers_3 FOREIGN KEY (created_by) references system_users(id); 
ALTER TABLE reservations ADD CONSTRAINT fk_reservations_1 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE reservations ADD CONSTRAINT fk_reservations_2 FOREIGN KEY (created_by) references system_users(id); 
ALTER TABLE reservations ADD CONSTRAINT fk_reservations_3 FOREIGN KEY (updated_by) references system_users(id); 
ALTER TABLE reservations ADD CONSTRAINT fk_reservations_4 FOREIGN KEY (customer_id) references customers(id); 
ALTER TABLE reservations ADD CONSTRAINT fk_reservations_5 FOREIGN KEY (restaurant_tables_id) references restaurant_tables(id); 
ALTER TABLE restaurant_tables ADD CONSTRAINT fk_restaurant_tables_4 FOREIGN KEY (status_id) references status_table(id); 
ALTER TABLE restaurant_tables ADD CONSTRAINT fk_restaurant_tables_1 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE restaurant_tables ADD CONSTRAINT fk_restaurant_tables_2 FOREIGN KEY (created_by) references system_users(id); 
ALTER TABLE restaurant_tables ADD CONSTRAINT fk_restaurant_tables_3 FOREIGN KEY (updated_by) references system_users(id); 
ALTER TABLE system_document ADD CONSTRAINT fk_system_document_2 FOREIGN KEY (category_id) references system_document_category(id); 
ALTER TABLE system_document_group ADD CONSTRAINT fk_system_document_group_2 FOREIGN KEY (document_id) references system_document(id); 
ALTER TABLE system_document_user ADD CONSTRAINT fk_system_document_user_2 FOREIGN KEY (document_id) references system_document(id); 
ALTER TABLE system_group_program ADD CONSTRAINT fk_system_group_program_1 FOREIGN KEY (system_program_id) references system_program(id); 
ALTER TABLE system_group_program ADD CONSTRAINT fk_system_group_program_2 FOREIGN KEY (system_group_id) references system_group(id); 
ALTER TABLE system_unit_settings ADD CONSTRAINT fk_system_unit_settings_1 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE system_unit_settings ADD CONSTRAINT fk_system_unit_settings_2 FOREIGN KEY (created_by) references system_users(id); 
ALTER TABLE system_unit_settings ADD CONSTRAINT fk_system_unit_settings_3 FOREIGN KEY (updated_by) references system_users(id); 
ALTER TABLE system_user_group ADD CONSTRAINT fk_system_user_group_1 FOREIGN KEY (system_group_id) references system_group(id); 
ALTER TABLE system_user_group ADD CONSTRAINT fk_system_user_group_2 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_user_program ADD CONSTRAINT fk_system_user_program_1 FOREIGN KEY (system_program_id) references system_program(id); 
ALTER TABLE system_user_program ADD CONSTRAINT fk_system_user_program_2 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_users ADD CONSTRAINT fk_system_user_1 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE system_users ADD CONSTRAINT fk_system_user_2 FOREIGN KEY (frontpage_id) references system_program(id); 
ALTER TABLE system_user_unit ADD CONSTRAINT fk_system_user_unit_1 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_user_unit ADD CONSTRAINT fk_system_user_unit_2 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE table_reservations ADD CONSTRAINT fk_table_reservations_1 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE table_reservations ADD CONSTRAINT fk_table_reservations_2 FOREIGN KEY (created_by) references system_users(id); 
ALTER TABLE table_reservations ADD CONSTRAINT fk_table_reservations_3 FOREIGN KEY (updated_by) references system_users(id); 
ALTER TABLE table_reservations ADD CONSTRAINT fk_table_reservations_4 FOREIGN KEY (table_id) references restaurant_tables(id); 
ALTER TABLE working_hours ADD CONSTRAINT fk_working_hours_1 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE working_hours ADD CONSTRAINT fk_working_hours_2 FOREIGN KEY (created_by) references system_users(id); 
ALTER TABLE working_hours ADD CONSTRAINT fk_working_hours_3 FOREIGN KEY (updated_by) references system_users(id); 
ALTER TABLE working_hours_clone_10179168ca2cf32822d ADD CONSTRAINT fk_working_hours_3_10179168ca2c662820f FOREIGN KEY (updated_by) references system_users(id); 
ALTER TABLE working_hours_clone_10179168ca2cf32822d ADD CONSTRAINT fk_working_hours_2_10179168ca2c662820f FOREIGN KEY (created_by) references system_users(id); 
ALTER TABLE working_hours_clone_10179168ca2cf32822d ADD CONSTRAINT fk_working_hours_1_10179168ca2c662820f FOREIGN KEY (system_unit_id) references system_unit(id); 
INSERT INTO status_table (id,name,style_class,description,created_at,system_unit_id,created_by,updated_by,deleted_at,updated_at) VALUES (1,'Disponível','badge-success','',null,null,null,null,null,null); 

INSERT INTO status_table (id,name,style_class,description,created_at,system_unit_id,created_by,updated_by,deleted_at,updated_at) VALUES (2,'Ocupado','badge-warning','',null,null,null,null,null,null); 

INSERT INTO status_table (id,name,style_class,description,created_at,system_unit_id,created_by,updated_by,deleted_at,updated_at) VALUES (3,'Reservado','badge-info','',null,null,null,null,null,null); 

INSERT INTO status_table (id,name,style_class,description,created_at,system_unit_id,created_by,updated_by,deleted_at,updated_at) VALUES (4,'Limpeza','badge-secondary','',null,null,null,null,null,null); 

INSERT INTO status_table (id,name,style_class,description,created_at,system_unit_id,created_by,updated_by,deleted_at,updated_at) VALUES (5,'Disabilitado','badge-danger','',null,null,null,null,null,null); 

INSERT INTO system_group (id,name,uuid) VALUES (1,'Admin',''); 

INSERT INTO system_group (id,name,uuid) VALUES (2,'Standard',''); 

INSERT INTO system_group (id,name,uuid) VALUES (3,'BChat Interno',''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (1,1,1,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (2,1,2,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (3,1,3,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (4,1,4,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (5,1,5,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (6,1,6,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (7,1,8,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (8,1,9,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (9,1,11,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (10,1,14,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (11,1,15,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (12,2,10,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (13,2,12,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (14,2,13,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (15,2,16,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (16,2,17,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (17,2,18,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (18,2,19,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (19,2,20,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (20,1,21,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (21,2,22,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (22,2,23,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (23,2,24,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (24,2,25,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (25,1,26,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (26,1,27,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (27,1,28,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (28,1,29,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (29,2,30,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (30,1,31,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (31,1,32,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (32,1,33,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (33,1,34,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (34,1,35,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (35,1,36,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (36,1,37,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (37,1,38,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (38,1,39,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (39,1,40,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (40,1,41,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (41,1,42,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (42,1,46,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (43,1,47,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (44,3,43,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (45,3,44,''); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (46,3,45,''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (1,'System Group Form','SystemGroupForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (2,'System Group List','SystemGroupList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (3,'System Program Form','SystemProgramForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (4,'System Program List','SystemProgramList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (5,'System User Form','SystemUserForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (6,'System User List','SystemUserList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (7,'Common Page','CommonPage',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (8,'System PHP Info','SystemPHPInfoView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (9,'System ChangeLog View','SystemChangeLogView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (10,'Welcome View','WelcomeView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (11,'System Sql Log','SystemSqlLogList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (12,'System Profile View','SystemProfileView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (13,'System Profile Form','SystemProfileForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (14,'System SQL Panel','SystemSQLPanel',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (15,'System Access Log','SystemAccessLogList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (16,'System Message Form','SystemMessageForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (17,'System Message List','SystemMessageList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (18,'System Message Form View','SystemMessageFormView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (19,'System Notification List','SystemNotificationList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (20,'System Notification Form View','SystemNotificationFormView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (21,'System Document Category List','SystemDocumentCategoryFormList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (22,'System Document Form','SystemDocumentForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (23,'System Document Upload Form','SystemDocumentUploadForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (24,'System Document List','SystemDocumentList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (25,'System Shared Document List','SystemSharedDocumentList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (26,'System Unit Form','SystemUnitForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (27,'System Unit List','SystemUnitList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (28,'System Access stats','SystemAccessLogStats',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (29,'System Preference form','SystemPreferenceForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (30,'System Support form','SystemSupportForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (31,'System PHP Error','SystemPHPErrorLogView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (32,'System Database Browser','SystemDatabaseExplorer',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (33,'System Table List','SystemTableList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (34,'System Data Browser','SystemDataBrowser',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (35,'System Menu Editor','SystemMenuEditor',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (36,'System Request Log','SystemRequestLogList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (37,'System Request Log View','SystemRequestLogView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (38,'System Administration Dashboard','SystemAdministrationDashboard',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (39,'System Log Dashboard','SystemLogDashboard',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (40,'System Session dump','SystemSessionDumpView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (41,'Files diff','SystemFilesDiff',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (42,'System Information','SystemInformationView',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (43,'Form to add user to chat group','SystemAddUserGroupForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (44,'Form to start a chat','SystemNewChatForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (45,'Form to start a group chat','SystemNewChatGroupForm',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (46,'System monitor online users list','SystemUserMonitorHeaderList',''); 

INSERT INTO system_program (id,name,controller,actions) VALUES (47,'System Data Import','SystemDataImportForm',''); 

INSERT INTO system_unit (id,name,connection_name) VALUES (1,'Matriz','matriz'); 

INSERT INTO system_user_group (id,system_user_id,system_group_id) VALUES (1,1,1); 

INSERT INTO system_user_group (id,system_user_id,system_group_id) VALUES (2,2,2); 

INSERT INTO system_user_group (id,system_user_id,system_group_id) VALUES (3,1,2); 

INSERT INTO system_user_program (id,system_user_id,system_program_id) VALUES (1,2,7); 

INSERT INTO system_users (id,name,login,password,email,frontpage_id,system_unit_id,active,accepted_term_policy_at,accepted_term_policy,two_factor_enabled,two_factor_type,two_factor_secret) VALUES (1,'Administrator','admin','21232f297a57a5a743894a0e4a801fc3','admin@admin.net',10,null,'Y','','','N','',''); 

INSERT INTO system_users (id,name,login,password,email,frontpage_id,system_unit_id,active,accepted_term_policy_at,accepted_term_policy,two_factor_enabled,two_factor_type,two_factor_secret) VALUES (2,'User','user','ee11cbb19052e40b07aac0ca060c23ee','user@user.net',7,null,'Y','','','N','',''); 

INSERT INTO system_user_unit (id,system_user_id,system_unit_id) VALUES (1,1,1); 
