/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-06 15:02:48                          */
/*==============================================================*/


/*==============================================================*/
/* Table: AUTOINS                                               */
/*==============================================================*/
create table AUTOINS
(
   INS_NAME             char(40) not null comment '����',
   INS_NUMBER           varchar(12) comment 'ֵ',
   INS_ID               char(2) not null comment 'ID',
   primary key (INS_ID)
);

alter table AUTOINS comment 'ѡ���ֵ�';

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
   DEL_REASON           varchar(100) comment 'ɾ��ԭ��',
   DEL_OPER             char(20),
   id                   int not null auto_increment comment 'ɾ���͵�ID',
   up_flag              char(1) default '0',
   flowno               varchar(20),
   del_no               int default 0,
   primary key (id)
);

alter table DEL_ORDER comment 'ɾ���͵���';

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
   id                   int not null auto_increment comment 'ɾ�����͵�����',
   commision            numeric(14,4) default 0,
   del_no               int default 0,
   primary key (id)
);

alter table DEL_ORDER_DETAIL comment 'ɾ����ϸ��';

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
/* Table: DISH_RELA                                             */
/*==============================================================*/
create table DISH_RELA
(
   ID                   int not null auto_increment comment 'ID',
   MAIN_DISH            char(20) comment '����ƷID',
   HYPO_DISH            char(20) comment '�ײ���ϸID',
   HYPO_QTY             numeric(12,4) comment '����',
   hypo_group           char(1) comment '���',
   hypo_price           numeric(12,2) comment '�ӼۿͶ�',
   primary key (ID)
);

alter table DISH_RELA comment '�ײ���ϸ';

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

alter table SHIFT comment '���';

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

alter table TABLES comment '̨λ��Ϣ';

/*==============================================================*/
/* Table: UNIT                                                  */
/*==============================================================*/
create table UNIT
(
   UNIT                 char(8) not null comment '��λ',
   primary key (UNIT)
);

alter table UNIT comment '������λ';

/*==============================================================*/
/* Table: WAITER                                                */
/*==============================================================*/
create table WAITER
(
   WAITER_ID            varchar(5) not null comment '���Ա����',
   POSNAME              varchar(50) comment '��������',
   WAITER               char(20) comment '���Ա',
   pda_pwd              varchar(20) comment '����',
   primary key (WAITER_ID)
);

alter table WAITER comment '���Ա';

/*==============================================================*/
/* Table: book_record                                           */
/*==============================================================*/
create table book_record
(
   book_id              int not null auto_increment comment 'Ԥ��ID',
   book_no              varchar(30) comment 'Ԥ������',
   book_date            timestamp comment 'Ԥ������',
   start_date           timestamp comment '��ʼʱ��',
   valid_date           timestamp comment '��Чʱ��',
   tablename            varchar(200) comment '̨λ����',
   cust_id              varchar(20) comment '�ͻ�ID',
   cust_name            varchar(80) comment '�ͻ�����',
   cust_tel             varchar(30) comment '�ͻ��绰',
   cust_leaveword       varchar(80),
   book_account         numeric(14,2) default 0,
   operator             char(20) comment '����Ա',
   operate_date         timestamp comment '��������',
   receiver             varchar(20) comment '�Ӵ�',
   book_status          varchar(10) comment 'Ԥ��״̬',
   remark               varchar(100) comment '��ע',
   cust_num             numeric(5,0) default 0,
   primary key (book_id)
);

alter table book_record comment 'Ԥ����¼';

/*==============================================================*/
/* Table: dinner                                                */
/*==============================================================*/
create table dinner
(
   dinnername           char(40) not null comment '��������',
   dinnertext           longblob comment 'OEM',
   dinnerpicture        longblob comment 'ͼƬ',
   dinnneraddress       varchar(100) comment '��ַ',
   dinnertel            char(20) comment '�绰',
   request_tel          varchar(30),
   agent                varchar(100) default '',
   pdaserver            varchar(100) default '',
   primary key (dinnername)
);

alter table dinner comment '������Ϣ��';

/*==============================================================*/
/* Table: dish_auto_with_person                                 */
/*==============================================================*/
create table dish_auto_with_person
(
   dish_id              char(10) not null comment '��Ʒ����',
   quantity             decimal(5,2) comment '����',
   auto                 char(1) default '0' comment '�Ƿ��Զ����',
   primary key (dish_id)
);

alter table dish_auto_with_person comment '���������Զ���˱�';

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
/* Table: ll_outprint                                           */
/*==============================================================*/
create table ll_outprint
(
   now_time             timestamp not null default CURRENT_TIMESTAMP comment '��ǰʱ��',
   computer_name        char(30) comment '�������',
   curorder_id          varchar(18) not null comment '�͵���',
   expensetype          char(10) comment '�ֹ�����',
   pos_name             varchar(50) not null comment '��������',
   pos_print            varchar(80) comment '��������ӡ��',
   table_name           char(20) not null comment '̨λ����',
   table_id             varchar(10) not null comment '̨λID',
   operator_name        char(20) not null comment '����Ա',
   now_using            char(1) not null default '0' comment '�Ƿ����ڴ�ӡ',
   person_number        char(10) comment '����',
   printflag            char(1) default '0',
   lb_id                char(2) comment '��ӡ��ID',
   extra_info           varchar(30) comment '������չ��Ϣ',
   primary key (now_time)
);

alter table ll_outprint comment '�������';

/*==============================================================*/
/* Table: ll_unneedprint                                        */
/*==============================================================*/
create table ll_unneedprint
(
   lb_id                char(2) not null comment 'ID',
   lb_name              char(40) not null comment '����',
   dishtype_id          char(2) not null comment '���ID',
   dishtype_name        char(10) not null comment '�������',
   primary key (lb_id)
);

alter table ll_unneedprint comment '����ӡ������';

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
   prn_no               numeric(5,0) comment '��ӡ����',
   primary key (curorderdetail_id)
);

alter table order_prn_detail comment '��ӡ��ϸ��';

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

alter table DISH add constraint fk_dishmustorder_group foreign key (dishmustorder_group)
      references dishmustorder_group (group_id) on delete set null on update restrict;

