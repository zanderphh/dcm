/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-06 14:52:17                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER
(
   CUSTOMER_ID          varchar(10) not null comment '�ͻ����',
   CUSTOMER_ANAME       char(20) comment 'CUSTOMER)ANAME',
   CUSTOMER_NAME        char(60) comment '�ͻ�����',
   CUSTOMER_TYPE        char(10) comment '�ͻ����',
   CUST_ADDRESS         varchar(100) comment '�ͻ���ַ',
   CITY                 char(20) comment '���ڳ���',
   ZIPCODE              char(6) comment '�ʱ�',
   TEL                  char(20) comment '�绰',
   FAX                  char(20) comment '����',
   EMAIL                char(20) comment '�����ʼ�',
   PRINCIPAL            char(20) comment '������',
   CONTACT              char(20) comment '��ϵ��',
   CONTACTTEL           char(20) comment '��ϵ�˵绰',
   BANK                 char(40) comment '����',
   ACCOUNT_ID           char(20) comment '�ʺ�',
   TAX_ID               char(20) comment '˰��',
   IMPREST              double comment 'Ԥ����',
   FIRSTDAY             date comment '�״���������',
   LASTDAY              date comment '�����������',
   TOTAL_TIMES          int comment '���Ѵ���',
   SHOULDPAY            double comment 'Ӧ�����',
   FREE_CHARGE          double comment '�ⵥ���',
   YETPAY               double comment '�Ѹ����',
   NOTPAY               double comment 'δ�ս��',
   KEEP_ACCOUNT         double comment '���ʽ��',
   LOST_AMOUNT          double comment '�ܵ����',
   OPERATORNAME         char(20) comment 'ǰ̨����Ա',
   CREDITLEVEL          int comment '���ü���',
   PAYTYPE              char(14) comment '���ʽ',
   CREDITQUOTA          double comment '���ö��',
   DISCOUNT_RATE        double comment '�ۿ���',
   SEX                  char(2) comment '�Ա�',
   ID_CARD              char(18) comment '���֤����',
   BIRTHDAY             date comment '����',
   COMPANY              char(30) comment '��˾����',
   MOBILEPHONE          char(30) comment '�ƶ��绰',
   HOME_ADDRESS         char(100) comment '��ͥ�绰',
   REMARK               varchar(100) comment '��ע',
   ISVIP                char(1) comment '�Ƿ�VIP',
   VIP_CARD             varchar(25) comment 'VIP����',
   VIPDATE              date comment 'VIPȷ������',
   ISCOMPANY            char(1) default 'N' comment '�Ƿ�˾�ͻ�',
   dish_id              char(5),
   price                numeric(12,4),
   Customer_Py          varchar(20) comment 'ƴ������',
   if_all_discount      char(1) default 'n' comment '�Ƿ���������۱�־λ',
   up_flag              char(1) default '0' comment 'ͬ����־λ',
   healthnote           varchar(1000),
   tips_remark          varchar(1000),
   habitnote            varchar(1000),
   photo                longblob comment '��Ƭ',
   hs_weixin_vip        varchar(20),
   hme_id               varchar(30) comment '��Ӧ�������ˮID',
   userId               varchar(30) comment '��Ӧ����˻�ԱID',
   primary key (CUSTOMER_ID)
);

alter table CUSTOMER comment '�ͻ���Ϣ';

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
   CUSTOMER_TYPE_ID     char(2) not null comment '���ID',
   CUSTOMER_TYPE        char(10) comment '�������',
   primary key (CUSTOMER_TYPE_ID)
);

alter table CUSTOMER_TYPE comment '��Ա���';

/*==============================================================*/
/* Table: customer_eat_habit                                    */
/*==============================================================*/
create table customer_eat_habit
(
   customer_id          varchar(10) not null comment '�ͻ�ID',
   eat_habit            varchar(100) not null comment '��ζ',
   checked              char(1) not null comment '�Ƿ�ѡ��',
   primary key (customer_id)
);

alter table customer_eat_habit comment '��Ա����ϰ��';

