CREATE TABLE system_change_log (
    id INTEGER PRIMARY KEY NOT NULL,
    logdate timestamp,
    login TEXT,
    tablename TEXT,
    primarykey TEXT,
    pkvalue TEXT,
    operation TEXT,
    columnname TEXT,
    oldvalue TEXT,
    newvalue TEXT,
    access_ip TEXT,
    transaction_id TEXT, 
    log_trace TEXT,
    session_id TEXT,
    class_name TEXT,
    php_sapi TEXT,
    log_year varchar(4),
    log_month varchar(2),
    log_day varchar(2)
);
CREATE TABLE system_sql_log (
    id INTEGER PRIMARY KEY NOT NULL,
    logdate timestamp,
    login TEXT,
    database_name TEXT,
    sql_command TEXT,
    statement_type TEXT,
    access_ip varchar(45),
    transaction_id TEXT,
    log_trace TEXT,
    session_id TEXT,
    class_name TEXT,
    php_sapi TEXT,
    request_id TEXT,
    log_year varchar(4),
    log_month varchar(2),
    log_day varchar(2)
);
CREATE TABLE system_access_log (
    id INTEGER PRIMARY KEY NOT NULL,
    sessionid text,
    login text,
    login_time timestamp,
    login_year varchar(4),
    login_month varchar(2),
    login_day varchar(2),
    logout_time timestamp,
    impersonated char(1),
    access_ip varchar(45),
    impersonated_by varchar(200)
);
CREATE TABLE system_request_log (
    id INTEGER PRIMARY KEY NOT NULL,
    endpoint TEXT,
    logdate TEXT,
    log_year varchar(4),
    log_month varchar(2),
    log_day varchar(2),
    session_id TEXT,
    login TEXT,
    access_ip TEXT,
    class_name TEXT,
    http_host TEXT,
    server_port TEXT,
    request_uri TEXT,
    request_method TEXT,
    query_string TEXT,
    request_headers TEXT,
    request_body TEXT,
    request_duration INT
);

CREATE TABLE system_access_notification_log (
    id INTEGER PRIMARY KEY NOT NULL,
    login TEXT,
    email TEXT,
    ip_address TEXT,
    login_time TEXT
);

