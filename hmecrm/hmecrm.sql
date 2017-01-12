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
   BAD_DISH_REASON_ID   char(2) not null comment '废菜原因代码',
   BAD_DISH_REASON_NAME char(40) comment '废菜原因名称',
   primary key (BAD_DISH_REASON_ID)
);

alter table BAD_DISH_REASON comment '废菜原因表';

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
   SALARY_ITEM_ID       char(3) not null comment '项目代码',
   SALARY_ITEM_NAME     char(20) comment '项目名称',
   primary key (SALARY_ITEM_ID)
);

alter table BASIC_SALARY_ITEM comment '基本工资项目表';

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
   PCH                  char(20) comment '生产批次号',
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
   BILL_ID              char(18) not null comment '结帐单号',
   HISORDER_ID          char(18) comment '客单号',
   TICKET_NO            char(20) comment '票据号',
   PAYTYPE              varchar(40) comment '付款类别',
   PAY_USAGE            char(14) comment '付款用途',
   REALPAY              numeric(12,2) comment '实付金额',
   CHECKSTAND_NAME      char(14) comment '收银台',
   PAYEE                char(20) comment '收银员',
   IS_STATICS           char(1) comment '是否参与统计',
   paydate              timestamp comment '付款日期',
   up_flag              char(1) default '0' comment '同步标志',
   cj_flag              smallint default 0 comment '快餐版本用',
   Vipno                varchar(20) comment '会员卡号',
   lqqty                int default 0 comment '代金券张数',
   primary key (BILL_ID)
);

alter table BILL comment '结帐单';

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
   BUYER_ID             varchar(5) not null comment '采购员编号',
   BUYER_NAME           char(20) comment '采购员名',
   BUYER_GRP_ID         char(2) comment '采购组代码',
   primary key (BUYER_ID)
);

alter table BUYER comment '采购员';

/*==============================================================*/
/* Table: BUYER_GRP                                             */
/*==============================================================*/
create table BUYER_GRP
(
   BUYER_GRP_ID         char(2) not null comment '采购组编号',
   BUYER_GRP_NAME       char(20) comment '采购组名称',
   primary key (BUYER_GRP_ID)
);

alter table BUYER_GRP comment '采购组';

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

alter table CERTIFICATION comment '职称';

/*==============================================================*/
/* Table: COMMITMONEY                                           */
/*==============================================================*/
create table COMMITMONEY
(
   COMMITMONEY_ID       char(13) not null comment '收银员交款编号',
   COMMITMONEY_DATE     date comment '交款日期',
   COMMITMONEY_TIME     time comment '交款时间',
   CHECKSTAND_NAME      char(14) comment '收银台',
   PAYEE                char(20) comment '收银员',
   CASHIER              char(20) comment '出纳',
   PAYTYPE              char(14) comment '结算方式',
   COMMITMONEY          numeric(12,2) comment '交款金额',
   primary key (COMMITMONEY_ID)
);

/*==============================================================*/
/* Table: CONTACT                                               */
/*==============================================================*/
create table CONTACT
(
   CONTACT_ID           char(14) not null comment '合同流水号',
   CONTACT_NO           char(20) comment '合同号',
   VENDOR_ID            char(12) comment '供货商代码',
   CONTACT_DATE         timestamp comment '合同日期',
   OPERATOR_ID          char(4) comment '操作员代码',
   OPERATOR_DATE        timestamp comment '修改日期',
   BUYER_GRP_ID         char(2) comment '采购组代码',
   BUYER_ID             varchar(5) comment '采购员代码',
   INVOICE_TYPE_ID      char(1) comment 'INVOICE_TYPE_ID',
   REMARK               longtext comment '摘要',
   MODIFIER_ID          char(4) comment 'modifier_Id',
   MODIFY_DATE          timestamp comment 'modify_date',
   AUDITER_ID           char(4) comment '审核人代码',
   AUDIT_DATE           timestamp comment '审核日期',
   IS_END               char(1) comment '合同是否结束',
   END_DATE             timestamp comment '结束日期',
   END_REASON           longtext comment '结束原因',
   IS_ACCOUNT           char(1) comment '是否记帐',
   CONTACT_TYPE_ID      char(1) comment '采购合同种类',
   CONTACT_PROP_ID      char(1) comment '采购合同属性1',
   DFDH                 char(14) comment '对方单号',
   IS_STATICS           char(1) comment '是否参与统计',
   primary key (CONTACT_ID)
);

alter table CONTACT comment '采购合同表';

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

alter table CONTACT_DETAIL comment '合同明细';

/*==============================================================*/
/* Table: CONTACT_END_REASON                                    */
/*==============================================================*/
create table CONTACT_END_REASON
(
   CONTACT_END_REASON_ID char(1) not null comment 'contact_end_reason_id',
   CONTACT_END_REASON_NAME char(20) comment 'contact_end_reason_name',
   primary key (CONTACT_END_REASON_ID)
);

alter table CONTACT_END_REASON comment '合同中止原因';

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
   IS_STATICS           char(1) comment '是否参与统计',
   primary key (CONTACT_OUT_FEE_ID)
);

alter table CONTACT_OUT_FEE comment 'contact_out_fee';

/*==============================================================*/
/* Table: CONTACT_TYPE                                          */
/*==============================================================*/
create table CONTACT_TYPE
(
   CONTACT_TYPE_ID      char(1) not null comment '采购合同类型代码',
   CONTACT_TYPE_NAME    char(20) comment '采购合同类型名称',
   primary key (CONTACT_TYPE_ID)
);

alter table CONTACT_TYPE comment '采购合同类型';

/*==============================================================*/
/* Table: CURORDER                                              */
/*==============================================================*/
create table CURORDER
(
   CURORDER_ID          varchar(18) not null comment '客单ID',
   POSNAME              varchar(50) comment '消费区',
   CUSTOMER_ID          varchar(20) comment '客户ID',
   CUSTOMER_ANAME       char(20) comment '客户别名',
   CUSTOMER_NAME        char(60) comment '客户名称',
   TABLENAME            char(20) comment '台位名称',
   SHIFT                char(10) comment '班次',
   ORDERDATE            timestamp comment '点单日期',
   ORDERTIME            time comment '点单时间',
   EXPENSETYPE          char(30) comment '消费类型（现用于手工单号）',
   PERSONNUMBER         float default 0 comment '人数',
   WAITER               char(20) comment '服务员',
   OPERATORNAME         char(20) comment '操作员名称',
   DISH_AMOUNT          decimal(16,2) default 0 comment '菜品总额',
   ROOMFEE              decimal(16,2) default 0 comment '包房费',
   SRVFEE               decimal(16,2) default 0 comment '服务费',
   AMOUNT               decimal(16,2) default 0 comment '客单总额',
   DISCOUNT_RATE        decimal(16,2) default 1 comment '折扣率',
   DISCOUNT             decimal(16,2) default 0 comment '折扣额',
   SHOULDPAY            numeric(12,2) comment '应付款',
   KEEP_ACCOUNT         decimal(16,2) default 0 comment '挂账金额',
   LOST_AMOUNT          decimal(16,2) default 0 comment '跑单金额',
   YETPAY               decimal(16,2) default 0 comment '已付款',
   FREE_CHARGE          decimal(16,2) default 0 comment '免零金额',
   NOTPAY               decimal(16,2) default 0 comment '未付金额',
   paytype              char(20) comment '付款方式',
   yetpay_temp          numeric(12,2),
   SRV_RATE             decimal(16) default 0 comment '服务费率',
   CANCEL_TABLE         char(2),
   CANCEL_TIME          timestamp,
   invoice_amount       numeric(12,2) default 0 comment '发票金额',
   recheck              varchar(100) default 'N' comment '退单标志',
   book_id              numeric(14,0) comment '对应预定ID',
   paytype_multi        varchar(60) comment '多付款方式明细',
   strout_flag          char(1) default 'N' comment '结算出库标志',
   vip_no               varchar(25) default '' comment '会员卡号',
   check_out            char(1) default '0',
   buf_dinner           char(1),
   all_discount         char(1) comment '整单打折标志位',
   invoice_num          varchar(50) comment '发票号',
   flowno               varchar(20) comment '流水号',
   calc_srv_flag        char(1),
   bs_flag              char(1),
   hme_id               varchar(30) comment '对应服务器流水ID',
   containordernos      varchar(50) comment '服务器单号',
   prepayamount         double comment '预付金额',
   order_upflag         char(1) comment '同步标志位',
   group_id             char(20),
   tableId              int comment '对应服务器台位ID',
   userId               int comment '对应服务器用户ID',
   primary key (CURORDER_ID)
);

