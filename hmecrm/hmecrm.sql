/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-05 11:26:07                          */
/*==============================================================*/

/*==============================================================*/
/* Table: AUTOINS                                               */
/*==============================================================*/
create table AUTOINS
(
   INS_NAME             char(40) not null comment 'INS_NAME',
   INS_NUMBER           varchar(12) comment 'INS_NUMBER',
   INS_ID               char(2) not null comment 'INS_ID',
   primary key (INS_ID)
);

alter table AUTOINS comment 'AUTOINS';

/*==============================================================*/
/* Table: BAD_DISH_REASON                                       */
/*==============================================================*/
create table BAD_DISH_REASON
(
   BAD_DISH_REASON_ID   char(2) not null comment '�ϲ�ԭ�����',
   BAD_DISH_REASON_NAME char(40) comment '�ϲ�ԭ������',
   primary key (BAD_DISH_REASON_ID)
);

alter table BAD_DISH_REASON comment '�ϲ�ԭ���';

/*==============================================================*/
/* Table: BASE_EXPENSE                                          */
/*==============================================================*/
create table BASE_EXPENSE
(
   DISH_ID              char(5) not null,
   TABLE_TYPE           char(2) not null,
   START_TIME           time not null,
   END_TIME             time not null,
   primary key (DISH_ID, TABLE_TYPE, START_TIME, END_TIME)
);

/*==============================================================*/
/* Table: BASIC_SALARY_ITEM                                     */
/*==============================================================*/
create table BASIC_SALARY_ITEM
(
   SALARY_ITEM_ID       char(3) not null comment '��Ŀ����',
   SALARY_ITEM_NAME     char(20) comment '��Ŀ����',
   primary key (SALARY_ITEM_ID)
);

alter table BASIC_SALARY_ITEM comment '����������Ŀ��';

/*==============================================================*/
/* Table: BATCH                                                 */
/*==============================================================*/
create table BATCH
(
   BATCH_ID             char(14) not null comment 'BATCH_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   VENDOR_ID            char(12) comment 'vendor_id',
   PRICE                numeric(16,6) comment 'PRICE',
   YXQ                  timestamp comment 'YXQ',
   PCH                  char(20) comment '�������κ�',
   STR_IN_DATE          timestamp comment 'str_in_date',
   total                numeric(15,2),
   primary key (BATCH_ID)
);

alter table BATCH comment 'batch';

/*==============================================================*/
/* Index: idx_batch_goods_id                                    */
/*==============================================================*/
create index idx_batch_goods_id on BATCH
(
   GOODS_ID
);

/*==============================================================*/
/* Table: BILL                                                  */
/*==============================================================*/
create table BILL
(
   BILL_ID              char(18) not null comment '���ʵ���',
   HISORDER_ID          char(18) comment '�͵���',
   TICKET_NO            char(20) comment 'Ʊ�ݺ�',
   PAYTYPE              varchar(40) comment '�������',
   PAY_USAGE            char(14) comment '������;',
   REALPAY              numeric(12,2) comment 'ʵ�����',
   CHECKSTAND_NAME      char(14) comment '����̨',
   PAYEE                char(20) comment '����Ա',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   paydate              timestamp comment '��������',
   up_flag              char(1) default '0' comment 'ͬ����־',
   cj_flag              smallint default 0 comment '��Ͱ汾��',
   Vipno                varchar(20) comment '��Ա����',
   lqqty                int default 0 comment '����ȯ����',
   primary key (BILL_ID)
);

alter table BILL comment '���ʵ�';

/*==============================================================*/
/* Index: bill_hisorder_id_indexe                               */
/*==============================================================*/
create index bill_hisorder_id_indexe on BILL
(
   HISORDER_ID
);

/*==============================================================*/
/* Index: idx_bill_paytype                                      */
/*==============================================================*/
create index idx_bill_paytype on BILL
(
   PAYTYPE
);

/*==============================================================*/
/* Index: idx_bill_hisorder_id                                  */
/*==============================================================*/
create index idx_bill_hisorder_id on BILL
(
   HISORDER_ID
);

/*==============================================================*/
/* Table: BUYER                                                 */
/*==============================================================*/
create table BUYER
(
   BUYER_ID             varchar(5) not null comment '�ɹ�Ա���',
   BUYER_NAME           char(20) comment '�ɹ�Ա��',
   BUYER_GRP_ID         char(2) comment '�ɹ������',
   primary key (BUYER_ID)
);

alter table BUYER comment '�ɹ�Ա';

/*==============================================================*/
/* Table: BUYER_GRP                                             */
/*==============================================================*/
create table BUYER_GRP
(
   BUYER_GRP_ID         char(2) not null comment '�ɹ�����',
   BUYER_GRP_NAME       char(20) comment '�ɹ�������',
   primary key (BUYER_GRP_ID)
);

alter table BUYER_GRP comment '�ɹ���';

/*==============================================================*/
/* Table: CALC_SALARY_ITEM                                      */
/*==============================================================*/
create table CALC_SALARY_ITEM
(
   SALARY_ITEM_ID       char(3) not null,
   SALARY_ITEM_NAME     char(20) not null,
   SALARY_ITEM_FORM     char(150),
   primary key (SALARY_ITEM_ID)
);

/*==============================================================*/
/* Table: CD                                                    */
/*==============================================================*/
create table CD
(
   CD_ID                char(4) not null comment 'CD_ID',
   CD_NAME              char(40) comment 'CD_NAME',
   primary key (CD_ID)
);

alter table CD comment 'CD';

/*==============================================================*/
/* Table: CERTIFICATE_TYPE                                      */
/*==============================================================*/
create table CERTIFICATE_TYPE
(
   ID                   int not null auto_increment,
   CERTIFICATE_TYPE     char(20),
   primary key (ID)
);

/*==============================================================*/
/* Table: CERTIFICATION                                         */
/*==============================================================*/
create table CERTIFICATION
(
   CERTIFICATION_ID     char(3) not null comment 'CERTIFICATION_ID',
   CERTIFICATION_NAME   char(20) comment 'CERTIFICATION_NAME',
   primary key (CERTIFICATION_ID)
);

alter table CERTIFICATION comment 'ְ��';

/*==============================================================*/
/* Table: COMMITMONEY                                           */
/*==============================================================*/
create table COMMITMONEY
(
   COMMITMONEY_ID       char(13) not null comment '����Ա������',
   COMMITMONEY_DATE     date comment '��������',
   COMMITMONEY_TIME     time comment '����ʱ��',
   CHECKSTAND_NAME      char(14) comment '����̨',
   PAYEE                char(20) comment '����Ա',
   CASHIER              char(20) comment '����',
   PAYTYPE              char(14) comment '���㷽ʽ',
   COMMITMONEY          numeric(12,2) comment '������',
   primary key (COMMITMONEY_ID)
);

/*==============================================================*/
/* Table: CONTACT                                               */
/*==============================================================*/
create table CONTACT
(
   CONTACT_ID           char(14) not null comment '��ͬ��ˮ��',
   CONTACT_NO           char(20) comment '��ͬ��',
   VENDOR_ID            char(12) comment '�����̴���',
   CONTACT_DATE         timestamp comment '��ͬ����',
   OPERATOR_ID          char(4) comment '����Ա����',
   OPERATOR_DATE        timestamp comment '�޸�����',
   BUYER_GRP_ID         char(2) comment '�ɹ������',
   BUYER_ID             varchar(5) comment '�ɹ�Ա����',
   INVOICE_TYPE_ID      char(1) comment 'INVOICE_TYPE_ID',
   REMARK               longtext comment 'ժҪ',
   MODIFIER_ID          char(4) comment 'modifier_Id',
   MODIFY_DATE          timestamp comment 'modify_date',
   AUDITER_ID           char(4) comment '����˴���',
   AUDIT_DATE           timestamp comment '�������',
   IS_END               char(1) comment '��ͬ�Ƿ����',
   END_DATE             timestamp comment '��������',
   END_REASON           longtext comment '����ԭ��',
   IS_ACCOUNT           char(1) comment '�Ƿ����',
   CONTACT_TYPE_ID      char(1) comment '�ɹ���ͬ����',
   CONTACT_PROP_ID      char(1) comment '�ɹ���ͬ����1',
   DFDH                 char(14) comment '�Է�����',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   primary key (CONTACT_ID)
);

alter table CONTACT comment '�ɹ���ͬ��';

/*==============================================================*/
/* Table: CONTACT_DETAIL                                        */
/*==============================================================*/
create table CONTACT_DETAIL
(
   CONTACT_DETAIL_ID    char(14) not null comment 'contact_detail_id',
   CONTACT_ID           char(14) comment 'CONTACT_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   QTY                  numeric(12,6) comment 'QTY',
   PRICE                numeric(16,6) comment 'PRICE',
   DISCOUNT             numeric(12,2) comment 'DISCOUNT',
   REMARK               longtext comment 'remark',
   primary key (CONTACT_DETAIL_ID)
);

alter table CONTACT_DETAIL comment '��ͬ��ϸ';

/*==============================================================*/
/* Table: CONTACT_END_REASON                                    */
/*==============================================================*/
create table CONTACT_END_REASON
(
   CONTACT_END_REASON_ID char(1) not null comment 'contact_end_reason_id',
   CONTACT_END_REASON_NAME char(20) comment 'contact_end_reason_name',
   primary key (CONTACT_END_REASON_ID)
);

alter table CONTACT_END_REASON comment '��ͬ��ֹԭ��';

/*==============================================================*/
/* Table: CONTACT_FEE_OUT_TYPE                                  */
/*==============================================================*/
create table CONTACT_FEE_OUT_TYPE
(
   FEE_TYPE_ID          char(2) not null comment 'fee_type_id',
   FEE_TYPE_NAME        char(20) comment 'fee_type_name',
   primary key (FEE_TYPE_ID)
);

alter table CONTACT_FEE_OUT_TYPE comment 'contact_fee_out_type';

/*==============================================================*/
/* Table: CONTACT_OUT_FEE                                       */
/*==============================================================*/
create table CONTACT_OUT_FEE
(
   CONTACT_OUT_FEE_ID   char(14) not null comment 'contact_out_fee_id',
   CONTACT_OUT_FEE_NO   char(20) comment 'contact_out_fee_NO',
   CONTACT_OUT_FEE_DATE timestamp comment 'contact_out_fee_DATE',
   CONTACT_ID           char(14) comment 'contact_id',
   AMOUNT               numeric(12,2) comment 'amount',
   FEE_TYPE_ID          char(2) comment 'fee_type_id',
   OPERATOR_ID          char(4) comment 'OPERATOR_ID',
   OPERATOR_DATE        timestamp comment 'operator_date',
   REMARK               longtext comment 'remark',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   primary key (CONTACT_OUT_FEE_ID)
);

alter table CONTACT_OUT_FEE comment 'contact_out_fee';

/*==============================================================*/
/* Table: CONTACT_TYPE                                          */
/*==============================================================*/
create table CONTACT_TYPE
(
   CONTACT_TYPE_ID      char(1) not null comment '�ɹ���ͬ���ʹ���',
   CONTACT_TYPE_NAME    char(20) comment '�ɹ���ͬ��������',
   primary key (CONTACT_TYPE_ID)
);

alter table CONTACT_TYPE comment '�ɹ���ͬ����';

/*==============================================================*/
/* Table: CURORDER                                              */
/*==============================================================*/
create table CURORDER
(
   CURORDER_ID          varchar(18) not null comment '�͵�ID',
   POSNAME              varchar(50) comment '������',
   CUSTOMER_ID          varchar(20) comment '�ͻ�ID',
   CUSTOMER_ANAME       char(20) comment '�ͻ�����',
   CUSTOMER_NAME        char(60) comment '�ͻ�����',
   TABLENAME            char(20) comment '̨λ����',
   SHIFT                char(10) comment '���',
   ORDERDATE            timestamp comment '�㵥����',
   ORDERTIME            time comment '�㵥ʱ��',
   EXPENSETYPE          char(30) comment '�������ͣ��������ֹ����ţ�',
   PERSONNUMBER         float default 0 comment '����',
   WAITER               char(20) comment '����Ա',
   OPERATORNAME         char(20) comment '����Ա����',
   DISH_AMOUNT          decimal(16,2) default 0 comment '��Ʒ�ܶ�',
   ROOMFEE              decimal(16,2) default 0 comment '������',
   SRVFEE               decimal(16,2) default 0 comment '�����',
   AMOUNT               decimal(16,2) default 0 comment '�͵��ܶ�',
   DISCOUNT_RATE        decimal(16,2) default 1 comment '�ۿ���',
   DISCOUNT             decimal(16,2) default 0 comment '�ۿ۶�',
   SHOULDPAY            numeric(12,2) comment 'Ӧ����',
   KEEP_ACCOUNT         decimal(16,2) default 0 comment '���˽��',
   LOST_AMOUNT          decimal(16,2) default 0 comment '�ܵ����',
   YETPAY               decimal(16,2) default 0 comment '�Ѹ���',
   FREE_CHARGE          decimal(16,2) default 0 comment '������',
   NOTPAY               decimal(16,2) default 0 comment 'δ�����',
   paytype              char(20) comment '���ʽ',
   yetpay_temp          numeric(12,2),
   SRV_RATE             decimal(16) default 0 comment '�������',
   CANCEL_TABLE         char(2),
   CANCEL_TIME          timestamp,
   invoice_amount       numeric(12,2) default 0 comment '��Ʊ���',
   recheck              varchar(100) default 'N' comment '�˵���־',
   book_id              numeric(14,0) comment '��ӦԤ��ID',
   paytype_multi        varchar(60) comment '�ึ�ʽ��ϸ',
   strout_flag          char(1) default 'N' comment '��������־',
   vip_no               varchar(25) default '' comment '��Ա����',
   check_out            char(1) default '0',
   buf_dinner           char(1),
   all_discount         char(1) comment '�������۱�־λ',
   invoice_num          varchar(50) comment '��Ʊ��',
   flowno               varchar(20) comment '��ˮ��',
   calc_srv_flag        char(1),
   bs_flag              char(1),
   hme_id               varchar(30) comment '��Ӧ��������ˮID',
   containordernos      varchar(50) comment '����������',
   prepayamount         double comment 'Ԥ�����',
   order_upflag         char(1) comment 'ͬ����־λ',
   group_id             char(20),
   tableId              int comment '��Ӧ������̨λID',
   userId               int comment '��Ӧ�������û�ID',
   primary key (CURORDER_ID)
);

alter table CURORDER comment '��ǰ�͵�';

/*==============================================================*/
/* Index: idx_unique_tablename                                  */
/*==============================================================*/
create unique index idx_unique_tablename on CURORDER
(
   TABLENAME
);

/*==============================================================*/
/* Table: CURORDERDETAIL                                        */
/*==============================================================*/
create table CURORDERDETAIL
(
   CURORDERDETAIL_ID    varchar(18) not null comment '�͵���ϸID',
   CURORDER_ID          varchar(18) comment '�͵���',
   POSNAME              varchar(50) comment '������',
   DISH_ID              char(10) comment '��Ʒ����',
   DISHTYPE             char(10) comment '��Ʒ���',
   DISHNAME             char(100) comment '��Ʒ����',
   UNIT                 char(8) comment '��Ʒ��λ',
   QUANTITY             numeric(14,3) comment '����',
   NEW_FINISH_QTY       numeric(12,2),
   FINISH_QTY           numeric(12,2),
   PRICE                numeric(12,2) comment '�۸�',
   DISCOUNT_RATE        numeric(12,2) comment '�ۿ���',
   AFTER_DISCOUNT       numeric(12,2) comment '�ۺ���',
   DISHTYPE_ID          char(2) comment '��Ʒ���ID',
   TECHNICIAN_NAME      char(20) comment '����Ա',
   OPERATOR_NAME        char(20) comment '����Ա',
   DISH_TIME            timestamp comment '���ʱ��',
   COST                 numeric(12,4) comment '�ɱ�',
   ORDER_NO             char(20),
   KITCHEN_PRN          char(1) comment '�����ӡ��',
   dish_request         varchar(250) comment '��Ʒ����',
   Order_Flag           char(1) comment '���˱�־λ',
   bar_code             varchar(20) comment '����',
   kill_id              varchar(13) default '' comment '�˲���ϸID',
   present_amt          numeric(7,2) default 0 comment '���Ͷ�',
   frt_mng              varchar(24) default '' comment 'ǰ������',
   WAITER               char(20) comment '����Ա',
   commision_rate       numeric(14,4) default 0 comment '�����',
   kill_reason          varchar(100) comment '�˲�ԭ��',
   reuse_prn            varchar(5) default '0',
   commision            numeric(14,4) default 0 comment '��λ���',
   strout_flag          char(1) default 'N' comment '�����־λ',
   tablename            char(20) comment '̨λ���ƣ�ת��̨��',
   jf_flag              char(1) comment '���ֱ�־λ',
   tc_flag              timestamp comment '��ɱ�־λ',
   flow_id              varchar(20) comment '��ˮ��',
   order_flag1          char(1) comment '���˱�־λ1',
   temp_text            varchar(500) comment '��ʱ��ע�����ڳ���',
   end_time             timestamp comment '����ʱ��',
   clock_appoint        char(1) default '0' comment '���ӱ�־λ',
   commision_clock      numeric(14,4) comment '������ɶ�',
   ordertype            char(1) default '0' comment '������ͣ����ϡ����£�',
   hme_upflag           char(1) comment 'ͬ����־λ',
   detailId             varchar(10) comment '��Ӧ�������͵���ϸ��ˮID',
   primary key (CURORDERDETAIL_ID)
);

alter table CURORDERDETAIL comment '��ǰ�͵���ϸ';

/*==============================================================*/
/* Index: idx_curorderdetail_dish_id                            */
/*==============================================================*/
create index idx_curorderdetail_dish_id on CURORDERDETAIL
(
   DISH_ID
);

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
   CUSTOMER_TYPE_ID     char(2) not null comment 'customer_type_id',
   CUSTOMER_TYPE        char(10) comment 'customer_type',
   primary key (CUSTOMER_TYPE_ID)
);

alter table CUSTOMER_TYPE comment 'customer_type';

/*==============================================================*/
/* Table: DEGREE                                                */
/*==============================================================*/
create table DEGREE
(
   DEGREE_ID            char(3) not null comment 'ѧ������',
   DEGREE_NAME          char(20) comment 'ѧ������',
   primary key (DEGREE_ID)
);

alter table DEGREE comment 'ѧ��';

/*==============================================================*/
/* Table: DEL_DISH                                              */
/*==============================================================*/
create table DEL_DISH
(
   CURORDERDETAIL_ID    char(13) not null,
   CURORDER_ID          char(13),
   POSNAME              varchar(50),
   DISH_ID              char(10),
   DISHTYPE             char(10),
   DISHNAME             char(20),
   UNIT                 char(8),
   QUANTITY             double,
   NEW_FINISH_QTY       double,
   FINISH_QTY           double,
   PRICE                double,
   DISCOUNT_RATE        double,
   AFTER_DISCOUNT       double,
   DISHTYPE_ID          char(2),
   TECHNICIAN_NAME      char(20),
   OPERATOR_NAME        char(20),
   DISH_TIME            timestamp,
   TABLE_NAME           char(20),
   BACK_TIME            timestamp,
   BACK_REASON          varchar(100),
   DEL_OPER             char(20),
   cost                 numeric(14,4),
   order_no             varchar(20),
   kitchen_prn          char(1),
   dish_request         varchar(250),
   Order_Flag           char(1),
   bar_code             varchar(20),
   kill_id              varchar(13) default '',
   primary key (CURORDERDETAIL_ID)
);

