/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-06 14:52:17                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER
(
   CUSTOMER_ID          varchar(10) not null comment '客户编号',
   CUSTOMER_ANAME       char(20) comment 'CUSTOMER)ANAME',
   CUSTOMER_NAME        char(60) comment '客户姓名',
   CUSTOMER_TYPE        char(10) comment '客户类别',
   CUST_ADDRESS         varchar(100) comment '客户地址',
   CITY                 char(20) comment '所在城市',
   ZIPCODE              char(6) comment '邮编',
   TEL                  char(20) comment '电话',
   FAX                  char(20) comment '传真',
   EMAIL                char(20) comment '电子邮件',
   PRINCIPAL            char(20) comment '负责人',
   CONTACT              char(20) comment '联系人',
   CONTACTTEL           char(20) comment '联系人电话',
   BANK                 char(40) comment '银行',
   ACCOUNT_ID           char(20) comment '帐号',
   TAX_ID               char(20) comment '税号',
   IMPREST              double comment '预付金',
   FIRSTDAY             date comment '首次消费日期',
   LASTDAY              date comment '最近消费日期',
   TOTAL_TIMES          int comment '消费次数',
   SHOULDPAY            double comment '应付金额',
   FREE_CHARGE          double comment '免单金额',
   YETPAY               double comment '已付金额',
   NOTPAY               double comment '未收金额',
   KEEP_ACCOUNT         double comment '记帐金额',
   LOST_AMOUNT          double comment '跑单金额',
   OPERATORNAME         char(20) comment '前台操作员',
   CREDITLEVEL          int comment '信用级别',
   PAYTYPE              char(14) comment '付款方式',
   CREDITQUOTA          double comment '信用额度',
   DISCOUNT_RATE        double comment '折扣率',
   SEX                  char(2) comment '性别',
   ID_CARD              char(18) comment '身份证号码',
   BIRTHDAY             date comment '生日',
   COMPANY              char(30) comment '公司名称',
   MOBILEPHONE          char(30) comment '移动电话',
   HOME_ADDRESS         char(100) comment '家庭电话',
   REMARK               varchar(100) comment '备注',
   ISVIP                char(1) comment '是否VIP',
   VIP_CARD             varchar(25) comment 'VIP卡号',
   VIPDATE              date comment 'VIP确认日期',
   ISCOMPANY            char(1) default 'N' comment '是否公司客户',
   dish_id              char(5),
   price                numeric(12,4),
   Customer_Py          varchar(20) comment '拼音简码',
   if_all_discount      char(1) default 'n' comment '是否可整单打折标志位',
   up_flag              char(1) default '0' comment '同步标志位',
   healthnote           varchar(1000),
   tips_remark          varchar(1000),
   habitnote            varchar(1000),
   photo                longblob comment '照片',
   hs_weixin_vip        varchar(20),
   hme_id               varchar(30) comment '对应服务端流水ID',
   userId               varchar(30) comment '对应服务端会员ID',
   primary key (CUSTOMER_ID)
);

alter table CUSTOMER comment '客户信息';

/*==============================================================*/
/* Index: IDX_VIP_CARD                                          */
/*==============================================================*/
create unique index IDX_VIP_CARD on CUSTOMER
(
   VIP_CARD
);

/*==============================================================*/
/* Index: idx_customer_hs_weixin_vip                            */
/*==============================================================*/
create unique index idx_customer_hs_weixin_vip on CUSTOMER
(
   hs_weixin_vip
);

/*==============================================================*/
/* Table: CUSTOMER_TYPE                                         */
/*==============================================================*/
create table CUSTOMER_TYPE
(
   CUSTOMER_TYPE_ID     char(2) not null comment '类别ID',
   CUSTOMER_TYPE        char(10) comment '类别名称',
   primary key (CUSTOMER_TYPE_ID)
);

alter table CUSTOMER_TYPE comment '会员类别';

/*==============================================================*/
/* Table: customer_eat_habit                                    */
/*==============================================================*/
create table customer_eat_habit
(
   customer_id          varchar(10) not null comment '客户ID',
   eat_habit            varchar(100) not null comment '口味',
   checked              char(1) not null comment '是否选中',
   primary key (customer_id)
);

alter table customer_eat_habit comment '会员消费习惯';

/*==============================================================*/
/* Table: customer_familymember                                 */
/*==============================================================*/
create table customer_familymember
(
   fid                  int not null auto_increment comment 'ID',
   customer_id          varchar(18) not null comment '客户ID',
   name                 varchar(50) not null comment '名称',
   sex                  varchar(2) comment '姓别',
   age                  int comment '年龄',
   id_code              varchar(50),
   office_tel           varchar(50),
   mobile               varchar(50),
   home_tel             varchar(50),
   fax                  varchar(50),
   email                varchar(50),
   company              varchar(50),
   duty                 varchar(50),
   earning              int default 0,
   relation             varchar(50),
   birthday             date,
   primary key (fid)
);

