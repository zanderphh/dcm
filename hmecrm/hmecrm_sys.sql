/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-06 15:47:57                          */
/*==============================================================*/


/*==============================================================*/
/* Table: FUNCTION                                              */
/*==============================================================*/
create table FUNCTION
(
   FUNCTION_ID          char(6) not null comment '功能代码',
   FUNCTION_NAME        char(50) comment '功能名称',
   site                 char(50) comment '功能模块',
   description          varchar(256) comment '描述',
   operator             varchar(256) comment '操作员',
   LB1                  char(50),
   LB2                  varchar(256),
   LB3                  varchar(256),
   window_name          varchar(100),
   argument1            varchar(100) comment '参数1',
   argument2            varchar(100) comment '参数2',
   argument3            varchar(100) comment '参数3',
   argument4            varchar(100) comment '参数4',
   argument5            varchar(100) comment '参数5',
   argument6            varchar(100) comment '参数6',
   argument7            varchar(100) comment '参数7',
   argument8            varchar(100) comment '参数8',
   argument9            varchar(100) comment '参数9',
   argument10           varchar(100) comment '参数10',
   argument11           varchar(100) comment '参数11',
   argument12           varchar(100) comment '参数12',
   argument13           varchar(100) comment '参数13',
   argument14           varchar(100) comment '参数14',
   argument15           varchar(100) comment '参数15',
   rpt_header           varchar(100) comment '报表头',
   rpt_foot             varchar(100) comment '报表尾',
   i_datawindow_type    numeric(4,0) comment '数据窗口类型',
   open_type            char(1) comment '打开方式',
   ver_flag             varchar(5) default '0',
   site_id              char(2) comment '模块ID（用于按从小到大排列）',
   primary key (FUNCTION_ID)
);

alter table FUNCTION comment '功能表';

/*==============================================================*/
/* Table: HZK                                                   */
/*==============================================================*/
create table HZK
(
   HZ                   varchar(2) not null comment '汉字',
   PYM                  varchar(1) comment '拼音码',
   primary key (HZ)
);

alter table HZK comment '汉字库';

/*==============================================================*/
/* Table: INSTALL                                               */
/*==============================================================*/
create table INSTALL
(
   INSTALL_ID           char(4) not null comment 'install_id',
   INSTALL_DATE         timestamp comment '安装日期',
   USE_DAY              int comment '使用天数',
   primary key (INSTALL_ID)
);

alter table INSTALL comment '安装信息';

/*==============================================================*/
/* Table: LICENSE                                               */
/*==============================================================*/
create table LICENSE
(
   ID                   int not null auto_increment comment 'ID',
   COMP_NO              char(20) comment '公司编码',
   COMPANY              varchar(100) comment '公司名称',
   ABBR                 varchar(100) comment '缩写',
   SOFTNAME             varchar(100) comment '软件名称',
   SOFTUSAGE            varchar(100) comment '软件用途',
   SOFTVERSION          char(20) comment '软件版本号',
   TEL                  varchar(100) comment '电话',
   FAX                  varchar(100) comment '传真',
   EMAIL                varchar(100) comment '电子邮件',
   HTTP                 varchar(100) comment '网址',
   ADDR                 varchar(100) comment '地址',
   POSTALCODE           char(20) comment '邮编',
   REMARK               varchar(1000) comment '备注',
   primary key (ID)
);

alter table LICENSE comment '授权表';

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
   OPERATOR_ID          char(20) not null comment '操作员代码',
   OPERATOR_NAME        char(20) comment '操作员名称',
   PASSWORD             char(10) comment '口令',
   pic                  varchar(1000),
   startup              char(1) default '1',
   discount             char(3) default '100' comment '折扣率',
   present_amt          numeric(7,2) default 0 comment '可赠送金额',
   free_amount          numeric(7,2) default 0 comment '可免零金额',
   group_id             char(4),
   is_addcust           char(1) default 'N',
   is_adddish           char(1) default 'N',
   logintime            char(30) comment '最后登录时间',
   edit_pwd_time        varchar(20) comment '最后修改密码时间',
   is_new_pwd           char(1) default '0' comment '是否需要修改密码',
   operator_num         varchar(100) comment '工号',
   primary key (OPERATOR_ID)
);

alter table OPERATOR comment '操作员';

/*==============================================================*/
/* Table: OPERATOR_FUNCTION                                     */
/*==============================================================*/
create table OPERATOR_FUNCTION
(
   OPERATOR_ID          char(20) not null comment '操作员代码',
   FUNCTION_ID          char(6) not null comment '功能代码',
   AUTH_RIGHT           char(1) comment '是否有此权限',
   ver_flag             varchar(5) default '0',
   primary key (OPERATOR_ID, FUNCTION_ID)
);