alter table CURORDER comment '当前客单';

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
   CURORDERDETAIL_ID    varchar(18) not null comment '客单明细ID',
   CURORDER_ID          varchar(18) comment '客单号',
   POSNAME              varchar(50) comment '消费区',
   DISH_ID              char(10) comment '菜品代码',
   DISHTYPE             char(10) comment '菜品类别',
   DISHNAME             char(100) comment '菜品名称',
   UNIT                 char(8) comment '菜品单位',
   QUANTITY             numeric(14,3) comment '数量',
   NEW_FINISH_QTY       numeric(12,2),
   FINISH_QTY           numeric(12,2),
   PRICE                numeric(12,2) comment '价格',
   DISCOUNT_RATE        numeric(12,2) comment '折扣率',
   AFTER_DISCOUNT       numeric(12,2) comment '折后金额',
   DISHTYPE_ID          char(2) comment '菜品类别ID',
   TECHNICIAN_NAME      char(20) comment '服务员',
   OPERATOR_NAME        char(20) comment '操作员',
   DISH_TIME            timestamp comment '点菜时间',
   COST                 numeric(12,4) comment '成本',
   ORDER_NO             char(20),
   KITCHEN_PRN          char(1) comment '厨打打印机',
   dish_request         varchar(250) comment '菜品需求',
   Order_Flag           char(1) comment '传菜标志位',
   bar_code             varchar(20) comment '条码',
   kill_id              varchar(13) default '' comment '退菜明细ID',
   present_amt          numeric(7,2) default 0 comment '赠送额',
   frt_mng              varchar(24) default '' comment '前厅经理',
   WAITER               char(20) comment '服务员',
   commision_rate       numeric(14,4) default 0 comment '提成率',
   kill_reason          varchar(100) comment '退菜原因',
   reuse_prn            varchar(5) default '0',
   commision            numeric(14,4) default 0 comment '单位提成',
   strout_flag          char(1) default 'N' comment '出库标志位',
   tablename            char(20) comment '台位名称（转并台）',
   jf_flag              char(1) comment '积分标志位',
   tc_flag              timestamp comment '提成标志位',
   flow_id              varchar(20) comment '流水号',
   order_flag1          char(1) comment '传菜标志位1',
   temp_text            varchar(500) comment '临时备注（用于厨打）',
   end_time             timestamp comment '结束时间',
   clock_appoint        char(1) default '0' comment '点钟标志位',
   commision_clock      numeric(14,4) comment '点钟提成额',
   ordertype            char(1) default '0' comment '点菜类型（线上、线下）',
   hme_upflag           char(1) comment '同步标志位',
   detailId             varchar(10) comment '对应服务器客单明细流水ID',
   primary key (CURORDERDETAIL_ID)
);

alter table CURORDERDETAIL comment '当前客单明细';

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
   DEGREE_ID            char(3) not null comment '学历代码',
   DEGREE_NAME          char(20) comment '学历名称',
   primary key (DEGREE_ID)
);

alter table DEGREE comment '学历';

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
   DEPARTMENT_ID        char(2) not null comment '部门代码',
   DEPARTMENT_NAME      char(20) comment '部门名称',
   primary key (DEPARTMENT_ID)
);

alter table DEPARTMENT comment '部门';

/*==============================================================*/
/* Table: DISH                                                  */
/*==============================================================*/
create table DISH
(
   DISH_ID              char(10) not null comment '菜品编号',
   DISHTYPE             char(10) comment '菜品类别',
   POSNAME              varchar(50) comment '消费点',
   DISHNAME             varchar(100) comment '菜品名称',
   UNIT                 char(8) comment '菜品单位',
   PRICE                numeric(12,2) comment '价格',
   COST                 numeric(12,2) comment '成本',
   ISSPECIAL            char(1) comment '是否特色菜',
   DISCOUNTABLE         char(1) comment '能否打折',
   DESCRIPTION          varchar(100) comment '说明',
   PY                   char(20) comment '拼音代码',
   LB1                  char(2) comment '类别1',
   LB2                  char(2) comment '类别2',
   LB3                  char(2) comment '菜品类别3',
   DISHTYPE_ID          char(2) comment '菜品类别代码',
   COMMISION_RATE       numeric(14,4) comment '提成',
   NP                   char(1) comment '时价',
   NP_PRICE             numeric(14,2) comment '时价价格',
   SP                   char(1) comment '促销',
   SP_PRICE             numeric(12,2) comment '保销价格',
   `USE`                char(1) comment '可用',
   sp_start             timestamp comment '促销起始日期',
   sp_end               timestamp comment '促销结束日期',
   is_temp              char(1) default 'N' comment '是否临时菜品',
   ps                   varchar(1) default 'N' comment '是否可配送',
   commision            numeric(14,4) default 0 comment '单位提成额',
   dishename            varchar(100) comment '菜品英文名',
   base_expense         char(1) default 'Y' comment '是否属于基本消费',
   tempnum              numeric(14,2) comment '估清数量',
   come_to              varchar(100),
   displaytype_id       char(2) comment '菜品类别ID',
   lb4                  char(2) comment '属性，对应表LB4',
   lb5                  char(2) comment '属性，对应表LB5',
   wd_flag              char(1) default '0' comment '是否可积分',
   front_color          char(16) comment '显示前景色',
   dishplay_order       int default 0 comment '排序',
   zc_flag              char(1) comment '主餐标志位',
   displayorder         numeric(5,2) comment '显示顺序',
   min_number           numeric(14,2) comment '估清报擎量',
   is_print             char(1) default '1' comment '是否在结账单打印',
   can_djq              char(1) default '1' comment '是否可使用券对该菜品进行结算',
   is_upto_radio        char(1) default '1' comment '是否同步（点菜宝专用标志位）',
   return_money         char(1) default '0' comment '是否参与返现',
   barcode              varchar(50) comment '条码',
   is_maiduan           char(1) default '0' comment '是否可以买断（计时消费）',
   time_maiduan         int comment '买断时长（计时消费）',
   price_maiduan        numeric(14,2) comment '买断价格（计时消费）',
   clock_time           int comment '点钟时长（计时消费）',
   clock_diff           int comment '点钟偏移值（计时消费）',
   commision_clock      numeric(14,4) comment '点钟提成（计时消费）',
   is_time              char(1) default '0' comment '是否计时消费（计时消费）',
   dish_tuijian         char(1) default '0' comment '是否推荐 ',
   dish_tejia           char(1) default '0' comment '是否特价',
   ipadpage             int comment '菜品所属页（IPAD专用）',
   vip_price            numeric(14,2) default 0 comment '会员价',
   is_weight            char(1) comment '是否称重',
   dish_index           int default 0 comment '菜品顺序',
   dishtype_id1         char(2) comment '菜品小类（IPAD专用）',
   is_haspic            char(1) default '0' comment '是否有图',
   mod_flag             char(1) default '0' comment '修改标志位',
   dish_memo            varchar(5000) comment '菜品备注',
   dish_group_name      varchar(50) comment '菜品所属组名称',
   department           varchar(30),
   pc_temp              char(1) comment '是否可配餐标志位',
   amount               double,
   hme_id               varchar(30) comment '对应服务器ID（点餐猫）',
   baseAmount           double,
   dishmustorder_group  char(2) comment '对应服务器必点菜组（点餐猫）',
   primary key (DISH_ID)
);