/*==============================================================*/
/* Table: customer_familymember                                 */
/*==============================================================*/
create table customer_familymember
(
   fid                  int not null auto_increment comment 'ID',
   customer_id          varchar(18) not null comment '�ͻ�ID',
   name                 varchar(50) not null comment '����',
   sex                  varchar(2) comment '�ձ�',
   age                  int comment '����',
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

alter table customer_familymember comment '��Ա��ͥ��Ա';

/*==============================================================*/
/* Table: customer_telrecord                                    */
/*==============================================================*/
create table customer_telrecord
(
   customer_id          varchar(10) not null comment '�ͻ�ID',
   customer_aname       char(20) comment '�ͻ�����',
   customer_name        char(60) comment '�ͻ�����',
   customer_type        char(10) comment '�ͻ����',
   cust_address         varchar(100) comment '�ͻ���ַ',
   city                 char(20) comment '���ڳ���',
   zipcode              char(6) comment '�ʱ�',
   tel                  char(20) comment '�绰',
   fax                  char(20) comment '����',
   email                char(20) comment '����',
   principal            char(20) comment '������',
   contact              char(20) comment '��ϵ��',
   contacttel           char(20) comment '��ϵ�绰',
   bank                 char(40) comment '����',
   account_id           char(20) comment '�˻�',
   tax_id               char(20),
   imprest              double,
   firstday             date comment '�״�����ʱ��',
   lastday              date comment '�ϴ�����ʱ��',
   total_times          int comment '�ܹ����Ѵ���',
   shouldpay            double comment 'Ӧ����',
   free_charge          double comment '����',
   yetpay               double comment '�Ѹ���',
   notpay               double comment 'δ����',
   keep_account         double comment '���˽��',
   lost_amount          double comment '�ܵ����',
   operatorname         char(20) comment '����Ա',
   creditlevel          int,
   paytype              char(14) comment '���ʽ',
   creditquota          double,
   discount_rate        double comment '�ۿ���',
   sex                  char(2) comment '�Ա�',
   id_card              char(18) comment 'ID��',
   birthday             date comment '����',
   company              char(30) comment '��˾����',
   mobilephone          char(30) comment '�ƶ��绰',
   home_address         char(100) comment '��ͥסַ',
   remark               varchar(100) comment '��ע',
   isvip                char(1) comment '�Ƿ�VIP�ͻ�',
   vip_card             varchar(25) comment 'VIP����',
   vipdate              date,
   iscompany            char(1) default 'N' comment '�Ƿ����ڹ�˾�ͻ�',
   dish_id              char(5),
   price                numeric(12,4),
   customer_py          varchar(20) comment '�ͻ���ƴ',
   if_all_discount      char(1) default 'n' comment '�Ƿ������������',
   tel_time             timestamp comment '����ʱ��',
   tel_num              varchar(20) comment '�������',
   primary key (customer_id)
);

alter table customer_telrecord comment '�ͻ������¼';

/*==============================================================*/
/* Table: tbl_CardFillFlow                                      */
/*==============================================================*/
create table tbl_CardFillFlow
(
   CardFillID           int not null auto_increment comment 'ID',
   VIPCardID            int not null comment '��ID',
   Customer_ID          varchar(20) comment '�ͻ�ID',
   Customer_Aname       varchar(20) comment '�ͻ�����',
   PayType              varchar(20) comment '���ʽ',
   FillMoney            numeric(14,4) default 0 comment '���γ�ֵ���',
   ValidMoney           numeric(12,2) default 0 comment '������Ч���',
   pos_id               varchar(3) comment '���ѵ�ID',
   FillDate             timestamp default CURRENT_TIMESTAMP comment '��ֵ����',
   OperateDate          timestamp default CURRENT_TIMESTAMP comment '��������',
   OperatorName         varchar(20) comment '����Ա',
   CardFillRemark       varchar(250) comment '��ֵ��ע',
   presentmoney         numeric(14,4) comment '���ͽ��',
   salesperson          varchar(10) comment '����Ա',
   hisorder_id          char(18),
   up_flag              char(1) default '0',
   last_customer        int,
   primary key (CardFillID)
);

alter table tbl_CardFillFlow comment '��Ա��ֵ��';

/*==============================================================*/
/* Table: tbl_CardRule                                          */
/*==============================================================*/
create table tbl_CardRule
(
   CardRuleID           int not null auto_increment comment 'ID',
   CardTypeID           varchar(4) not null comment '�����ID',
   pos_id               varchar(3) comment '��������',
   DiscountRate         numeric(7,4) default 1 comment '�ۿ���',
   CDExpr               varchar(1000) default 'empty' comment '���۳��������ӣ�',
   CollectByMoney       numeric(14,2) default 0 comment '������',
   ByMoneyFlag          char(1) default '0' comment '���ַ�ʽ',
   ByMoneyPoint         numeric(9,4) comment '�����ֵ�',
   CollectBytimes       numeric(12,0) default 0 comment '��������',
   ByTimesPoint         numeric(9,4) comment '�������ֵ�',
   RuleStatus           char(1) default '0' comment '�����Ƿ�����',
   CardRuleRemark       varchar(250) comment '��ע',
   shift                varchar(10) comment '��Σ����ݰ�β�ͬ���ֲ�ͬ��',
   primary key (CardRuleID)
);

alter table tbl_CardRule comment 'VIP������';

/*==============================================================*/
/* Table: tbl_VIP                                               */
/*==============================================================*/
create table tbl_VIP
(
   VIPCardID            int not null auto_increment comment '����ID',
   CardTypeID           varchar(4) not null comment '�����ID',
   Customer_ID          varchar(20) comment '�ͻ�ID',
   Customer_Aname       varchar(20) comment '�ͻ�����',
   VIPNo                varchar(25) comment '����',
   Password             varchar(15) comment '����',
   CardDiscRate         numeric(7,4) default 1 comment '���ۿ���',
   FillAmount           numeric(12,2) default 0 comment '��ֵ�ܶ�',
   ValidMoney           numeric(12,2) default 0 comment '��Ч���',
   ExpendLeave          numeric(12,2) default 0,
   ExpendSum            numeric(14,2) default 0 comment '�����ܶ�',
   ExpendIntegral       numeric(12,4) default 0 comment '���ѻ����ܶ�',
   TimesLeave           numeric(12,2) default 0,
   ExpendTimes          numeric(12,2) default 0 comment '���Ѵ���',
   TimesIntegral        numeric(12,4) default 0 comment '���������ܶ�',
   TotalIntegral        numeric(12,4) default 0 comment '�����ܶ�',
   CardStatusFlag       varchar(10) default '0' comment '��״̬',
   VIPStartDate         timestamp default CURRENT_TIMESTAMP comment '��������',
   VIPEndDate           timestamp comment '��Ч��ֹ����',
   LastUseDate          timestamp comment '���ʹ������',
   OperatorName         varchar(20) comment '����Ա',
   CardRemark           varchar(250) comment '��ע',
   lastfilldate         timestamp comment '����ֵ����',
   up_flag              char(1) default '0' comment 'ͬ����־λ',
   primary key (VIPCardID)
);

alter table tbl_VIP comment '��Ա��';

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
   CardTypeID           varchar(4) not null comment '���ID',
   CardTypeName         varchar(50) comment '�������',
   CardTypeUsefullife   numeric(8,2) default 0 comment '��Ч�ڣ���λ����',
   EndAlterTime         numeric(7,0) default 0,
   CardTypeDeadLine     timestamp,
   CardTypeRemark       varchar(250),
   cz_flag              char(1) default 'n' comment '�Ƿ��ֵ��־λ',
   fx_flag              char(1),
   use_vip_flag         char(1) default '1' comment '�Ƿ����ñ�־λ',
   primary key (CardTypeID)
);