/*==============================================================*/
/* Table: DEL_ORDER                                             */
/*==============================================================*/
create table DEL_ORDER
(
   CURORDER_ID          char(13) not null,
   POSNAME              varchar(50),
   CUSTOMER_ID          char(6),
   CUSTOMER_ANAME       char(20),
   CUSTOMER_NAME        char(60),
   TABLENAME            char(20),
   SHIFT                char(10),
   ORDERDATE            date,
   ORDERTIME            time,
   EXPENSETYPE          char(30),
   PERSONNUMBER         int,
   WAITER               char(20),
   OPERATORNAME         char(20),
   DISH_AMOUNT          double,
   ROOMFEE              double,
   SRVFEE               double,
   AMOUNT               double,
   DISCOUNT_RATE        double,
   DISCOUNT             double,
   SHOULDPAY            double,
   PAYTYPE              char(20),
   YETPAY_TEMP          numeric(12,2),
   SRV_RATE             numeric(3,0),
   FREE_CHARGE          numeric(12,2) default 0,
   KEEP_ACCOUNT         numeric(12,2),
   LOST_AMOUNT          numeric(12,2),
   YETPAY               numeric(12,2),
   NOTPAY               numeric(12,2),
   DEL_TIME             timestamp,
   DEL_REASON           varchar(100),
   DEL_OPER             char(20),
   id                   int not null auto_increment,
   up_flag              char(1) default '0',
   flowno               varchar(20),
   del_no               int default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: DEL_ORDER_DETAIL                                      */
/*==============================================================*/
create table DEL_ORDER_DETAIL
(
   CURORDERDETAIL_ID    char(13) not null,
   CURORDER_ID          char(13),
   POSNAME              varchar(50),
   DISH_ID              char(10),
   DISHTYPE             char(10),
   DISHNAME             char(100),
   UNIT                 char(8),
   QUANTITY             double,
   NEW_FINISH_QTY       double,
   FINISH_QTY           double,
   PRICE                double,
   DISCOUNT_RATE        double,
   AFTER_DISCOUNT       double,
   DISHTYPE_ID          char(2),
   TECHNICIAN_NAME      char(20),
   OPERATOR_NAME        char(20),
   DISH_TIME            timestamp,
   cost                 numeric(14,4),
   order_no             varchar(20),
   kitchen_prn          char(1),
   dish_request         varchar(250),
   Order_Flag           char(1),
   bar_code             varchar(20),
   kill_id              varchar(13) default '',
   WAITER               char(20),
   present_amt          numeric(7,2) default 0,
   frt_mng              varchar(24) default '',
   commision_rate       numeric(14,2) default 0,
   kill_reason          varchar(100),
   reuse_prn            varchar(5) default '0',
   id                   int not null auto_increment,
   commision            numeric(14,4) default 0,
   del_no               int default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: DEPARTMENT                                            */
/*==============================================================*/
create table DEPARTMENT
(
   DEPARTMENT_ID        char(2) not null comment '���Ŵ���',
   DEPARTMENT_NAME      char(20) comment '��������',
   primary key (DEPARTMENT_ID)
);

alter table DEPARTMENT comment '����';

/*==============================================================*/
/* Table: DISH                                                  */
/*==============================================================*/
create table DISH
(
   DISH_ID              char(10) not null comment '��Ʒ���',
   DISHTYPE             char(10) comment '��Ʒ���',
   POSNAME              varchar(50) comment '���ѵ�',
   DISHNAME             varchar(100) comment '��Ʒ����',
   UNIT                 char(8) comment '��Ʒ��λ',
   PRICE                numeric(12,2) comment '�۸�',
   COST                 numeric(12,2) comment '�ɱ�',
   ISSPECIAL            char(1) comment '�Ƿ���ɫ��',
   DISCOUNTABLE         char(1) comment '�ܷ����',
   DESCRIPTION          varchar(100) comment '˵��',
   PY                   char(20) comment 'ƴ������',
   LB1                  char(2) comment '���1',
   LB2                  char(2) comment '���2',
   LB3                  char(2) comment '��Ʒ���3',
   DISHTYPE_ID          char(2) comment '��Ʒ������',
   COMMISION_RATE       numeric(14,4) comment '���',
   NP                   char(1) comment 'ʱ��',
   NP_PRICE             numeric(14,2) comment 'ʱ�ۼ۸�',
   SP                   char(1) comment '����',
   SP_PRICE             numeric(12,2) comment '�����۸�',
   `USE`                char(1) comment '����',
   sp_start             timestamp comment '������ʼ����',
   sp_end               timestamp comment '������������',
   is_temp              char(1) default 'N' comment '�Ƿ���ʱ��Ʒ',
   ps                   varchar(1) default 'N' comment '�Ƿ������',
   commision            numeric(14,4) default 0 comment '��λ��ɶ�',
   dishename            varchar(100) comment '��ƷӢ����',
   base_expense         char(1) default 'Y' comment '�Ƿ����ڻ�������',
   tempnum              numeric(14,2) comment '��������',
   come_to              varchar(100),
   displaytype_id       char(2) comment '��Ʒ���ID',
   lb4                  char(2) comment '���ԣ���Ӧ��LB4',
   lb5                  char(2) comment '���ԣ���Ӧ��LB5',
   wd_flag              char(1) default '0' comment '�Ƿ�ɻ���',
   front_color          char(16) comment '��ʾǰ��ɫ',
   dishplay_order       int default 0 comment '����',
   zc_flag              char(1) comment '���ͱ�־λ',
   displayorder         numeric(5,2) comment '��ʾ˳��',
   min_number           numeric(14,2) comment '���屨����',
   is_print             char(1) default '1' comment '�Ƿ��ڽ��˵���ӡ',
   can_djq              char(1) default '1' comment '�Ƿ��ʹ��ȯ�Ըò�Ʒ���н���',
   is_upto_radio        char(1) default '1' comment '�Ƿ�ͬ������˱�ר�ñ�־λ��',
   return_money         char(1) default '0' comment '�Ƿ���뷵��',
   barcode              varchar(50) comment '����',
   is_maiduan           char(1) default '0' comment '�Ƿ������ϣ���ʱ���ѣ�',
   time_maiduan         int comment '���ʱ������ʱ���ѣ�',
   price_maiduan        numeric(14,2) comment '��ϼ۸񣨼�ʱ���ѣ�',
   clock_time           int comment '����ʱ������ʱ���ѣ�',
   clock_diff           int comment '����ƫ��ֵ����ʱ���ѣ�',
   commision_clock      numeric(14,4) comment '������ɣ���ʱ���ѣ�',
   is_time              char(1) default '0' comment '�Ƿ��ʱ���ѣ���ʱ���ѣ�',
   dish_tuijian         char(1) default '0' comment '�Ƿ��Ƽ� ',
   dish_tejia           char(1) default '0' comment '�Ƿ��ؼ�',
   ipadpage             int comment '��Ʒ����ҳ��IPADר�ã�',
   vip_price            numeric(14,2) default 0 comment '��Ա��',
   is_weight            char(1) comment '�Ƿ����',
   dish_index           int default 0 comment '��Ʒ˳��',
   dishtype_id1         char(2) comment '��ƷС�ࣨIPADר�ã�',
   is_haspic            char(1) default '0' comment '�Ƿ���ͼ',
   mod_flag             char(1) default '0' comment '�޸ı�־λ',
   dish_memo            varchar(5000) comment '��Ʒ��ע',
   dish_group_name      varchar(50) comment '��Ʒ����������',
   department           varchar(30),
   pc_temp              char(1) comment '�Ƿ����ͱ�־λ',
   amount               double,
   hme_id               varchar(30) comment '��Ӧ������ID�����è��',
   baseAmount           double,
   dishmustorder_group  char(2) comment '��Ӧ�������ص���飨���è��',
   primary key (DISH_ID)
);

alter table DISH comment '��Ʒ��ϸ';

/*==============================================================*/
/* Index: idx_dish_dishtype                                     */
/*==============================================================*/
create index idx_dish_dishtype on DISH
(
   DISHTYPE
);

/*==============================================================*/
/* Table: DISHTYPE                                              */
/*==============================================================*/
create table DISHTYPE
(
   DISHTYPE_ID          char(2) not null comment '������',
   POSNAME              varchar(50) comment '��������',
   DISHTYPE             char(10) comment '�������',
   EDISHTYPE            char(10) comment '���Ӣ������',
   dishtypecolor        char(16) comment '��ʾ��ɫ',
   displayorder         numeric(5,2) comment '��ʾ˳��',
   hme_id               varchar(30) comment '�����ID',
   primary key (DISHTYPE_ID)
);

alter table DISHTYPE comment '��Ʒ���';

/*==============================================================*/
/* Table: DISH_BACK_REASON                                      */
/*==============================================================*/
create table DISH_BACK_REASON
(
   DISH_BACK_REASON_ID  char(2) not null comment '�˲�ԭ�����',
   DISH_BACK_REASON_NAME char(40) comment '�˲�ԭ������',
   primary key (DISH_BACK_REASON_ID)
);

/*==============================================================*/
/* Table: DISH_CANCEL                                           */
/*==============================================================*/
create table DISH_CANCEL
(
   DISH_CANCEL_ID       char(13) not null comment '��Ʒȡ�����',
   ORDER_ID             char(13) not null comment '�͵���',
   DISH_ID              char(10) comment '��Ʒ����',
   QTY                  numeric(12,2) comment '����',
   KITCHEN_ID           char(2) comment '�������',
   REASON               char(40) comment '�˲�ԭ��',
   DEAL                 char(40) comment '����ʽ',
   PRINCIPAL            char(20) comment '������',
   primary key (DISH_CANCEL_ID)
);

alter table DISH_CANCEL comment '��Ʒȡ����';

/*==============================================================*/
/* Table: DISH_COMEBACK                                         */
/*==============================================================*/
create table DISH_COMEBACK
(
   DISH_COMEBACK_ID     char(13) not null comment '�˲˱��',
   ORDER_ID             char(13) not null comment '�͵���',
   DISH_ID              char(10) comment '��Ʒ���',
   QTY                  numeric(12,2) comment '����',
   KITCHEN_ID           char(2) comment '�������',
   REASON               char(40) comment '�˲�ԭ��',
   DEAL                 char(40) comment '����ʽ',
   PRINCIPAL            char(20) comment '������',
   primary key (DISH_COMEBACK_ID)
);

alter table DISH_COMEBACK comment '�˲˱�';

/*==============================================================*/
/* Table: DISH_LB1                                              */
/*==============================================================*/
create table DISH_LB1
(
   LB_ID                char(2) not null comment 'lb_id',
   LB_NAME              char(40) comment 'lb_name',
   primary key (LB_ID)
);

alter table DISH_LB1 comment 'dish_lb1';

/*==============================================================*/
/* Table: DISH_LB2                                              */
/*==============================================================*/
create table DISH_LB2
(
   LB_ID                char(2) not null comment 'lb_id',
   LB_NAME              char(40) comment 'lb_name',
   Printer              varchar(80),
   pos_print            char(1) default 'N',
   pip                  varchar(80),
   printer2             varchar(80),
   pip2                 varchar(80),
   printer3             varchar(80),
   pip3                 varchar(80),
   spareprint           char(1) default 'N',
   userspecil           char(1) default 'N',
   primary key (LB_ID)
);

alter table DISH_LB2 comment 'dish_lb2';

/*==============================================================*/
/* Table: DISH_LB3                                              */
/*==============================================================*/
create table DISH_LB3
(
   LB_ID                char(2) not null comment 'lb_id',
   LB_NAME              char(40) comment 'lb_name',
   displaycolor         char(16),
   displayorder         int,
   primary key (LB_ID)
);

alter table DISH_LB3 comment 'dish_lb3';

/*==============================================================*/
/* Table: DISH_MATERIAL                                         */
/*==============================================================*/
create table DISH_MATERIAL
(
   DISH_ID              char(10) not null comment '��Ʒ���',
   GOODS_ID             char(12) not null comment '��Ʒ���',
   GOODS_NAME           char(60) comment '��Ʒ����',
   UNIT                 char(10) comment '������λ',
   WASTAGE              numeric(12,6) comment '������',
   store_id             varchar(4),
   price                numeric(12,6),
   loss                 numeric(12,2) default 1,
   primary key (DISH_ID, GOODS_ID)
);

alter table DISH_MATERIAL comment '��Ʒԭ�����ı�';

/*==============================================================*/
/* Table: DISH_OUT                                              */
/*==============================================================*/
create table DISH_OUT
(
   CURORDER_ID          char(13) not null comment '��ǰ�͵����',
   POSNAME              varchar(50) comment '���ѵ�',
   CUSTOMER_ID          char(6) comment '�ͻ����',
   CUSTOMER_ANAME       char(20) comment '�ͻ����',
   CUSTOMER_NAME        char(60) comment '�ͻ�����',
   TABLENAME            char(20) comment '̨λ����',
   SHIFT                char(10) comment '���',
   ORDERDATE            date comment '�㵥����',
   ORDERTIME            time comment '�㵥ʱ��',
   EXPENSETYPE          char(10) comment '�������',
   PERSONNUMBER         int comment '�Ͳ�����',
   WAITER               char(20) comment '���Ա',
   OPERATORNAME         char(20) comment 'ǰ̨����Ա',
   DISH_AMOUNT          numeric(12,2) comment '��Ʒ�ܽ��',
   ROOMFEE              numeric(12,2) comment '������',
   SRVFEE               numeric(12,2) comment '�����',
   AMOUNT               numeric(12,2) comment '�͵��ܽ��',
   DISCOUNT_RATE        numeric(12,2) comment '���ۿ���',
   DISCOUNT             numeric(12,2) comment '�ۿ۽��',
   SHOULDPAY            numeric(12,2) comment 'Ӧ�����',
   primary key (CURORDER_ID)
);

alter table DISH_OUT comment '��Ʒ����';

/*==============================================================*/
/* Table: DISH_OUT_DETAIL                                       */
/*==============================================================*/
create table DISH_OUT_DETAIL
(
   CURORDERDETAIL_ID    char(13) not null comment 'CURORDERDETAIL_ID',
   CURORDER_ID          char(13) comment 'CURORDER_ID',
   POSNAME              varchar(50) comment 'POSNAME',
   DISH_ID              char(10) comment '��Ʒ���',
   DISHTYPE             char(10) comment 'DISHTYPE',
   DISHNAME             char(20) comment 'DISHNAME',
   UNIT                 char(8) comment 'UNIT',
   QUANTITY             numeric(12,2) comment 'QUANTITY',
   NEW_FINISH_QTY       numeric(12,2) comment '�³�������',
   FINISH_QTY           numeric(12,2) comment '��������',
   PRICE                numeric(12,2) comment 'PRICE',
   DISCOUNT_RATE        numeric(12,2) comment 'DISCOUNT RATE',
   AFTER_DISCOUNT       numeric(12,2) comment 'AFTER DISCOUNT',
   DISHTYPE_ID          char(2) comment 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa',
   primary key (CURORDERDETAIL_ID)
);

alter table DISH_OUT_DETAIL comment '��ǰ�͵���ϸ';

/*==============================================================*/
/* Table: DISH_RELA                                             */
/*==============================================================*/
create table DISH_RELA
(
   ID                   int not null auto_increment,
   MAIN_DISH            char(20),
   HYPO_DISH            char(20),
   HYPO_QTY             numeric(12,4),
   hypo_group           char(1),
   hypo_price           numeric(12,2),
   primary key (ID)
);

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
create table EMPLOYEE
(
   EMPLOYEE_ID          char(5) not null comment 'EMPLOYEE_ID',
   EMPLOYEE_NAME        char(20) comment 'ְԱ����',
   SERVICE_ID           char(4) comment '�������',
   DEPARTMENT_ID        char(3) comment '���Ŵ���',
   POSITION_ID          char(3) comment 'ְλ����',
   JOINDAY              timestamp comment '��������',
   QUITDAY              timestamp comment '��ְ����',
   HIRE_STATUS_ID       char(2) comment 'Ƹ��״̬����',
   SALARY_CLASS_ID      char(2) comment '���ʼ������',
   WORK_STATUS_ID       char(3) comment '�ù�״̬����',
   SEX                  char(2) comment '�Ա�',
   MARRIAGE_NAME        char(6) comment '���',
   NATIVE_ID            char(3) comment '�������',
   BIRTHDAY             timestamp comment '����',
   ID                   char(20) comment '���֤����',
   ADDRESS              char(100) comment '��ס��ַ',
   HOME_ADDRESS         char(100) comment '���õ�ַ',
   HOME_TEL             char(20) comment '��ͥ�绰',
   HOME_ZIPCODE         char(8) comment '��ͥ�ʱ�',
   MOBILEPHONE          char(40) comment '�ƶ��绰����',
   DEGREE_ID            char(3) comment 'ѧ������',
   CERTIFICATION_ID     char(2) comment 'ְ�ƴ���',
   SPECIALITY           char(40) comment '��ѧרҵ',
   COLLEGE              char(40) comment '��ҵԺУ',
   GRADUATE_DATE        timestamp comment '��ҵ����',
   MODIFY_DATE          timestamp comment '�Ǽ��޸�����',
   OPERATOR_NAME        char(10) comment '�Ǽ���',
   IS_SALARY            char(1) comment '�Ʒ�����',
   PHOTO                longblob comment '��Ƭ',
   REMARK               longtext comment '��ע',
   FILED1               char(10) comment '�����ֶ�1',
   FILED2               char(10) comment '�����ֶ�2',
   FILED3               char(10) comment '�����ֶ�3',
   FILED4               char(10) comment '�����ֶ�4',
   FILED5               numeric(12,2) comment '�����ֶ�5',
   FILED6               numeric(12,2) comment '�����ֶ�6',
   FILED7               numeric(12,2) comment '�����ֶ�7',
   e_name               varchar(100),
   jj_contact           varchar(100),
   jj_addr              varchar(100),
   jj_tel               varchar(100),
   id_card              char(20),
   diploma_zs           char(20),
   health_zs            char(2),
   marriage_zs          char(2),
   nowork_zs            char(2),
   idleness_zs          char(2),
   operate_zs           char(2),
   employ_zs            char(2),
   pic_num              char(2),
   dorm_no              char(20),
   bed_no               char(20),
   up_flag              char(1) default '0',
   primary key (EMPLOYEE_ID)
);

alter table EMPLOYEE comment 'ְԱ';

/*==============================================================*/
/* Table: EXPENSETYPE                                           */
/*==============================================================*/
create table EXPENSETYPE
(
   EXPENSETYPE          char(10) not null comment 'expensetype',
   primary key (EXPENSETYPE)
);

/*==============================================================*/
/* Table: FLAG                                                  */
/*==============================================================*/
create table FLAG
(
   FLAG_ID              char(10) not null comment '��־����',
   FLAG_NAME            char(20) comment '��־����',
   FLAG_BIT             char(1) comment '��־λ',
   primary key (FLAG_ID)
);

alter table FLAG comment '��־λ��';

/*==============================================================*/
/* Table: FRT_MGR                                               */
/*==============================================================*/
create table FRT_MGR
(
   FRT_MGR_ID           char(4) not null comment 'ǰ̨������',
   FRT_MGR_NAME         char(20) not null comment 'ǰ̨��������',
   primary key (FRT_MGR_ID)
);

/*==============================================================*/
/* Table: FUNCTION                                              */
/*==============================================================*/
create table FUNCTION
(
   FUNCTION_ID          char(6) not null comment '���ܴ���',
   FUNCTION_NAME        char(50) comment '��������',
   site                 char(50),
   description          varchar(256),
   operator             varchar(256),
   LB1                  char(50),
   LB2                  varchar(256),
   LB3                  varchar(256),
   window_name          varchar(100),
   argument1            varchar(100),
   argument2            varchar(100),
   argument3            varchar(100),
   argument4            varchar(100),
   argument5            varchar(100),
   argument6            varchar(100),
   argument7            varchar(100),
   argument8            varchar(100),
   argument9            varchar(100),
   argument10           varchar(100),
   argument11           varchar(100),
   argument12           varchar(100),
   argument13           varchar(100),
   argument14           varchar(100),
   argument15           varchar(100),
   rpt_header           varchar(100),
   rpt_foot             varchar(100),
   i_datawindow_type    numeric(4,0),
   open_type            char(1),
   ver_flag             varchar(5) default '0',
   site_id              char(2),
   primary key (FUNCTION_ID)
);

alter table FUNCTION comment '���ܱ�';

/*==============================================================*/
/* Table: GETTER                                                */
/*==============================================================*/
create table GETTER
(
   GETTER_ID            varchar(5) not null comment 'GETTER_ID',
   GETTER_NAME          char(20) comment 'GETTER_NAME',
   primary key (GETTER_ID)
);

alter table GETTER comment 'GETTER';

/*==============================================================*/
/* Table: GET_DEPARTMENT                                        */
/*==============================================================*/
create table GET_DEPARTMENT
(
   GET_DEPARTMENT_ID    char(2) not null comment 'get_department_id',
   GET_DEPARTMENT_NAME  char(20) comment 'get_department_name',
   primary key (GET_DEPARTMENT_ID)
);

alter table GET_DEPARTMENT comment 'get_department';

/*==============================================================*/
/* Table: GOODS                                                 */
/*==============================================================*/
create table GOODS
(
   GOODS_ID             char(16) not null comment '��Ʒ����',
   GOODS_NO             char(20) comment '��Ʒ��ˮ��',
   GOODS_NAME           char(40) comment '��Ʒ����',
   GOODS_ENAME          char(40) comment '��ƷӢ������',
   GOODS_LNAME          char(40) comment '��Ʒ��������',
   SPEC                 char(40) comment '���',
   SCCJ_ID              char(12) comment '��������',
   GOODS_UNIT           char(8) comment 'ɢ��������λ',
   PACK_UNIT            char(8) comment '����������λ',
   SZB                  int comment 'ɢ����',
   MIN_STORAGE          numeric(12,2) comment '��С���',
   MAX_STORAGE          numeric(12,2) comment '�����',
   BEST_STORAGE         numeric(12,2) comment '���ſ��',
   IS_MX                char(1) comment '�Ƿ���ϸ',
   IS_VALID             char(1) comment '�Ƿ���Ч',
   LB1_ID               char(2) comment 'LB1_ID',
   LB2_ID               char(2) comment 'LB2_ID',
   LB3_ID               char(2) comment 'LB3_ID',
   LB4_ID               char(2) comment 'LB4_ID',
   LB5_ID               char(2) comment 'LB5_ID',
   LB6_ID               char(2) comment 'LB6_ID',
   LB7_ID               char(2) comment 'LB7_ID',
   LB8_ID               char(2) comment 'LB8_ID',
   LB9_ID               char(2) comment 'LB9_ID',
   LB10_ID              char(2) comment 'LB10_ID',
   DM                   char(20) comment '����������',
   PY                   char(20) comment 'ƴ��������',
   BARCODE              char(40) comment '������',
   YXQ                  int comment '��Ч��',
   JJFS_ID              char(1) comment '�Ƽ۷�ʽ',
   YZH                  char(60) comment 'ҩ�ֺ�',
   KM_ID                char(16) comment '�����Ŀ',
   tradeprice           numeric(14,6),
   retailprice          numeric(14,6),
   store_id             char(3),
   primary key (GOODS_ID)
);

alter table GOODS comment 'GOODS';

/*==============================================================*/
/* Table: GOODS_DETAIL                                          */
/*==============================================================*/
create table GOODS_DETAIL
(
   GOODS_DETAIL_ID      char(14) not null comment '��Ʒ��ϸ�ʴ���',
   GOODS_ID             char(16) comment '��Ʒ����',
   STR_DATE             timestamp comment '��������',
   STORE_ID             char(2) comment '�ֿ����',
   BATCH_ID             char(14) comment '��Ʒ�����ˮ��',
   QTY                  numeric(12,6) comment '��������',
   REMAIN_QTY           numeric(12,2) comment '�������',
   REMAIN_AMOUNT        numeric(24,2) comment '������',
   IS_STR_IN            char(1) comment '������',
   STR_TYPE_NAME        char(20) comment '����ⷽʽ����',
   STR_BILL_ID          char(14) comment '����ⵥ��',
   OPERATOR_NAME        char(20) comment '�ֿ����Ա',
   REMARK               longtext comment 'ժҪ',
   price_ydpj           numeric(12,4) default 0,
   price_xjxc_next      numeric(12,4) default 0,
   price_xjxc_this      numeric(12,4) default 0,
   price                decimal(14,6),
   primary key (GOODS_DETAIL_ID)
);

alter table GOODS_DETAIL comment '��Ʒ��ϸ��';

/*==============================================================*/
/* Index: idx_goods_detail_goods_id                             */
/*==============================================================*/
create index idx_goods_detail_goods_id on GOODS_DETAIL
(
   GOODS_ID
);

/*==============================================================*/
/* Table: GOODS_LEVEL                                           */
/*==============================================================*/
create table GOODS_LEVEL
(
   LEVEL_ID             char(1) not null comment 'level_id',
   LEVEL_NAME           char(20) comment 'level_name',
   LEVEL_LEN            int comment '���볤��',
   TOTAL_LEN            int comment '�ܳ���',
   primary key (LEVEL_ID)
);

alter table GOODS_LEVEL comment '��Ʒ������';

/*==============================================================*/
/* Table: GOODS_UNIT                                            */
/*==============================================================*/
create table GOODS_UNIT
(
   GOODS_UNIT           char(4) not null comment 'GOODS_UNIT',
   primary key (GOODS_UNIT)
);

alter table GOODS_UNIT comment 'GOODS_UNIT';

/*==============================================================*/
/* Table: GROUP_ACCOUNT                                         */
/*==============================================================*/
create table GROUP_ACCOUNT
(
   GROUP_ACCOUNT_ID     char(14) not null comment '���ʺŴ���',
   GROUP_ACCOUNT_NAME   char(20) comment '���ʺ�����',
   REMARK               char(40) comment '��ע',
   primary key (GROUP_ACCOUNT_ID)
);

alter table GROUP_ACCOUNT comment '���ʺ�';

/*==============================================================*/
/* Table: GROUP_ACCOUNT_CURORDER                                */
/*==============================================================*/
create table GROUP_ACCOUNT_CURORDER
(
   GROUP_ACCOUNT_ID     char(14) not null comment '���ʺŴ���',
   CURORDER_ID          char(14) not null comment '��ǰ�͵���',
   primary key (GROUP_ACCOUNT_ID, CURORDER_ID)
);

alter table GROUP_ACCOUNT_CURORDER comment '���ʺż���ǰ�͵���Ӧ��';

/*==============================================================*/
/* Table: HIRE_STATUS                                           */
/*==============================================================*/
create table HIRE_STATUS
(
   HIRE_STATUS_ID       char(2) not null comment 'Ƹ��״̬����',
   HIRE_STATUS_NAME     char(10) comment 'Ƹ��״̬����',
   primary key (HIRE_STATUS_ID)
);

alter table HIRE_STATUS comment 'Ƹ��״̬';

/*==============================================================*/
/* Table: HISORDER                                              */
/*==============================================================*/
create table HISORDER
(
   HISORDER_ID          char(18) not null comment '��ʷ�͵���',
   POSNAME              varchar(50) comment '���ѵ�����',
   CUSTOMER_ID          varchar(20) comment '�ͻ����',
   CUSTOMER_ANAME       char(20) comment '�ͻ����',
   CUSTOMER_NAME        char(60) comment '�ͻ�����',
   TABLENAME            char(20) comment '̨λ����',
   SHIFT                char(10) comment '���',
   ORDERTIME            time comment '�㵥ʱ��',
   BILL_TIME            time comment '����ʱ��',
   EXPENSETYPE          char(30) comment '�������',
   PERSONNUMBER         int comment '�Ͳ�����',
   WAITER               char(20) comment '���Ա',
   OPERATORNAME         char(20) comment 'ǰ̨����Ա',
   DISH_AMOUNT          numeric(12,2) comment '��Ʒ�ܶ�',
   ROOMFEE              numeric(12,2) comment '������',
   SRVFEE               numeric(12,2) comment '�����',
   AMOUNT               numeric(12,2) comment '�ܽ��',
   DISCOUNT_RATE        numeric(12,2) comment '���ۿ���',
   DISCOUNT             numeric(12,2) comment '�ۿ۽��',
   SHOULDPAY            numeric(12,2) comment 'Ӧ�����',
   YETPAY               numeric(12,2) comment '�Ѹ����',
   NOTPAY               numeric(12,2) comment 'δ�����',
   KEEP_ACCOUNT         numeric(12,2) comment '���ʽ��',
   LOST_AMOUNT          numeric(12,2) comment '�ܵ����',
   FREE_CHARGE          numeric(12,2) comment '�ⵥ���',
   FRT_MGR_NAME         char(20) comment 'ǰ̨����',
   GNR_MGR_NAME         char(20) comment '�ܾ���',
   PAYSTATUS            char(10) comment '����״̬',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   orderdate            timestamp comment '�㵥����',
   bill_date            timestamp comment '��������',
   invoice_amount       numeric(12,2) comment '��Ʊ���',
   BILL_OPER            char(20),
   recheck              varchar(100) default 'N' comment '�Ƿ��˵���־',
   paytype              varchar(20) comment '���ʽ',
   book_id              numeric(14,0) comment 'Ԥ����ID',
   strout_flag          char(1) default 'N' comment '��������־λ',
   paytype_multi        varchar(60) comment '�ึ�ʽ��ϸ',
   up_flag              char(1) default '0' comment '�Ƿ�ͬ����־λ',
   check_out            char(1) default '0' comment '��Ͱ���',
   day_flag             char(1) default '0' comment '��Ͱ���',
   check_date           timestamp comment '��Ͱ���',
   zf_je                numeric(12,2) comment '��Ͱ���',
   zl_je                numeric(12,2) comment '��Ͱ���',
   qj_flag              timestamp comment '��Ͱ���',
   tuoji                char(1) comment '��Ͱ���',
   buf_dinner           char(1),
   all_discount         char(1) comment '�������۱�־λ',
   invoice_num          varchar(50) comment '��Ʊ����',
   flowno               varchar(20) comment 'ͬ����ˮ��',
   memo                 varchar(1000) comment '�͵���ע',
   calc_srv_flag        char(1),
   jf2cash              numeric(14,2) comment '���ֵ��ֽ��',
   bs_flag              char(1),
   vipno_linkage        varchar(20) comment '��������',
   vippwd_linkage       varchar(20) comment '��������',
   hme_id               varchar(30) comment '��Ӧ��������ˮID',
   containordernos      varchar(50) comment '����������',
   prepayamount         double comment 'Ԥ����',
   order_upflag         char(1) comment 'ͬ����־λ',
   group_id             char(20),
   tableId              int comment '��Ӧ������̨λID',
   userId               int comment '��Ӧ�������û�ID',
   primary key (HISORDER_ID)
);

alter table HISORDER comment '��ʷ�͵�';

/*==============================================================*/
/* Index: idx_hisorder_posname                                  */
/*==============================================================*/
create index idx_hisorder_posname on HISORDER
(
   POSNAME
);

/*==============================================================*/
/* Index: idx_hisorder_tablename                                */
/*==============================================================*/
create index idx_hisorder_tablename on HISORDER
(
   TABLENAME
);

/*==============================================================*/
/* Index: idx_hisorder_shift                                    */
/*==============================================================*/
create index idx_hisorder_shift on HISORDER
(
   SHIFT
);

/*==============================================================*/
/* Index: idx_bill_date                                         */
/*==============================================================*/
create index idx_bill_date on HISORDER
(
   bill_date
);

/*==============================================================*/
/* Table: HISORDERDETAIL                                        */
/*==============================================================*/
create table HISORDERDETAIL
(
   HISORDERDETAIL_ID    char(18) not null comment '�͵���ϸID',
   HISORDER_ID          char(18) not null comment '�͵�ID',
   POSNAME              varchar(50) comment '��������',
   DISH_ID              char(10) comment '��Ʒ���',
   DISHTYPE             char(10) comment '��Ʒ���',
   DISHNAME             char(100) comment '��Ʒ����',
   UNIT                 char(8) comment '��λ',
   QUANTITY             numeric(14,3) comment '����',
   PRICE                numeric(12,2) comment '�۸�',
   DISCOUNT_RATE        numeric(12,2) comment '�ۿ���',
   AFTER_DISCOUNT       numeric(12,2) comment '�ۺ���',
   DISHTYPE_ID          char(2) comment '��Ʒ���ID',
   technician_name      char(20) default '' comment '����Ա',
   OPERATOR_NAME        char(20) comment '����Ա',
   DISH_TIME            timestamp comment '���ʱ��',
   COST                 numeric(12,4) comment '�ɱ�',
   ORDER_NO             char(20),
   dish_request         varchar(250) comment '��Ʒ����',
   Order_Flag           char(1) comment '���˱�־',
   bar_code             varchar(20) comment '����',
   kill_id              varchar(13) default '' comment '�˲���ϸID',
   present_amt          numeric(7,2) default 0 comment '���ͽ��',
   frt_mng              varchar(24) default '' comment 'ǰ������',
   WAITER               char(20) comment '����Ա',
   commision_rate       numeric(14,4) default 0 comment '���������',
   kill_reason          varchar(100) comment '�˲�ԭ��',
   commision            numeric(14,4) default 0 comment '��λ���',
   strout_flag          char(1) default 'N' comment '��������־λ',
   up_flag              char(1) default '0' comment 'ͬ����־λ',
   tablename            char(20) comment '̨λ���ƣ�ת��̨��',
   flow_id              varchar(20) comment '��ˮ��',
   end_time             timestamp comment '����ʱ��',
   clock_appoint        char(1),
   commision_clock      numeric(14,4) comment '�������',
   str_out_bill_id      varchar(20) comment '��Ӧ���������ϸID',
   kitchen_prn          char(1) comment '�����ӡ��',
   jf_flag              char(1) comment '���ֱ�־λ',
   ordertype            char(1) default '0' comment '������ͣ����ϡ����£�',
   detailId             varchar(10) comment '��Ӧ�������͵���ϸID',
   primary key (HISORDERDETAIL_ID)
);

alter table HISORDERDETAIL comment '��ʷ�͵���ϸ';

/*==============================================================*/
/* Index: idx_hisorderdetail_hisorder_id                        */
/*==============================================================*/
create index idx_hisorderdetail_hisorder_id on HISORDERDETAIL
(
   HISORDER_ID
);

/*==============================================================*/
/* Index: idx_hisorderdetail_dish_id                            */
/*==============================================================*/
create index idx_hisorderdetail_dish_id on HISORDERDETAIL
(
   DISH_ID
);

/*==============================================================*/
/* Index: idx_hisorderdetail_posname                            */
/*==============================================================*/
create index idx_hisorderdetail_posname on HISORDERDETAIL
(
   POSNAME
);

/*==============================================================*/
/* Index: idx_hisorder_technician_name                          */
/*==============================================================*/
create index idx_hisorder_technician_name on HISORDERDETAIL
(
   technician_name
);

/*==============================================================*/
/* Table: HZK                                                   */
/*==============================================================*/
create table HZK
(
   HZ                   varchar(2) not null,
   PYM                  varchar(1),
   primary key (HZ)
);

/*==============================================================*/
/* Table: INSTALL                                               */
/*==============================================================*/
create table INSTALL
(
   INSTALL_ID           char(4) not null comment 'install_id',
   INSTALL_DATE         timestamp comment 'install_date',
   USE_DAY              int comment 'use_day',
   primary key (INSTALL_ID)
);

alter table INSTALL comment 'install';

/*==============================================================*/
/* Table: INVOICE                                               */
/*==============================================================*/
create table INVOICE
(
   INVOICE_ID           char(14) not null comment 'INVOICE_ID',
   INVOICE_NO           char(20) comment 'INVOICE_NO',
   INVOICE_DATE         timestamp comment 'INVOICE_DATE',
   CONTACT_ID           char(14) comment 'CONTACT_ID',
   AMOUNT               numeric(12,2) comment 'AMOUNT',
   INVOICE_TYPE_ID      char(1) comment 'INVOICE_TYPE_ID',
   OPERATOR_ID          char(4) comment 'OPERATOR_ID',
   OPERATOR_DATE        timestamp comment 'operator_date',
   REMARK               longtext comment 'remark',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   primary key (INVOICE_ID)
);

alter table INVOICE comment 'INVOICE';

/*==============================================================*/
/* Table: INVOICE_TYPE                                          */
/*==============================================================*/
create table INVOICE_TYPE
(
   INVOICE_TYPE_ID      char(1) not null comment 'INVOICE_TYPE_ID',
   INVOICE_TYPE_NAME    char(20) comment 'INVOICE_TYPE_name',
   primary key (INVOICE_TYPE_ID)
);

alter table INVOICE_TYPE comment 'INVOICE_TYPE';

/*==============================================================*/
/* Table: JJFS                                                  */
/*==============================================================*/
create table JJFS
(
   JJFS_ID              char(1) not null comment '�Ƽ۷�ʽ����',
   JJFS_NAME            char(20) comment '�Ƽ۷�ʽ����',
   primary key (JJFS_ID)
);

alter table JJFS comment '�Ƽ۷�ʽ';

/*==============================================================*/
/* Table: KM                                                    */
/*==============================================================*/
create table KM
(
   KM_ID                char(16) not null comment '��Ŀ����',
   KM_NAME              char(40) comment '��Ŀ����',
   primary key (KM_ID)
);

alter table KM comment '�����Ŀ';

/*==============================================================*/
/* Table: LB1                                                   */
/*==============================================================*/
create table LB1
(
   LB1_ID               char(2) not null comment 'LB1_ID',
   LB1_NAME             char(20) comment 'LB1_NAME',
   primary key (LB1_ID)
);

alter table LB1 comment 'LB1';

/*==============================================================*/
/* Table: LB2                                                   */
/*==============================================================*/
create table LB2
(
   LB2_ID               char(2) not null comment 'LB2_ID',
   LB2_NAME             char(20) comment 'LB2_NAME',
   primary key (LB2_ID)
);

alter table LB2 comment 'LB2';

/*==============================================================*/
/* Table: LB3                                                   */
/*==============================================================*/
create table LB3
(
   LB3_ID               char(2) not null comment 'LB3_ID',
   LB3_NAME             char(20) comment 'LB3_NAME',
   primary key (LB3_ID)
);

alter table LB3 comment 'LB3';

/*==============================================================*/
/* Table: LB4                                                   */
/*==============================================================*/
create table LB4
(
   LB4_ID               char(2) not null comment 'LB4_ID',
   LB4_NAME             char(20) comment 'LB4_NAME',
   primary key (LB4_ID)
);

alter table LB4 comment 'LB4';

/*==============================================================*/
/* Table: LB5                                                   */
/*==============================================================*/
create table LB5
(
   LB5_ID               char(2) not null comment 'LB5_ID',
   LB5_NAME             char(20) comment 'LB5_NAME',
   primary key (LB5_ID)
);

alter table LB5 comment 'LB5';

/*==============================================================*/
/* Table: LB6                                                   */
/*==============================================================*/
create table LB6
(
   LB6_ID               char(2) not null comment 'LB6_ID',
   LB6_NAME             char(20) comment 'LB6_NAME',
   primary key (LB6_ID)
);

alter table LB6 comment 'LB6';

/*==============================================================*/
/* Table: LB7                                                   */
/*==============================================================*/
create table LB7
(
   LB7_ID               char(2) not null comment 'LB7_ID',
   LB7_NAME             char(20) comment 'LB7_NAME',
   primary key (LB7_ID)
);

alter table LB7 comment 'LB7';

/*==============================================================*/
/* Table: LB8                                                   */
/*==============================================================*/
create table LB8
(
   LB8_ID               char(2) not null comment 'LB8_ID',
   LB8_NAME             char(20) comment 'LB8_NAME',
   primary key (LB8_ID)
);

alter table LB8 comment 'LB8';

/*==============================================================*/
/* Table: LB9                                                   */
/*==============================================================*/
create table LB9
(
   LB9_ID               char(2) not null comment 'LB9_ID',
   LB9_NAME             char(20) comment 'LB9_NAME',
   primary key (LB9_ID)
);

alter table LB9 comment 'LB9';

/*==============================================================*/
/* Table: LICENSE                                               */
/*==============================================================*/
create table LICENSE
(
   ID                   int not null auto_increment,
   COMP_NO              char(20),
   COMPANY              varchar(100),
   ABBR                 varchar(100),
   SOFTNAME             varchar(100),
   SOFTUSAGE            varchar(100),
   SOFTVERSION          char(20),
   TEL                  varchar(100),
   FAX                  varchar(100),
   EMAIL                varchar(100),
   HTTP                 varchar(100),
   ADDR                 varchar(100),
   POSTALCODE           char(20),
   REMARK               varchar(1000),
   primary key (ID)
);

/*==============================================================*/
/* Index: COMP_NO                                               */
/*==============================================================*/
create unique index COMP_NO on LICENSE
(
   COMP_NO
);

/*==============================================================*/
/* Table: MAJOR                                                 */
/*==============================================================*/
create table MAJOR
(
   MAJOR_ID             char(2) not null comment 'רҵ����',
   MAJOR_NAME           char(40) comment 'רҵ����',
   primary key (MAJOR_ID)
);

alter table MAJOR comment 'רҵ';

/*==============================================================*/
/* Table: MARRIAGE                                              */
/*==============================================================*/
create table MARRIAGE
(
   MARRIAGE_ID          char(2) not null comment '����״̬����',
   MARRIAGE_NAME        char(10) comment '����״̬����',
   primary key (MARRIAGE_ID)
);

alter table MARRIAGE comment '����״̬';

/*==============================================================*/
/* Table: NATIVE                                                */
/*==============================================================*/
create table NATIVE
(
   NATIVE_ID            char(3) not null comment '�������',
   NATIVE_NAME          char(20) comment '��������',
   primary key (NATIVE_ID)
);

alter table NATIVE comment '����';

/*==============================================================*/
/* Table: NETCARD                                               */
/*==============================================================*/
create table NETCARD
(
   NETCARD_ID           char(20) not null,
   SERIAL_NO            char(40),
   primary key (NETCARD_ID)
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
   discount             char(3) default '100',
   present_amt          numeric(7,2) default 0 comment '�����ͽ��',
   free_amount          numeric(7,2) default 0,
   group_id             char(4),
   is_addcust           char(1) default 'N',
   is_adddish           char(1) default 'N',
   logintime            char(30),
   edit_pwd_time        varchar(20),
   is_new_pwd           char(1) default '0',
   operator_num         varchar(100),
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
/* Table: ORDER_PRN                                             */
/*==============================================================*/
create table ORDER_PRN
(
   ID                   int not null auto_increment comment '���',
   HISORDER_ID          char(18) comment '��ʷ�͵���',
   POSNAME              varchar(50) comment '���ѵ�����',
   CUSTOMER_NAME        char(60) comment '�ͻ�����',
   TABLENAME            char(20) comment '̨λ����',
   SHIFT                char(10) comment '���',
   ORDERDATE            date comment '�㵥����',
   EXPENSETYPE          char(30) comment '��˵���',
   OPERATORNAME         char(20) comment 'ǰ̨����Ա',
   SHOULDPAY            numeric(12,4) comment 'Ӧ�����',
   PRN_NO               numeric(2,0) comment '�ڼ��δ�ӡ',
   up_flag              char(1) default '0',
   memo                 varchar(100),
   customer_id          varchar(20),
   discount_rate        decimal(16,2),
   free_charge          decimal(16,2),
   roomfee              decimal(16,2),
   srv_fee              decimal(16,2),
   paytype              varchar(20),
   primary key (ID)
);

alter table ORDER_PRN comment '�͵���ӡ��¼';

/*==============================================================*/
/* Index: idx_order_prn_hisorder_id                             */
/*==============================================================*/
create index idx_order_prn_hisorder_id on ORDER_PRN
(
   HISORDER_ID
);

/*==============================================================*/
/* Table: PAYMENT                                               */
/*==============================================================*/
create table PAYMENT
(
   PAYMENT_ID           char(14) not null comment 'PAYMENT_ID',
   PAYMENT_DATE         timestamp comment 'PAYMENT_DATE',
   CONTACT_ID           char(14) comment 'CONTACT_ID',
   AMOUNT               numeric(12,2) comment 'AMOUNT',
   PAYMENT_TYPE_ID      char(1) comment 'PAYMENT_TYPE_ID',
   PAYMENT_USAGE_ID     char(1) comment 'PAYMENT_USAGE_ID',
   PAYMENT_NO           char(20) comment 'PAYMENT_NO',
   OPERATOR_ID          char(4) comment 'OPERATOR_ID',
   OPERATOR_DATE        timestamp comment 'operator_date',
   REMARK               longtext comment 'remark',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   primary key (PAYMENT_ID)
);

alter table PAYMENT comment 'PAYMENT';

/*==============================================================*/
/* Table: PAYMENT_TYPE                                          */
/*==============================================================*/
create table PAYMENT_TYPE
(
   PAYMENT_TYPE_ID      char(1) not null comment 'PAYMENT_TYPE_ID',
   PAYMENT_TYPE_NAME    char(20) comment 'PAYMENT_TYPE_NAME',
   primary key (PAYMENT_TYPE_ID)
);

alter table PAYMENT_TYPE comment 'PAYMENT_TYPE';

/*==============================================================*/
/* Table: PAYMENT_USAGE                                         */
/*==============================================================*/
create table PAYMENT_USAGE
(
   PAYMENT_USAGE_ID     char(1) not null comment 'PAYMENT_USAGE_ID',
   PAYMENT_USAGE_NAME   char(20) comment 'PAYMENT_USAGE_NAME',
   primary key (PAYMENT_USAGE_ID)
);

alter table PAYMENT_USAGE comment 'PAYMENT_USAGE';

/*==============================================================*/
/* Table: PAYSALARY                                             */
/*==============================================================*/
create table PAYSALARY
(
   EMPLOYEE_ID          char(5) not null comment 'ְԱ����',
   YEAR                 char(4) not null comment '��н���',
   MONTH                char(2) not null comment '��н�·�',
   SPR                  char(10) comment '������',
   ZBR                  char(10) comment '�Ʊ���',
   OPERATOR             char(10) comment '������',
   IS_PAYED             char(1) comment '����״̬',
   EDITABLE             char(1) comment '�ɷ��޸�',
   S01                  numeric(12,2) default 0 comment '������1',
   S02                  numeric(12,2) comment '������2',
   S03                  numeric(12,2) comment '������3',
   S04                  numeric(12,2) comment '������4',
   S05                  numeric(12,2) comment '������5',
   S06                  numeric(12,2) comment '������6',
   S07                  numeric(12,2) comment '������7',
   S08                  numeric(12,2) comment '������8',
   S09                  numeric(12,2) comment '������9',
   S10                  numeric(12,2) comment '������10',
   S11                  numeric(12,2) comment '������11',
   S12                  numeric(12,2) comment '������12',
   S13                  numeric(12,2) comment '������13',
   S14                  numeric(12,2) default 0 comment '������14',
   S15                  numeric(12,2) comment '������15',
   S16                  numeric(12,2) comment '������16',
   S17                  numeric(12,2) comment '������17',
   S18                  numeric(12,2) comment '������18',
   S19                  numeric(12,2) comment '������19',
   S20                  numeric(12,2) comment '������20',
   S21                  numeric(12,2) comment '������21',
   S22                  numeric(12,2) comment '������22',
   S23                  numeric(12,2) comment '������23',
   S24                  numeric(12,2) comment '������24',
   S25                  numeric(12,2) comment '������25',
   S26                  numeric(12,2) comment '������26',
   S27                  numeric(12,2) comment '������27',
   S28                  numeric(12,2) comment '������28',
   S29                  numeric(12,2) comment '������29',
   S30                  numeric(12,2) comment '������30',
   primary key (EMPLOYEE_ID, YEAR, MONTH)
);

alter table PAYSALARY comment '���ʷ��ű�';

/*==============================================================*/
/* Table: PK                                                    */
/*==============================================================*/
create table PK
(
   PK_ID                char(14) not null comment 'pk_id',
   PK_NO                longtext comment 'pk_no',
   STR_IN_BILL_ID       char(14) comment 'STR_IN_BILL_ID',
   STR_OUT_BILL_ID      char(14) comment 'STR_OUT_BILL_ID',
   STORE_ID             char(2) comment 'STORE_ID',
   OPERATOR_ID          varchar(20) comment 'operator_id',
   VERIFIER             char(20) comment 'VERIFIER',
   PK_DATE              timestamp comment 'PK_DATE',
   AUDITER_ID           char(4) comment 'auditer_id',
   AUDIT_DATE           timestamp comment 'audit_date',
   REMARK               longtext comment 'remark',
   modifier_id          varchar(8),
   modify_date          timestamp,
   operator_date        timestamp,
   primary key (PK_ID)
);

alter table PK comment 'PK';

/*==============================================================*/
/* Table: PK_DETAIL                                             */
/*==============================================================*/
create table PK_DETAIL
(
   PK_ID                char(14) not null comment 'pk_id',
   STOCK_REMAIN_ID      char(14) not null comment 'stock_remain_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   ZMSL                 numeric(12,2) comment 'ZMSL',
   PDSL                 numeric(12,2) comment 'PDSL',
   BATCH_ID             char(14),
   remark               varchar(200),
   price                decimal(12,6),
   primary key (PK_ID, STOCK_REMAIN_ID)
);

alter table PK_DETAIL comment 'PK_detail';

/*==============================================================*/
/* Table: POS                                                   */
/*==============================================================*/
create table POS
(
   POS_ID               char(2) not null comment '���ѵ����',
   POSNAME              varchar(50) not null comment '���ѵ�����',
   printer              varchar(80),
   collect_flag         char(1) default 'N',
   store_id             varchar(10),
   print_flag           char(1) default '1' comment '�Ƿ����ô�ӡ����',
   hme_id               varchar(30) comment '��Ӧ�����ID',
   primary key (POS_ID)
);

alter table POS comment '���ѵ�';

/*==============================================================*/
/* Table: POSITION                                              */
/*==============================================================*/
create table POSITION
(
   POSITION_ID          char(2) not null comment 'ְλ����',
   POSITION_NAME        char(20) comment 'ְλ����',
   primary key (POSITION_ID)
);

alter table POSITION comment 'ְλ';

/*==============================================================*/
/* Table: PRE_EXAM                                              */
/*==============================================================*/
create table PRE_EXAM
(
   EXAM_ID              char(14) not null comment 'EXAM_ID',
   STR_IN_BILL_ID       char(14) comment 'STR_IN_BILL_ID',
   BATCH_ID             char(14) comment 'BATCH_ID',
   GOODS_ID             char(16) comment '��Ʒ����',
   QUALITICATION        char(20) comment '�ϸ�֤',
   WARRANT              char(20) comment '���֤',
   LOOK_QLT_NAME        char(20) comment '����������',
   PACK_QLT_NAME        char(20) comment '��װ����',
   CONCLUSION           char(20) comment '���ս���',
   OPERATOR_NAME        char(20) comment '����Ա',
   OPERATOR_DATE        timestamp comment '��������',
   primary key (EXAM_ID)
);

alter table PRE_EXAM comment 'pre_exam';

/*==============================================================*/
/* Table: PRE_PCH_CONTACT                                       */
/*==============================================================*/
create table PRE_PCH_CONTACT
(
   CONTACT_ID           char(14) not null comment 'CONTACT_ID',
   CONTACT_NO           char(20) comment 'CONTACT_NO',
   VENDOR_ID            char(12) comment 'VENDOR_ID',
   CONTACT_DATE         timestamp comment 'CONTACT_DATE',
   OPERATOR_ID          char(4) comment 'OPERATOR_ID',
   OPERATOR_DATE        timestamp comment 'operator_date',
   BUYER_GRP_ID         char(2) comment 'buyer_grp_id',
   BUYER_ID             varchar(5) comment 'BUYER_ID',
   INVOICE_TYPE_ID      char(1) comment 'INVOICE_TYPE_ID',
   REMARK               longtext comment 'ժҪ',
   END_DATE             timestamp comment '��������',
   AUDIT_DATE           timestamp comment '�������',
   MODIFIER_ID          char(4) comment 'modifier_Id',
   CONTACT_PROP_ID      char(1) comment '�ɹ���ͬ����1',
   MODIFY_DATE          timestamp comment 'modify_date',
   IS_END               char(1) comment '��ͬ�Ƿ����',
   DFDH                 char(14) comment '�Է�����',
   CONTACT_TYPE_ID      char(1) comment '�ɹ���ͬ����',
   END_REASON           longtext comment '����ԭ��',
   AUDITER_ID           char(4) comment '����˴���',
   IS_ACCOUNT           char(1) comment '�Ƿ����',
   primary key (CONTACT_ID)
);

alter table PRE_PCH_CONTACT comment '��ǰ�ɹ���ͬ��';

/*==============================================================*/
/* Table: PRE_PCH_CONTACT_DETAIL                                */
/*==============================================================*/
create table PRE_PCH_CONTACT_DETAIL
(
   CONTACT_DETAIL_ID    char(14) not null comment 'contact_detail_id',
   CONTACT_ID           char(14) comment 'CONTACT_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   QTY                  numeric(12,6) comment 'QTY',
   PRICE                numeric(16,6) comment 'PRICE',
   DISCOUNT             numeric(12,2) comment 'DISCOUNT',
   primary key (CONTACT_DETAIL_ID)
);

alter table PRE_PCH_CONTACT_DETAIL comment '��ǰ��ͬ��ϸ';

/*==============================================================*/
/* Table: PRE_PK                                                */
/*==============================================================*/
create table PRE_PK
(
   PK_ID                char(14) not null comment 'pk_id',
   PK_NO                longtext comment 'pk_no',
   PK_DATE              timestamp comment 'PK_DATE',
   STORE_ID             char(2) comment 'STORE_ID',
   VERIFIER             char(20) comment 'VERIFIER',
   OPERATOR_ID          varchar(20) comment 'operator_id',
   REMARK               longtext comment 'remark',
   primary key (PK_ID)
);

alter table PRE_PK comment 'pre_pk';

/*==============================================================*/
/* Table: PRE_PK_DETAIL                                         */
/*==============================================================*/
create table PRE_PK_DETAIL
(
   PK_ID                char(14) not null comment 'pk_id',
   STOCK_REMAIN_ID      char(14) not null comment 'stock_remain_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   PDSL                 numeric(12,6) comment 'PDSL',
   ZMSL                 numeric(12,6) comment 'ZMSL',
   BATCH_ID             char(14),
   primary key (PK_ID, STOCK_REMAIN_ID)
);

alter table PRE_PK_DETAIL comment 'pre_pk_detail';

/*==============================================================*/
/* Table: PRE_STR_IN_BILL                                       */
/*==============================================================*/
create table PRE_STR_IN_BILL
(
   STR_IN_BILL_ID       char(14) not null comment 'STR_IN_BILL_ID',
   STR_IN_BILL_NO       char(20) comment 'str_in_bill_no',
   DFDH                 char(14) comment 'DFDH',
   STR_IN_TYPE_ID       char(1) comment 'STR_IN_TYPE_id',
   OPERATOR_DATE        timestamp comment 'operator_date',
   STR_IN_DATE          timestamp comment 'STR_IN_DATE',
   STORE_ID             char(2) comment 'STORE_ID',
   TRANSACTOR           char(20) comment 'TRANSACTOR',
   OPERATOR_ID          varchar(20) comment 'operator_id',
   COME_FROM            char(40) comment 'COME_FROM',
   VERIFIER             char(20) comment 'VERIFIER',
   BILL_NUM             int comment '��������',
   REMARK               longtext comment 'remark',
   BUYER_GRP_ID         char(2) comment '�ɹ������',
   VENDOR_ID            char(12) comment '�����̴���',
   BUYER_ID             varchar(5) comment '�ɹ�Ա����',
   INVOICE_TYPE_ID      char(1) comment 'INVOICE_TYPE_ID',
   modifier_id          char(4),
   modify_date          timestamp,
   is_account           char(1),
   primary key (STR_IN_BILL_ID)
);

alter table PRE_STR_IN_BILL comment '��ⵥ��ϸ';

/*==============================================================*/
/* Table: PRE_STR_IN_BILL_DETAIL                                */
/*==============================================================*/
create table PRE_STR_IN_BILL_DETAIL
(
   BATCH_ID             char(14) not null comment 'BATCH_ID',
   STR_IN_BILL_ID       char(14) not null comment 'STR_IN_BILL_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   QTY                  numeric(12,6) comment 'QTY',
   PRICE                numeric(12,6) comment 'PRICE',
   YXQ                  timestamp comment 'YXQ',
   PCH                  char(20) comment '�������κ�',
   PIECE                numeric(12,2) comment '����',
   discount             numeric(12,2) default 1,
   total                numeric(16,2),
   remark               varchar(200),
   primary key (BATCH_ID, STR_IN_BILL_ID)
);

alter table PRE_STR_IN_BILL_DETAIL comment 'pre_STR_IN_BILL_DETAIL';

/*==============================================================*/
/* Table: PRE_STR_OUT_BILL                                      */
/*==============================================================*/
create table PRE_STR_OUT_BILL
(
   STR_OUT_BILL_ID      char(14) not null comment 'pre_STR_OUT_BILL_ID',
   STR_OUT_BILL_NO      char(20) comment 'str_ourt_bill_no',
   DFDH                 char(14) comment 'DFDH',
   STR_OUT_TYPE_ID      char(1) comment 'STR_OUT_TYPE_id',
   STR_OUT_DATE         timestamp comment 'STR_OUT_DATE',
   STORE_ID             char(2) comment 'STORE_ID',
   OPERATOR_ID          varchar(20) comment 'operator_id',
   TRANSACTOR           char(20) comment 'TRANSACTOR',
   VERIFIER             char(20) comment 'VERIFIER',
   COME_TO              char(40) comment 'COME_TO',
   REMARK               longtext comment 'REMARK',
   INVOICE_TYPE_ID      char(1) comment 'INVOICE_TYPE_ID',
   BILL_NUM             int comment '��������',
   OPERATOR_DATE        timestamp comment 'operator_date',
   CUSTOMER_ID          char(12) comment 'CUSTOMER_ID',
   XSHT_TYPE_ID         char(1) comment '���ۺ�ͬ���ʹ���',
   XSHT_PROP_ID         char(1) comment '���ۻ��˻�',
   IS_OTC               char(1) comment '�Ƿ�otc',
   POS_ID               char(2) comment 'pos_ID',
   COUNTER_ID           char(2) comment '��̨����',
   SALES_ID             char(12) comment 'SALES_ID',
   primary key (STR_OUT_BILL_ID)
);

alter table PRE_STR_OUT_BILL comment 'pre_STR_OUT_BILL';

/*==============================================================*/
/* Table: PRE_STR_OUT_BILL_DETAIL                               */
/*==============================================================*/
create table PRE_STR_OUT_BILL_DETAIL
(
   STR_OUT_BILL_ID      char(14) not null comment 'pre_STR_OUT_BILL_ID',
   GOODS_ID             char(16) not null comment 'GOODS_ID',
   BATCH_ID             char(14) not null comment 'BATCH_ID',
   QTY                  numeric(12,6) comment 'QTY',
   PIECE                numeric(12,2) comment '����',
   pch                  char(20),
   price                numeric(16,6) default 0,
   orderby              int,
   remark               varchar(200),
   primary key (STR_OUT_BILL_ID)
);

alter table PRE_STR_OUT_BILL_DETAIL comment 'pre_STR_OUT_BILL_DETAIL';

/*==============================================================*/
/* Table: PRICE                                                 */
/*==============================================================*/
create table PRICE
(
   PRICE_ID             char(14) not null comment '�۸����',
   GOODS_ID             char(16) comment '��Ʒ����',
   PRICE_TYPE_ID        char(1) comment '�۸����ʹ���',
   POS_ID               char(2) comment '���۵����',
   PRICE                numeric(12,2) comment '�۸�',
   primary key (PRICE_ID)
);

alter table PRICE comment '�۸�';

/*==============================================================*/
/* Table: PRICE_TYPE                                            */
/*==============================================================*/
create table PRICE_TYPE
(
   PRICE_TYPE_ID        char(1) not null comment 'price_type_id',
   PRICE_TYPE_NAME      char(20) comment 'price_type_name',
   primary key (PRICE_TYPE_ID)
);

alter table PRICE_TYPE comment '�۸�����';

/*==============================================================*/
/* Table: PRICE_USAGE                                           */
/*==============================================================*/
create table PRICE_USAGE
(
   PRICE_USAGE_ID       char(1) not null comment '�۸�ʹ���������',
   PRICE_USAGE_NAME     char(20) comment '�۸�ʹ���������',
   PRICE_TYPE_ID        char(1) comment '�۸����ʹ���',
   primary key (PRICE_USAGE_ID)
);

alter table PRICE_USAGE comment '�۸�ʹ�������';

/*==============================================================*/
/* Table: RECORD_ENABLE                                         */
/*==============================================================*/
create table RECORD_ENABLE
(
   ENABLE               char(1) not null comment 'enable',
   primary key (ENABLE)
);

alter table RECORD_ENABLE comment '�Ƿ�������������';

/*==============================================================*/
/* Table: REPORT1                                               */
/*==============================================================*/
create table REPORT1
(
   REPORT_ID            varchar(54) not null,
   REPORT_NAME          varchar(36),
   REPORT_STATE         varchar(10),
   REPORT_DW            varchar(50),
   REPORT_SYSTEM        varchar(36),
   REPORT_PAPER_SIZE    varchar(10),
   REPORT_PERCENT       int,
   REPORT_DATAWINDOW    varchar(254),
   REPORT_WHERE         varchar(254),
   REPORT_DECLARE       varchar(254),
   primary key (REPORT_ID)
);

alter table REPORT1 comment '����Ǽ�';

/*==============================================================*/
/* Table: REPORT2                                               */
/*==============================================================*/
create table REPORT2
(
   REPORT_ID            varchar(54) not null,
   OBJECT_NAME          varchar(51) not null,
   BANDRPT              varchar(10) not null,
   XRPT                 int,
   YRPT                 int,
   X2RPT                int,
   Y2RPT                int,
   HEIGHT               int,
   WIDTH                int,
   BORDERRPT            varchar(1),
   COLOR                varchar(255),
   FONT_NAME            varchar(12),
   FONT_SIZE            varchar(4),
   SELECT_LABEL         varchar(1),
   EXPR                 varchar(1000),
   EXPR_ENGLISH         varchar(1000),
   ALIGNMENT_RPT        varchar(1),
   FORMAT_RPT           varchar(30),
   REP_REPORT_ID        varchar(54),
   type_expr            varchar(10),
   primary key (REPORT_ID, OBJECT_NAME)
);

alter table REPORT2 comment '������������';

/*==============================================================*/
/* Table: REPORT_CHINESE_TO_ENGLISH                             */
/*==============================================================*/
create table REPORT_CHINESE_TO_ENGLISH
(
   NAME_CHINESE         varchar(36) not null,
   NAME_ENGLISH         varchar(36) not null,
   NAME_CHINESE_FUNC    varchar(36) not null,
   primary key (NAME_CHINESE)
);

alter table REPORT_CHINESE_TO_ENGLISH comment '�Զ��庯��';

/*==============================================================*/
/* Table: REPORT_CONDITION                                      */
/*==============================================================*/
create table REPORT_CONDITION
(
   DWOBJECT             varchar(24) not null,
   S_RELATION           varchar(5) not null,
   S_FIELD              varchar(45) not null,
   S_COMPARE            varchar(6) not null,
   S_VALUE              varchar(24) not null,
   primary key (DWOBJECT)
);

alter table REPORT_CONDITION comment '��̨�������һ�εĴ�ӡ����';

/*==============================================================*/
/* Table: REPORT_FIELD                                          */
/*==============================================================*/
create table REPORT_FIELD
(
   REPORT_ID            varchar(54) not null,
   TABLE_ENGLISH        varchar(50) not null,
   COLUMN_ENGLISH       varchar(255) not null,
   COLUMN_CHINESE       varchar(255),
   COLUMN_TYPE          varchar(12),
   COLUMN_LEN1          numeric(5,0),
   COLUMN_LEN2          numeric(5,0),
   COLUMN_SELECT        varchar(255),
   COLUMN_SORT          int not null,
   REP_REPORT_ID        varchar(54),
   primary key (REPORT_ID, COLUMN_SORT)
);

alter table REPORT_FIELD comment '��̨������ѡ�ֶ�';

/*==============================================================*/
/* Table: REPORT_FROMWHERE                                      */
/*==============================================================*/
create table REPORT_FROMWHERE
(
   REPORT_ID            varchar(54) not null,
   FROM_EXPR            varchar(254) not null,
   WHERE_EXPR           varchar(1000) not null,
   SORT_EXPR            varchar(254) not null,
   primary key (REPORT_ID)
);

alter table REPORT_FROMWHERE comment '��̨������ѡ����';

/*==============================================================*/
/* Table: REPORT_FUNC                                           */
/*==============================================================*/
create table REPORT_FUNC
(
   FUNC_ENGLISH         varchar(18) not null,
   FUNC_CHINA           varchar(16) not null,
   primary key (FUNC_ENGLISH)
);

alter table REPORT_FUNC comment '��׼����';

/*==============================================================*/
/* Table: REPORT_TABLE                                          */
/*==============================================================*/
create table REPORT_TABLE
(
   TABLE_ENGLISH        varchar(50) not null,
   TABLE_CHINESE        varchar(50) not null,
   primary key (TABLE_ENGLISH)
);

alter table REPORT_TABLE comment '��̨����������ʵı����ͼ����Ӣ����';

/*==============================================================*/
/* Table: ROOM                                                  */
/*==============================================================*/
create table ROOM
(
   ROOM_ID              char(4) not null comment '̨λ����',
   ROOM_NAME            char(20) comment '̨λ����',
   BED_NUM              decimal(4) comment '����',
   ROOMFEE              decimal(12,2) comment '������',
   STATUSNAME           char(20) comment '̨λ״̬����',
   REMARK               varchar(255) comment '˵��',
   primary key (ROOM_ID)
);

alter table ROOM comment '������Ϣ';

/*==============================================================*/
/* Table: ROOM_USE                                              */
/*==============================================================*/
create table ROOM_USE
(
   RSV_ID               int not null auto_increment,
   ROOM_NO              char(20),
   HISORDER_ID          char(20),
   START_TIME           timestamp,
   END_TIME             timestamp,
   CUST_NAME            char(20),
   CUST_NO              char(20),
   ID_CARD              char(20),
   ADDR                 varchar(100),
   TEL                  varchar(100),
   FOREGIFT             numeric(12,4),
   RENT                 numeric(12,4),
   OPERATOR             char(20),
   DEL_OPER             char(20),
   REMARK               varchar(1000),
   CERTIFICATE_TYPE     char(20),
   primary key (RSV_ID)
);

/*==============================================================*/
/* Table: RSV                                                   */
/*==============================================================*/
create table RSV
(
   RSV_ID               int not null auto_increment,
   ROOM_NO              char(20),
   RSV_DATE             timestamp,
   RSV_MODE             char(20),
   ESTIMATE_END_TIME    timestamp,
   CUST_NAME            char(20),
   CUST_NO              char(20),
   ID_CARD              char(20),
   ADDR                 varchar(100),
   TEL                  varchar(100),
   FOREGIFT             numeric(12,4),
   RENT                 numeric(12,4),
   OPERATOR             char(20),
   DEL_OPER             char(20),
   REMARK               varchar(1000),
   CERTIFICATE_TYPE     char(20),
   SHIFT                char(20),
   primary key (RSV_ID)
);

/*==============================================================*/
/* Table: SALARY_CLASS                                          */
/*==============================================================*/
create table SALARY_CLASS
(
   SALARY_CLASS_ID      char(2) not null comment '���ʼ������',
   SALARY_CLASS_NAME    char(20) comment '���ʼ�������',
   BASIC_SALARY         double comment '��������',
   benefit_salary       numeric(12,4),
   backshish            numeric(12,4),
   primary key (SALARY_CLASS_ID)
);

alter table SALARY_CLASS comment '���ʼ����';

/*==============================================================*/
/* Table: SALARY_ITEM_ORDER                                     */
/*==============================================================*/
create table SALARY_ITEM_ORDER
(
   SALARY_ITEM_ID       char(3) not null comment '������Ŀ���',
   SALARY_ITEM_NAME     char(20) comment '������Ŀ����',
   primary key (SALARY_ITEM_ID)
);

alter table SALARY_ITEM_ORDER comment '������Ŀ����˳���';

/*==============================================================*/
/* Table: SALES                                                 */
/*==============================================================*/
create table SALES
(
   SALES_ID             char(12) not null comment 'sales_id',
   SALES_NAME           char(20) comment 'sales_name',
   POS_ID               char(2) comment 'pos_id',
   LB1_ID               char(2) comment '�������1',
   LB2_ID               char(2) comment '�������2',
   IS_MX                char(1) comment 'is_mx',
   DM                   char(20) comment '�ټǴ���',
   PY                   char(20) comment 'ƴ������',
   primary key (SALES_ID)
);

alter table SALES comment 'Tab_17675';

/*==============================================================*/
/* Table: SCCJ                                                  */
/*==============================================================*/
create table SCCJ
(
   SCCJ_ID              char(12) not null comment '�������Ҵ���',
   SCCJ_ANAME           char(20) not null comment '�������Ҽ��',
   SCCJ_NAME            char(60) comment '������������',
   SCCJ_TYPE_ID         char(2) comment '��������������',
   DM                   char(10) comment '�ټǴ���',
   PY                   char(30) comment 'ƴ������',
   ADDR                 longtext comment '��ַ',
   CITY                 char(20) comment '���ڳ���',
   ZIPCODE              char(6) comment '��������',
   TEL                  char(40) comment '�绰',
   FAX                  char(40) comment '����',
   EMAIL                char(40) comment '�����ʼ�',
   PRINCIPAL            char(20) comment '������',
   CONTACT              char(20) comment '��ϵ��',
   CONTACTTEL           char(40) comment '��ϵ�˵绰',
   BANK                 char(40) comment '������',
   ACCOUNT_ID           char(20) comment '�ʺ�',
   TAX_ID               char(20) comment '˰��',
   IS_MX                char(1) comment '�Ƿ���ϸ',
   FIRSTDAY             timestamp comment '�Ǽ�����',
   OPERATOR_NAME        char(20) comment '����Ա',
   REMARK               longtext comment '��ע',
   LB1                  char(1) comment '��������1',
   LB2                  char(1) comment '��������2',
   CD_ID                char(4) comment '���ش���',
   primary key (SCCJ_ID)
);

alter table SCCJ comment '��������';

/*==============================================================*/
/* Table: SCCJ_LEVEL                                            */
/*==============================================================*/
create table SCCJ_LEVEL
(
   LEVEL_ID             char(1) not null comment 'level_id',
   LEVEL_NAME           char(20) comment 'level_name',
   LEVEL_LEN            int comment '���볤��',
   TOTAL_LEN            int comment '�ܳ���',
   primary key (LEVEL_ID)
);

alter table SCCJ_LEVEL comment '�������Ҳ��';

/*==============================================================*/
/* Table: SCCJ_TYPE                                             */
/*==============================================================*/
create table SCCJ_TYPE
(
   SCCJ_TYPE_ID         char(2) comment 'SCCJ_TYPE_ID',
   SCCJ_TYPE_NAME       char(20) comment 'SCCJ_TYPE_NAME'
);

alter table SCCJ_TYPE comment 'SCCJ_TYPE';

/*==============================================================*/
/* Table: SHIFT                                                 */
/*==============================================================*/
create table SHIFT
(
   SHIFT_ID             char(2) not null comment '���ID',
   SHIFT                char(10) not null comment '�������',
   time_start           time comment '��ʼʱ��',
   time_end             time comment '����ʱ��',
   primary key (SHIFT_ID)
);

/*==============================================================*/
/* Table: SHOULDCOMMIT                                          */
/*==============================================================*/
create table SHOULDCOMMIT
(
   OPERATOR_ID          char(13) not null comment '����Ա���',
   POSNAME              varchar(50) not null comment '���ѵ�',
   OPERATOR_NAME        char(20) comment '����Ա����',
   CASH_REMAIN          numeric(12,2) comment '�ֽ����',
   CHECK_REMAIN         numeric(12,2) comment '֧Ʊ���',
   CREDIT_CARD_REMAIN   numeric(12,2) comment '���ÿ����',
   KEEP_ACCOUNT_REMAIN  numeric(12,2) comment '�������',
   REMAIN1              numeric(12,2) comment '�������1',
   REMAIN2              numeric(12,2) comment '�������2',
   primary key (OPERATOR_ID, POSNAME)
);

alter table SHOULDCOMMIT comment '����ԱӦ�ɿ�';

/*==============================================================*/
/* Table: STOCK_REMAIN                                          */
/*==============================================================*/
create table STOCK_REMAIN
(
   STOCK_REMAIN_ID      char(14) not null comment 'stock_remain_id',
   GOODS_ID             char(16) comment 'GOODS_ID',
   BATCH_ID             char(14) not null comment 'BATCH_ID',
   STORE_ID             char(2) comment 'STORE_ID',
   QTY                  numeric(12,6) comment 'QTY',
   PRICE                numeric(12,6) comment 'price',
   STOCK_TYPE_ID        char(1) comment 'stock_type_id',
   IS_CAN_SALE          char(1) comment 'is_can_sale',
   up_flag              char(1) default '0',
   primary key (STOCK_REMAIN_ID)
);

alter table STOCK_REMAIN comment 'STOCK_REMAIN';

/*==============================================================*/
/* Index: idx_stock_remain_goods_id                             */
/*==============================================================*/
create index idx_stock_remain_goods_id on STOCK_REMAIN
(
   GOODS_ID
);

/*==============================================================*/
/* Index: idx_stock_remain_batch_id                             */
/*==============================================================*/
create index idx_stock_remain_batch_id on STOCK_REMAIN
(
   BATCH_ID
);

/*==============================================================*/
/* Table: STOCK_TYPE                                            */
/*==============================================================*/
create table STOCK_TYPE
(
   STOCK_TYPE_ID        char(1) not null comment '������Դ���',
   STOCK_TYPE_NAME      char(20) comment '�����������',
   primary key (STOCK_TYPE_ID)
);

alter table STOCK_TYPE comment '�������';

/*==============================================================*/
/* Table: STORE                                                 */
/*==============================================================*/
create table STORE
(
   STORE_ID             char(2) not null comment 'STORE_ID',
   STORE_NAME           char(20) comment 'STORE_NAME',
   primary key (STORE_ID)
);

alter table STORE comment 'STORE';

/*==============================================================*/
/* Table: STR_IN_BILL                                           */
/*==============================================================*/
create table STR_IN_BILL
(
   STR_IN_BILL_ID       char(14) not null comment 'STR_IN_BILL_ID',
   STR_IN_BILL_NO       char(20) comment 'str_in_bill_no',
   DFDH                 char(14) comment 'DFDH',
   STR_IN_TYPE_ID       char(1) comment 'STR_IN_TYPE_id',
   STR_IN_DATE          timestamp comment 'STR_IN_DATE',
   OPERATOR_DATE        timestamp comment 'operator_date',
   STORE_ID             char(2) comment 'STORE_ID',
   TRANSACTOR           char(20) comment '������',
   OPERATOR_ID          varchar(20) comment '�Ƶ��˴���',
   COME_FROM            char(40) comment 'COME_FROM',
   VERIFIER             char(20) comment 'VERIFIER',
   MODIFIER_ID          char(4) comment 'modifier_Id',
   MODIFY_DATE          timestamp comment 'modify_date',
   AUDITER_ID           char(4) comment '����˴���',
   AUDIT_DATE           timestamp comment '�������',
   BILL_NUM             int comment '��������',
   REMARK               varchar(100) comment 'remark',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   is_end               char(1) default 'N',
   end_date             timestamp,
   end_reason           longtext,
   invoice_type_id      char(1),
   buyer_grp_id         char(2),
   buyer_id             char(5),
   vendor_id            char(12),
   is_account           char(1),
   is_zhibo             char(1),
   primary key (STR_IN_BILL_ID)
);

alter table STR_IN_BILL comment '��ⵥ';

/*==============================================================*/
/* Table: STR_IN_BILL_DETAIL                                    */
/*==============================================================*/
create table STR_IN_BILL_DETAIL
(
   STR_IN_BILL_ID       char(14) not null comment 'STR_IN_BILL_ID',
   BATCH_ID             char(14) not null comment 'BATCH_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   QTY                  numeric(12,6) comment 'QTY',
   PIECE                numeric(12,2) comment '����',
   price                numeric(12,6),
   discount             numeric(12,2) default 1,
   yxq                  timestamp,
   pch                  char(20),
   total                numeric(16,2),
   remark               varchar(200),
   come_to              varchar(30),
   primary key (STR_IN_BILL_ID, BATCH_ID)
);

alter table STR_IN_BILL_DETAIL comment 'STR_IN_BILL_DETAIL';

/*==============================================================*/
/* Table: STR_IN_TYPE                                           */
/*==============================================================*/
create table STR_IN_TYPE
(
   STR_IN_TYPE_ID       char(1) not null comment 'STR_IN_TYPE_ID',
   STR_IN_TYPE_NAME     char(20) comment 'STR_IN_TYPE_name',
   primary key (STR_IN_TYPE_ID)
);

alter table STR_IN_TYPE comment 'STR_IN_TYPE';

/*==============================================================*/
/* Table: STR_OUT_BILL                                          */
/*==============================================================*/
create table STR_OUT_BILL
(
   STR_OUT_BILL_ID      char(14) not null comment 'STR_OUT_BILL_ID',
   STR_OUT_BILL_NO      char(20) comment 'str_out_bill_no',
   DFDH                 char(14) comment 'DFDH',
   STR_OUT_TYPE_ID      char(1) comment 'STR_OUT_TYPE_id',
   STR_OUT_DATE         timestamp comment 'STR_OUT_DATE',
   OPERATOR_DATE        timestamp comment 'operator_date',
   STORE_ID             char(2) comment 'STORE_ID',
   TRANSACTOR           char(20) comment 'TRANSACTOR',
   OPERATOR_ID          varchar(20) comment 'operator_id',
   COME_TO              char(40) comment 'COME_TO',
   VERIFIER             char(20) comment 'VERIFIER',
   MODIFIER_ID          char(4) comment 'modifier_Id',
   MODIFY_DATE          timestamp comment 'modify_date',
   AUDITER_ID           char(4) comment 'auditer_id',
   AUDIT_DATE           timestamp comment '�������',
   BILL_NUM             int comment '��������',
   REMARK               longtext comment 'REMARK',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   primary key (STR_OUT_BILL_ID)
);

alter table STR_OUT_BILL comment 'STR_OUT_BILL';

/*==============================================================*/
/* Table: STR_OUT_BILL_DETAIL                                   */
/*==============================================================*/
create table STR_OUT_BILL_DETAIL
(
   STR_OUT_BILL_ID      char(14) not null comment 'STR_OUT_BILL_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   BATCH_ID             char(14) not null comment 'BATCH_ID',
   QTY                  numeric(12,6) comment 'QTY',
   PIECE                numeric(12,2) comment '����',
   price                numeric(12,6),
   orderby              int,
   remark               varchar(200),
   primary key (STR_OUT_BILL_ID)
);

alter table STR_OUT_BILL_DETAIL comment 'STR_OUT_BILL_DETAIL';

/*==============================================================*/
/* Table: STR_OUT_TYPE                                          */
/*==============================================================*/
create table STR_OUT_TYPE
(
   STR_OUT_TYPE_ID      char(1) not null comment 'STR_OUT_TYPE_ID',
   STR_OUT_TYPE_NAME    char(20) comment 'STR_OUT_TYPE_name',
   primary key (STR_OUT_TYPE_ID)
);

alter table STR_OUT_TYPE comment 'STR_OUT_TYPE';

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
/* Table: Sales_Consignee                                       */
/*==============================================================*/
create table Sales_Consignee
(
   Consignee_Id         varchar(5) not null,
   Consignee            varchar(20) not null,
   primary key (Consignee_Id)
);

/*==============================================================*/
/* Table: Sales_Consigner                                       */
/*==============================================================*/
create table Sales_Consigner
(
   Consigner_Id         varchar(5) not null,
   Consigner            varchar(20) not null,
   primary key (Consigner_Id)
);

/*==============================================================*/
/* Table: Sales_Detail                                          */
/*==============================================================*/
create table Sales_Detail
(
   Sales_Id             varchar(12) not null,
   Sales_Detail_Id      int not null auto_increment,
   Goods_Id             varchar(16),
   Store_Name           varchar(20),
   Qty                  numeric(12,2),
   Price                numeric(14,4),
   Discount             numeric(12,2) default 1,
   Piece                numeric(12,2),
   Note                 varchar(100),
   primary key (Sales_Detail_Id)
);

/*==============================================================*/
/* Table: Sales_Freight_Corp                                    */
/*==============================================================*/
create table Sales_Freight_Corp
(
   Freight_Id           varchar(10) not null,
   Freight_Aname        varchar(20),
   Freight_Name         varchar(50),
   Freight_Py           varchar(20),
   Linkman              varchar(10),
   Search_Tel           varchar(20),
   Mobile_Tel           varchar(25),
   Zipcode              varchar(10),
   Address              varchar(100),
   Operator_Id          varchar(10),
   Operate_Date         timestamp,
   primary key (Freight_Id)
);

/*==============================================================*/
/* Table: Sales_Freight_Type                                    */
/*==============================================================*/
create table Sales_Freight_Type
(
   Freight_Type_Id      varchar(5) not null,
   Freight_Type_Name    varchar(20),
   primary key (Freight_Type_Id)
);

/*==============================================================*/
/* Table: Sales_League_Corp                                     */
/*==============================================================*/
create table Sales_League_Corp
(
   League_Id            varchar(10) not null,
   League_Aname         varchar(20),
   League_Name          varchar(50),
   League_Py            varchar(20),
   Linkman              varchar(10),
   Tel                  varchar(20),
   Mobile_Tel           varchar(25),
   Zipcode              varchar(10),
   Address              varchar(100),
   Operator_Id          varchar(10),
   Operate_Date         timestamp,
   primary key (League_Id)
);

/*==============================================================*/
/* Table: Sales_Master                                          */
/*==============================================================*/
create table Sales_Master
(
   Sales_Id             varchar(12) not null,
   Sales_No             varchar(12) not null,
   League_Id            varchar(10),
   Sales_Type_Id        varchar(5),
   Sales_Date           timestamp,
   Freight_Id           varchar(10),
   Store_Id             varchar(5),
   Freight_Type_Id      varchar(5),
   Consignee            varchar(20),
   Checker_Id           varchar(10),
   Consigner            varchar(20),
   Operator_Id          varchar(10),
   Operate_Date         timestamp,
   Auditer_Id           varchar(10),
   Auditer_Flag         char(1),
   Audit_Date           timestamp,
   Note                 varchar(100),
   primary key (Sales_Id)
);

/*==============================================================*/
/* Table: Sales_Type                                            */
/*==============================================================*/
create table Sales_Type
(
   Sales_Type_Id        varchar(5) not null,
   Sales_Type_Name      varchar(20),
   primary key (Sales_Type_Id)
);

/*==============================================================*/
/* Table: TABLES                                                */
/*==============================================================*/
create table TABLES
(
   TABLE_ID             varchar(10) not null default '0' comment '̨λ����',
   POSNAME              varchar(50) not null comment '���ѵ�����',
   TABLENAME            char(20) not null comment '̨λ����',
   SEATNUMBER           int comment '��λ����',
   ROOMFEE              numeric(12,2) comment '������',
   STATUSNAME           char(10) comment '̨λ״̬����',
   EXCLUSIVE            char(1) comment '̨λ�Ƿ�ר��',
   SRV_RATE             numeric(3,0) comment '�������',
   TABLE_TYPE           char(2) comment '̨λ����',
   USE_SEX              char(20),
   roomfee_over         numeric(12,2) default 0,
   start_time           time default '00:00:00',
   end_time             time default '00:00:00',
   book_id              numeric(14,0) default 0,
   time_over            numeric(2,0) default 0,
   time_over_flag       char(1) default '0',
   kx_x                 numeric(12,2),
   kx_y                 numeric(12,2),
   kx_file              varchar(50),
   print_mode           char(2),
   display_type         char(1),
   display_com          char(1),
   display_bit_rate     numeric(12,0),
   qt_tuoji             char(1),
   print_poit           char(2) default '0',
   operator             varchar(50),
   zzx_com              char(1) default '1',
   tabletype            varchar(50),
   person_min_expend    numeric(14,2),
   tablename_union      varchar(30),
   led_card_addr        int,
   status_Modified      char(1) comment '״̬�Ƿ��޸ı�־λ',
   hme_id               varchar(30) comment '��Ӧ�����̨λID',
   table_printer        varchar(50) comment '̨λ��Ӧ���˴�ӡ��',
   primary key (TABLE_ID)
);

alter table TABLES comment '��λ��Ϣ';

/*==============================================================*/
/* Table: TIME_LAG                                              */
/*==============================================================*/
create table TIME_LAG
(
   TIME_LAG             numeric(12,4) not null,
   primary key (TIME_LAG)
);

/*==============================================================*/
/* Table: TK_STR_LOOKER                                         */
/*==============================================================*/
create table TK_STR_LOOKER
(
   TK_STR_LOOKER_ID     char(4) not null comment 'TK_STR_LOOKER_ID',
   TK_STR_LOOKER_NAME   char(20) comment 'TK_STR_LOOKER_NAME',
   primary key (TK_STR_LOOKER_ID)
);

/*==============================================================*/
/* Table: TMPORDERDETAIL                                        */
/*==============================================================*/
create table TMPORDERDETAIL
(
   TMPORDERDETAIL_ID    char(14),
   TMPORDER_ID          char(14),
   DISH_ID              char(5),
   DISHNAME             char(20),
   UNIT                 char(8),
   QUANTITY             double,
   PRICE                double,
   DISCOUNT_RATE        double,
   DISHTYPE_ID          char(2),
   DISHTYPE             char(10),
   POSNAME              varchar(50),
   TECHNICIAN_NAME      char(20)
);

/*==============================================================*/
/* Table: TMP_DISH_AMOUNT                                       */
/*==============================================================*/
create table TMP_DISH_AMOUNT
(
   DISH_ID              char(5) not null,
   SALE_AMOUNT          numeric(12,2),
   BADDISH_AMOUNT       numeric(12,2),
   primary key (DISH_ID)
);

/*==============================================================*/
/* Table: TRANS_STR                                             */
/*==============================================================*/
create table TRANS_STR
(
   STR_OUT_BILL_ID      char(14) not null comment 'STR_OUT_BILL_ID',
   primary key (STR_OUT_BILL_ID)
);

alter table TRANS_STR comment 'TRANS_STR';

/*==============================================================*/
/* Table: UNIT                                                  */
/*==============================================================*/
create table UNIT
(
   UNIT                 char(8) not null comment 'UNIT',
   primary key (UNIT)
);

alter table UNIT comment '������λ';

/*==============================================================*/
/* Table: VENDOR                                                */
/*==============================================================*/
create table VENDOR
(
   VENDOR_ID            char(12) not null comment 'VENDOR_ID',
   VENDOR_ANAME         char(20) not null comment 'VENDOR_ANAME',
   VENDOR_NAME          char(60) comment 'VENDOR_NAME',
   VENDOR_TYPE_ID       char(2) comment 'vendor_type_id',
   DM                   char(10) comment '�ټǴ���',
   PY                   char(30) comment 'ƴ������',
   VENDOR_ADDRESS       varchar(100) comment 'VENDOR_ADDRESS',
   CITY                 char(20) comment 'CITY',
   ZIPCODE              char(6) comment 'ZIPCODE',
   TEL                  char(20) comment 'TEL',
   FAX                  char(20) comment 'FAX',
   EMAIL                char(20) comment 'EMAIL',
   PRINCIPAL            char(20) comment 'PRINCIPAL',
   CONTACT              char(20) comment 'CONTACT',
   CONTACTTEL           char(20) comment 'CONTACTTEL',
   BANK                 char(40) comment 'BANK',
   ACCOUNT_ID           numeric(12,2) comment 'ACCOUNT_ID',
   TAX_ID               char(20) comment 'TAX_ID',
   IS_MX                char(1) comment '�Ƿ���ϸ',
   CRT_DATE             timestamp comment 'CRT_DATE',
   OPERATOR_NAME        char(20) comment '����Ա',
   CREDITLEVEL          char(1) comment '���ü���',
   CREDITQUOTA          numeric(12,2) comment 'CREDITQUOTA',
   DISCOUNT_RATE        numeric(12,2) comment '�ۿ���',
   REMARK               varchar(100) comment 'REMARK',
   LB1                  char(1) comment '��������1',
   LB2                  char(1) comment '��������2',
   LB3                  char(1) comment '��������3',
   primary key (VENDOR_ID)
);

alter table VENDOR comment 'VENDOR';

/*==============================================================*/
/* Table: VENDOR_LEVEL                                          */
/*==============================================================*/
create table VENDOR_LEVEL
(
   LEVEL_ID             char(1) not null comment 'level_id',
   LEVEL_NAME           char(20) comment 'level_name',
   LEVEL_LEN            int comment '���볤��',
   TOTAL_LEN            int comment '�ܳ���',
   primary key (LEVEL_ID)
);

alter table VENDOR_LEVEL comment '��Ӧ�̲��';

/*==============================================================*/
/* Table: VENDOR_TYPE                                           */
/*==============================================================*/
create table VENDOR_TYPE
(
   VENDOR_TYPE_ID       char(2) not null comment 'VENDOR_TYPE_ID',
   VENDOR_TYPE          char(20) comment 'VENDOR_TYPE',
   primary key (VENDOR_TYPE_ID)
);

alter table VENDOR_TYPE comment 'VENDOR_TYPE';

/*==============================================================*/
/* Table: VERIFIER                                              */
/*==============================================================*/
create table VERIFIER
(
   VERIFIER_ID          varchar(5) not null comment 'VERIFIER_ID',
   VERIFIER             char(20) comment 'VERIFIER',
   primary key (VERIFIER_ID)
);

alter table VERIFIER comment 'VERIFIER';

/*==============================================================*/
/* Table: VIP_RECORD                                            */
/*==============================================================*/
create table VIP_RECORD
(
   ID                   int not null auto_increment,
   ADD_DATE             timestamp,
   PAYTYPE              char(20),
   CUST_NO              char(20),
   CUST_NAME            char(20),
   VIP_NO               char(20),
   ADD_MONEY            numeric(12,4),
   OPERATOR             char(20),
   primary key (ID)
);

/*==============================================================*/
/* Table: WAITER                                                */
/*==============================================================*/
create table WAITER
(
   WAITER_ID            varchar(5) not null comment '���Ա����',
   POSNAME              varchar(50),
   WAITER               char(20),
   pda_pwd              varchar(20),
   primary key (WAITER_ID)
);

alter table WAITER comment '���Ա';

/*==============================================================*/
/* Table: WORK_STATUS                                           */
/*==============================================================*/
create table WORK_STATUS
(
   WORK_STATUS_ID       char(2) not null comment '�ù�״̬����',
   WORK_STATUS_NAME     char(20) comment '�ù�״̬����',
   primary key (WORK_STATUS_ID)
);

alter table WORK_STATUS comment '�ù�״̬';

/*==============================================================*/
/* Table: XSHT                                                  */
/*==============================================================*/
create table XSHT
(
   XSHT_ID              char(14) not null comment 'XSHT_ID',
   XSHT_NO              char(20) comment 'XSHT_NO',
   CUSTOMER_ID          char(12) comment 'CUSTOMER_ID',
   XSHT_DATE            timestamp comment 'XSHT_DATE',
   OPERATOR_ID          char(4) comment 'OPERATOR_ID',
   OPERATOR_DATE        timestamp comment 'operator_date',
   POS_ID               char(2) comment 'pos_ID',
   SALES_ID             char(12) comment 'SALES_ID',
   INVOICE_TYPE_ID      char(1) comment 'INVOICE_TYPE_ID',
   REMARK               longtext comment 'ժҪ',
   MODIFIER_ID          char(4) comment 'modifier_Id',
   MODIFY_DATE          timestamp comment 'modify_date',
   AUDITER_ID           char(4) comment '����˴���',
   AUDIT_DATE           timestamp comment '�������',
   IS_END               char(1) comment 'IS_END',
   END_DATE             timestamp comment '����ʱ��',
   END_REASON           longtext comment '����ԭ��',
   IS_ACCOUNT           char(1) comment '�Ƿ����',
   XSHT_TYPE_ID         char(1) comment '���ۺ�ͬ���ʹ���',
   XSHT_PROP_ID         char(1) comment '���ۻ��˻�',
   DFDH                 char(14) comment '�Է�����',
   IS_OTC               char(1) comment '�Ƿ�otc',
   FREE_CHARGE          numeric(12,2) comment '����',
   AMOUNT               numeric(12,2) comment '��ͬ���',
   YJS_NAME             char(20) comment 'ҩ��ʦ',
   RX_NO                char(20) comment '������',
   COUNTER_ID           char(2) comment '��̨����',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   primary key (XSHT_ID)
);

alter table XSHT comment 'XSHT';

/*==============================================================*/
/* Table: XSHT_DETAIL                                           */
/*==============================================================*/
create table XSHT_DETAIL
(
   XSHT_DETAIL_ID       int not null comment '���ۺ�ͬ��ϸ����',
   XSHT_ID              char(14) comment 'XSHT_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   QTY                  numeric(12,2) comment 'QTY',
   PRICE                numeric(12,2) comment 'PRICE',
   DISCOUNT             numeric(12,2) comment 'DISCOUNT',
   REMARK               numeric(12,2) comment 'remark',
   primary key (XSHT_DETAIL_ID)
);

alter table XSHT_DETAIL comment 'XSHT_DETAIL';

/*==============================================================*/
/* Table: addbill                                               */
/*==============================================================*/
create table addbill
(
   addbill_id           char(30) not null,
   hisorder_id          char(13) not null,
   note                 char(60),
   primary key (addbill_id)
);

/*==============================================================*/
/* Table: addbill_exist                                         */
/*==============================================================*/
create table addbill_exist
(
   addbill_id           char(30) not null,
   primary key (addbill_id)
);

/*==============================================================*/
/* Table: aorderbill_exist                                      */
/*==============================================================*/
create table aorderbill_exist
(
   addbill_id           char(30) not null,
   primary key (addbill_id)
);

/*==============================================================*/
/* Table: bill_manage                                           */
/*==============================================================*/
create table bill_manage
(
   id                   varchar(8) not null,
   date1                varchar(10),
   bill_num             varchar(16),
   bill_money           decimal(12,2),
   curorder_id          varchar(18),
   bill_remain          decimal(12,2),
   sendperson           varchar(10),
   getperson            varchar(10),
   primary key (id)
);

/*==============================================================*/
/* Table: book_record                                           */
/*==============================================================*/
create table book_record
(
   book_id              int not null auto_increment,
   book_no              varchar(30),
   book_date            timestamp,
   start_date           timestamp,
   valid_date           timestamp,
   tablename            varchar(200),
   cust_id              varchar(20),
   cust_name            varchar(80),
   cust_tel             varchar(30),
   cust_leaveword       varchar(80),
   book_account         numeric(14,2) default 0,
   operator             char(20),
   operate_date         timestamp,
   receiver             varchar(20),
   book_status          varchar(10),
   remark               varchar(100),
   cust_num             numeric(5,0) default 0,
   primary key (book_id)
);

/*==============================================================*/
/* Table: book_table                                            */
/*==============================================================*/
create table book_table
(
   book_id              numeric(14,0) not null,
   book_no              varchar(30),
   tablename            varchar(40) not null,
   cust_num             numeric(5,0) default 0,
   book_status          varchar(10),
   remark               varchar(100),
   primary key (book_id, tablename)
);

/*==============================================================*/
/* Table: carddata                                              */
/*==============================================================*/
create table carddata
(
   id                   int not null,
   card_id              int not null,
   dish_id              char(5) not null,
   card_page            char(1) not null,
   quantity             numeric(12,2) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: check_out                                             */
/*==============================================================*/
create table check_out
(
   checkout_date        timestamp not null,
   primary key (checkout_date)
);

/*==============================================================*/
/* Table: customer_eat_habit                                    */
/*==============================================================*/
create table customer_eat_habit
(
   customer_id          varchar(10) not null,
   eat_habit            varchar(100) not null,
   checked              char(1) not null,
   primary key (customer_id)
);

/*==============================================================*/
/* Table: customer_familymember                                 */
/*==============================================================*/
create table customer_familymember
(
   fid                  int not null auto_increment,
   customer_id          varchar(18) not null,
   name                 varchar(50) not null,
   sex                  varchar(2),
   age                  int,
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

/*==============================================================*/
/* Table: customer_telrecord                                    */
/*==============================================================*/
create table customer_telrecord
(
   customer_id          varchar(10) not null,
   customer_aname       char(20),
   customer_name        char(60),
   customer_type        char(10),
   cust_address         varchar(100),
   city                 char(20),
   zipcode              char(6),
   tel                  char(20),
   fax                  char(20),
   email                char(20),
   principal            char(20),
   contact              char(20),
   contacttel           char(20),
   bank                 char(40),
   account_id           char(20),
   tax_id               char(20),
   imprest              double,
   firstday             date,
   lastday              date,
   total_times          int,
   shouldpay            double,
   free_charge          double,
   yetpay               double,
   notpay               double,
   keep_account         double,
   lost_amount          double,
   operatorname         char(20),
   creditlevel          int,
   paytype              char(14),
   creditquota          double,
   discount_rate        double,
   sex                  char(2),
   id_card              char(18),
   birthday             date,
   company              char(30),
   mobilephone          char(30),
   home_address         char(100),
   remark               varchar(100),
   isvip                char(1),
   vip_card             varchar(25),
   vipdate              date,
   iscompany            char(1) default 'N',
   dish_id              char(5),
   price                numeric(12,4),
   customer_py          varchar(20),
   if_all_discount      char(1) default 'n',
   tel_time             timestamp,
   tel_num              varchar(20),
   primary key (customer_id)
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

/*==============================================================*/
/* Table: del_curorder                                          */
/*==============================================================*/
create table del_curorder
(
   curorder_id          varchar(18) not null,
   posname              varchar(50),
   customer_id          varchar(20),
   customer_aname       char(20),
   customer_name        char(60),
   tablename            char(20),
   shift                char(10),
   orderdate            timestamp,
   del_date             timestamp,
   ordertime            time,
   expensetype          char(30),
   personnumber         float default 0,
   waiter               char(20),
   operatorname         char(20),
   dish_amount          decimal(16,2) default 0,
   roomfee              decimal(16,2) default 0,
   srvfee               decimal(16,2) default 0,
   amount               decimal(16,2) default 0,
   discount_rate        decimal(16,2) default 1,
   discount             decimal(16,2) default 0,
   shouldpay            numeric(12,2),
   keep_account         decimal(16,2) default 0,
   lost_amount          decimal(16,2) default 0,
   yetpay               decimal(16,2) default 0,
   free_charge          decimal(16,2) default 0,
   notpay               decimal(16,2) default 0,
   paytype              char(20),
   yetpay_temp          numeric(12,2),
   srv_rate             decimal(16) default 0,
   cancel_table         char(2),
   cancel_time          timestamp,
   invoice_amount       numeric(12,2) default 0,
   recheck              char(1) default 'N',
   book_id              numeric(14,0),
   paytype_multi        varchar(60),
   strout_flag          char(1) default 'N',
   vip_no               varchar(25) default '',
   check_out            char(1) default '0',
   buf_dinner           char(1),
   flowno               varchar(20),
   all_discount         char(1),
   invoice_num          varchar(50),
   redeal_flag          char(1),
   primary key (curorder_id)
);

/*==============================================================*/
/* Table: dinner                                                */
/*==============================================================*/
create table dinner
(
   dinnername           char(40) not null,
   dinnertext           longblob,
   dinnerpicture        longblob,
   dinnneraddress       varchar(100),
   dinnertel            char(20),
   request_tel          varchar(30),
   agent                varchar(100) default '',
   pdaserver            varchar(100) default '',
   primary key (dinnername)
);

/*==============================================================*/
/* Table: dish_auto_with_person                                 */
/*==============================================================*/
create table dish_auto_with_person
(
   dish_id              char(10) not null,
   quantity             decimal(5,2),
   auto                 char(1) default '0',
   primary key (dish_id)
);

/*==============================================================*/
/* Table: dish_display                                          */
/*==============================================================*/
create table dish_display
(
   dish_id              char(10) not null,
   dishname             char(100),
   dishtype             varchar(10),
   pictrue              varchar(200),
   remark1              varchar(300),
   remark2              varchar(300),
   remark3              varchar(300),
   remark4              varchar(300),
   remark5              varchar(300),
   remark6              varchar(300),
   remark7              varchar(300),
   remark8              varchar(300),
   remark9              varchar(300),
   remark10             varchar(300),
   remark11             varchar(300),
   remark12             varchar(300),
   remark13             varchar(300),
   remark14             varchar(300),
   remark15             varchar(300),
   remark16             varchar(300),
   remark17             varchar(300),
   remark18             varchar(300),
   remark19             varchar(300),
   remark20             varchar(300),
   remark21             varchar(300),
   remark22             varchar(300),
   remark23             varchar(300),
   remark24             varchar(300),
   remark25             varchar(300),
   remark26             varchar(300),
   remark27             varchar(300),
   remark28             varchar(300),
   remark29             varchar(300),
   remark30             varchar(300),
   primary key (dish_id)
);

/*==============================================================*/
/* Table: dish_evaluate                                         */
/*==============================================================*/
create table dish_evaluate
(
   insertdate           timestamp not null,
   dish_id              varchar(50) not null,
   note                 varchar(100) not null,
   num                  numeric(14,2) not null,
   stror_num            numeric(14,2) not null,
   primary key (insertdate)
);

/*==============================================================*/
/* Table: dish_lb4                                              */
/*==============================================================*/
create table dish_lb4
(
   lb_id                char(2) not null,
   lb_name              char(40),
   primary key (lb_id)
);

/*==============================================================*/
/* Table: dish_option                                           */
/*==============================================================*/
create table dish_option
(
   id                   char(5) not null,
   optionname           varchar(50) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: dish_out1                                             */
/*==============================================================*/
create table dish_out1
(
   CURORDERDETAIL_ID    char(13) not null,
   CURORDER_ID          char(13),
   POSNAME              varchar(50),
   DISH_ID              char(10),
   DISHTYPE             char(10),
   DISHNAME             char(20),
   UNIT                 char(8),
   QUANTITY             numeric(12,2),
   NEW_FINISH_QTY       numeric(12,2),
   FINISH_QTY           numeric(12,2),
   PRICE                numeric(12,2),
   DISCOUNT_RATE        numeric(12,2),
   AFTER_DISCOUNT       numeric(12,2),
   DISHTYPE_ID          char(2),
   TECHNICIAN_NAME      char(20),
   OPERATOR_NAME        char(20),
   DISH_TIME            timestamp,
   COST                 numeric(12,4),
   ORDER_NO             char(20),
   KITCHEN_PRN          char(1),
   WAITER               char(20),
   dish_request         varchar(250),
   Order_Flag           char(1),
   bar_code             varchar(20),
   kill_id              varchar(13) default '',
   present_amt          numeric(7,2) default 0,
   frt_mng              varchar(24) default '',
   commision_rate       numeric(14,2) default 0,
   ID                   int not null auto_increment,
   dish_out_time        timestamp default CURRENT_TIMESTAMP,
   kill_reason          varchar(100),
   primary key (ID)
);

/*==============================================================*/
/* Table: dish_posdiscount                                      */
/*==============================================================*/
create table dish_posdiscount
(
   pos_id               varchar(5) not null,
   dish_id              varchar(10) not null,
   discount_rate        numeric(14,2) default 1,
   note                 varchar(20),
   primary key (pos_id, dish_id)
);

/*==============================================================*/
/* Table: dish_select                                           */
/*==============================================================*/
create table dish_select
(
   flag                 char(10) not null,
   dish_id              char(10),
   primary key (flag)
);

/*==============================================================*/
/* Table: dishdisplay                                           */
/*==============================================================*/
create table dishdisplay
(
   dishtype_id          char(2) not null,
   posname              varchar(50),
   dishtype             char(10),
   edishtype            char(10),
   displayorder         numeric(5,2),
   dishtypecolor        char(16),
   is_display           char(1) default '1',
   primary key (dishtype_id)
);

/*==============================================================*/
/* Table: dishmustorder_group                                   */
/*==============================================================*/
create table dishmustorder_group
(
   group_id             char(2) not null comment '��ID',
   group_name           varchar(10) comment '������',
   group_type           char(1) comment '������˾������˾���',
   group_qty            int comment 'ÿ���ѡ������',
   hme_id               varchar(30) comment '��Ӧ�����ID',
   upflag               char(1) comment 'ͬ����־λ',
   primary key (group_id)
);

alter table dishmustorder_group comment '��Ʒ��ѡ��';

/*==============================================================*/
/* Table: dishtype_sub                                          */
/*==============================================================*/
create table dishtype_sub
(
   lb_id                char(2) not null,
   lb_name              varchar(10),
   parent_id            char(2),
   primary key (lb_id)
);

/*==============================================================*/
/* Table: drink_stock                                           */
/*==============================================================*/
create table drink_stock
(
   stock_no             varchar(40) not null,
   drink_name           varchar(40) not null,
   drink_num            numeric(10,2) default 0,
   unit                 varchar(10),
   cust_name            varchar(40),
   cust_pws             varchar(20) default '',
   stock_position       varchar(100),
   waiter_name          varchar(20),
   stock_date           timestamp,
   valid_date           timestamp,
   remark               varchar(100),
   primary key (stock_no, drink_name)
);

/*==============================================================*/
/* Table: drink_stock_detail                                    */
/*==============================================================*/
create table drink_stock_detail
(
   stock_id             int not null auto_increment,
   stock_no             varchar(40) not null,
   drink_name           varchar(40),
   drink_num            numeric(10,2) default 0,
   unit                 varchar(10),
   cust_name            varchar(40),
   stock_position       varchar(100),
   waiter_name          varchar(20),
   stock_date           timestamp,
   valid_date           timestamp,
   remark               varchar(100),
   operater             varchar(20),
   operation_date       timestamp,
   stock_status         varchar(10),
   remark2              varchar(100),
   primary key (stock_id)
);

/*==============================================================*/
/* Table: fileupdate                                            */
/*==============================================================*/
create table fileupdate
(
   filename             varchar(255) not null,
   file                 longblob,
   updatetime           timestamp,
   primary key (filename)
);

/*==============================================================*/
/* Table: forepos_cross                                         */
/*==============================================================*/
create table forepos_cross
(
   cross_id             varchar(30) not null,
   starttime            timestamp,
   endtime              timestamp,
   cashier_id           char(20),
   cashier_name         char(20),
   manage_id            char(20),
   manage_name          char(20),
   crosstime            timestamp,
   up_flag              char(1) default '0',
   primary key (cross_id)
);

/*==============================================================*/
/* Table: forepos_cross_detail                                  */
/*==============================================================*/
create table forepos_cross_detail
(
   detail_id            int not null auto_increment,
   cross_id             varchar(30) not null,
   paytype_name         char(14),
   should_turn          numeric(12,2),
   real_turn            numeric(12,2),
   up_flag              char(1) default '0',
   primary key (detail_id)
);

/*==============================================================*/
/* Table: func_lb1                                              */
/*==============================================================*/
create table func_lb1
(
   func_lb1             char(20) not null,
   order_no             char(2),
   primary key (func_lb1)
);

/*==============================================================*/
/* Table: func_lb2                                              */
/*==============================================================*/
create table func_lb2
(
   id                   int not null auto_increment,
   func_lb1             char(20),
   func_lb2             char(50),
   FUNCTION_ID          char(6),
   remark               varchar(1000),
   order_no             char(2),
   ver_flag             varchar(5) default '0',
   primary key (id)
);

/*==============================================================*/
/* Table: helth_info                                            */
/*==============================================================*/
create table helth_info
(
   id                   int not null auto_increment,
   customer_id          varchar(10) not null,
   helth_info           varchar(1000),
   primary key (id)
);

/*==============================================================*/
/* Table: hme_communication                                     */
/*==============================================================*/
create table hme_communication
(
   id                   int not null auto_increment comment 'ID',
   rec_time             timestamp comment '����ʱ��',
   busCode              char(5) comment 'ҵ�����',
   tips                 varchar(500) comment '֪ͨ��Ϣ',
   is_tip               char(5) default '0' comment '֪ͨ�Ƿ���',
   data                 varchar(5000) comment '��������',
   state_flag           char(2) comment '״̬��δ�����Ѷ���',
   orderNo              varchar(50) comment '������',
   tableId              varchar(50) comment '̨λID',
   dealinfo             varchar(200),
   primary key (id)
);

alter table hme_communication comment '���è��Ϣ��';

/*==============================================================*/
/* Table: hme_order                                             */
/*==============================================================*/
create table hme_order
(
   orderId              varchar(50) comment 'ID',
   shopId               varchar(20) comment '����ID',
   userId               varchar(20) comment '�û�ID',
   orderNo              varchar(50) not null comment '����',
   shopName             varchar(40) comment '��������',
   shopLogoURL          varchar(100) comment '����LOGO����',
   longlatitude         varchar(30) comment '��γ��',
   bookedTime           varchar(20) comment 'Ԥ��ʱ��',
   createTime           varchar(20) comment '����ʱ��',
   confirmTime          varchar(30) comment 'ȷ��ʱ��',
   orderState           char(1) comment '����״̬',
   orderType            char(1) comment '��������',
   payState             char(1) comment '����״̬',
   consumeState         char(1) comment '����״̬',
   appraiseState        char(1),
   totalAmount          double comment '�͵����',
   prepayAmount         double comment 'Ԥ�����',
   bookedNumber         double,
   peopleNumber         int comment '����',
   contact              varchar(10) comment '��ϵ��',
   contactPhone         varchar(20) comment '��ϵ�绰',
   isNeedRoom           char(1) comment '�Ƿ���Ҫ����',
   comment              varchar(100) comment '��ע',
   invoiceTitle         varchar(50),
   online_pay           double default 0 comment '���ϸ�����',
   download_flag        int default 0 comment 'ͬ����־λ',
   primary key (orderNo)
);

alter table hme_order comment '���è�͵�';

/*==============================================================*/
/* Table: hme_order_detail                                      */
/*==============================================================*/
create table hme_order_detail
(
   detailId             varchar(50) comment '��ϸID',
   orderId              varchar(50) comment '�͵�ID',
   orderNo              varchar(50) comment '�͵���',
   dishId               varchar(20) comment '��Ʒ����',
   dishName             varchar(50) comment '��Ʒ����',
   quantity             double comment '����',
   price                double comment '�۸�',
   rebatePoints         double,
   basePoints           double,
   isDelete             char(1),
   get_flag             char(1) comment 'ͬ����־λ'
);

alter table hme_order_detail comment '���è������ϸ';

/*==============================================================*/
/* Table: infoclients                                           */
/*==============================================================*/
create table infoclients
(
   code                 char(50)
);

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
/* Table: j_sync_cfg                                            */
/*==============================================================*/
create table j_sync_cfg
(
   sync_id              varchar(50) not null,
   sync_name            varchar(50),
   sync_type            varchar(10),
   sync_interval        int,
   last_sync_time       varchar(20),
   is_enable            int,
   order_id             int,
   primary key (sync_id)
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

/*==============================================================*/
/* Table: late_reason                                           */
/*==============================================================*/
create table late_reason
(
   id                   int not null auto_increment,
   late_reason          char(20),
   remark               varchar(1000),
   primary key (id)
);

/*==============================================================*/
/* Table: late_record                                           */
/*==============================================================*/
create table late_record
(
   id                   int not null auto_increment,
   emp_no               char(20),
   emp_name             char(20),
   department           char(20),
   occur_date           timestamp,
   late_reason          char(20),
   start_time           timestamp,
   end_time             timestamp,
   add_time             timestamp,
   check_man            char(20),
   mng_name             char(20),
   remark               varchar(1000),
   primary key (id)
);

/*==============================================================*/
/* Table: line_sys                                              */
/*==============================================================*/
create table line_sys
(
   name                 varchar(50) not null,
   lastnum              int,
   frontnum             int,
   prefix               char(10),
   id                   char(2) not null,
   primary key (name)
);

/*==============================================================*/
/* Table: ll_dengjiyanse                                        */
/*==============================================================*/
create table ll_dengjiyanse
(
   id                   int not null,
   mingcheng            char(20),
   yanse                int,
   shuoming             char(50),
   keyong               char(10),
   shiduan              int,
   primary key (id)
);

/*==============================================================*/
/* Table: ll_outprint                                           */
/*==============================================================*/
create table ll_outprint
(
   now_time             timestamp not null default CURRENT_TIMESTAMP,
   computer_name        char(30),
   curorder_id          varchar(18) not null,
   expensetype          char(10),
   pos_name             varchar(50) not null,
   pos_print            varchar(80),
   table_name           char(20) not null,
   table_id             varchar(10) not null,
   operator_name        char(20) not null,
   now_using            char(1) not null default '0',
   person_number        char(10),
   printflag            char(1) default '0',
   lb_id                char(2),
   extra_info           varchar(30),
   primary key (now_time)
);

alter table ll_outprint comment '���򻺴�';

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

/*==============================================================*/
/* Table: ll_unneedprint                                        */
/*==============================================================*/
create table ll_unneedprint
(
   lb_id                char(2) not null,
   lb_name              char(40) not null,
   dishtype_id          char(2) not null,
   dishtype_name        char(10) not null,
   primary key (lb_id)
);

/*==============================================================*/
/* Table: mobile_device                                         */
/*==============================================================*/
create table mobile_device
(
   device_id            varchar(20) not null,
   is_valid             varchar(1),
   memo                 varchar(50),
   primary key (device_id)
);

/*==============================================================*/
/* Table: multi_pay                                             */
/*==============================================================*/
create table multi_pay
(
   curorder_id          varchar(20),
   vipno                varchar(20),
   cash                 decimal(12,2),
   credit_card          decimal(12,2),
   check1               decimal(12,2),
   largess              decimal(12,2),
   keep_account         decimal(12,2),
   entertainment        decimal(12,2),
   keep_account_n       decimal(12,2),
   vip_card             decimal(12,2),
   posname              varchar(50),
   tablename            varchar(50)
);

/*==============================================================*/
/* Table: multi_print_reason                                    */
/*==============================================================*/
create table multi_print_reason
(
   multi_print_reason_id char(2) not null,
   multi_print_reason_name char(40),
   primary key (multi_print_reason_id)
);

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

/*==============================================================*/
/* Table: net_delete_row                                        */
/*==============================================================*/
create table net_delete_row
(
   id                   int not null auto_increment,
   del_table            varchar(50) not null,
   del_primary_data     varchar(50) not null,
   del_primary_column   varchar(50),
   primary key (id)
);

/*==============================================================*/
/* Table: operator_fixdiscount                                  */
/*==============================================================*/
create table operator_fixdiscount
(
   operator_id          varchar(20) not null,
   discount_rate        double not null,
   primary key (operator_id)
);

/*==============================================================*/
/* Table: operator_group                                        */
/*==============================================================*/
create table operator_group
(
   group_id             char(4) not null,
   group_name           char(20),
   operator_id          char(20) not null,
   primary key (group_id, operator_id)
);

/*==============================================================*/
/* Table: operator_group_function                               */
/*==============================================================*/
create table operator_group_function
(
   group_id             char(4) not null,
   function_id          char(6) not null,
   auth_right           char(1),
   primary key (group_id, function_id)
);

/*==============================================================*/
/* Table: order_prn_detail                                      */
/*==============================================================*/
create table order_prn_detail
(
   curorderdetail_id    char(13) not null,
   curorder_id          char(13),
   posname              varchar(50),
   dish_id              char(10),
   dishtype             char(10),
   dishname             char(100),
   unit                 char(8),
   quantity             numeric(12,2),
   new_finish_qty       numeric(12,2),
   finish_qty           numeric(12,2),
   price                numeric(12,2),
   discount_rate        numeric(12,2),
   after_discount       numeric(12,2),
   dishtype_id          char(2),
   technician_name      char(20),
   operator_name        char(20),
   dish_time            timestamp,
   cost                 numeric(12,4),
   order_no             char(20),
   kitchen_prn          char(1),
   dish_request         varchar(250),
   order_flag           char(1),
   bar_code             varchar(20),
   kill_id              varchar(13) default '',
   present_amt          numeric(7,2) default 0,
   frt_mng              varchar(24) default '',
   waiter               char(20),
   commision_rate       numeric(14,4) default 0,
   kill_reason          varchar(100),
   reuse_prn            varchar(5) default '0',
   commision            numeric(14,4) default 0,
   strout_flag          char(1) default 'N',
   tablename            char(20),
   jf_flag              char(1),
   tc_flag              timestamp,
   flow_id              varchar(10),
   order_flag1          char(1),
   prn_no               numeric(5,0),
   primary key (curorderdetail_id)
);

/*==============================================================*/
/* Index: order_prn_detail_idx                                  */
/*==============================================================*/
create index order_prn_detail_idx on order_prn_detail
(
   curorder_id
);

/*==============================================================*/
/* Table: paytype                                               */
/*==============================================================*/
create table paytype
(
   paytype              char(14) not null comment '���ʽ',
   paytype_id           char(5) comment '���ʽ����',
   pic                  varchar(100),
   displayorder         int comment '��ʾ˳��',
   paymenny             numeric(10,2),
   displayyesno         char(1),
   zhjz                 char(1) default '0',
   lq                   char(1) default '0',
   discount             numeric(10,2) default 1,
   paynumber            numeric(10,2) default 0,
   realmenny            numeric(10,2) default 0,
   qx                   char(1) default '0',
   is_zzx               char(1) default '0' comment '�Ƿ�������',
   is_vip               char(1) default '0' comment '�Ƿ�VIP',
   primary key (paytype)
);

alter table paytype comment '���ʽ';

/*==============================================================*/
/* Table: paytype1                                              */
/*==============================================================*/
create table paytype1
(
   paytype_id           varchar(10) not null,
   paytype_name         varchar(20) not null,
   is_valid             varchar(1),
   primary key (paytype_id)
);

/*==============================================================*/
/* Table: paytype_multy                                         */
/*==============================================================*/
create table paytype_multy
(
   curorder_id          varchar(20) not null,
   paytype              varchar(20),
   amount               decimal(10,2),
   vipno                varchar(20),
   vippwd               varchar(20),
   primary key (curorder_id)
);

/*==============================================================*/
/* Table: paytype_return                                        */
/*==============================================================*/
create table paytype_return
(
   return_id            int not null auto_increment,
   return_paytype       varchar(20) not null,
   return_base          decimal(14,2),
   return_money         decimal(14,2),
   return_percentage    decimal(8,2),
   return_type          char(2) default '0',
   is_use               char(1) default '1',
   primary key (return_id)
);

/*==============================================================*/
/* Table: pbcatcol                                              */
/*==============================================================*/
create table pbcatcol
(
   pbc_tnam             char(129) not null,
   pbc_tid              int,
   pbc_ownr             char(129) not null,
   pbc_cnam             char(129) not null,
   pbc_cid              smallint,
   pbc_labl             char(254),
   pbc_lpos             smallint,
   pbc_hdr              char(254),
   pbc_hpos             smallint,
   pbc_jtfy             smallint,
   pbc_mask             char(31),
   pbc_case             smallint,
   pbc_hght             smallint,
   pbc_wdth             smallint,
   pbc_ptrn             char(31),
   pbc_bmap             char(1),
   pbc_init             char(254),
   pbc_cmnt             char(254),
   pbc_edit             char(31),
   pbc_tag              char(254),
   primary key (pbc_tnam)
);

/*==============================================================*/
/* Index: pbcatc_x                                              */
/*==============================================================*/
create unique index pbcatc_x on pbcatcol
(
   pbc_tnam,
   pbc_ownr,
   pbc_cnam
);

/*==============================================================*/
/* Table: pbcatedt                                              */
/*==============================================================*/
create table pbcatedt
(
   pbe_name             char(30) not null,
   pbe_edit             char(254),
   pbe_type             smallint,
   pbe_cntr             int,
   pbe_seqn             smallint not null,
   pbe_flag             int,
   pbe_work             char(32),
   primary key (pbe_name)
);

/*==============================================================*/
/* Index: pbcate_x                                              */
/*==============================================================*/
create unique index pbcate_x on pbcatedt
(
   pbe_name,
   pbe_seqn
);

/*==============================================================*/
/* Table: pbcatfmt                                              */
/*==============================================================*/
create table pbcatfmt
(
   pbf_name             char(30) not null,
   pbf_frmt             char(254),
   pbf_type             smallint,
   pbf_cntr             int,
   primary key (pbf_name)
);

/*==============================================================*/
/* Index: pbcatf_x                                              */
/*==============================================================*/
create unique index pbcatf_x on pbcatfmt
(
   pbf_name
);

/*==============================================================*/
/* Table: pbcattbl                                              */
/*==============================================================*/
create table pbcattbl
(
   pbt_tnam             char(129) not null,
   pbt_tid              int,
   pbt_ownr             char(129) not null,
   pbd_fhgt             smallint,
   pbd_fwgt             smallint,
   pbd_fitl             char(1),
   pbd_funl             char(1),
   pbd_fchr             smallint,
   pbd_fptc             smallint,
   pbd_ffce             char(18),
   pbh_fhgt             smallint,
   pbh_fwgt             smallint,
   pbh_fitl             char(1),
   pbh_funl             char(1),
   pbh_fchr             smallint,
   pbh_fptc             smallint,
   pbh_ffce             char(18),
   pbl_fhgt             smallint,
   pbl_fwgt             smallint,
   pbl_fitl             char(1),
   pbl_funl             char(1),
   pbl_fchr             smallint,
   pbl_fptc             smallint,
   pbl_ffce             char(18),
   pbt_cmnt             char(254),
   primary key (pbt_tnam)
);

/*==============================================================*/
/* Index: pbcatt_x                                              */
/*==============================================================*/
create unique index pbcatt_x on pbcattbl
(
   pbt_tnam,
   pbt_ownr
);

/*==============================================================*/
/* Table: pbcatvld                                              */
/*==============================================================*/
create table pbcatvld
(
   pbv_name             char(30) not null,
   pbv_vald             char(254),
   pbv_type             smallint,
   pbv_cntr             int,
   pbv_msg              char(254),
   primary key (pbv_name)
);

/*==============================================================*/
/* Index: pbcatv_x                                              */
/*==============================================================*/
create unique index pbcatv_x on pbcatvld
(
   pbv_name
);

/*==============================================================*/
/* Table: pdaver                                                */
/*==============================================================*/
create table pdaver
(
   pdaver               char(1) not null,
   primary key (pdaver)
);

/*==============================================================*/
/* Table: pk_del                                                */
/*==============================================================*/
create table pk_del
(
   pk_id                char(14) not null,
   pk_no                longtext,
   str_in_bill_id       char(14),
   str_out_bill_id      char(14),
   store_id             char(2),
   operator_id          varchar(20),
   verifier             char(20),
   pk_date              timestamp,
   auditer_id           char(4),
   audit_date           timestamp,
   remark               longtext,
   del_reson            varchar(100),
   modifier_id          varchar(8),
   modify_date          timestamp,
   operator_date        timestamp,
   primary key (pk_id)
);

/*==============================================================*/
/* Table: pk_detail_del                                         */
/*==============================================================*/
create table pk_detail_del
(
   pk_id                char(14) not null,
   stock_remain_id      char(14) not null,
   goods_id             char(16),
   zmsl                 numeric(12,2),
   pdsl                 numeric(12,2),
   batch_id             char(14),
   price                decimal(12,6),
   remark               varchar(200),
   primary key (pk_id, stock_remain_id)
);

/*==============================================================*/
/* Table: pop_grant                                             */
/*==============================================================*/
create table pop_grant
(
   id                   int not null auto_increment,
   grant_fid            varchar(50),
   grant_eid            varchar(50),
   grant_sday           timestamp,
   grant_eday           timestamp,
   primary key (id)
);

/*==============================================================*/
/* Table: pos_vip                                               */
/*==============================================================*/
create table pos_vip
(
   id                   int not null auto_increment,
   vip_id               int not null,
   vip_type             varchar(20),
   vip_no               varchar(20),
   name                 varchar(10),
   sex                  char(2),
   tel                  varchar(20),
   email                varchar(20),
   start_date           date,
   discount_rate        decimal(3,3),
   valid_money          decimal(14,2),
   valid_points         decimal(14,2),
   memo                 varchar(1000),
   system_memo          varchar(1000),
   operator             varchar(10),
   operate_time         timestamp,
   primary key (id)
);

/*==============================================================*/
/* Index: idx_pos_vip_vip_id                                    */
/*==============================================================*/
create index idx_pos_vip_vip_id on pos_vip
(
   vip_id
);

/*==============================================================*/
/* Table: pos_vip_points_flow                                   */
/*==============================================================*/
create table pos_vip_points_flow
(
   _id                  int not null auto_increment,
   vip_id               int not null,
   occur_time           timestamp,
   occur_money          double,
   occur_points         double,
   after_points         double,
   operator             varchar(10),
   operate_date         timestamp,
   system_memo          varchar(1000),
   memo                 varchar(1000),
   primary key (_id)
);

/*==============================================================*/
/* Index: idx_pos_vip_points_flow_vip_id                        */
/*==============================================================*/
create index idx_pos_vip_points_flow_vip_id on pos_vip_points_flow
(
   vip_id
);

/*==============================================================*/
/* Table: pre_checkback                                         */
/*==============================================================*/
create table pre_checkback
(
   checkback_id         char(14),
   str_out_bill_id      char(14),
   goods_id             char(16),
   batch_id             char(14),
   operator_name        char(20),
   operator_date        timestamp
);

/*==============================================================*/
/* Table: pre_order                                             */
/*==============================================================*/
create table pre_order
(
   id                   varchar(10),
   dish_id              varchar(10),
   quantity             numeric(14,2),
   order1               int,
   orderdate            date,
   ordered_flag         char(1)
);

/*==============================================================*/
/* Table: print_flow                                            */
/*==============================================================*/
create table print_flow
(
   id                   int not null auto_increment,
   flow_zd              varchar(12),
   flow_fd              varchar(12),
   print_time           timestamp,
   primary key (id)
);

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

/*==============================================================*/
/* Table: receive                                               */
/*==============================================================*/
create table receive
(
   receive_id           char(1) not null,
   com                  varchar(4),
   primary key (receive_id)
);

/*==============================================================*/
/* Table: report                                                */
/*==============================================================*/
create table report
(
   report_id            int not null auto_increment comment '������',
   report_name          varchar(100) comment '��������',
   chinese_name         varchar(100) comment '������������',
   remark               varchar(100) comment '��ע',
   primary key (report_id)
);

alter table report comment '��������ݴ���';

/*==============================================================*/
/* Table: report_detail                                         */
/*==============================================================*/
create table report_detail
(
   report_id            int comment '������',
   column_id            int not null auto_increment comment '�ֶα��',
   table_name           varchar(100) comment '����',
   column_name          varchar(100) comment '�ֶ���',
   chinese_name         varchar(100) comment '�ֶ���������',
   is_visible           char(1) comment '�Ƿ���ʾ',
   width                numeric(4,0) comment '���',
   order_no             numeric(4,0) comment '����',
   primary key (column_id)
);

alter table report_detail comment '����ʹ���ֶ���ϸ';

/*==============================================================*/
/* Table: rg                                                    */
/*==============================================================*/
create table rg
(
   requestcode          varchar(30),
   registercode         varchar(30)
);

/*==============================================================*/
/* Table: setpage                                               */
/*==============================================================*/
create table setpage
(
   dishtype_id          varchar(10) not null,
   index_id             int not null,
   cnt                  int,
   primary key (dishtype_id, index_id)
);

/*==============================================================*/
/* Table: str_in_bill_del                                       */
/*==============================================================*/
create table str_in_bill_del
(
   str_in_bill_id       char(14) not null,
   str_in_bill_no       char(20),
   dfdh                 char(14),
   str_in_type_id       char(1),
   str_in_date          timestamp,
   operator_date        timestamp,
   store_id             char(2),
   transactor           char(20),
   operator_id          varchar(20),
   come_from            char(40),
   verifier             char(20),
   modifier_id          char(4),
   modify_date          timestamp,
   auditer_id           char(4),
   audit_date           timestamp,
   bill_num             int,
   remark               varchar(100),
   is_statics           char(1),
   is_end               char(1) default 'N',
   end_date             timestamp,
   end_reason           longtext,
   invoice_type_id      char(1),
   buyer_grp_id         char(2),
   buyer_id             char(5),
   vendor_id            char(12),
   is_account           char(1),
   del_reason           varchar(100),
   is_zhibo             char(1),
   primary key (str_in_bill_id)
);

/*==============================================================*/
/* Table: str_in_bill_detail_del                                */
/*==============================================================*/
create table str_in_bill_detail_del
(
   str_in_bill_id       char(14) not null,
   batch_id             char(14) not null,
   goods_id             char(16),
   qty                  numeric(12,6),
   piece                numeric(12,2),
   price                numeric(12,6),
   discount             numeric(12,2) default 1,
   yxq                  timestamp,
   pch                  char(20),
   total                numeric(16,2),
   remark               varchar(200),
   primary key (str_in_bill_id, batch_id)
);

/*==============================================================*/
/* Table: str_out_bill_check                                    */
/*==============================================================*/
create table str_out_bill_check
(
   id                   int not null auto_increment,
   goods_id             char(16) not null,
   come_to              char(40) not null,
   check_date           timestamp,
   qty                  numeric(12,6),
   out_qty              numeric(12,6),
   check_to_date        timestamp,
   primary key (id)
);

/*==============================================================*/
/* Table: str_out_bill_del                                      */
/*==============================================================*/
create table str_out_bill_del
(
   str_out_bill_id      char(14) not null,
   str_out_bill_no      char(20),
   dfdh                 char(14),
   str_out_type_id      char(1),
   str_out_date         timestamp,
   operator_date        timestamp,
   store_id             char(2),
   transactor           char(20),
   operator_id          varchar(20),
   come_to              char(40),
   verifier             char(20),
   modifier_id          char(4),
   modify_date          timestamp,
   auditer_id           char(4),
   audit_date           timestamp,
   bill_num             int,
   remark               longtext,
   is_statics           char(1),
   del_reson            varchar(100),
   primary key (str_out_bill_id)
);

/*==============================================================*/
/* Table: str_out_bill_detail_del                               */
/*==============================================================*/
create table str_out_bill_detail_del
(
   str_out_bill_id      char(14) not null,
   goods_id             char(16),
   batch_id             char(14) not null,
   qty                  numeric(12,6),
   piece                numeric(12,2),
   price                numeric(12,6),
   remark               varchar(200),
   primary key (str_out_bill_id)
);

/*==============================================================*/
/* Table: str_zk                                                */
/*==============================================================*/
create table str_zk
(
   zk_id                varchar(14) not null,
   zk_no                varchar(20),
   zk_date              timestamp,
   store_out            char(10),
   store_in             char(10),
   operator_id          char(4),
   operator_date        timestamp,
   modifier_id          char(4),
   modify_date          timestamp,
   auditer_id           char(4),
   audit_date           timestamp,
   remark               varchar(100),
   primary key (zk_id)
);

/*==============================================================*/
/* Index: idx_str_zk_date                                       */
/*==============================================================*/
create index idx_str_zk_date on str_zk
(
   zk_date
);

/*==============================================================*/
/* Index: idx_str_zk_id                                         */
/*==============================================================*/
create unique index idx_str_zk_id on str_zk
(
   zk_id
);

/*==============================================================*/
/* Table: str_zk_del                                            */
/*==============================================================*/
create table str_zk_del
(
   zk_id                varchar(14) not null,
   zk_no                varchar(20),
   zk_date              timestamp,
   store_out            char(10),
   store_in             char(10),
   operator_id          char(4),
   operator_date        timestamp,
   modifier_id          char(4),
   modify_date          timestamp,
   auditer_id           char(4),
   audit_date           timestamp,
   remark               varchar(100),
   primary key (zk_id)
);

/*==============================================================*/
/* Index: idx_str_zk_del_date                                   */
/*==============================================================*/
create index idx_str_zk_del_date on str_zk_del
(
   zk_date
);

/*==============================================================*/
/* Index: idx_str_zk_del_id                                     */
/*==============================================================*/
create unique index idx_str_zk_del_id on str_zk_del
(
   zk_id
);

/*==============================================================*/
/* Table: str_zk_detail                                         */
/*==============================================================*/
create table str_zk_detail
(
   batch_id_out         varchar(14),
   batch_id_in          varchar(14),
   goods_id             varchar(16),
   qty                  decimal(16,6),
   piece                decimal(16,6),
   price                decimal(16,6),
   orderby              int,
   remark               varchar(100)
);

/*==============================================================*/
/* Table: str_zk_detail_del                                     */
/*==============================================================*/
create table str_zk_detail_del
(
   batch_id_out         varchar(14),
   batch_id_in          varchar(14),
   goods_id             varchar(16),
   qty                  decimal(16,6),
   piece                decimal(16,6),
   price                decimal(16,6),
   orderby              int,
   remark               varchar(100)
);

/*==============================================================*/
/* Table: table_with_card                                       */
/*==============================================================*/
create table table_with_card
(
   table_id             varchar(20) not null,
   cardno               varchar(20) not null,
   card_id              varchar(20) not null,
   valid                char(1),
   primary key (table_id)
);

/*==============================================================*/
/* Table: tablestatus                                           */
/*==============================================================*/
create table tablestatus
(
   statusname           char(10) not null,
   tablestatus_id       char(1),
   tablestatus_pic      varchar(100) default '',
   primary key (statusname)
);

/*==============================================================*/
/* Table: tbl_CardFillFlow                                      */
/*==============================================================*/
create table tbl_CardFillFlow
(
   CardFillID           int not null auto_increment,
   VIPCardID            int not null,
   Customer_ID          varchar(20),
   Customer_Aname       varchar(20),
   PayType              varchar(20),
   FillMoney            numeric(14,4) default 0,
   ValidMoney           numeric(12,2) default 0,
   pos_id               varchar(3),
   FillDate             timestamp default CURRENT_TIMESTAMP,
   OperateDate          timestamp default CURRENT_TIMESTAMP,
   OperatorName         varchar(20),
   CardFillRemark       varchar(250),
   presentmoney         numeric(14,4),
   salesperson          varchar(10),
   hisorder_id          char(18),
   up_flag              char(1) default '0',
   last_customer        int,
   primary key (CardFillID)
);

/*==============================================================*/
/* Table: tbl_CardRule                                          */
/*==============================================================*/
create table tbl_CardRule
(
   CardRuleID           int not null auto_increment,
   CardTypeID           varchar(4) not null,
   pos_id               varchar(3),
   DiscountRate         numeric(7,4) default 1,
   CDExpr               varchar(1000) default 'empty',
   CollectByMoney       numeric(14,2) default 0,
   ByMoneyFlag          char(1) default '0',
   ByMoneyPoint         numeric(9,4),
   CollectBytimes       numeric(12,0) default 0,
   ByTimesPoint         numeric(9,4),
   RuleStatus           char(1) default '0',
   CardRuleRemark       varchar(250),
   shift                varchar(10),
   primary key (CardRuleID)
);

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
   ExpendFlowID         int not null auto_increment,
   VIPCardID            int not null,
   ShouldPay            numeric(14,4),
   ExpendDate           timestamp,
   ExpendWay            char(1),
   HisOrder_ID          varchar(20) default '0',
   OperatorName         varchar(20),
   ExpendFlowRemark     varchar(250),
   expend_amt           numeric(14,4) default 0,
   integralflow         numeric(14,4) default 0,
   up_flag              char(1) default '0',
   last_customer        int,
   primary key (ExpendFlowID)
);

/*==============================================================*/
/* Table: tbl_cardrule_lb1                                      */
/*==============================================================*/
create table tbl_cardrule_lb1
(
   cardruleid           int not null auto_increment,
   cardtypeid           varchar(4) not null,
   lb1_id               varchar(2),
   discountrate         numeric(7,4) default 1,
   cdexpr               varchar(255) default 'empty',
   collectbymoney       numeric(14,2) default 0,
   collectpoint         numeric(9,4) default 0,
   collectflag          char(1) default '0',
   collectbytimes       numeric(12,0) default 0,
   bytimespoint         numeric(9,4) default 0,
   killbymoney          numeric(14,2) default 0,
   killpoint            numeric(9,4) default 0,
   killflag             char(1) default '0',
   rulestatus           char(1) default '0',
   cardruleremark       varchar(250),
   primary key (cardruleid)
);

/*==============================================================*/
/* Table: tbl_dish_assis                                        */
/*==============================================================*/
create table tbl_dish_assis
(
   Assis_Name           varchar(30) not null,
   Notes                varchar(150),
   primary key (Assis_Name)
);

/*==============================================================*/
/* Table: tbl_dish_doways                                       */
/*==============================================================*/
create table tbl_dish_doways
(
   doways_Name          varchar(30) not null,
   dish_id              varchar(10) not null,
   Notes                varchar(150),
   primary key (doways_Name, dish_id)
);

/*==============================================================*/
/* Table: tbl_dish_parts                                        */
/*==============================================================*/
create table tbl_dish_parts
(
   Parts_Name           varchar(30) not null,
   dish_id              varchar(10) not null,
   Notes                varchar(150),
   primary key (Parts_Name, dish_id)
);

/*==============================================================*/
/* Table: tbl_dish_specreqs                                     */
/*==============================================================*/
create table tbl_dish_specreqs
(
   SpecReqs_Name        varchar(30) not null,
   Notes                varchar(150),
   specreqs_price       numeric(12,2),
   primary key (SpecReqs_Name)
);

/*==============================================================*/
/* Table: tbl_dish_ways                                         */
/*==============================================================*/
create table tbl_dish_ways
(
   Ways_Name            varchar(30) not null,
   Notes                varchar(150),
   primary key (Ways_Name)
);

/*==============================================================*/
/* Table: tbl_pdapnt                                            */
/*==============================================================*/
create table tbl_pdapnt
(
   pntid                int not null auto_increment,
   op_id                char(13),
   op_operator          char(10),
   op_time              timestamp default CURRENT_TIMESTAMP,
   op_flag              varchar(5),
   op_srid              char(20),
   primary key (pntid)
);

/*==============================================================*/
/* Table: tbl_temp_dish_list                                    */
/*==============================================================*/
create table tbl_temp_dish_list
(
   list_id              int not null auto_increment,
   dish_name            varchar(50),
   dish_content         varchar(50),
   dish_note            varchar(250),
   primary key (list_id)
);

/*==============================================================*/
/* Table: technician                                            */
/*==============================================================*/
create table technician
(
   technician_ID        char(5) not null,
   technician_NAME      char(20),
   primary key (technician_ID)
);

/*==============================================================*/
/* Table: tuangou_type                                          */
/*==============================================================*/
create table tuangou_type
(
   id                   varchar(2) not null,
   name                 varchar(30),
   amount               double,
   primary key (id)
);

/*==============================================================*/
/* Table: uoption                                               */
/*==============================================================*/
create table uoption
(
   opt_id               varchar(20) not null,
   opt_number           varchar(8),
   opt_effect           char(1) default 'Y',
   note                 varchar(500),
   primary key (opt_id)
);

/*==============================================================*/
/* Table: vendor_goods                                          */
/*==============================================================*/
create table vendor_goods
(
   iserial              int not null auto_increment,
   vendor_id            char(12),
   goods_id             char(16),
   recprice             numeric(16,4),
   recdate              timestamp,
   flag                 varchar(2) default '',
   remark               varchar(250),
   primary key (iserial)
);

/*==============================================================*/
/* Table: version                                               */
/*==============================================================*/
create table version
(
   version              char(15) not null,
   create_date          date,
   principal            char(100),
   pbl                  varchar(1000),
   remark               varchar(1000),
   pbd                  varchar(1000),
   primary key (version)
);

/*==============================================================*/
/* Table: vip_hismessage                                        */
/*==============================================================*/
create table vip_hismessage
(
   id                   int not null auto_increment,
   message_num          int,
   sendtime             timestamp not null,
   operator             varchar(10),
   customer             varchar(255),
   sendmessage          longtext,
   primary key (id)
);

/*==============================================================*/
/* Table: vip_message                                           */
/*==============================================================*/
create table vip_message
(
   message_info         varchar(255) not null,
   add_time             timestamp,
   primary key (message_info)
);

/*==============================================================*/
/* Table: zv_half_hour                                          */
/*==============================================================*/
create table zv_half_hour
(
   hh_id                int not null,
   hh_name              char(10) not null,
   primary key (hh_id)
);

/*==============================================================*/
/* Table: zv_hm                                                 */
/*==============================================================*/
create table zv_hm
(
   hm_id                int not null,
   hm_name              char(10) not null,
   primary key (hm_id)
);

/*==============================================================*/
/* Table: zv_hour                                               */
/*==============================================================*/
create table zv_hour
(
   h_id                 int not null,
   h_name               char(10) not null,
   primary key (h_id)
);

/*==============================================================*/
/* Table: zv_minute                                             */
/*==============================================================*/
create table zv_minute
(
   h_id                 int not null,
   h_name               char(10) not null,
   primary key (h_id)
);

alter table CONTACT_DETAIL add constraint FK_CONTACT__REF_7835_CONTACT foreign key (CONTACT_ID)
      references CONTACT (CONTACT_ID) on delete restrict on update restrict;

alter table DISH add constraint fk_dishmustorder_group foreign key (dishmustorder_group)
      references dishmustorder_group (group_id) on delete set null on update restrict;

alter table PRE_PCH_CONTACT_DETAIL add constraint FK_PRE_PCH__REF_9159_PRE_PCH_ foreign key (CONTACT_ID)
      references PRE_PCH_CONTACT (CONTACT_ID) on delete restrict on update restrict;

alter table PRE_PK_DETAIL add constraint FK_PRE_PK_D_REF_23222_PRE_PK foreign key (PK_ID)
      references PRE_PK (PK_ID) on delete restrict on update restrict;

alter table PRE_STR_OUT_BILL_DETAIL add constraint FK_PRE_STR__REF_84132_PRE_STR_ foreign key (STR_OUT_BILL_ID)
      references PRE_STR_OUT_BILL (STR_OUT_BILL_ID) on delete restrict on update restrict;

alter table REPORT2 add constraint FK_REPORT2_FK_REPORT_REPORT1 foreign key (REPORT_ID)
      references REPORT1 (REPORT_ID) on delete restrict on update restrict;

alter table REPORT2 add constraint FK_REPORT2_FK_REPORT_REPORT_F foreign key (REP_REPORT_ID)
      references REPORT_FROMWHERE (REPORT_ID) on delete restrict on update restrict;

alter table REPORT_FIELD add constraint FK_REPORT_F_FK_REPORT_REPORT1 foreign key (REPORT_ID)
      references REPORT1 (REPORT_ID) on delete restrict on update restrict;

alter table REPORT_FIELD add constraint FK_REPORT_F_FK_REPORT_REPORT_F foreign key (REP_REPORT_ID)
      references REPORT_FROMWHERE (REPORT_ID) on delete restrict on update restrict;

alter table func_lb2 add constraint FK_FUNC_LB2_REF_85105_FUNC_LB1 foreign key (func_lb1)
      references func_lb1 (func_lb1) on delete cascade on update cascade;

alter table operator_fixdiscount add constraint fk_fixdiscount foreign key (operator_id)
      references OPERATOR (OPERATOR_ID) on delete cascade on update restrict;

alter table report_detail add constraint FK_REPORT_D_REF_15245_REPORT foreign key (report_id)
      references report (report_id) on delete restrict on update restrict;

alter table tbl_CardFillFlow add constraint FK_TBL_CARD_TBL_VIP_T_TBL_VIP foreign key (VIPCardID)
      references tbl_VIP (VIPCardID) on delete restrict on update cascade;

alter table tbl_CardRule add constraint FK_TBL_CARD_TBL_VIPCA_TBL_VIPC foreign key (CardTypeID)
      references tbl_VIPCardType (CardTypeID) on delete restrict on update cascade;

alter table tbl_VIP add constraint FK_TBL_VIP_TBL_VIPCA_TBL_VIPC foreign key (CardTypeID)
      references tbl_VIPCardType (CardTypeID) on delete restrict on update cascade;

alter table tbl_VIPExpendFlow add constraint FK_TBL_VIPE_TBL_VIP_T_TBL_VIP foreign key (VIPCardID)
      references tbl_VIP (VIPCardID) on delete restrict on update cascade;

alter table tbl_cardrule_lb1 add constraint fk_tbl_card_tbl_vipca_tbl_vipc foreign key (cardtypeid)
      references tbl_VIPCardType (CardTypeID) on delete restrict on update restrict;

alter table vendor_goods add constraint fk_vendor_goods_ref_goods foreign key (goods_id)
      references GOODS (GOODS_ID) on delete cascade on update restrict;

alter table vendor_goods add constraint fk_vendor_goods_ref_vendor foreign key (vendor_id)
      references VENDOR (VENDOR_ID) on delete cascade on update restrict;


create trigger delete_curorder before delete order 1 on CURORDER
REFERENCING OLD AS old_curorder  
FOR EACH ROW  
BEGIN 
delete from del_curorder where curorder_id = old_curorder.curorder_id;
INSERT INTO del_curorder ( curorder_id,  posname,  customer_id,  customer_aname,  customer_name,  tablename,  shift,  orderdate,del_date , ordertime,  expensetype,  personnumber,  waiter,  operatorname,  dish_amount,  roomfee,  srvfee,  amount,  discount_rate,  discount,  shouldpay,  keep_account,  lost_amount,  yetpay,  free_charge,  notpay,  paytype,  yetpay_temp,  srv_rate,  cancel_table,  cancel_time,  invoice_amount,  recheck,  book_id,  paytype_multi,  strout_flag,  vip_no,  check_out,  buf_dinner, 
 flowno,  all_discount,  invoice_num ) VALUES ( old_curorder.curorder_id,  old_curorder.posname,  old_curorder.customer_id,  old_curorder.customer_aname,  old_curorder.customer_name,  old_curorder.tablename,  old_curorder.shift,  old_curorder.orderdate, getdate(), old_curorder.ordertime,  old_curorder.expensetype,  old_curorder.personnumber,  old_curorder.waiter,  old_curorder.operatorname,  old_curorder.dish_amount,  old_curorder.roomfee,  old_curorder.srvfee,  old_curorder.amount, 
 old_curorder.discount_rate,  old_curorder.discount,  old_curorder.shouldpay,  old_curorder.keep_account,  old_curorder.lost_amount,  old_curorder.yetpay,  old_curorder.free_charge,  old_curorder.notpay,  old_curorder.paytype,  old_curorder.yetpay_temp,  old_curorder.srv_rate,  old_curorder.cancel_table,  old_curorder.cancel_time,  old_curorder.invoice_amount,  old_curorder.recheck,  old_curorder.book_id,  old_curorder.paytype_multi,  old_curorder.strout_flag,  old_curorder.vip_no, 
 old_curorder.check_out,  old_curorder.buf_dinner,  old_curorder.flowno,  old_curorder.all_discount,  old_curorder.invoice_num  );
END;


create trigger update_customer before update of CUSTOMER_ID, CUSTOMER_ANAME, CUSTOMER_NAME, CUSTOMER_TYPE, CUST_ADDRESS, CITY, ZIPCODE, TEL, FAX, EMAIL, PRINCIPAL, CONTACT, CONTACTTEL, BANK, ACCOUNT_ID, TAX_ID, IMPREST, FIRSTDAY, LASTDAY, TOTAL_TIMES, SHOULDPAY, FREE_CHARGE, YETPAY, NOTPAY, KEEP_ACCOUNT, LOST_AMOUNT, OPERATORNAME, CREDITLEVEL, PAYTYPE, CREDITQUOTA, DISCOUNT_RATE, SEX, ID_CARD, BIRTHDAY, COMPANY, MOBILEPHONE, HOME_ADDRESS, REMARK, ISVIP, VIP_CARD, VIPDATE, ISCOMPANY, dish_id, price,
 Customer_Py, if_all_discount order 2 on CUSTOMER
REFERENCING OLD AS old_customer NEW AS new_customer 
FOR EACH ROW 
BEGIN
	update customer set up_flag = '0' where customer_id = new_customer.customer_id;
END;


create trigger update_TableStatus before update of statusname order 2 on TABLES
REFERENCING OLD AS old_tables NEW AS new_tables 
FOR EACH ROW 
BEGIN 
IF (select count(*) from uoption where opt_id = 'update_tablestatus' ) = 0 THEN 
	insert into uoption(opt_id,note) values('update_tablestatus','1') 
else 	update uoption set note = '1' where opt_id = 'update_tablestatus' 
END IF;update tables set status_modified = '1' where table_id = new_tables.table_id 
END;


create trigger update_tbl_cardfillflow before update of CardFillID, VIPCardID, Customer_ID, Customer_Aname, PayType, FillMoney, ValidMoney, pos_id, FillDate, OperateDate, OperatorName, CardFillRemark, presentmoney, salesperson, hisorder_id order 2 on tbl_CardFillFlow
REFERENCING OLD AS old_tbl_cardfillflow NEW AS new_tbl_cardfillflow 
FOR EACH ROW
BEGIN
	update tbl_cardfillflow set up_flag = '0' where CardFillID = new_tbl_cardfillflow.CardFillID;
END;


create trigger update_tbl_vip before update of VIPCardID, CardTypeID, Customer_ID, Customer_Aname, VIPNo, Password, CardDiscRate, FillAmount, ValidMoney, ExpendLeave, ExpendSum, ExpendIntegral, TimesLeave, ExpendTimes, TimesIntegral, TotalIntegral, CardStatusFlag, VIPStartDate, VIPEndDate, LastUseDate, OperatorName, CardRemark, lastfilldate order 2 on tbl_VIP
REFERENCING OLD AS old_tbl_vip NEW AS new_tbl_vip 
FOR EACH ROW 
BEGIN
	update tbl_vip set up_flag = '0' where VIPCardID = new_tbl_vip.VIPCardID;
END;


create trigger update_tbl_vipexpendflow before update of ExpendFlowID, VIPCardID, ShouldPay, ExpendDate, ExpendWay, HisOrder_ID, OperatorName, ExpendFlowRemark, expend_amt, integralflow order 2 on tbl_VIPExpendFlow
REFERENCING OLD AS old_tbl_vipexpendflow NEW AS new_tbl_vipexpendflow
FOR EACH ROW
BEGIN
	update tbl_vipexpendflow set up_flag = '0' where ExpendFlowID = new_tbl_vipexpendflow.ExpendFlowID;
END;

