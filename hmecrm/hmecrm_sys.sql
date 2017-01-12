/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-06 15:47:57                          */
/*==============================================================*/


/*==============================================================*/
/* Table: FUNCTION                                              */
/*==============================================================*/
create table FUNCTION
(
   FUNCTION_ID          char(6) not null comment '���ܴ���',
   FUNCTION_NAME        char(50) comment '��������',
   site                 char(50) comment '����ģ��',
   description          varchar(256) comment '����',
   operator             varchar(256) comment '����Ա',
   LB1                  char(50),
   LB2                  varchar(256),
   LB3                  varchar(256),
   window_name          varchar(100),
   argument1            varchar(100) comment '����1',
   argument2            varchar(100) comment '����2',
   argument3            varchar(100) comment '����3',
   argument4            varchar(100) comment '����4',
   argument5            varchar(100) comment '����5',
   argument6            varchar(100) comment '����6',
   argument7            varchar(100) comment '����7',
   argument8            varchar(100) comment '����8',
   argument9            varchar(100) comment '����9',
   argument10           varchar(100) comment '����10',
   argument11           varchar(100) comment '����11',
   argument12           varchar(100) comment '����12',
   argument13           varchar(100) comment '����13',
   argument14           varchar(100) comment '����14',
   argument15           varchar(100) comment '����15',
   rpt_header           varchar(100) comment '����ͷ',
   rpt_foot             varchar(100) comment '����β',
   i_datawindow_type    numeric(4,0) comment '���ݴ�������',
   open_type            char(1) comment '�򿪷�ʽ',
   ver_flag             varchar(5) default '0',
   site_id              char(2) comment 'ģ��ID�����ڰ���С�������У�',
   primary key (FUNCTION_ID)
);

alter table FUNCTION comment '���ܱ�';

/*==============================================================*/
/* Table: HZK                                                   */
/*==============================================================*/
create table HZK
(
   HZ                   varchar(2) not null comment '����',
   PYM                  varchar(1) comment 'ƴ����',
   primary key (HZ)
);

alter table HZK comment '���ֿ�';

/*==============================================================*/
/* Table: INSTALL                                               */
/*==============================================================*/
create table INSTALL
(
   INSTALL_ID           char(4) not null comment 'install_id',
   INSTALL_DATE         timestamp comment '��װ����',
   USE_DAY              int comment 'ʹ������',
   primary key (INSTALL_ID)
);

alter table INSTALL comment '��װ��Ϣ';

/*==============================================================*/
/* Table: LICENSE                                               */
/*==============================================================*/
create table LICENSE
(
   ID                   int not null auto_increment comment 'ID',
   COMP_NO              char(20) comment '��˾����',
   COMPANY              varchar(100) comment '��˾����',
   ABBR                 varchar(100) comment '��д',
   SOFTNAME             varchar(100) comment '�������',
   SOFTUSAGE            varchar(100) comment '�����;',
   SOFTVERSION          char(20) comment '����汾��',
   TEL                  varchar(100) comment '�绰',
   FAX                  varchar(100) comment '����',
   EMAIL                varchar(100) comment '�����ʼ�',
   HTTP                 varchar(100) comment '��ַ',
   ADDR                 varchar(100) comment '��ַ',
   POSTALCODE           char(20) comment '�ʱ�',
   REMARK               varchar(1000) comment '��ע',
   primary key (ID)
);

alter table LICENSE comment '��Ȩ��';

/*==============================================================*/
/* Index: COMP_NO                                               */
/*==============================================================*/
create unique index COMP_NO on LICENSE
(
   COMP_NO
);