alter table DISH comment '菜品明细';

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
   DISHTYPE_ID          char(2) not null comment '类别代码',
   POSNAME              varchar(50) comment '消费区域',
   DISHTYPE             char(10) comment '类别名称',
   EDISHTYPE            char(10) comment '类别英文名称',
   dishtypecolor        char(16) comment '显示颜色',
   displayorder         numeric(5,2) comment '显示顺序',
   hme_id               varchar(30) comment '服务端ID',
   primary key (DISHTYPE_ID)
);

alter table DISHTYPE comment '菜品类别';

/*==============================================================*/
/* Table: DISH_BACK_REASON                                      */
/*==============================================================*/
create table DISH_BACK_REASON
(
   DISH_BACK_REASON_ID  char(2) not null comment '退菜原因代码',
   DISH_BACK_REASON_NAME char(40) comment '退菜原因名称',
   primary key (DISH_BACK_REASON_ID)
);

/*==============================================================*/
/* Table: DISH_CANCEL                                           */
/*==============================================================*/
create table DISH_CANCEL
(
   DISH_CANCEL_ID       char(13) not null comment '菜品取消编号',
   ORDER_ID             char(13) not null comment '客单号',
   DISH_ID              char(10) comment '菜品代码',
   QTY                  numeric(12,2) comment '数量',
   KITCHEN_ID           char(2) comment '厨房编号',
   REASON               char(40) comment '退菜原因',
   DEAL                 char(40) comment '处理方式',
   PRINCIPAL            char(20) comment '责任人',
   primary key (DISH_CANCEL_ID)
);

alter table DISH_CANCEL comment '菜品取消表';

/*==============================================================*/
/* Table: DISH_COMEBACK                                         */
/*==============================================================*/
create table DISH_COMEBACK
(
   DISH_COMEBACK_ID     char(13) not null comment '退菜编号',
   ORDER_ID             char(13) not null comment '客单号',
   DISH_ID              char(10) comment '菜品编号',
   QTY                  numeric(12,2) comment '数量',
   KITCHEN_ID           char(2) comment '厨房编号',
   REASON               char(40) comment '退菜原因',
   DEAL                 char(40) comment '处理方式',
   PRINCIPAL            char(20) comment '责任人',
   primary key (DISH_COMEBACK_ID)
);

alter table DISH_COMEBACK comment '退菜表';

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
   DISH_ID              char(10) not null comment '菜品编号',
   GOODS_ID             char(12) not null comment '商品编号',
   GOODS_NAME           char(60) comment '商品名称',
   UNIT                 char(10) comment '计量单位',
   WASTAGE              numeric(12,6) comment '消耗量',
   store_id             varchar(4),
   price                numeric(12,6),
   loss                 numeric(12,2) default 1,
   primary key (DISH_ID, GOODS_ID)
);

alter table DISH_MATERIAL comment '菜品原料消耗表';

/*==============================================================*/
/* Table: DISH_OUT                                              */
/*==============================================================*/
create table DISH_OUT
(
   CURORDER_ID          char(13) not null comment '当前客单编号',
   POSNAME              varchar(50) comment '消费点',
   CUSTOMER_ID          char(6) comment '客户编号',
   CUSTOMER_ANAME       char(20) comment '客户简称',
   CUSTOMER_NAME        char(60) comment '客户名称',
   TABLENAME            char(20) comment '台位名称',
   SHIFT                char(10) comment '班次',
   ORDERDATE            date comment '点单日期',
   ORDERTIME            time comment '点单时间',
   EXPENSETYPE          char(10) comment '消费类别',
   PERSONNUMBER         int comment '就餐人数',
   WAITER               char(20) comment '点菜员',
   OPERATORNAME         char(20) comment '前台操作员',
   DISH_AMOUNT          numeric(12,2) comment '菜品总金额',
   ROOMFEE              numeric(12,2) comment '包房费',
   SRVFEE               numeric(12,2) comment '服务费',
   AMOUNT               numeric(12,2) comment '客单总金额',
   DISCOUNT_RATE        numeric(12,2) comment '总折扣率',
   DISCOUNT             numeric(12,2) comment '折扣金额',
   SHOULDPAY            numeric(12,2) comment '应付金额',
   primary key (CURORDER_ID)
);

alter table DISH_OUT comment '菜品出堂';

/*==============================================================*/
/* Table: DISH_OUT_DETAIL                                       */
/*==============================================================*/
create table DISH_OUT_DETAIL
(
   CURORDERDETAIL_ID    char(13) not null comment 'CURORDERDETAIL_ID',
   CURORDER_ID          char(13) comment 'CURORDER_ID',
   POSNAME              varchar(50) comment 'POSNAME',
   DISH_ID              char(10) comment '菜品编号',
   DISHTYPE             char(10) comment 'DISHTYPE',
   DISHNAME             char(20) comment 'DISHNAME',
   UNIT                 char(8) comment 'UNIT',
   QUANTITY             numeric(12,2) comment 'QUANTITY',
   NEW_FINISH_QTY       numeric(12,2) comment '新出堂数量',
   FINISH_QTY           numeric(12,2) comment '出堂数量',
   PRICE                numeric(12,2) comment 'PRICE',
   DISCOUNT_RATE        numeric(12,2) comment 'DISCOUNT RATE',
   AFTER_DISCOUNT       numeric(12,2) comment 'AFTER DISCOUNT',
   DISHTYPE_ID          char(2) comment 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa',
   primary key (CURORDERDETAIL_ID)
);

alter table DISH_OUT_DETAIL comment '当前客单明细';

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
   EMPLOYEE_NAME        char(20) comment '职员姓名',
   SERVICE_ID           char(4) comment '服务代码',
   DEPARTMENT_ID        char(3) comment '部门代码',
   POSITION_ID          char(3) comment '职位代码',
   JOINDAY              timestamp comment '到岗日期',
   QUITDAY              timestamp comment '离职日期',
   HIRE_STATUS_ID       char(2) comment '聘用状态代码',
   SALARY_CLASS_ID      char(2) comment '工资级别代码',
   WORK_STATUS_ID       char(3) comment '用工状态代码',
   SEX                  char(2) comment '性别',
   MARRIAGE_NAME        char(6) comment '婚否',
   NATIVE_ID            char(3) comment '民族代码',
   BIRTHDAY             timestamp comment '生日',
   ID                   char(20) comment '身份证号码',
   ADDRESS              char(100) comment '常住地址',
   HOME_ADDRESS         char(100) comment '常用地址',
   HOME_TEL             char(20) comment '家庭电话',
   HOME_ZIPCODE         char(8) comment '家庭邮编',
   MOBILEPHONE          char(40) comment '移动电话传呼',
   DEGREE_ID            char(3) comment '学历代码',
   CERTIFICATION_ID     char(2) comment '职称代码',
   SPECIALITY           char(40) comment '所学专业',
   COLLEGE              char(40) comment '毕业院校',
   GRADUATE_DATE        timestamp comment '毕业日期',
   MODIFY_DATE          timestamp comment '登记修改日期',
   OPERATOR_NAME        char(10) comment '登记人',
   IS_SALARY            char(1) comment '计发工资',
   PHOTO                longblob comment '照片',
   REMARK               longtext comment '备注',
   FILED1               char(10) comment '备用字段1',
   FILED2               char(10) comment '备用字段2',
   FILED3               char(10) comment '备用字段3',
   FILED4               char(10) comment '备用字段4',
   FILED5               numeric(12,2) comment '备用字段5',
   FILED6               numeric(12,2) comment '备用字段6',
   FILED7               numeric(12,2) comment '备用字段7',
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

