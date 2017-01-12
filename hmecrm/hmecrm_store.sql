/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-06 15:26:44                          */
/*==============================================================*/


/*==============================================================*/
/* Table: BATCH                                                 */
/*==============================================================*/
create table BATCH
(
   BATCH_ID             char(14) not null comment '����ID',
   GOODS_ID             char(16) comment '��Ʒ���',
   VENDOR_ID            char(12) comment '�����̴���',
   PRICE                numeric(16,6) comment '���κ�',
   YXQ                  timestamp comment '��Ч��',
   PCH                  char(20) comment '�������κ�',
   STR_IN_DATE          timestamp comment '�������',
   total                numeric(15,2) comment '�ϼƽ��',
   primary key (BATCH_ID)
);

alter table BATCH comment '���α�';

/*==============================================================*/
/* Index: idx_batch_goods_id                                    */
/*==============================================================*/
create index idx_batch_goods_id on BATCH
(
   GOODS_ID
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
/* Table: DISH_MATERIAL                                         */
/*==============================================================*/
create table DISH_MATERIAL
(
   DISH_ID              char(10) not null comment '��Ʒ���',
   GOODS_ID             char(12) not null comment '��Ʒ���',
   GOODS_NAME           char(60) comment '��Ʒ����',
   UNIT                 char(10) comment '������λ',
   WASTAGE              numeric(12,6) comment '������',
   store_id             varchar(4) comment '�ֿ�ID',
   price                numeric(12,6) comment '�۸�',
   loss                 numeric(12,2) default 1,
   primary key (DISH_ID, GOODS_ID)
);

alter table DISH_MATERIAL comment '��Ʒԭ�����ı�';

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
   LEVEL_ID             char(1) not null comment '���ID',
   LEVEL_NAME           char(20) comment '�������',
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
   GOODS_UNIT           char(4) not null comment '��λ��',
   primary key (GOODS_UNIT)
);

alter table GOODS_UNIT comment '��Ʒ��λ';

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
/* Table: PK                                                    */
/*==============================================================*/
create table PK
(
   PK_ID                char(14) not null comment '�̿�ID',
   PK_NO                longtext comment '�̿ⵥ��',
   STR_IN_BILL_ID       char(14) comment '��ⵥID',
   STR_OUT_BILL_ID      char(14) comment '���ⵥID',
   STORE_ID             char(2) comment '�ֿ�ID',
   OPERATOR_ID          varchar(20) comment '����Ա',
   VERIFIER             char(20) comment '����Ա',
   PK_DATE              timestamp comment '�̿�����',
   AUDITER_ID           char(4) comment '�����ԱID',
   AUDIT_DATE           timestamp comment '�������',
   REMARK               longtext comment '��ע',
   modifier_id          varchar(8) comment '�޸���ԱID',
   modify_date          timestamp comment '�޸�����',
   operator_date        timestamp comment '��������',
   primary key (PK_ID)
);

alter table PK comment '�̿ⵥ';

/*==============================================================*/
/* Table: PK_DETAIL                                             */
/*==============================================================*/
create table PK_DETAIL
(
   PK_ID                char(14) not null comment '�̿ⵥID',
   STOCK_REMAIN_ID      char(14) not null comment '���ID',
   GOODS_ID             char(16) comment '��Ʒ����',
   ZMSL                 numeric(12,2) comment '��������',
   PDSL                 numeric(12,2) comment '�̵�����',
   BATCH_ID             char(14) comment '�������ID',
   remark               varchar(200) comment '��ע',
   price                decimal(12,6) comment '�۸�',
   primary key (PK_ID, STOCK_REMAIN_ID)
);

alter table PK_DETAIL comment '�̿ⵥ��ϸ';

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
   PK_ID                char(14) not null comment '�̿ⵥID',
   PK_NO                longtext comment '�̿ⵥ��',
   PK_DATE              timestamp comment '�̵�����',
   STORE_ID             char(2) comment '�̵�ֿ�',
   VERIFIER             char(20) comment '������',
   OPERATOR_ID          varchar(20) comment '����ԱID',
   REMARK               longtext comment '��ע',
   primary key (PK_ID)
);