alter table customer_familymember comment '会员家庭成员';

/*==============================================================*/
/* Table: customer_telrecord                                    */
/*==============================================================*/
create table customer_telrecord
(
   customer_id          varchar(10) not null comment '客户ID',
   customer_aname       char(20) comment '客户别名',
   customer_name        char(60) comment '客户名称',
   customer_type        char(10) comment '客户类别',
   cust_address         varchar(100) comment '客户地址',
   city                 char(20) comment '所在城市',
   zipcode              char(6) comment '邮编',
   tel                  char(20) comment '电话',
   fax                  char(20) comment '传真',
   email                char(20) comment '电邮',
   principal            char(20) comment '负责人',
   contact              char(20) comment '联系人',
   contacttel           char(20) comment '联系电话',
   bank                 char(40) comment '银行',
   account_id           char(20) comment '账户',
   tax_id               char(20),
   imprest              double,
   firstday             date comment '首次消费时间',
   lastday              date comment '上次消费时间',
   total_times          int comment '总共消费次数',
   shouldpay            double comment '应付款',
   free_charge          double comment '免零',
   yetpay               double comment '已付款',
   notpay               double comment '未付款',
   keep_account         double comment '挂账金额',
   lost_amount          double comment '跑单金额',
   operatorname         char(20) comment '操作员',
   creditlevel          int,
   paytype              char(14) comment '付款方式',
   creditquota          double,
   discount_rate        double comment '折扣率',
   sex                  char(2) comment '性别',
   id_card              char(18) comment 'ID卡',
   birthday             date comment '生日',
   company              char(30) comment '公司名称',
   mobilephone          char(30) comment '移动电话',
   home_address         char(100) comment '家庭住址',
   remark               varchar(100) comment '备注',
   isvip                char(1) comment '是否VIP客户',
   vip_card             varchar(25) comment 'VIP卡号',
   vipdate              date,
   iscompany            char(1) default 'N' comment '是否属于公司客户',
   dish_id              char(5),
   price                numeric(12,4),
   customer_py          varchar(20) comment '客户简拼',
   if_all_discount      char(1) default 'n' comment '是否可以整单打折',
   tel_time             timestamp comment '来电时间',
   tel_num              varchar(20) comment '来电号码',
   primary key (customer_id)
);

alter table customer_telrecord comment '客户来电记录';

/*==============================================================*/
/* Table: tbl_CardFillFlow                                      */
/*==============================================================*/
create table tbl_CardFillFlow
(
   CardFillID           int not null auto_increment comment 'ID',
   VIPCardID            int not null comment '卡ID',
   Customer_ID          varchar(20) comment '客户ID',
   Customer_Aname       varchar(20) comment '客户别名',
   PayType              varchar(20) comment '付款方式',
   FillMoney            numeric(14,4) default 0 comment '本次冲值金额',
   ValidMoney           numeric(12,2) default 0 comment '本次有效金额',
   pos_id               varchar(3) comment '消费点ID',
   FillDate             timestamp default CURRENT_TIMESTAMP comment '冲值日期',
   OperateDate          timestamp default CURRENT_TIMESTAMP comment '操作日期',
   OperatorName         varchar(20) comment '操作员',
   CardFillRemark       varchar(250) comment '充值备注',
   presentmoney         numeric(14,4) comment '赠送金额',
   salesperson          varchar(10) comment '推销员',
   hisorder_id          char(18),
   up_flag              char(1) default '0',
   last_customer        int,
   primary key (CardFillID)
);

alter table tbl_CardFillFlow comment '会员充值表';

/*==============================================================*/
/* Table: tbl_CardRule                                          */
/*==============================================================*/
create table tbl_CardRule
(
   CardRuleID           int not null auto_increment comment 'ID',
   CardTypeID           varchar(4) not null comment '卡类别ID',
   pos_id               varchar(3) comment '消费区域',
   DiscountRate         numeric(7,4) default 1 comment '折扣率',
   CDExpr               varchar(1000) default 'empty' comment '打折常数（因子）',
   CollectByMoney       numeric(14,2) default 0 comment '金额积分',
   ByMoneyFlag          char(1) default '0' comment '积分方式',
   ByMoneyPoint         numeric(9,4) comment '金额积分点',
   CollectBytimes       numeric(12,0) default 0 comment '次数积分',
   ByTimesPoint         numeric(9,4) comment '次数积分点',
   RuleStatus           char(1) default '0' comment '规则是否启用',
   CardRuleRemark       varchar(250) comment '备注',
   shift                varchar(10) comment '班次（根据班次不同积分不同）',
   primary key (CardRuleID)
);