alter table EMPLOYEE comment '职员';

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
   FLAG_ID              char(10) not null comment '标志代码',
   FLAG_NAME            char(20) comment '标志含义',
   FLAG_BIT             char(1) comment '标志位',
   primary key (FLAG_ID)
);

alter table FLAG comment '标志位表';

/*==============================================================*/
/* Table: FRT_MGR                                               */
/*==============================================================*/
create table FRT_MGR
(
   FRT_MGR_ID           char(4) not null comment '前台经理编号',
   FRT_MGR_NAME         char(20) not null comment '前台经理名称',
   primary key (FRT_MGR_ID)
);

/*==============================================================*/
/* Table: FUNCTION                                              */
/*==============================================================*/
create table FUNCTION
(
   FUNCTION_ID          char(6) not null comment '功能代码',
   FUNCTION_NAME        char(50) comment '功能名称',
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

alter table FUNCTION comment '功能表';

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
   GOODS_ID             char(16) not null comment '商品代码',
   GOODS_NO             char(20) comment '商品流水号',
   GOODS_NAME           char(40) comment '商品名称',
   GOODS_ENAME          char(40) comment '商品英文名称',
   GOODS_LNAME          char(40) comment '商品拉丁名称',
   SPEC                 char(40) comment '规格',
   SCCJ_ID              char(12) comment '生产厂家',
   GOODS_UNIT           char(8) comment '散件计量单位',
   PACK_UNIT            char(8) comment '整件计量单位',
   SZB                  int comment '散整比',
   MIN_STORAGE          numeric(12,2) comment '最小库存',
   MAX_STORAGE          numeric(12,2) comment '最大库存',
   BEST_STORAGE         numeric(12,2) comment '最优库存',
   IS_MX                char(1) comment '是否明细',
   IS_VALID             char(1) comment '是否有效',
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
   DM                   char(20) comment '代码助记码',
   PY                   char(20) comment '拼音助记码',
   BARCODE              char(40) comment '条形码',
   YXQ                  int comment '有效期',
   JJFS_ID              char(1) comment '计价方式',
   YZH                  char(60) comment '药字号',
   KM_ID                char(16) comment '财务科目',
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
   GOODS_DETAIL_ID      char(14) not null comment '商品明细帐代码',
   GOODS_ID             char(16) comment '商品代码',
   STR_DATE             timestamp comment '发生日期',
   STORE_ID             char(2) comment '仓库代码',
   BATCH_ID             char(14) comment '商品入库流水号',
   QTY                  numeric(12,6) comment '发生数量',
   REMAIN_QTY           numeric(12,2) comment '数量余额',
   REMAIN_AMOUNT        numeric(24,2) comment '金额余额',
   IS_STR_IN            char(1) comment '进出库',
   STR_TYPE_NAME        char(20) comment '出入库方式名称',
   STR_BILL_ID          char(14) comment '出入库单号',
   OPERATOR_NAME        char(20) comment '仓库管理员',
   REMARK               longtext comment '摘要',
   price_ydpj           numeric(12,4) default 0,
   price_xjxc_next      numeric(12,4) default 0,
   price_xjxc_this      numeric(12,4) default 0,
   price                decimal(14,6),
   primary key (GOODS_DETAIL_ID)
);

alter table GOODS_DETAIL comment '商品明细帐';

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
   LEVEL_LEN            int comment '代码长度',
   TOTAL_LEN            int comment '总长度',
   primary key (LEVEL_ID)
);

alter table GOODS_LEVEL comment '商品代码层次';

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
   GROUP_ACCOUNT_ID     char(14) not null comment '组帐号代码',
   GROUP_ACCOUNT_NAME   char(20) comment '组帐号名称',
   REMARK               char(40) comment '备注',
   primary key (GROUP_ACCOUNT_ID)
);

alter table GROUP_ACCOUNT comment '组帐号';

/*==============================================================*/
/* Table: GROUP_ACCOUNT_CURORDER                                */
/*==============================================================*/
create table GROUP_ACCOUNT_CURORDER
(
   GROUP_ACCOUNT_ID     char(14) not null comment '组帐号代码',
   CURORDER_ID          char(14) not null comment '当前客单号',
   primary key (GROUP_ACCOUNT_ID, CURORDER_ID)
);

alter table GROUP_ACCOUNT_CURORDER comment '组帐号及当前客单对应表';

/*==============================================================*/
/* Table: HIRE_STATUS                                           */
/*==============================================================*/
create table HIRE_STATUS
(
   HIRE_STATUS_ID       char(2) not null comment '聘用状态代码',
   HIRE_STATUS_NAME     char(10) comment '聘用状态名称',
   primary key (HIRE_STATUS_ID)
);

alter table HIRE_STATUS comment '聘用状态';

/*==============================================================*/
/* Table: HISORDER                                              */
/*==============================================================*/
create table HISORDER
(
   HISORDER_ID          char(18) not null comment '历史客单号',
   POSNAME              varchar(50) comment '消费点名称',
   CUSTOMER_ID          varchar(20) comment '客户编号',
   CUSTOMER_ANAME       char(20) comment '客户简称',
   CUSTOMER_NAME        char(60) comment '客户名称',
   TABLENAME            char(20) comment '台位名称',
   SHIFT                char(10) comment '班次',
   ORDERTIME            time comment '点单时间',
   BILL_TIME            time comment '结帐时间',
   EXPENSETYPE          char(30) comment '消费类别',
   PERSONNUMBER         int comment '就餐人数',
   WAITER               char(20) comment '点菜员',
   OPERATORNAME         char(20) comment '前台操作员',
   DISH_AMOUNT          numeric(12,2) comment '菜品总额',
   ROOMFEE              numeric(12,2) comment '包房费',
   SRVFEE               numeric(12,2) comment '服务费',
   AMOUNT               numeric(12,2) comment '总金额',
   DISCOUNT_RATE        numeric(12,2) comment '总折扣率',
   DISCOUNT             numeric(12,2) comment '折扣金额',
   SHOULDPAY            numeric(12,2) comment '应付金额',
   YETPAY               numeric(12,2) comment '已付金额',
   NOTPAY               numeric(12,2) comment '未付金额',
   KEEP_ACCOUNT         numeric(12,2) comment '记帐金额',
   LOST_AMOUNT          numeric(12,2) comment '跑单金额',
   FREE_CHARGE          numeric(12,2) comment '免单金额',
   FRT_MGR_NAME         char(20) comment '前台经理',
   GNR_MGR_NAME         char(20) comment '总经理',
   PAYSTATUS            char(10) comment '付款状态',
   IS_STATICS           char(1) comment '是否参与统计',
   orderdate            timestamp comment '点单日期',
   bill_date            timestamp comment '结账日期',
   invoice_amount       numeric(12,2) comment '发票金额',
   BILL_OPER            char(20),
   recheck              varchar(100) default 'N' comment '是否退单标志',
   paytype              varchar(20) comment '付款方式',
   book_id              numeric(14,0) comment '预定单ID',
   strout_flag          char(1) default 'N' comment '结算出库标志位',
   paytype_multi        varchar(60) comment '多付款方式明细',
   up_flag              char(1) default '0' comment '是否同步标志位',
   check_out            char(1) default '0' comment '快餐版用',
   day_flag             char(1) default '0' comment '快餐版用',
   check_date           timestamp comment '快餐版用',
   zf_je                numeric(12,2) comment '快餐版用',
   zl_je                numeric(12,2) comment '快餐版用',
   qj_flag              timestamp comment '快餐版用',
   tuoji                char(1) comment '快餐版用',
   buf_dinner           char(1),
   all_discount         char(1) comment '整单打折标志位',
   invoice_num          varchar(50) comment '发票号码',
   flowno               varchar(20) comment '同步流水号',
   memo                 varchar(1000) comment '客单备注',
   calc_srv_flag        char(1),
   jf2cash              numeric(14,2) comment '积分抵现金额',
   bs_flag              char(1),
   vipno_linkage        varchar(20) comment '连锁卡号',
   vippwd_linkage       varchar(20) comment '连锁卡密',
   hme_id               varchar(30) comment '对应服务器流水ID',
   containordernos      varchar(50) comment '服务器单号',
   prepayamount         double comment '预付款',
   order_upflag         char(1) comment '同步标志位',
   group_id             char(20),
   tableId              int comment '对应服务器台位ID',
   userId               int comment '对应服务器用户ID',
   primary key (HISORDER_ID)
);