alter table PRE_PK comment 'Ԥ�̿ⵥ';

/*==============================================================*/
/* Table: PRE_PK_DETAIL                                         */
/*==============================================================*/
create table PRE_PK_DETAIL
(
   PK_ID                char(14) not null comment '�̿ⵥID',
   STOCK_REMAIN_ID      char(14) not null comment '���������ˮ',
   GOODS_ID             char(16) comment '��ƷID',
   PDSL                 numeric(12,6) comment '�̵�����',
   ZMSL                 numeric(12,6) comment '��������',
   BATCH_ID             char(14),
   primary key (PK_ID, STOCK_REMAIN_ID)
);

alter table PRE_PK_DETAIL comment 'Ԥ�̿ⵥ��ϸ';

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

alter table PRE_STR_IN_BILL_DETAIL comment 'Ԥ��ⵥ��ϸ';

/*==============================================================*/
/* Table: PRE_STR_OUT_BILL                                      */
/*==============================================================*/
create table PRE_STR_OUT_BILL
(
   STR_OUT_BILL_ID      char(14) not null comment 'ID',
   STR_OUT_BILL_NO      char(20) comment '���ⵥ��',
   DFDH                 char(14) comment '�Է�����',
   STR_OUT_TYPE_ID      char(1) comment '�������ID',
   STR_OUT_DATE         timestamp comment '��������',
   STORE_ID             char(2) comment '����ֿ�ID',
   OPERATOR_ID          varchar(20) comment '����ԱID',
   TRANSACTOR           char(20) comment '������',
   VERIFIER             char(20) comment '������',
   COME_TO              char(40) comment '������Դ',
   REMARK               longtext comment '��ע',
   INVOICE_TYPE_ID      char(1) comment '��Ʊ���ID',
   BILL_NUM             int comment '��������',
   OPERATOR_DATE        timestamp comment '��������',
   CUSTOMER_ID          char(12) comment '�ͻ�����',
   XSHT_TYPE_ID         char(1) comment '���ۺ�ͬ���ʹ���',
   XSHT_PROP_ID         char(1) comment '���ۻ��˻�',
   IS_OTC               char(1) comment '�Ƿ�otc',
   POS_ID               char(2) comment '����������',
   COUNTER_ID           char(2) comment '��̨����',
   SALES_ID             char(12) comment 'SALES_ID',
   primary key (STR_OUT_BILL_ID)
);

alter table PRE_STR_OUT_BILL comment 'Ԥ���ⵥ';

/*==============================================================*/
/* Table: PRE_STR_OUT_BILL_DETAIL                               */
/*==============================================================*/
create table PRE_STR_OUT_BILL_DETAIL
(
   STR_OUT_BILL_ID      char(14) not null comment 'ID',
   GOODS_ID             char(16) not null comment '��ƷID',
   BATCH_ID             char(14) not null comment '�������ID',
   QTY                  numeric(12,6) comment '����',
   PIECE                numeric(12,2) comment '����',
   pch                  char(20) comment '���κ�',
   price                numeric(16,6) default 0 comment '������',
   orderby              int comment '����',
   remark               varchar(200) comment '��ע',
   primary key (STR_OUT_BILL_ID)
);

alter table PRE_STR_OUT_BILL_DETAIL comment 'Ԥ������ϸ��';

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
   SCCJ_TYPE_ID         char(2) comment 'ID',
   SCCJ_TYPE_NAME       char(20) comment '����'
);

alter table SCCJ_TYPE comment '������������';

/*==============================================================*/
/* Table: STOCK_REMAIN                                          */
/*==============================================================*/
create table STOCK_REMAIN
(
   STOCK_REMAIN_ID      char(14) not null comment '���ID',
   GOODS_ID             char(16) comment '��Ʒ����',
   BATCH_ID             char(14) not null comment '���δ���',
   STORE_ID             char(2) comment '�ֿ�ID',
   QTY                  numeric(12,6) comment '�ֿ������',
   PRICE                numeric(12,6) comment '�۸�',
   STOCK_TYPE_ID        char(1) comment '�����ʽ',
   IS_CAN_SALE          char(1) comment '�Ƿ����',
   up_flag              char(1) default '0' comment 'ͬ����־λ',
   primary key (STOCK_REMAIN_ID)
);