/*==============================================================*/
/* Table: OPERATOR                                              */
/*==============================================================*/
create table OPERATOR
(
   OPERATOR_ID          char(20) not null comment '����Ա����',
   OPERATOR_NAME        char(20) comment '����Ա����',
   PASSWORD             char(10) comment '����',
   pic                  varchar(1000),
   startup              char(1) default '1',
   discount             char(3) default '100' comment '�ۿ���',
   present_amt          numeric(7,2) default 0 comment '�����ͽ��',
   free_amount          numeric(7,2) default 0 comment '��������',
   group_id             char(4),
   is_addcust           char(1) default 'N',
   is_adddish           char(1) default 'N',
   logintime            char(30) comment '����¼ʱ��',
   edit_pwd_time        varchar(20) comment '����޸�����ʱ��',
   is_new_pwd           char(1) default '0' comment '�Ƿ���Ҫ�޸�����',
   operator_num         varchar(100) comment '����',
   primary key (OPERATOR_ID)
);

alter table OPERATOR comment '����Ա';

/*==============================================================*/
/* Table: OPERATOR_FUNCTION                                     */
/*==============================================================*/
create table OPERATOR_FUNCTION
(
   OPERATOR_ID          char(20) not null comment '����Ա����',
   FUNCTION_ID          char(6) not null comment '���ܴ���',
   AUTH_RIGHT           char(1) comment '�Ƿ��д�Ȩ��',
   ver_flag             varchar(5) default '0',
   primary key (OPERATOR_ID, FUNCTION_ID)
);

alter table OPERATOR_FUNCTION comment '����Ա���ܶ�Ӧ��';

/*==============================================================*/
/* Table: OPERATOR_POS                                          */
/*==============================================================*/
create table OPERATOR_POS
(
   OPERATOR_ID          char(20) not null comment '����Ա����',
   POS_ID               char(2) not null comment 'ǰ̨����',
   primary key (OPERATOR_ID, POS_ID)
);

alter table OPERATOR_POS comment '����Աǰ̨��Ӧ��';

/*==============================================================*/
/* Table: OPERATOR_STORE                                        */
/*==============================================================*/
create table OPERATOR_STORE
(
   OPERATOR_ID          char(20) not null comment '����Ա����',
   STORE_ID             char(2) not null comment '�ֿ����',
   primary key (OPERATOR_ID, STORE_ID)
);

alter table OPERATOR_STORE comment '����Ա�ֿ�Ȩ�ޱ�';

/*==============================================================*/
/* Table: SYSLOG                                                */
/*==============================================================*/
create table SYSLOG
(
   SYSLOG_ID            char(14) not null,
   LOG_IN               timestamp,
   LOG_OUT              timestamp,
   OPERATOR_NAME        char(20),
   ACTION               varchar(250),
   primary key (SYSLOG_ID)
);

/*==============================================================*/
/* Table: day_mon_rec                                           */
/*==============================================================*/
create table day_mon_rec
(
   rq                   timestamp,
   op_type              int not null,
   op_describe          char(50) not null,
   year                 char(4),
   month                char(2),
   lsh                  int not null auto_increment,
   czy                  char(50),
   up_flag              char(1) default '0',
   primary key (lsh)
);

alter table day_mon_rec comment '������־';

/*==============================================================*/
/* Table: fileupdate                                            */
/*==============================================================*/
create table fileupdate
(
   filename             varchar(255) not null comment '�ļ���',
   file                 longblob comment '�ļ�',
   updatetime           timestamp comment '����ʱ��',
   primary key (filename)
);

alter table fileupdate comment '�ļ�����';

/*==============================================================*/
/* Table: infoclients                                           */
/*==============================================================*/
create table infoclients
(
   code                 char(50) comment '�ͻ���'
);

alter table infoclients comment '�ͻ���������Ϣ';

/*==============================================================*/
/* Table: infosc                                                */
/*==============================================================*/
create table infosc
(
   id                   int not null default 1,
   dt1                  int,
   dt2                  int,
   dt3                  int,
   dt4                  int,
   dt5                  int,
   dt6                  int,
   dt7                  int,
   dt8                  int,
   primary key (id)
);

/*==============================================================*/
/* Table: j_upgrade                                             */
/*==============================================================*/
create table j_upgrade
(
   version              varchar(50) not null,
   zip_file_data        longblob,
   last_update_time     varchar(20),
   primary key (version)
);

