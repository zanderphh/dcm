/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-06 15:02:48                          */
/*==============================================================*/


/*==============================================================*/
/* Table: AUTOINS                                               */
/*==============================================================*/
create table AUTOINS
(
   INS_NAME             char(40) not null comment '名称',
   INS_NUMBER           varchar(12) comment '值',
   INS_ID               char(2) not null comment 'ID',
   primary key (INS_ID)
);

alter table AUTOINS comment '选项字典';

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
   DEL_REASON           varchar(100) comment '删单原因',
   DEL_OPER             char(20),
   id                   int not null auto_increment comment '删除客单ID',
   up_flag              char(1) default '0',
   flowno               varchar(20),
   del_no               int default 0,
   primary key (id)
);

alter table DEL_ORDER comment '删除客单表';

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
   id                   int not null auto_increment comment '删除主客单单号',
   commision            numeric(14,4) default 0,
   del_no               int default 0,
   primary key (id)
);

alter table DEL_ORDER_DETAIL comment '删单明细表';

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
/* Table: DISH_RELA                                             */
/*==============================================================*/
create table DISH_RELA
(
   ID                   int not null auto_increment comment 'ID',
   MAIN_DISH            char(20) comment '主菜品ID',
   HYPO_DISH            char(20) comment '套餐明细ID',
   HYPO_QTY             numeric(12,4) comment '数量',
   hypo_group           char(1) comment '组别',
   hypo_price           numeric(12,2) comment '加价客度',
   primary key (ID)
);

alter table DISH_RELA comment '套餐明细';

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

alter table SHIFT comment '班次';

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

alter table TABLES comment '台位信息';

/*==============================================================*/
/* Table: UNIT                                                  */
/*==============================================================*/
create table UNIT
(
   UNIT                 char(8) not null comment '单位',
   primary key (UNIT)
);

alter table UNIT comment '计量单位';

/*==============================================================*/
/* Table: WAITER                                                */
/*==============================================================*/
create table WAITER
(
   WAITER_ID            varchar(5) not null comment '点菜员代码',
   POSNAME              varchar(50) comment '消费区域',
   WAITER               char(20) comment '点菜员',
   pda_pwd              varchar(20) comment '密码',
   primary key (WAITER_ID)
);

alter table WAITER comment '点菜员';

/*==============================================================*/
/* Table: book_record                                           */
/*==============================================================*/
create table book_record
(
   book_id              int not null auto_increment comment '预定ID',
   book_no              varchar(30) comment '预定单号',
   book_date            timestamp comment '预定日期',
   start_date           timestamp comment '开始时间',
   valid_date           timestamp comment '有效时间',
   tablename            varchar(200) comment '台位名称',
   cust_id              varchar(20) comment '客户ID',
   cust_name            varchar(80) comment '客户名称',
   cust_tel             varchar(30) comment '客户电话',
   cust_leaveword       varchar(80),
   book_account         numeric(14,2) default 0,
   operator             char(20) comment '操作员',
   operate_date         timestamp comment '操作日期',
   receiver             varchar(20) comment '接待',
   book_status          varchar(10) comment '预定状态',
   remark               varchar(100) comment '备注',
   cust_num             numeric(5,0) default 0,
   primary key (book_id)
);

alter table book_record comment '预定计录';

/*==============================================================*/
/* Table: dinner                                                */
/*==============================================================*/
create table dinner
(
   dinnername           char(40) not null comment '餐厅名称',
   dinnertext           longblob comment 'OEM',
   dinnerpicture        longblob comment '图片',
   dinnneraddress       varchar(100) comment '地址',
   dinnertel            char(20) comment '电话',
   request_tel          varchar(30),
   agent                varchar(100) default '',
   pdaserver            varchar(100) default '',
   primary key (dinnername)
);

alter table dinner comment '餐厅信息表';

/*==============================================================*/
/* Table: dish_auto_with_person                                 */
/*==============================================================*/
create table dish_auto_with_person
(
   dish_id              char(10) not null comment '菜品代码',
   quantity             decimal(5,2) comment '数量',
   auto                 char(1) default '0' comment '是否自动点菜',
   primary key (dish_id)
);

alter table dish_auto_with_person comment '根据人数自动点菜表';

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
/* Table: ll_outprint                                           */
/*==============================================================*/
create table ll_outprint
(
   now_time             timestamp not null default CURRENT_TIMESTAMP comment '当前时间',
   computer_name        char(30) comment '计算机名',
   curorder_id          varchar(18) not null comment '客单号',
   expensetype          char(10) comment '手工单号',
   pos_name             varchar(50) not null comment '消费区域',
   pos_print            varchar(80) comment '消费区打印机',
   table_name           char(20) not null comment '台位名称',
   table_id             varchar(10) not null comment '台位ID',
   operator_name        char(20) not null comment '操作员',
   now_using            char(1) not null default '0' comment '是否正在打印',
   person_number        char(10) comment '人数',
   printflag            char(1) default '0',
   lb_id                char(2) comment '打印机ID',
   extra_info           varchar(30) comment '其它扩展信息',
   primary key (now_time)
);

alter table ll_outprint comment '厨打队列';

/*==============================================================*/
/* Table: ll_unneedprint                                        */
/*==============================================================*/
create table ll_unneedprint
(
   lb_id                char(2) not null comment 'ID',
   lb_name              char(40) not null comment '名称',
   dishtype_id          char(2) not null comment '类别ID',
   dishtype_name        char(10) not null comment '类别名称',
   primary key (lb_id)
);

alter table ll_unneedprint comment '不打印类别过滤';

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
   prn_no               numeric(5,0) comment '打印次数',
   primary key (curorderdetail_id)
);

alter table order_prn_detail comment '打印明细表';

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

alter table DISH add constraint fk_dishmustorder_group foreign key (dishmustorder_group)
      references dishmustorder_group (group_id) on delete set null on update restrict;