alter table STOCK_REMAIN comment '����';

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
   STORE_ID             char(2) not null comment 'ID',
   STORE_NAME           char(20) comment '����',
   primary key (STORE_ID)
);

alter table STORE comment '�ֿ��';

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
   STR_IN_BILL_ID       char(14) not null comment '��ⵥID',
   BATCH_ID             char(14) not null comment '�������ID',
   GOODS_ID             char(16) comment '��������',
   QTY                  numeric(12,6) comment '����',
   PIECE                numeric(12,2) comment '����',
   price                numeric(12,6) comment '�۸�',
   discount             numeric(12,2) default 1 comment '�ۿ�',
   yxq                  timestamp comment '��Ч��',
   pch                  char(20) comment '���κ�',
   total                numeric(16,2) comment '�ϼƽ��',
   remark               varchar(200) comment '��ע',
   come_to              varchar(30) comment '�����Դ',
   primary key (STR_IN_BILL_ID, BATCH_ID)
);

alter table STR_IN_BILL_DETAIL comment '��ⵥ��ϸ';

/*==============================================================*/
/* Table: STR_IN_TYPE                                           */
/*==============================================================*/
create table STR_IN_TYPE
(
   STR_IN_TYPE_ID       char(1) not null comment 'ID',
   STR_IN_TYPE_NAME     char(20) comment '����',
   primary key (STR_IN_TYPE_ID)
);

alter table STR_IN_TYPE comment '��ⷽʽ';

/*==============================================================*/
/* Table: STR_OUT_BILL                                          */
/*==============================================================*/
create table STR_OUT_BILL
(
   STR_OUT_BILL_ID      char(14) not null comment '���ⵥID',
   STR_OUT_BILL_NO      char(20) comment '���ⵥ��',
   DFDH                 char(14) comment '�Է�����',
   STR_OUT_TYPE_ID      char(1) comment '���ⷽʽ',
   STR_OUT_DATE         timestamp comment '��������',
   OPERATOR_DATE        timestamp comment '����Ա',
   STORE_ID             char(2) comment '����ֿ�ID',
   TRANSACTOR           char(20) comment '������',
   OPERATOR_ID          varchar(20) comment '����Ա',
   COME_TO              char(40) comment '������Դ',
   VERIFIER             char(20) comment '������',
   MODIFIER_ID          char(4) comment '�޸���ID',
   MODIFY_DATE          timestamp comment '�޸�����',
   AUDITER_ID           char(4) comment '�����Ա',
   AUDIT_DATE           timestamp comment '�������',
   BILL_NUM             int comment '��������',
   REMARK               longtext comment '��ע',
   IS_STATICS           char(1) comment '�Ƿ����ͳ��',
   primary key (STR_OUT_BILL_ID)
);

alter table STR_OUT_BILL comment '��Ϊ����';

/*==============================================================*/
/* Table: STR_OUT_BILL_DETAIL                                   */
/*==============================================================*/
create table STR_OUT_BILL_DETAIL
(
   STR_OUT_BILL_ID      char(14) not null comment '���ⵥ��',
   GOODS_ID             char(16) comment '��Ʒ����',
   BATCH_ID             char(14) not null comment '���ID',
   QTY                  numeric(12,6) comment '��������',
   PIECE                numeric(12,2) comment '�������',
   price                numeric(12,6) comment '����ο�����',
   orderby              int comment '����',
   remark               varchar(200) comment '��ע',
   primary key (STR_OUT_BILL_ID)
);

alter table STR_OUT_BILL_DETAIL comment '���ⵥ��ϸ';

/*==============================================================*/
/* Table: STR_OUT_TYPE                                          */
/*==============================================================*/
create table STR_OUT_TYPE
(
   STR_OUT_TYPE_ID      char(1) not null comment 'ID',
   STR_OUT_TYPE_NAME    char(20) comment '����',
   primary key (STR_OUT_TYPE_ID)
);

alter table STR_OUT_TYPE comment '���ⷽʽ';

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