alter table tbl_CardRule comment 'VIP卡规则';

/*==============================================================*/
/* Table: tbl_VIP                                               */
/*==============================================================*/
create table tbl_VIP
(
   VIPCardID            int not null auto_increment comment '自增ID',
   CardTypeID           varchar(4) not null comment '卡类别ID',
   Customer_ID          varchar(20) comment '客户ID',
   Customer_Aname       varchar(20) comment '客户别名',
   VIPNo                varchar(25) comment '卡号',
   Password             varchar(15) comment '密码',
   CardDiscRate         numeric(7,4) default 1 comment '卡折扣率',
   FillAmount           numeric(12,2) default 0 comment '冲值总额',
   ValidMoney           numeric(12,2) default 0 comment '有效金额',
   ExpendLeave          numeric(12,2) default 0,
   ExpendSum            numeric(14,2) default 0 comment '消费总额',
   ExpendIntegral       numeric(12,4) default 0 comment '消费积分总额',
   TimesLeave           numeric(12,2) default 0,
   ExpendTimes          numeric(12,2) default 0 comment '消费次数',
   TimesIntegral        numeric(12,4) default 0 comment '次数积分总额',
   TotalIntegral        numeric(12,4) default 0 comment '积分总额',
   CardStatusFlag       varchar(10) default '0' comment '卡状态',
   VIPStartDate         timestamp default CURRENT_TIMESTAMP comment '发卡日期',
   VIPEndDate           timestamp comment '有效截止日期',
   LastUseDate          timestamp comment '最后使用日期',
   OperatorName         varchar(20) comment '操作员',
   CardRemark           varchar(250) comment '备注',
   lastfilldate         timestamp comment '最后冲值日期',
   up_flag              char(1) default '0' comment '同步标志位',
   primary key (VIPCardID)
);

alter table tbl_VIP comment '会员卡';

/*==============================================================*/
/* Index: idx_tbl_vip_customer_id                               */
/*==============================================================*/
create index idx_tbl_vip_customer_id on tbl_VIP
(
   Customer_ID
);

/*==============================================================*/
/* Table: tbl_VIPCardType                                       */
/*==============================================================*/
create table tbl_VIPCardType
(
   CardTypeID           varchar(4) not null comment '类别ID',
   CardTypeName         varchar(50) comment '类别名称',
   CardTypeUsefullife   numeric(8,2) default 0 comment '有效期，单位：月',
   EndAlterTime         numeric(7,0) default 0,
   CardTypeDeadLine     timestamp,
   CardTypeRemark       varchar(250),
   cz_flag              char(1) default 'n' comment '是否冲值标志位',
   fx_flag              char(1),
   use_vip_flag         char(1) default '1' comment '是否启用标志位',
   primary key (CardTypeID)
);

alter table tbl_VIPCardType comment 'VIP卡类别';

/*==============================================================*/
/* Table: tbl_VIPExpendFlow                                     */
/*==============================================================*/
create table tbl_VIPExpendFlow
(
   ExpendFlowID         int not null auto_increment comment 'ID',
   VIPCardID            int not null comment '卡ID',
   ShouldPay            numeric(14,4) comment '应付金额',
   ExpendDate           timestamp comment '消费日期',
   ExpendWay            char(1) comment '消费方式（VIP卡/现金）',
   HisOrder_ID          varchar(20) default '0' comment '历史客单ID',
   OperatorName         varchar(20) comment '操作员',
   ExpendFlowRemark     varchar(250) comment '消费备注',
   expend_amt           numeric(14,4) default 0 comment '卡付金额',
   integralflow         numeric(14,4) default 0 comment '积分',
   up_flag              char(1) default '0' comment '同步标志',
   last_customer        int,
   primary key (ExpendFlowID)
);

alter table tbl_VIPExpendFlow comment 'VIP卡消费记录';

alter table tbl_CardFillFlow add constraint FK_TBL_CARD_TBL_VIP_T_TBL_VIP foreign key (VIPCardID)
      references tbl_VIP (VIPCardID) on delete restrict on update cascade;

alter table tbl_CardRule add constraint FK_TBL_CARD_TBL_VIPCA_TBL_VIPC foreign key (CardTypeID)
      references tbl_VIPCardType (CardTypeID) on delete restrict on update cascade;

alter table tbl_VIP add constraint FK_TBL_VIP_TBL_VIPCA_TBL_VIPC foreign key (CardTypeID)
      references tbl_VIPCardType (CardTypeID) on delete restrict on update cascade;

alter table tbl_VIPExpendFlow add constraint FK_TBL_VIPE_TBL_VIP_T_TBL_VIP foreign key (VIPCardID)
      references tbl_VIP (VIPCardID) on delete restrict on update cascade;