alter table HISORDER comment '历史客单';

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
   HISORDERDETAIL_ID    char(18) not null comment '客单明细ID',
   HISORDER_ID          char(18) not null comment '客单ID',
   POSNAME              varchar(50) comment '消费区域',
   DISH_ID              char(10) comment '菜品编号',
   DISHTYPE             char(10) comment '菜品类别',
   DISHNAME             char(100) comment '菜品名称',
   UNIT                 char(8) comment '单位',
   QUANTITY             numeric(14,3) comment '数量',
   PRICE                numeric(12,2) comment '价格',
   DISCOUNT_RATE        numeric(12,2) comment '折扣率',
   AFTER_DISCOUNT       numeric(12,2) comment '折后金额',
   DISHTYPE_ID          char(2) comment '菜品类别ID',
   technician_name      char(20) default '' comment '服务员',
   OPERATOR_NAME        char(20) comment '操作员',
   DISH_TIME            timestamp comment '点菜时间',
   COST                 numeric(12,4) comment '成本',
   ORDER_NO             char(20),
   dish_request         varchar(250) comment '菜品需求',
   Order_Flag           char(1) comment '传菜标志',
   bar_code             varchar(20) comment '条码',
   kill_id              varchar(13) default '' comment '退菜明细ID',
   present_amt          numeric(7,2) default 0 comment '赠送金额',
   frt_mng              varchar(24) default '' comment '前厅经理',
   WAITER               char(20) comment '服务员',
   commision_rate       numeric(14,4) default 0 comment '比利提成率',
   kill_reason          varchar(100) comment '退菜原因',
   commision            numeric(14,4) default 0 comment '单位提成',
   strout_flag          char(1) default 'N' comment '结算出库标志位',
   up_flag              char(1) default '0' comment '同步标志位',
   tablename            char(20) comment '台位名称（转并台）',
   flow_id              varchar(20) comment '流水号',
   end_time             timestamp comment '结束时间',
   clock_appoint        char(1),
   commision_clock      numeric(14,4) comment '点钟提成',
   str_out_bill_id      varchar(20) comment '对应结算出库明细ID',
   kitchen_prn          char(1) comment '厨打打印机',
   jf_flag              char(1) comment '积分标志位',
   ordertype            char(1) default '0' comment '点菜类型（线上、线下）',
   detailId             varchar(10) comment '对应服务器客单明细ID',
   primary key (HISORDERDETAIL_ID)
);

alter table HISORDERDETAIL comment '历史客单明细';

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
   IS_STATICS           char(1) comment '是否参与统计',
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
   JJFS_ID              char(1) not null comment '计价方式代码',
   JJFS_NAME            char(20) comment '计价方式名称',
   primary key (JJFS_ID)
);

alter table JJFS comment '计价方式';

/*==============================================================*/
/* Table: KM                                                    */
/*==============================================================*/
create table KM
(
   KM_ID                char(16) not null comment '科目代码',
   KM_NAME              char(40) comment '科目名称',
   primary key (KM_ID)
);

alter table KM comment '财务科目';

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
   MAJOR_ID             char(2) not null comment '专业代码',
   MAJOR_NAME           char(40) comment '专业名称',
   primary key (MAJOR_ID)
);

alter table MAJOR comment '专业';

/*==============================================================*/
/* Table: MARRIAGE                                              */
/*==============================================================*/
create table MARRIAGE
(
   MARRIAGE_ID          char(2) not null comment '婚姻状态代码',
   MARRIAGE_NAME        char(10) comment '婚姻状态名称',
   primary key (MARRIAGE_ID)
);

alter table MARRIAGE comment '婚姻状态';

/*==============================================================*/
/* Table: NATIVE                                                */
/*==============================================================*/
create table NATIVE
(
   NATIVE_ID            char(3) not null comment '民族代码',
   NATIVE_NAME          char(20) comment '民族名称',
   primary key (NATIVE_ID)
);

alter table NATIVE comment '民族';

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
   OPERATOR_ID          char(20) not null comment '操作员代码',
   OPERATOR_NAME        char(20) comment '操作员名称',
   PASSWORD             char(10) comment '口令',
   pic                  varchar(1000),
   startup              char(1) default '1',
   discount             char(3) default '100',
   present_amt          numeric(7,2) default 0 comment '可赠送金额',
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
/* Table: ORDER_PRN                                             */
/*==============================================================*/
create table ORDER_PRN
(
   ID                   int not null auto_increment comment '编号',
   HISORDER_ID          char(18) comment '历史客单号',
   POSNAME              varchar(50) comment '消费点名称',
   CUSTOMER_NAME        char(60) comment '客户名称',
   TABLENAME            char(20) comment '台位名称',
   SHIFT                char(10) comment '班次',
   ORDERDATE            date comment '点单日期',
   EXPENSETYPE          char(30) comment '点菜单号',
   OPERATORNAME         char(20) comment '前台操作员',
   SHOULDPAY            numeric(12,4) comment '应付金额',
   PRN_NO               numeric(2,0) comment '第几次打印',
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

alter table ORDER_PRN comment '客单打印记录';

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
   IS_STATICS           char(1) comment '是否参与统计',
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
   EMPLOYEE_ID          char(5) not null comment '职员代码',
   YEAR                 char(4) not null comment '发薪年份',
   MONTH                char(2) not null comment '发薪月份',
   SPR                  char(10) comment '审批人',
   ZBR                  char(10) comment '制表人',
   OPERATOR             char(10) comment '操作者',
   IS_PAYED             char(1) comment '发放状态',
   EDITABLE             char(1) comment '可否修改',
   S01                  numeric(12,2) default 0 comment '工资项1',
   S02                  numeric(12,2) comment '工资项2',
   S03                  numeric(12,2) comment '工资项3',
   S04                  numeric(12,2) comment '工资项4',
   S05                  numeric(12,2) comment '工资项5',
   S06                  numeric(12,2) comment '工资项6',
   S07                  numeric(12,2) comment '工资项7',
   S08                  numeric(12,2) comment '工资项8',
   S09                  numeric(12,2) comment '工资项9',
   S10                  numeric(12,2) comment '工资项10',
   S11                  numeric(12,2) comment '工资项11',
   S12                  numeric(12,2) comment '工资项12',
   S13                  numeric(12,2) comment '工资项13',
   S14                  numeric(12,2) default 0 comment '工资项14',
   S15                  numeric(12,2) comment '工资项15',
   S16                  numeric(12,2) comment '工资项16',
   S17                  numeric(12,2) comment '工资项17',
   S18                  numeric(12,2) comment '工资项18',
   S19                  numeric(12,2) comment '工资项19',
   S20                  numeric(12,2) comment '工资项20',
   S21                  numeric(12,2) comment '工资项21',
   S22                  numeric(12,2) comment '工资项22',
   S23                  numeric(12,2) comment '工资项23',
   S24                  numeric(12,2) comment '工资项24',
   S25                  numeric(12,2) comment '工资项25',
   S26                  numeric(12,2) comment '工资项26',
   S27                  numeric(12,2) comment '工资项27',
   S28                  numeric(12,2) comment '工资项28',
   S29                  numeric(12,2) comment '工资项29',
   S30                  numeric(12,2) comment '工资项30',
   primary key (EMPLOYEE_ID, YEAR, MONTH)
);