CREATE TABLE address( 
      id  SERIAL    NOT NULL  , 
      cep varchar  (15)   , 
      rua varchar  (255)   , 
      created_at timestamp   , 
      updated_at timestamp   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE agendamento( 
      id  SERIAL    NOT NULL  , 
      titulo varchar  (200)   NOT NULL  , 
      descricao text   NOT NULL  , 
      data_inicio timestamp   NOT NULL  , 
      data_fim timestamp   NOT NULL  , 
      relevancia_id integer   NOT NULL  , 
      agenda_id integer   , 
      recorrencia_id integer   NOT NULL  , 
      limite_recorrencia date   , 
      plano_id integer   , 
      tipo_id integer   , 
      considera_final_semana_id integer   , 
      dias_personalizado integer   , 
      lembrete_agenda_id integer   , 
      system_users_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE categoria( 
      id  SERIAL    NOT NULL  , 
      created_at timestamp   , 
      updated_at timestamp   , 
      descricao varchar  (200)   NOT NULL  , 
      tipo_categoria_id integer   NOT NULL  , 
      totaliza_receita_despesa_id integer   NOT NULL  , 
      system_users_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE considera_final_semana( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (200)   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE conta( 
      id  SERIAL    NOT NULL  , 
      tipo_conta_id integer   NOT NULL  , 
      descricao varchar  (200)   NOT NULL  , 
      banco varchar  (200)   , 
      data_saldo_inicial date   NOT NULL  , 
      saldo_inicial float   NOT NULL  , 
      saldo_atual float   NOT NULL  , 
      system_users_id integer   NOT NULL  , 
      updated_at timestamp   , 
      created_at timestamp   , 
      saldo_calculado_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE customers( 
      id  SERIAL    NOT NULL  , 
      name varchar  (255)   NOT NULL  , 
      cnpj varchar  (25)   NOT NULL  , 
      created_at timestamp   , 
      updated_at timestamp   , 
      cnae text   , 
      address_id integer   NOT NULL  , 
      website varchar  (255)   , 
      email varchar  (255)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE lancamento( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (200)   NOT NULL  , 
      vencimento date   NOT NULL  , 
      pagamento date   , 
      valor float   NOT NULL  , 
      categoria_id integer   NOT NULL  , 
      conta_id integer   NOT NULL  , 
      status_lancamento_id integer   NOT NULL  , 
      system_users_id integer   NOT NULL  , 
      updated_at timestamp   , 
      created_at timestamp   , 
      tipo_lancamento_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE lembrete_agenda( 
      id  SERIAL    NOT NULL  , 
      minutos integer   , 
      descricao text   , 
      mensagem text   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE plano( 
      id  SERIAL    NOT NULL  , 
      titulo varchar  (200)   , 
      descricao text   NOT NULL  , 
      previsao date   NOT NULL  , 
      created_at timestamp   NOT NULL  , 
      updated_at timestamp   , 
      system_users_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE product( 
      id  SERIAL    NOT NULL  , 
      name varchar  (255)   NOT NULL  , 
      created_at timestamp   , 
      updated_at timestamp   , 
      type_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE quote( 
      id  SERIAL    NOT NULL  , 
      created_at timestamp   , 
      updated_at timestamp   , 
      customer_id integer   NOT NULL  , 
      status_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE recorrencia( 
      id  SERIAL    NOT NULL  , 
      descricao char  (200)   NOT NULL  , 
      qtd_dia integer   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE relevancia( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (200)   NOT NULL  , 
      cor varchar  (200)   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE saldo_calculado( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (5)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE service( 
      id  SERIAL    NOT NULL  , 
      created_at timestamp   , 
      updated_at timestamp   , 
      name varchar  (255)   , 
      type_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE service_requirement( 
      id  SERIAL    NOT NULL  , 
      created_at timestamp   , 
      updated_at timestamp   , 
      product_id integer   NOT NULL  , 
      service_id integer   NOT NULL  , 
      is_required char  (1)   NOT NULL    DEFAULT 'T', 
      notes text   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE status_lancamento( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (200)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE status_quote( 
      id  SERIAL    NOT NULL  , 
      name varchar  (255)   NOT NULL  , 
      notes text   , 
      created_at timestamp   , 
      updated_at timestamp   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE status_tarefa( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (200)   NOT NULL  , 
      cor text   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_document( 
      id integer   NOT NULL  , 
      category_id integer   NOT NULL  , 
      system_user_id integer   , 
      title text   NOT NULL  , 
      description text   , 
      submission_date date   , 
      archive_date date   , 
      filename text   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_document_category( 
      id integer   NOT NULL  , 
      name text   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_document_group( 
      id integer   NOT NULL  , 
      document_id integer   NOT NULL  , 
      system_group_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_document_user( 
      id integer   NOT NULL  , 
      document_id integer   NOT NULL  , 
      system_user_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_group( 
      id integer   NOT NULL  , 
      name text   NOT NULL  , 
      uuid varchar  (36)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_group_program( 
      id integer   NOT NULL  , 
      system_group_id integer   NOT NULL  , 
      system_program_id integer   NOT NULL  , 
      actions text   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_message( 
      id integer   NOT NULL  , 
      system_user_id integer   NOT NULL  , 
      system_user_to_id integer   NOT NULL  , 
      subject text   NOT NULL  , 
      message text   , 
      dt_message timestamp   , 
      checked char  (1)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_notification( 
      id integer   NOT NULL  , 
      system_user_id integer   NOT NULL  , 
      system_user_to_id integer   NOT NULL  , 
      subject text   , 
      message text   , 
      dt_message timestamp   , 
      action_url text   , 
      action_label text   , 
      icon text   , 
      checked char  (1)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_preference( 
      id varchar  (255)   NOT NULL  , 
      preference text   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_program( 
      id integer   NOT NULL  , 
      name text   NOT NULL  , 
      controller text   NOT NULL  , 
      actions text   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_unit( 
      id integer   NOT NULL  , 
      name text   NOT NULL  , 
      connection_name text   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_user_group( 
      id integer   NOT NULL  , 
      system_user_id integer   NOT NULL  , 
      system_group_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_user_program( 
      id integer   NOT NULL  , 
      system_user_id integer   NOT NULL  , 
      system_program_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_users( 
      id integer   NOT NULL  , 
      name text   NOT NULL  , 
      login text   NOT NULL  , 
      password text   NOT NULL  , 
      email text   , 
      frontpage_id integer   , 
      system_unit_id integer   , 
      active char  (1)   , 
      accepted_term_policy_at text   , 
      accepted_term_policy char  (1)   , 
      two_factor_enabled char  (1)     DEFAULT 'N', 
      two_factor_type varchar  (100)   , 
      two_factor_secret varchar  (255)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE system_user_unit( 
      id integer   NOT NULL  , 
      system_user_id integer   NOT NULL  , 
      system_unit_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE tarefa( 
      id integer   NOT NULL  , 
      descricao varchar  (200)   NOT NULL  , 
      detalhe text   , 
      conclusao date   , 
      plano_id integer   , 
      status_tarefa_id integer   NOT NULL  , 
      relevancia_id integer   NOT NULL  , 
      created_at timestamp   NOT NULL  , 
      update_at timestamp   , 
      tipo_id integer   NOT NULL  , 
      system_users_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE tipo( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (200)   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE tipo_categoria( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (200)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE tipo_conta( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (200)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE tipo_lancamento( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (200)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE totaliza_receita_despesa( 
      id  SERIAL    NOT NULL  , 
      descricao varchar  (20)   , 
 PRIMARY KEY (id)) ; 

CREATE TABLE transacao( 
      id  SERIAL    NOT NULL  , 
      created_at timestamp   , 
      updated_at timestamp   , 
      data_transacao date   NOT NULL  , 
      conta_id integer   NOT NULL  , 
      saldo_anterior float   NOT NULL  , 
      valor float   NOT NULL  , 
      saldo_final float   , 
      lancamento_id integer   NOT NULL  , 
      system_users_id integer   NOT NULL  , 
 PRIMARY KEY (id)) ; 

CREATE TABLE type_product( 
      id  SERIAL    NOT NULL  , 
      name varchar  (255)   NOT NULL  , 
      created_at timestamp   , 
      updated_at timestamp   , 
      hazardous char  (1)   NOT NULL    DEFAULT 'F', 
 PRIMARY KEY (id)) ; 

CREATE TABLE type_service( 
      id  SERIAL    NOT NULL  , 
      created_at timestamp   , 
      updated_at timestamp   , 
      name varchar  (255)   NOT NULL  , 
 PRIMARY KEY (id)) ; 

 
  
 ALTER TABLE agendamento ADD CONSTRAINT fk_agenda_1 FOREIGN KEY (relevancia_id) references relevancia(id); 
ALTER TABLE agendamento ADD CONSTRAINT fk_agenda_3 FOREIGN KEY (recorrencia_id) references recorrencia(id); 
ALTER TABLE agendamento ADD CONSTRAINT fk_agenda_4 FOREIGN KEY (plano_id) references plano(id); 
ALTER TABLE agendamento ADD CONSTRAINT fk_agenda_5 FOREIGN KEY (tipo_id) references tipo(id); 
ALTER TABLE agendamento ADD CONSTRAINT fk_agenda_6 FOREIGN KEY (considera_final_semana_id) references considera_final_semana(id); 
ALTER TABLE agendamento ADD CONSTRAINT fk_agenda_7 FOREIGN KEY (lembrete_agenda_id) references lembrete_agenda(id); 
ALTER TABLE agendamento ADD CONSTRAINT fk_agendamento_8 FOREIGN KEY (system_users_id) references system_users(id); 
ALTER TABLE categoria ADD CONSTRAINT fk_categoria_1 FOREIGN KEY (tipo_categoria_id) references tipo_categoria(id); 
ALTER TABLE categoria ADD CONSTRAINT fk_categoria_2 FOREIGN KEY (totaliza_receita_despesa_id) references totaliza_receita_despesa(id); 
ALTER TABLE categoria ADD CONSTRAINT fk_categoria_3 FOREIGN KEY (system_users_id) references system_users(id); 
ALTER TABLE conta ADD CONSTRAINT fk_conta_1 FOREIGN KEY (tipo_conta_id) references tipo_conta(id); 
ALTER TABLE conta ADD CONSTRAINT fk_conta_2 FOREIGN KEY (system_users_id) references system_users(id); 
ALTER TABLE conta ADD CONSTRAINT fk_conta_3 FOREIGN KEY (saldo_calculado_id) references saldo_calculado(id); 
ALTER TABLE customers ADD CONSTRAINT fk_customers_1 FOREIGN KEY (address_id) references address(id); 
ALTER TABLE lancamento ADD CONSTRAINT fk_lancamento_1 FOREIGN KEY (categoria_id) references categoria(id); 
ALTER TABLE lancamento ADD CONSTRAINT fk_lancamento_2 FOREIGN KEY (conta_id) references conta(id); 
ALTER TABLE lancamento ADD CONSTRAINT fk_lancamento_3 FOREIGN KEY (status_lancamento_id) references status_lancamento(id); 
ALTER TABLE lancamento ADD CONSTRAINT fk_lancamento_4 FOREIGN KEY (system_users_id) references system_users(id); 
ALTER TABLE lancamento ADD CONSTRAINT fk_lancamento_5 FOREIGN KEY (tipo_lancamento_id) references tipo_lancamento(id); 
ALTER TABLE plano ADD CONSTRAINT fk_plano_1 FOREIGN KEY (system_users_id) references system_users(id); 
ALTER TABLE product ADD CONSTRAINT fk_product_1 FOREIGN KEY (type_id) references type_product(id); 
ALTER TABLE quote ADD CONSTRAINT fk_quote_1 FOREIGN KEY (customer_id) references customers(id); 
ALTER TABLE quote ADD CONSTRAINT fk_quote_2 FOREIGN KEY (status_id) references status_quote(id); 
ALTER TABLE service ADD CONSTRAINT fk_service_1 FOREIGN KEY (type_id) references type_service(id); 
ALTER TABLE service_requirement ADD CONSTRAINT fk_service_requirement_1 FOREIGN KEY (product_id) references product(id); 
ALTER TABLE service_requirement ADD CONSTRAINT fk_service_requirement_2 FOREIGN KEY (service_id) references service(id); 
ALTER TABLE system_document ADD CONSTRAINT fk_system_document_2 FOREIGN KEY (category_id) references system_document_category(id); 
ALTER TABLE system_document ADD CONSTRAINT fk_system_document_1 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_document_group ADD CONSTRAINT fk_system_document_group_2 FOREIGN KEY (document_id) references system_document(id); 
ALTER TABLE system_document_group ADD CONSTRAINT fk_system_document_group_1 FOREIGN KEY (system_group_id) references system_group(id); 
ALTER TABLE system_document_user ADD CONSTRAINT fk_system_document_user_2 FOREIGN KEY (document_id) references system_document(id); 
ALTER TABLE system_document_user ADD CONSTRAINT fk_system_document_user_1 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_group_program ADD CONSTRAINT fk_system_group_program_1 FOREIGN KEY (system_program_id) references system_program(id); 
ALTER TABLE system_group_program ADD CONSTRAINT fk_system_group_program_2 FOREIGN KEY (system_group_id) references system_group(id); 
ALTER TABLE system_message ADD CONSTRAINT fk_system_message_1 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_message ADD CONSTRAINT fk_system_message_2 FOREIGN KEY (system_user_to_id) references system_users(id); 
ALTER TABLE system_notification ADD CONSTRAINT fk_system_notification_1 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_notification ADD CONSTRAINT fk_system_notification_2 FOREIGN KEY (system_user_to_id) references system_users(id); 
ALTER TABLE system_user_group ADD CONSTRAINT fk_system_user_group_1 FOREIGN KEY (system_group_id) references system_group(id); 
ALTER TABLE system_user_group ADD CONSTRAINT fk_system_user_group_2 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_user_program ADD CONSTRAINT fk_system_user_program_1 FOREIGN KEY (system_program_id) references system_program(id); 
ALTER TABLE system_user_program ADD CONSTRAINT fk_system_user_program_2 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_users ADD CONSTRAINT fk_system_user_1 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE system_users ADD CONSTRAINT fk_system_user_2 FOREIGN KEY (frontpage_id) references system_program(id); 
ALTER TABLE system_user_unit ADD CONSTRAINT fk_system_user_unit_1 FOREIGN KEY (system_user_id) references system_users(id); 
ALTER TABLE system_user_unit ADD CONSTRAINT fk_system_user_unit_2 FOREIGN KEY (system_unit_id) references system_unit(id); 
ALTER TABLE tarefa ADD CONSTRAINT fk_tarefa_1 FOREIGN KEY (plano_id) references plano(id); 
ALTER TABLE tarefa ADD CONSTRAINT fk_tarefa_2 FOREIGN KEY (status_tarefa_id) references status_tarefa(id); 
ALTER TABLE tarefa ADD CONSTRAINT fk_tarefa_3 FOREIGN KEY (relevancia_id) references relevancia(id); 
ALTER TABLE tarefa ADD CONSTRAINT fk_tarefa_4 FOREIGN KEY (tipo_id) references tipo(id); 
ALTER TABLE tarefa ADD CONSTRAINT fk_tarefa_5 FOREIGN KEY (system_users_id) references system_users(id); 
ALTER TABLE transacao ADD CONSTRAINT fk_transacoes_2 FOREIGN KEY (conta_id) references conta(id); 
ALTER TABLE transacao ADD CONSTRAINT fk_transacoes_3 FOREIGN KEY (lancamento_id) references lancamento(id); 
ALTER TABLE transacao ADD CONSTRAINT fk_transacao_4 FOREIGN KEY (system_users_id) references system_users(id); 
 
 CREATE index idx_agendamento_relevancia_id on agendamento(relevancia_id); 
CREATE index idx_agendamento_recorrencia_id on agendamento(recorrencia_id); 
CREATE index idx_agendamento_plano_id on agendamento(plano_id); 
CREATE index idx_agendamento_tipo_id on agendamento(tipo_id); 
CREATE index idx_agendamento_considera_final_semana_id on agendamento(considera_final_semana_id); 
CREATE index idx_agendamento_lembrete_agenda_id on agendamento(lembrete_agenda_id); 
CREATE index idx_agendamento_system_users_id on agendamento(system_users_id); 
CREATE index idx_categoria_tipo_categoria_id on categoria(tipo_categoria_id); 
CREATE index idx_categoria_totaliza_receita_despesa_id on categoria(totaliza_receita_despesa_id); 
CREATE index idx_categoria_system_users_id on categoria(system_users_id); 
CREATE index idx_conta_tipo_conta_id on conta(tipo_conta_id); 
CREATE index idx_conta_system_users_id on conta(system_users_id); 
CREATE index idx_conta_saldo_calculado_id on conta(saldo_calculado_id); 
CREATE index idx_customers_address_id on customers(address_id); 
CREATE index idx_lancamento_categoria_id on lancamento(categoria_id); 
CREATE index idx_lancamento_conta_id on lancamento(conta_id); 
CREATE index idx_lancamento_status_lancamento_id on lancamento(status_lancamento_id); 
CREATE index idx_lancamento_system_users_id on lancamento(system_users_id); 
CREATE index idx_lancamento_tipo_lancamento_id on lancamento(tipo_lancamento_id); 
CREATE index idx_plano_system_users_id on plano(system_users_id); 
CREATE index idx_product_type_id on product(type_id); 
CREATE index idx_quote_customer_id on quote(customer_id); 
CREATE index idx_quote_status_id on quote(status_id); 
CREATE index idx_service_type_id on service(type_id); 
CREATE index idx_service_requirement_product_id on service_requirement(product_id); 
CREATE index idx_service_requirement_service_id on service_requirement(service_id); 
CREATE index idx_system_document_category_id on system_document(category_id); 
CREATE index idx_system_document_system_user_id on system_document(system_user_id); 
CREATE index idx_system_document_group_document_id on system_document_group(document_id); 
CREATE index idx_system_document_group_system_group_id on system_document_group(system_group_id); 
CREATE index idx_system_document_user_document_id on system_document_user(document_id); 
CREATE index idx_system_document_user_system_user_id on system_document_user(system_user_id); 
CREATE index idx_system_group_program_system_program_id on system_group_program(system_program_id); 
CREATE index idx_system_group_program_system_group_id on system_group_program(system_group_id); 
CREATE index idx_system_message_system_user_id on system_message(system_user_id); 
CREATE index idx_system_message_system_user_to_id on system_message(system_user_to_id); 
CREATE index idx_system_notification_system_user_id on system_notification(system_user_id); 
CREATE index idx_system_notification_system_user_to_id on system_notification(system_user_to_id); 
CREATE index idx_system_user_group_system_group_id on system_user_group(system_group_id); 
CREATE index idx_system_user_group_system_user_id on system_user_group(system_user_id); 
CREATE index idx_system_user_program_system_program_id on system_user_program(system_program_id); 
CREATE index idx_system_user_program_system_user_id on system_user_program(system_user_id); 
CREATE index idx_system_users_system_unit_id on system_users(system_unit_id); 
CREATE index idx_system_users_frontpage_id on system_users(frontpage_id); 
CREATE index idx_system_user_unit_system_user_id on system_user_unit(system_user_id); 
CREATE index idx_system_user_unit_system_unit_id on system_user_unit(system_unit_id); 
CREATE index idx_tarefa_plano_id on tarefa(plano_id); 
CREATE index idx_tarefa_status_tarefa_id on tarefa(status_tarefa_id); 
CREATE index idx_tarefa_relevancia_id on tarefa(relevancia_id); 
CREATE index idx_tarefa_tipo_id on tarefa(tipo_id); 
CREATE index idx_tarefa_system_users_id on tarefa(system_users_id); 
CREATE index idx_transacao_conta_id on transacao(conta_id); 
CREATE index idx_transacao_lancamento_id on transacao(lancamento_id); 
CREATE index idx_transacao_system_users_id on transacao(system_users_id); 
INSERT INTO considera_final_semana (id,descricao) VALUES (1,'Sim'); 

INSERT INTO considera_final_semana (id,descricao) VALUES (2,'Não'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (1,5,'5 Minutos antes de iniciar','inicia em 5 minutos.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (2,10,'10 Minutos antes de iniciar','inicia em 10 minutos.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (3,15,'15 Minutos antes de iniciar','inicia em 15 minutos.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (4,20,'20 Minutos antes de iniciar','inicia em 20 minutos.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (5,30,'30 Minutos antes de iniciar','inicia em 30 minutos.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (6,45,'45 Minutos antes de iniciar','inicia em 45 minutos.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (7,60,'1 Hora antes de iniciar','inicia em 1 hora.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (8,120,'2 Hora antes de iniciar','inicia em 2 horas.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (9,180,'3 Hora antes de iniciar','inicia em 3 horas.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (10,240,'4 Hora antes de iniciar','inicia em 4 horas.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (11,300,'5 Hora antes de iniciar','inicia em 5 horas.'); 

INSERT INTO lembrete_agenda (id,minutos,descricao,mensagem) VALUES (12,360,'6 Hora antes de iniciar','inicia em 6 horas.'); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (1,'Sem Recorrência',0); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (2,'Diário',1); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (3,'Semanal',7); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (4,'Mensal',30); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (5,'Anual',365); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (6,'Quinzenal',15); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (7,'Trimestral',90); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (8,'Semestral',180); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (9,'Dia Específico',0); 

INSERT INTO recorrencia (id,descricao,qtd_dia) VALUES (10,'Personalizada',0); 

INSERT INTO relevancia (id,descricao,cor) VALUES (1,'Importante','#ffa000'); 

INSERT INTO relevancia (id,descricao,cor) VALUES (2,'Urgente','#d50000'); 

INSERT INTO relevancia (id,descricao,cor) VALUES (3,'Eventual','#4caf50'); 

INSERT INTO saldo_calculado (id,descricao) VALUES (1,'Sim'); 

INSERT INTO saldo_calculado (id,descricao) VALUES (2,'Não'); 

INSERT INTO status_lancamento (id,descricao) VALUES (1,'Aberto'); 

INSERT INTO status_lancamento (id,descricao) VALUES (2,'Pago'); 

INSERT INTO status_quote (id,name,notes,created_at,updated_at) VALUES (1,'Draft','',null,null); 

INSERT INTO status_quote (id,name,notes,created_at,updated_at) VALUES (2,'Awaiting Info','',null,null); 

INSERT INTO status_quote (id,name,notes,created_at,updated_at) VALUES (3,'Proposed','',null,null); 

INSERT INTO status_quote (id,name,notes,created_at,updated_at) VALUES (4,'Accepted','',null,null); 

INSERT INTO status_quote (id,name,notes,created_at,updated_at) VALUES (5,'Cancelled','',null,null); 

INSERT INTO status_quote (id,name,notes,created_at,updated_at) VALUES (6,'Closed','',null,null); 

INSERT INTO status_quote (id,name,notes,created_at,updated_at) VALUES (7,'Expired','',null,null); 

INSERT INTO status_tarefa (id,descricao,cor) VALUES (1,'Pendente','#ffcdd2'); 

INSERT INTO status_tarefa (id,descricao,cor) VALUES (2,'Em Progresso','#fff9c4'); 

INSERT INTO status_tarefa (id,descricao,cor) VALUES (3,'Concluída','#a5d6a7'); 

INSERT INTO system_group (id,name,uuid) VALUES (1,'Admin',null); 

INSERT INTO system_group (id,name,uuid) VALUES (2,'Standard',null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (1,1,1,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (2,1,2,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (3,1,3,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (4,1,4,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (5,1,5,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (6,1,6,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (7,1,8,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (8,1,9,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (9,1,11,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (10,1,14,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (11,1,15,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (12,2,10,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (13,2,12,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (14,2,13,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (15,2,16,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (16,2,17,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (17,2,18,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (18,2,19,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (19,2,20,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (20,1,21,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (21,2,22,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (22,2,23,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (23,2,24,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (24,2,25,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (25,1,26,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (26,1,27,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (27,1,28,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (28,1,29,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (29,2,30,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (30,1,31,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (31,1,32,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (32,1,33,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (33,1,34,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (34,1,35,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (35,1,36,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (36,1,37,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (37,1,38,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (38,1,39,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (39,1,40,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (40,1,41,null); 

INSERT INTO system_group_program (id,system_group_id,system_program_id,actions) VALUES (41,1,42,null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (1,'System Group Form','SystemGroupForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (2,'System Group List','SystemGroupList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (3,'System Program Form','SystemProgramForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (4,'System Program List','SystemProgramList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (5,'System User Form','SystemUserForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (6,'System User List','SystemUserList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (7,'Common Page','CommonPage',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (8,'System PHP Info','SystemPHPInfoView',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (9,'System ChangeLog View','SystemChangeLogView',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (10,'Welcome View','WelcomeView',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (11,'System Sql Log','SystemSqlLogList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (12,'System Profile View','SystemProfileView',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (13,'System Profile Form','SystemProfileForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (14,'System SQL Panel','SystemSQLPanel',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (15,'System Access Log','SystemAccessLogList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (16,'System Message Form','SystemMessageForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (17,'System Message List','SystemMessageList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (18,'System Message Form View','SystemMessageFormView',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (19,'System Notification List','SystemNotificationList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (20,'System Notification Form View','SystemNotificationFormView',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (21,'System Document Category List','SystemDocumentCategoryFormList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (22,'System Document Form','SystemDocumentForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (23,'System Document Upload Form','SystemDocumentUploadForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (24,'System Document List','SystemDocumentList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (25,'System Shared Document List','SystemSharedDocumentList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (26,'System Unit Form','SystemUnitForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (27,'System Unit List','SystemUnitList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (28,'System Access stats','SystemAccessLogStats',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (29,'System Preference form','SystemPreferenceForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (30,'System Support form','SystemSupportForm',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (31,'System PHP Error','SystemPHPErrorLogView',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (32,'System Database Browser','SystemDatabaseExplorer',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (33,'System Table List','SystemTableList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (34,'System Data Browser','SystemDataBrowser',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (35,'System Menu Editor','SystemMenuEditor',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (36,'System Request Log','SystemRequestLogList',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (37,'System Request Log View','SystemRequestLogView',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (38,'System Administration Dashboard','SystemAdministrationDashboard',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (39,'System Log Dashboard','SystemLogDashboard',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (40,'System Session dump','SystemSessionDumpView',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (41,'Files diff','SystemFilesDiff',null); 

INSERT INTO system_program (id,name,controller,actions) VALUES (42,'System Information','SystemInformationView',null); 

INSERT INTO system_unit (id,name,connection_name) VALUES (1,'Matriz','matriz'); 

INSERT INTO system_user_group (id,system_user_id,system_group_id) VALUES (1,1,1); 

INSERT INTO system_user_group (id,system_user_id,system_group_id) VALUES (2,2,2); 

INSERT INTO system_user_group (id,system_user_id,system_group_id) VALUES (3,1,2); 

INSERT INTO system_user_program (id,system_user_id,system_program_id) VALUES (1,2,7); 

INSERT INTO system_users (id,name,login,password,email,frontpage_id,system_unit_id,active,accepted_term_policy_at,accepted_term_policy,two_factor_enabled,two_factor_type,two_factor_secret) VALUES (1,'Administrator','admin','21232f297a57a5a743894a0e4a801fc3','admin@admin.net',10,null,'Y','','',null,null,null); 

INSERT INTO system_users (id,name,login,password,email,frontpage_id,system_unit_id,active,accepted_term_policy_at,accepted_term_policy,two_factor_enabled,two_factor_type,two_factor_secret) VALUES (2,'User','user','ee11cbb19052e40b07aac0ca060c23ee','user@user.net',7,null,'Y','','',null,null,null); 

INSERT INTO system_user_unit (id,system_user_id,system_unit_id) VALUES (1,1,1); 

INSERT INTO tipo (id,descricao) VALUES (1,'Pessoal'); 

INSERT INTO tipo (id,descricao) VALUES (2,'Profissional'); 

INSERT INTO tipo_categoria (id,descricao) VALUES (1,'Receita'); 

INSERT INTO tipo_categoria (id,descricao) VALUES (2,'Despesa'); 

INSERT INTO tipo_conta (id,descricao) VALUES (1,'Conta Corrente'); 

INSERT INTO tipo_conta (id,descricao) VALUES (2,'Conta Poupança'); 

INSERT INTO tipo_conta (id,descricao) VALUES (3,'Investimento'); 

INSERT INTO tipo_conta (id,descricao) VALUES (4,'Digital'); 

INSERT INTO tipo_lancamento (id,descricao) VALUES (1,'Receita'); 

INSERT INTO tipo_lancamento (id,descricao) VALUES (2,'Despesa'); 

INSERT INTO totaliza_receita_despesa (id,descricao) VALUES (1,'Sim'); 

INSERT INTO totaliza_receita_despesa (id,descricao) VALUES (2,'Não'); 
SELECT setval('address_id_seq', coalesce(max(id),0) + 1, false) FROM address;
SELECT setval('agendamento_id_seq', coalesce(max(id),0) + 1, false) FROM agendamento;
SELECT setval('categoria_id_seq', coalesce(max(id),0) + 1, false) FROM categoria;
SELECT setval('considera_final_semana_id_seq', coalesce(max(id),0) + 1, false) FROM considera_final_semana;
SELECT setval('conta_id_seq', coalesce(max(id),0) + 1, false) FROM conta;
SELECT setval('customers_id_seq', coalesce(max(id),0) + 1, false) FROM customers;
SELECT setval('lancamento_id_seq', coalesce(max(id),0) + 1, false) FROM lancamento;
SELECT setval('lembrete_agenda_id_seq', coalesce(max(id),0) + 1, false) FROM lembrete_agenda;
SELECT setval('plano_id_seq', coalesce(max(id),0) + 1, false) FROM plano;
SELECT setval('product_id_seq', coalesce(max(id),0) + 1, false) FROM product;
SELECT setval('quote_id_seq', coalesce(max(id),0) + 1, false) FROM quote;
SELECT setval('recorrencia_id_seq', coalesce(max(id),0) + 1, false) FROM recorrencia;
SELECT setval('relevancia_id_seq', coalesce(max(id),0) + 1, false) FROM relevancia;
SELECT setval('saldo_calculado_id_seq', coalesce(max(id),0) + 1, false) FROM saldo_calculado;
SELECT setval('service_id_seq', coalesce(max(id),0) + 1, false) FROM service;
SELECT setval('service_requirement_id_seq', coalesce(max(id),0) + 1, false) FROM service_requirement;
SELECT setval('status_lancamento_id_seq', coalesce(max(id),0) + 1, false) FROM status_lancamento;
SELECT setval('status_quote_id_seq', coalesce(max(id),0) + 1, false) FROM status_quote;
SELECT setval('status_tarefa_id_seq', coalesce(max(id),0) + 1, false) FROM status_tarefa;
SELECT setval('tipo_id_seq', coalesce(max(id),0) + 1, false) FROM tipo;
SELECT setval('tipo_categoria_id_seq', coalesce(max(id),0) + 1, false) FROM tipo_categoria;
SELECT setval('tipo_conta_id_seq', coalesce(max(id),0) + 1, false) FROM tipo_conta;
SELECT setval('tipo_lancamento_id_seq', coalesce(max(id),0) + 1, false) FROM tipo_lancamento;
SELECT setval('totaliza_receita_despesa_id_seq', coalesce(max(id),0) + 1, false) FROM totaliza_receita_despesa;
SELECT setval('transacao_id_seq', coalesce(max(id),0) + 1, false) FROM transacao;
SELECT setval('type_product_id_seq', coalesce(max(id),0) + 1, false) FROM type_product;
SELECT setval('type_service_id_seq', coalesce(max(id),0) + 1, false) FROM type_service;