alter table tbl_VIPCardType comment 'VIP�����';

/*==============================================================*/
/* Table: tbl_VIPExpendFlow                                     */
/*==============================================================*/
create table tbl_VIPExpendFlow
(
   ExpendFlowID         int not null auto_increment comment 'ID',
   VIPCardID            int not null comment '��ID',
   ShouldPay            numeric(14,4) comment 'Ӧ�����',
   ExpendDate           timestamp comment '��������',
   ExpendWay            char(1) comment '���ѷ�ʽ��VIP��/�ֽ�',
   HisOrder_ID          varchar(20) default '0' comment '��ʷ�͵�ID',
   OperatorName         varchar(20) comment '����Ա',
   ExpendFlowRemark     varchar(250) comment '���ѱ�ע',
   expend_amt           numeric(14,4) default 0 comment '�������',
   integralflow         numeric(14,4) default 0 comment '����',
   up_flag              char(1) default '0' comment 'ͬ����־',
   last_customer        int,
   primary key (ExpendFlowID)
);

alter table tbl_VIPExpendFlow comment 'VIP�����Ѽ�¼';

alter table tbl_CardFillFlow add constraint FK_TBL_CARD_TBL_VIP_T_TBL_VIP foreign key (VIPCardID)
      references tbl_VIP (VIPCardID) on delete restrict on update cascade;

alter table tbl_CardRule add constraint FK_TBL_CARD_TBL_VIPCA_TBL_VIPC foreign key (CardTypeID)
      references tbl_VIPCardType (CardTypeID) on delete restrict on update cascade;

alter table tbl_VIP add constraint FK_TBL_VIP_TBL_VIPCA_TBL_VIPC foreign key (CardTypeID)
      references tbl_VIPCardType (CardTypeID) on delete restrict on update cascade;

alter table tbl_VIPExpendFlow add constraint FK_TBL_VIPE_TBL_VIP_T_TBL_VIP foreign key (VIPCardID)
      references tbl_VIP (VIPCardID) on delete restrict on update cascade;