alter table PAYSALARY comment '工资发放表';

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
   POS_ID               char(2) not null comment '消费点代码',
   POSNAME              varchar(50) not null comment '消费点名称',
   printer              varchar(80),
   collect_flag         char(1) default 'N',
   store_id             varchar(10),
   print_flag           char(1) default '1' comment '是否启用打印功能',
   hme_id               varchar(30) comment '对应服务端ID',
   primary key (POS_ID)
);

alter table POS comment '消费点';

/*==============================================================*/
/* Table: POSITION                                              */
/*==============================================================*/
create table POSITION
(
   POSITION_ID          char(2) not null comment '职位代码',
   POSITION_NAME        char(20) comment '职位名称',
   primary key (POSITION_ID)
);

alter table POSITION comment '职位';

/*==============================================================*/
/* Table: PRE_EXAM                                              */
/*==============================================================*/
create table PRE_EXAM
(
   EXAM_ID              char(14) not null comment 'EXAM_ID',
   STR_IN_BILL_ID       char(14) comment 'STR_IN_BILL_ID',
   BATCH_ID             char(14) comment 'BATCH_ID',
   GOODS_ID             char(16) comment '商品代码',
   QUALITICATION        char(20) comment '合格证',
   WARRANT              char(20) comment '许可证',
   LOOK_QLT_NAME        char(20) comment '外观质量情况',
   PACK_QLT_NAME        char(20) comment '包装质量',
   CONCLUSION           char(20) comment '验收结论',
   OPERATOR_NAME        char(20) comment '验收员',
   OPERATOR_DATE        timestamp comment '验收日期',
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
   REMARK               longtext comment '摘要',
   END_DATE             timestamp comment '结束日期',
   AUDIT_DATE           timestamp comment '审核日期',
   MODIFIER_ID          char(4) comment 'modifier_Id',
   CONTACT_PROP_ID      char(1) comment '采购合同属性1',
   MODIFY_DATE          timestamp comment 'modify_date',
   IS_END               char(1) comment '合同是否结束',
   DFDH                 char(14) comment '对方单号',
   CONTACT_TYPE_ID      char(1) comment '采购合同种类',
   END_REASON           longtext comment '结束原因',
   AUDITER_ID           char(4) comment '审核人代码',
   IS_ACCOUNT           char(1) comment '是否记帐',
   primary key (CONTACT_ID)
);

alter table PRE_PCH_CONTACT comment '当前采购合同表';

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

alter table PRE_PCH_CONTACT_DETAIL comment '当前合同明细';

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
   BILL_NUM             int comment '单据张数',
   REMARK               longtext comment 'remark',
   BUYER_GRP_ID         char(2) comment '采购组代码',
   VENDOR_ID            char(12) comment '供货商代码',
   BUYER_ID             varchar(5) comment '采购员代码',
   INVOICE_TYPE_ID      char(1) comment 'INVOICE_TYPE_ID',
   modifier_id          char(4),
   modify_date          timestamp,
   is_account           char(1),
   primary key (STR_IN_BILL_ID)
);

alter table PRE_STR_IN_BILL comment '入库单明细';

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
   PCH                  char(20) comment '生产批次号',
   PIECE                numeric(12,2) comment '件数',
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
   BILL_NUM             int comment '单据张数',
   OPERATOR_DATE        timestamp comment 'operator_date',
   CUSTOMER_ID          char(12) comment 'CUSTOMER_ID',
   XSHT_TYPE_ID         char(1) comment '销售合同类型代码',
   XSHT_PROP_ID         char(1) comment '销售或退货',
   IS_OTC               char(1) comment '是否otc',
   POS_ID               char(2) comment 'pos_ID',
   COUNTER_ID           char(2) comment '柜台代码',
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
   PIECE                numeric(12,2) comment '件数',
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
   PRICE_ID             char(14) not null comment '价格代码',
   GOODS_ID             char(16) comment '商品代码',
   PRICE_TYPE_ID        char(1) comment '价格类型代码',
   POS_ID               char(2) comment '销售点代码',
   PRICE                numeric(12,2) comment '价格',
   primary key (PRICE_ID)
);

alter table PRICE comment '价格';

/*==============================================================*/
/* Table: PRICE_TYPE                                            */
/*==============================================================*/
create table PRICE_TYPE
(
   PRICE_TYPE_ID        char(1) not null comment 'price_type_id',
   PRICE_TYPE_NAME      char(20) comment 'price_type_name',
   primary key (PRICE_TYPE_ID)
);

alter table PRICE_TYPE comment '价格种类';

/*==============================================================*/
/* Table: PRICE_USAGE                                           */
/*==============================================================*/
create table PRICE_USAGE
(
   PRICE_USAGE_ID       char(1) not null comment '价格使用情况代码',
   PRICE_USAGE_NAME     char(20) comment '价格使用情况名称',
   PRICE_TYPE_ID        char(1) comment '价格类型代码',
   primary key (PRICE_USAGE_ID)
);

alter table PRICE_USAGE comment '价格使用情况表';

/*==============================================================*/
/* Table: RECORD_ENABLE                                         */
/*==============================================================*/
create table RECORD_ENABLE
(
   ENABLE               char(1) not null comment 'enable',
   primary key (ENABLE)
);

alter table RECORD_ENABLE comment '是否允许隐藏数据';

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

alter table REPORT1 comment '报表登记';

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

alter table REPORT2 comment '报表对象和属性';

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

alter table REPORT_CHINESE_TO_ENGLISH comment '自定义函数';

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

alter table REPORT_CONDITION comment '后台报表最后一次的打印条件';

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

alter table REPORT_FIELD comment '后台报表所选字段';

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

alter table REPORT_FROMWHERE comment '后台报表所选关联';

/*==============================================================*/
/* Table: REPORT_FUNC                                           */
/*==============================================================*/
create table REPORT_FUNC
(
   FUNC_ENGLISH         varchar(18) not null,
   FUNC_CHINA           varchar(16) not null,
   primary key (FUNC_ENGLISH)
);

alter table REPORT_FUNC comment '标准函数';

/*==============================================================*/
/* Table: REPORT_TABLE                                          */
/*==============================================================*/
create table REPORT_TABLE
(
   TABLE_ENGLISH        varchar(50) not null,
   TABLE_CHINESE        varchar(50) not null,
   primary key (TABLE_ENGLISH)
);

alter table REPORT_TABLE comment '后台报表中需访问的表或视图的中英文名';

/*==============================================================*/
/* Table: ROOM                                                  */
/*==============================================================*/
create table ROOM
(
   ROOM_ID              char(4) not null comment '台位代码',
   ROOM_NAME            char(20) comment '台位名称',
   BED_NUM              decimal(4) comment '床数',
   ROOMFEE              decimal(12,2) comment '包房费',
   STATUSNAME           char(20) comment '台位状态名称',
   REMARK               varchar(255) comment '说明',
   primary key (ROOM_ID)
);