alter table j_upgrade comment '�����ļ�';

/*==============================================================*/
/* Table: line_sys                                              */
/*==============================================================*/
create table line_sys
(
   name                 varchar(50) not null comment '����',
   lastnum              int comment '����ͷ������',
   frontnum             int comment 'ǰ�滹�ж���λ',
   prefix               char(10) comment 'ǰ׺',
   id                   char(2) not null,
   primary key (name)
);

alter table line_sys comment '�к�/�Ŷ�ϵͳ';

/*==============================================================*/
/* Table: ll_parameter                                          */
/*==============================================================*/
create table ll_parameter
(
   par_name             char(50) not null,
   par_val              char(50),
   par_catption         char(255),
   primary key (par_name)
);

alter table ll_parameter comment 'ϵͳ����';

/*==============================================================*/
/* Table: net_connect                                           */
/*==============================================================*/
create table net_connect
(
   id                   int not null,
   net_dbms             varchar(80),
   net_database         varchar(30),
   net_logpass          varchar(30),
   net_servername       varchar(30),
   net_logid            varchar(30),
   logid                varchar(30),
   logpass              varchar(30),
   net_timer            int,
   stop_flag            char(1) default '0',
   primary key (id)
);

alter table net_connect comment '������Ϣ';

/*==============================================================*/
/* Table: operator_fixdiscount                                  */
/*==============================================================*/
create table operator_fixdiscount
(
   operator_id          varchar(20) not null comment '����ԱID',
   discount_rate        double not null comment '�ۿ���',
   primary key (operator_id)
);

alter table operator_fixdiscount comment '����Ա�̶��ۿ�';

/*==============================================================*/
/* Table: operator_group                                        */
/*==============================================================*/
create table operator_group
(
   group_id             char(4) not null comment '��ID',
   group_name           char(20) comment '������',
   operator_id          char(20) not null comment '����Ա',
   primary key (group_id, operator_id)
);

alter table operator_group comment '����Ա��';

/*==============================================================*/
/* Table: operator_group_function                               */
/*==============================================================*/
create table operator_group_function
(
   group_id             char(4) not null comment '��ID',
   function_id          char(6) not null comment 'Ȩ��ID',
   auth_right           char(1) comment '�Ƿ��д�Ȩ��',
   primary key (group_id, function_id)
);

alter table operator_group_function comment '��Ȩ��';

/*==============================================================*/
/* Table: radio                                                 */
/*==============================================================*/
create table radio
(
   radio_id             varchar(3) not null,
   receive_id           char(1),
   radio_uid            varchar(10),
   operator_id          varchar(12),
   primary key (radio_id)
);

alter table radio comment '��˶�ר��';

/*==============================================================*/
/* Table: receive                                               */
/*==============================================================*/
create table receive
(
   receive_id           char(1) not null comment 'ID',
   com                  varchar(4) comment 'COM��',
   primary key (receive_id)
);

alter table receive comment '��˱����ջ�վ��Ϣ';

/*==============================================================*/
/* Table: uoption                                               */
/*==============================================================*/
create table uoption
(
   opt_id               varchar(20) not null comment 'ID',
   opt_number           varchar(8) comment 'NUMBER',
   opt_effect           char(1) default 'Y' comment 'ѡ��',
   note                 varchar(500) comment '˵��',
   primary key (opt_id)
);

alter table uoption comment 'ѡ���ֵ�';

/*==============================================================*/
/* Table: version                                               */
/*==============================================================*/
create table version
(
   version              char(15) not null comment '�汾��',
   create_date          date comment '��������',
   principal            char(100) comment '��Ҫ��������',
   pbl                  varchar(1000) comment '���ļ�',
   remark               varchar(1000) comment '��ע',
   pbd                  varchar(1000) comment '���ļ�',
   primary key (version)
);

alter table version comment '����汾��¼';

alter table operator_fixdiscount add constraint fk_fixdiscount foreign key (operator_id)
      references OPERATOR (OPERATOR_ID) on delete cascade on update restrict;