alter table VENDOR comment '������';

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
   VENDOR_TYPE_ID       char(2) not null comment 'ID',
   VENDOR_TYPE          char(20) comment '����',
   primary key (VENDOR_TYPE_ID)
);

alter table VENDOR_TYPE comment '����������';

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

alter table pk_del comment '�̿ⵥɾ����';

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

alter table pk_detail_del comment '�̿���ϸɾ��';

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

alter table str_in_bill_del comment '��ⵥɾ����';

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

alter table str_out_bill_del comment '���ⵥɾ���͵���';

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

alter table str_out_bill_detail_del comment '������ϸɾ����';

/*==============================================================*/
/* Table: str_zk                                                */
/*==============================================================*/
create table str_zk
(
   zk_id                varchar(14) not null comment 'ת�ⵥID',
   zk_no                varchar(20) comment 'ת�ⵥ��',
   zk_date              timestamp comment 'ת������',
   store_out            char(10) comment '����ֿ�',
   store_in             char(10) comment '���ֿ�',
   operator_id          char(4) comment '����Ա',
   operator_date        timestamp comment '��������',
   modifier_id          char(4) comment '�޸���ԱID',
   modify_date          timestamp comment '�޸�����',
   auditer_id           char(4) comment '�����ԱID',
   audit_date           timestamp comment '�������',
   remark               varchar(100) comment '��ע',
   primary key (zk_id)
);

alter table str_zk comment 'ת�ⵥ';

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

alter table str_zk_del comment 'ת�ⵥɾ��';

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
   batch_id_out         varchar(14) comment 'ת��ID',
   batch_id_in          varchar(14) comment 'ת��ID',
   goods_id             varchar(16) comment '��Ʒ����',
   qty                  decimal(16,6) comment '����',
   piece                decimal(16,6) comment '����',
   price                decimal(16,6) comment '�۸�',
   orderby              int comment '����',
   remark               varchar(100) comment '��ע'
);

alter table str_zk_detail comment 'ת����ϸ';

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

alter table str_zk_detail_del comment 'ת����ϸɾ��';

/*==============================================================*/
/* Table: vendor_goods                                          */
/*==============================================================*/
create table vendor_goods
(
   iserial              int not null auto_increment,
   vendor_id            char(12) comment 'ID',
   goods_id             char(16) comment '��ƷID',
   recprice             numeric(16,4) comment '�۸�',
   recdate              timestamp comment '����',
   flag                 varchar(2) default '',
   remark               varchar(250) comment '��ע',
   primary key (iserial)
);

alter table vendor_goods comment '�����̹�����ϸ';

/*==============================================================*/
/* Table: ��Ʒ��                                                   */
/*==============================================================*/
create table ��Ʒ��
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

alter table ��Ʒ�� comment 'GOODS';

alter table CONTACT_DETAIL add constraint FK_CONTACT__REF_7835_CONTACT foreign key (CONTACT_ID)
      references CONTACT (CONTACT_ID) on delete restrict on update restrict;

alter table PRE_PCH_CONTACT_DETAIL add constraint FK_PRE_PCH__REF_9159_PRE_PCH_ foreign key (CONTACT_ID)
      references PRE_PCH_CONTACT (CONTACT_ID) on delete restrict on update restrict;

alter table PRE_PK_DETAIL add constraint FK_PRE_PK_D_REF_23222_PRE_PK foreign key (PK_ID)
      references PRE_PK (PK_ID) on delete restrict on update restrict;

alter table PRE_STR_OUT_BILL_DETAIL add constraint FK_PRE_STR__REF_84132_PRE_STR_ foreign key (STR_OUT_BILL_ID)
      references PRE_STR_OUT_BILL (STR_OUT_BILL_ID) on delete restrict on update restrict;

alter table vendor_goods add constraint fk_vendor_goods_ref_goods foreign key (goods_id)
      references ��Ʒ�� (GOODS_ID) on delete cascade on update restrict;

alter table vendor_goods add constraint fk_vendor_goods_ref_vendor foreign key (vendor_id)
      references VENDOR (VENDOR_ID) on delete cascade on update restrict;