alter table OPERATOR_FUNCTION comment '操作员功能对应表';

/*==============================================================*/
/* Table: OPERATOR_POS                                          */
/*==============================================================*/
create table OPERATOR_POS
(
   OPERATOR_ID          char(20) not null comment '操作员代码',
   POS_ID               char(2) not null comment '前台代码',
   primary key (OPERATOR_ID, POS_ID)
);

alter table OPERATOR_POS comment '操作员前台对应表';

/*==============================================================*/
/* Table: OPERATOR_STORE                                        */
/*==============================================================*/
create table OPERATOR_STORE
(
   OPERATOR_ID          char(20) not null comment '操作员代码',
   STORE_ID             char(2) not null comment '仓库代码',
   primary key (OPERATOR_ID, STORE_ID)
);

alter table OPERATOR_STORE comment '操作员仓库权限表';

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

alter table day_mon_rec comment '操作日志';

/*==============================================================*/
/* Table: fileupdate                                            */
/*==============================================================*/
create table fileupdate
(
   filename             varchar(255) not null comment '文件名',
   file                 longblob comment '文件',
   updatetime           timestamp comment '更新时间',
   primary key (filename)
);

alter table fileupdate comment '文件更新';

/*==============================================================*/
/* Table: infoclients                                           */
/*==============================================================*/
create table infoclients
(
   code                 char(50) comment '客户端'
);

alter table infoclients comment '客户端连接信息';

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

alter table j_upgrade comment '更新文件';

/*==============================================================*/
/* Table: line_sys                                              */
/*==============================================================*/
create table line_sys
(
   name                 varchar(50) not null comment '名称',
   lastnum              int comment '队列头部编码',
   frontnum             int comment '前面还有多少位',
   prefix               char(10) comment '前缀',
   id                   char(2) not null,
   primary key (name)
);

alter table line_sys comment '叫号/排队系统';

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

alter table ll_parameter comment '系统参数';

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

alter table net_connect comment '连接信息';

/*==============================================================*/
/* Table: operator_fixdiscount                                  */
/*==============================================================*/
create table operator_fixdiscount
(
   operator_id          varchar(20) not null comment '操作员ID',
   discount_rate        double not null comment '折扣率',
   primary key (operator_id)
);

alter table operator_fixdiscount comment '操作员固定折扣';

/*==============================================================*/
/* Table: operator_group                                        */
/*==============================================================*/
create table operator_group
(
   group_id             char(4) not null comment '组ID',
   group_name           char(20) comment '组名称',
   operator_id          char(20) not null comment '操作员',
   primary key (group_id, operator_id)
);

alter table operator_group comment '操作员组';

/*==============================================================*/
/* Table: operator_group_function                               */
/*==============================================================*/
create table operator_group_function
(
   group_id             char(4) not null comment '组ID',
   function_id          char(6) not null comment '权限ID',
   auth_right           char(1) comment '是否有此权限',
   primary key (group_id, function_id)
);

alter table operator_group_function comment '组权限';

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

alter table radio comment '点菜定专用';

/*==============================================================*/
/* Table: receive                                               */
/*==============================================================*/
create table receive
(
   receive_id           char(1) not null comment 'ID',
   com                  varchar(4) comment 'COM口',
   primary key (receive_id)
);

alter table receive comment '点菜宝接收基站信息';

/*==============================================================*/
/* Table: uoption                                               */
/*==============================================================*/
create table uoption
(
   opt_id               varchar(20) not null comment 'ID',
   opt_number           varchar(8) comment 'NUMBER',
   opt_effect           char(1) default 'Y' comment '选项',
   note                 varchar(500) comment '说明',
   primary key (opt_id)
);

alter table uoption comment '选项字典';

/*==============================================================*/
/* Table: version                                               */
/*==============================================================*/
create table version
(
   version              char(15) not null comment '版本号',
   create_date          date comment '更新日期',
   principal            char(100) comment '主要更新内容',
   pbl                  varchar(1000) comment '库文件',
   remark               varchar(1000) comment '备注',
   pbd                  varchar(1000) comment '库文件',
   primary key (version)
);

alter table version comment '软件版本记录';

alter table operator_fixdiscount add constraint fk_fixdiscount foreign key (operator_id)
      references OPERATOR (OPERATOR_ID) on delete cascade on update restrict;