alter table ROOM comment '包房信息';

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
   SALARY_CLASS_ID      char(2) not null comment '工资级别代码',
   SALARY_CLASS_NAME    char(20) comment '工资级别名称',
   BASIC_SALARY         double comment '基本工资',
   benefit_salary       numeric(12,4),
   backshish            numeric(12,4),
   primary key (SALARY_CLASS_ID)
);

alter table SALARY_CLASS comment '工资级别表';

/*==============================================================*/
/* Table: SALARY_ITEM_ORDER                                     */
/*==============================================================*/
create table SALARY_ITEM_ORDER
(
   SALARY_ITEM_ID       char(3) not null comment '工资项目编号',
   SALARY_ITEM_NAME     char(20) comment '工资项目名称',
   primary key (SALARY_ITEM_ID)
);

alter table SALARY_ITEM_ORDER comment '工资项目排列顺序表';

/*==============================================================*/
/* Table: SALES                                                 */
/*==============================================================*/
create table SALES
(
   SALES_ID             char(12) not null comment 'sales_id',
   SALES_NAME           char(20) comment 'sales_name',
   POS_ID               char(2) comment 'pos_id',
   LB1_ID               char(2) comment '分类代码1',
   LB2_ID               char(2) comment '分类代码2',
   IS_MX                char(1) comment 'is_mx',
   DM                   char(20) comment '速记代码',
   PY                   char(20) comment '拼音代码',
   primary key (SALES_ID)
);

alter table SALES comment 'Tab_17675';

/*==============================================================*/
/* Table: SCCJ                                                  */
/*==============================================================*/
create table SCCJ
(
   SCCJ_ID              char(12) not null comment '生产厂家代码',
   SCCJ_ANAME           char(20) not null comment '生产厂家简称',
   SCCJ_NAME            char(60) comment '生产厂家名称',
   SCCJ_TYPE_ID         char(2) comment '生产厂家类别代码',
   DM                   char(10) comment '速记代码',
   PY                   char(30) comment '拼音代码',
   ADDR                 longtext comment '地址',
   CITY                 char(20) comment '所在城市',
   ZIPCODE              char(6) comment '邮政编码',
   TEL                  char(40) comment '电话',
   FAX                  char(40) comment '传真',
   EMAIL                char(40) comment '电子邮件',
   PRINCIPAL            char(20) comment '负责人',
   CONTACT              char(20) comment '联系人',
   CONTACTTEL           char(40) comment '联系人电话',
   BANK                 char(40) comment '开户行',
   ACCOUNT_ID           char(20) comment '帐号',
   TAX_ID               char(20) comment '税号',
   IS_MX                char(1) comment '是否明细',
   FIRSTDAY             timestamp comment '登记日期',
   OPERATOR_NAME        char(20) comment '操作员',
   REMARK               longtext comment '备注',
   LB1                  char(1) comment '分类属性1',
   LB2                  char(1) comment '分类属性2',
   CD_ID                char(4) comment '产地代码',
   primary key (SCCJ_ID)
);

alter table SCCJ comment '生产厂家';

/*==============================================================*/
/* Table: SCCJ_LEVEL                                            */
/*==============================================================*/
create table SCCJ_LEVEL
(
   LEVEL_ID             char(1) not null comment 'level_id',
   LEVEL_NAME           char(20) comment 'level_name',
   LEVEL_LEN            int comment '代码长度',
   TOTAL_LEN            int comment '总长度',
   primary key (LEVEL_ID)
);

alter table SCCJ_LEVEL comment '生产厂家层次';

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
   SHIFT_ID             char(2) not null comment '班次ID',
   SHIFT                char(10) not null comment '班次名称',
   time_start           time comment '开始时间',
   time_end             time comment '结束时间',
   primary key (SHIFT_ID)
);

/*==============================================================*/
/* Table: SHOULDCOMMIT                                          */
/*==============================================================*/
create table SHOULDCOMMIT
(
   OPERATOR_ID          char(13) not null comment '收银员编号',
   POSNAME              varchar(50) not null comment '消费点',
   OPERATOR_NAME        char(20) comment '收银员名称',
   CASH_REMAIN          numeric(12,2) comment '现金余额',
   CHECK_REMAIN         numeric(12,2) comment '支票余额',
   CREDIT_CARD_REMAIN   numeric(12,2) comment '信用卡余额',
   KEEP_ACCOUNT_REMAIN  numeric(12,2) comment '记帐余额',
   REMAIN1              numeric(12,2) comment '其他余额1',
   REMAIN2              numeric(12,2) comment '其他余额2',
   primary key (OPERATOR_ID, POSNAME)
);

alter table SHOULDCOMMIT comment '收银员应缴款';

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
   STOCK_TYPE_ID        char(1) not null comment '库存属性代码',
   STOCK_TYPE_NAME      char(20) comment '库存属性名称',
   primary key (STOCK_TYPE_ID)
);

alter table STOCK_TYPE comment '库存属性';

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
   TRANSACTOR           char(20) comment '经手人',
   OPERATOR_ID          varchar(20) comment '制单人代码',
   COME_FROM            char(40) comment 'COME_FROM',
   VERIFIER             char(20) comment 'VERIFIER',
   MODIFIER_ID          char(4) comment 'modifier_Id',
   MODIFY_DATE          timestamp comment 'modify_date',
   AUDITER_ID           char(4) comment '审核人代码',
   AUDIT_DATE           timestamp comment '审核日期',
   BILL_NUM             int comment '单据张数',
   REMARK               varchar(100) comment 'remark',
   IS_STATICS           char(1) comment '是否参与统计',
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

alter table STR_IN_BILL comment '入库单';

/*==============================================================*/
/* Table: STR_IN_BILL_DETAIL                                    */
/*==============================================================*/
create table STR_IN_BILL_DETAIL
(
   STR_IN_BILL_ID       char(14) not null comment 'STR_IN_BILL_ID',
   BATCH_ID             char(14) not null comment 'BATCH_ID',
   GOODS_ID             char(16) comment 'GOODS_ID',
   QTY                  numeric(12,6) comment 'QTY',
   PIECE                numeric(12,2) comment '件数',
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
   AUDIT_DATE           timestamp comment '审核日期',
   BILL_NUM             int comment '单据张数',
   REMARK               longtext comment 'REMARK',
   IS_STATICS           char(1) comment '是否参与统计',
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
   PIECE                numeric(12,2) comment '件数',
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
   TABLE_ID             varchar(10) not null default '0' comment '台位代码',
   POSNAME              varchar(50) not null comment '消费点名称',
   TABLENAME            char(20) not null comment '台位名称',
   SEATNUMBER           int comment '座位数量',
   ROOMFEE              numeric(12,2) comment '包房费',
   STATUSNAME           char(10) comment '台位状态名称',
   EXCLUSIVE            char(1) comment '台位是否专用',
   SRV_RATE             numeric(3,0) comment '服务费率',
   TABLE_TYPE           char(2) comment '台位类型',
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
   status_Modified      char(1) comment '状态是否修改标志位',
   hme_id               varchar(30) comment '对应服务端台位ID',
   table_printer        varchar(50) comment '台位对应传菜打印机',
   primary key (TABLE_ID)
);

alter table TABLES comment '餐位信息';

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

alter table UNIT comment '计量单位';

/*==============================================================*/
/* Table: VENDOR                                                */
/*==============================================================*/
create table VENDOR
(
   VENDOR_ID            char(12) not null comment 'VENDOR_ID',
   VENDOR_ANAME         char(20) not null comment 'VENDOR_ANAME',
   VENDOR_NAME          char(60) comment 'VENDOR_NAME',
   VENDOR_TYPE_ID       char(2) comment 'vendor_type_id',
   DM                   char(10) comment '速记代码',
   PY                   char(30) comment '拼音代码',
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
   IS_MX                char(1) comment '是否明细',
   CRT_DATE             timestamp comment 'CRT_DATE',
   OPERATOR_NAME        char(20) comment '操作员',
   CREDITLEVEL          char(1) comment '信用级别',
   CREDITQUOTA          numeric(12,2) comment 'CREDITQUOTA',
   DISCOUNT_RATE        numeric(12,2) comment '折扣率',
   REMARK               varchar(100) comment 'REMARK',
   LB1                  char(1) comment '分类属性1',
   LB2                  char(1) comment '分类属性2',
   LB3                  char(1) comment '分类属性3',
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
   LEVEL_LEN            int comment '代码长度',
   TOTAL_LEN            int comment '总长度',
   primary key (LEVEL_ID)
);

alter table VENDOR_LEVEL comment '供应商层次';

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
   WAITER_ID            varchar(5) not null comment '点菜员代码',
   POSNAME              varchar(50),
   WAITER               char(20),
   pda_pwd              varchar(20),
   primary key (WAITER_ID)
);

alter table WAITER comment '点菜员';

/*==============================================================*/
/* Table: WORK_STATUS                                           */
/*==============================================================*/
create table WORK_STATUS
(
   WORK_STATUS_ID       char(2) not null comment '用工状态代码',
   WORK_STATUS_NAME     char(20) comment '用工状态名称',
   primary key (WORK_STATUS_ID)
);

alter table WORK_STATUS comment '用工状态';

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
   REMARK               longtext comment '摘要',
   MODIFIER_ID          char(4) comment 'modifier_Id',
   MODIFY_DATE          timestamp comment 'modify_date',
   AUDITER_ID           char(4) comment '审核人代码',
   AUDIT_DATE           timestamp comment '审核日期',
   IS_END               char(1) comment 'IS_END',
   END_DATE             timestamp comment '结束时间',
   END_REASON           longtext comment '结束原因',
   IS_ACCOUNT           char(1) comment '是否记帐',
   XSHT_TYPE_ID         char(1) comment '销售合同类型代码',
   XSHT_PROP_ID         char(1) comment '销售或退货',
   DFDH                 char(14) comment '对方单号',
   IS_OTC               char(1) comment '是否otc',
   FREE_CHARGE          numeric(12,2) comment '免零',
   AMOUNT               numeric(12,2) comment '合同金额',
   YJS_NAME             char(20) comment '药剂师',
   RX_NO                char(20) comment '处方号',
   COUNTER_ID           char(2) comment '柜台代码',
   IS_STATICS           char(1) comment '是否参与统计',
   primary key (XSHT_ID)
);

alter table XSHT comment 'XSHT';

/*==============================================================*/
/* Table: XSHT_DETAIL                                           */
/*==============================================================*/
create table XSHT_DETAIL
(
   XSHT_DETAIL_ID       int not null comment '销售合同明细代码',
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
   group_id             char(2) not null comment '组ID',
   group_name           varchar(10) comment '组名称',
   group_type           char(1) comment '组类别（人均、非人均）',
   group_qty            int comment '每组必选菜数量',
   hme_id               varchar(30) comment '对应服务端ID',
   upflag               char(1) comment '同步标志位',
   primary key (group_id)
);

alter table dishmustorder_group comment '菜品必选表';

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
   rec_time             timestamp comment '接收时间',
   busCode              char(5) comment '业务代码',
   tips                 varchar(500) comment '通知信息',
   is_tip               char(5) default '0' comment '通知是否发送',
   data                 varchar(5000) comment '接收数据',
   state_flag           char(2) comment '状态（未读、已读）',
   orderNo              varchar(50) comment '订单号',
   tableId              varchar(50) comment '台位ID',
   dealinfo             varchar(200),
   primary key (id)
);

alter table hme_communication comment '点餐猫消息表';

/*==============================================================*/
/* Table: hme_order                                             */
/*==============================================================*/
create table hme_order
(
   orderId              varchar(50) comment 'ID',
   shopId               varchar(20) comment '店铺ID',
   userId               varchar(20) comment '用户ID',
   orderNo              varchar(50) not null comment '单号',
   shopName             varchar(40) comment '店铺名称',
   shopLogoURL          varchar(100) comment '店铺LOGO链接',
   longlatitude         varchar(30) comment '经纬度',
   bookedTime           varchar(20) comment '预定时间',
   createTime           varchar(20) comment '创建时间',
   confirmTime          varchar(30) comment '确认时间',
   orderState           char(1) comment '订单状态',
   orderType            char(1) comment '订单类型',
   payState             char(1) comment '付款状态',
   consumeState         char(1) comment '消费状态',
   appraiseState        char(1),
   totalAmount          double comment '客单金额',
   prepayAmount         double comment '预付金额',
   bookedNumber         double,
   peopleNumber         int comment '人数',
   contact              varchar(10) comment '联系人',
   contactPhone         varchar(20) comment '联系电话',
   isNeedRoom           char(1) comment '是否需要包房',
   comment              varchar(100) comment '备注',
   invoiceTitle         varchar(50),
   online_pay           double default 0 comment '线上付款金额',
   download_flag        int default 0 comment '同步标志位',
   primary key (orderNo)
);

alter table hme_order comment '点餐猫客单';

/*==============================================================*/
/* Table: hme_order_detail                                      */
/*==============================================================*/
create table hme_order_detail
(
   detailId             varchar(50) comment '明细ID',
   orderId              varchar(50) comment '客单ID',
   orderNo              varchar(50) comment '客单号',
   dishId               varchar(20) comment '菜品代码',
   dishName             varchar(50) comment '菜品名称',
   quantity             double comment '数量',
   price                double comment '价格',
   rebatePoints         double,
   basePoints           double,
   isDelete             char(1),
   get_flag             char(1) comment '同步标志位'
);

alter table hme_order_detail comment '点餐猫订单明细';

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

alter table ll_outprint comment '厨打缓存';

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
   paytype              char(14) not null comment '付款方式',
   paytype_id           char(5) comment '付款方式代码',
   pic                  varchar(100),
   displayorder         int comment '显示顺序',
   paymenny             numeric(10,2),
   displayyesno         char(1),
   zhjz                 char(1) default '0',
   lq                   char(1) default '0',
   discount             numeric(10,2) default 1,
   paynumber            numeric(10,2) default 0,
   realmenny            numeric(10,2) default 0,
   qx                   char(1) default '0',
   is_zzx               char(1) default '0' comment '是否掌中行',
   is_vip               char(1) default '0' comment '是否VIP',
   primary key (paytype)
);

alter table paytype comment '付款方式';

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
   report_id            int not null auto_increment comment '报表编号',
   report_name          varchar(100) comment '报表名称',
   chinese_name         varchar(100) comment '报表中文名称',
   remark               varchar(100) comment '备注',
   primary key (report_id)
);

alter table report comment '报表或数据窗口';

/*==============================================================*/
/* Table: report_detail                                         */
/*==============================================================*/
create table report_detail
(
   report_id            int comment '报表编号',
   column_id            int not null auto_increment comment '字段编号',
   table_name           varchar(100) comment '表名',
   column_name          varchar(100) comment '字段名',
   chinese_name         varchar(100) comment '字段中文名称',
   is_visible           char(1) comment '是否显示',
   width                numeric(4,0) comment '宽度',
   order_no             numeric(4,0) comment '排序',
   primary key (column_id)
);

alter table report_detail comment '报表使用字段明细';

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

