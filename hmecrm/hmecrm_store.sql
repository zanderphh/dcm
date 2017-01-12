/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-06 15:26:44                          */
/*==============================================================*/


/*==============================================================*/
/* Table: BATCH                                                 */
/*==============================================================*/
create table BATCH
(
   BATCH_ID             char(14) not null comment '批次ID',
   GOODS_ID             char(16) comment '商品代杩',
   VENDOR_ID            char(12) comment '供货商代码',
   PRICE                numeric(16,6) comment '批次号',
   YXQ                  timestamp comment '有效期',
   PCH                  char(20) comment '生产批次号',
   STR_IN_DATE          timestamp comment '入库日期',
   total                numeric(15,2) comment '合计金额',
   primary key (BATCH_ID)
);

alter table BATCH comment '批次表';

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
/* Table: DISH_MATERIAL                                         */
/*==============================================================*/
create table DISH_MATERIAL
(
   DISH_ID              char(10) not null comment '菜品编号',
   GOODS_ID             char(12) not null comment '商品编号',
   GOODS_NAME           char(60) comment '商品名称',
   UNIT                 char(10) comment '计量单位',
   WASTAGE              numeric(12,6) comment '消耗量',
   store_id             varchar(4) comment '仓库ID',
   price                numeric(12,6) comment '价格',
   loss                 numeric(12,2) default 1,
   primary key (DISH_ID, GOODS_ID)
);

alter table DISH_MATERIAL comment '菜品原料消耗表';

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
   LEVEL_ID             char(1) not null comment '层次ID',
   LEVEL_NAME           char(20) comment '层次名称',
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
   GOODS_UNIT           char(4) not null comment '单位名',
   primary key (GOODS_UNIT)
);

alter table GOODS_UNIT comment '商品单位';

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
/* Table: PK                                                    */
/*==============================================================*/
create table PK
(
   PK_ID                char(14) not null comment '盘库ID',
   PK_NO                longtext comment '盘库单号',
   STR_IN_BILL_ID       char(14) comment '入库单ID',
   STR_OUT_BILL_ID      char(14) comment '出库单ID',
   STORE_ID             char(2) comment '仓库ID',
   OPERATOR_ID          varchar(20) comment '操作员',
   VERIFIER             char(20) comment '验收员',
   PK_DATE              timestamp comment '盘库日期',
   AUDITER_ID           char(4) comment '审核人员ID',
   AUDIT_DATE           timestamp comment '审核日期',
   REMARK               longtext comment '备注',
   modifier_id          varchar(8) comment '修改人员ID',
   modify_date          timestamp comment '修改日期',
   operator_date        timestamp comment '操作日期',
   primary key (PK_ID)
);

alter table PK comment '盘库单';

/*==============================================================*/
/* Table: PK_DETAIL                                             */
/*==============================================================*/
create table PK_DETAIL
(
   PK_ID                char(14) not null comment '盘库单ID',
   STOCK_REMAIN_ID      char(14) not null comment '库存ID',
   GOODS_ID             char(16) comment '商品代码',
   ZMSL                 numeric(12,2) comment '账面数量',
   PDSL                 numeric(12,2) comment '盘点数量',
   BATCH_ID             char(14) comment '入库批次ID',
   remark               varchar(200) comment '备注',
   price                decimal(12,6) comment '价格',
   primary key (PK_ID, STOCK_REMAIN_ID)
);

alter table PK_DETAIL comment '盘库单明细';

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
   PK_ID                char(14) not null comment '盘库单ID',
   PK_NO                longtext comment '盘库单号',
   PK_DATE              timestamp comment '盘点日期',
   STORE_ID             char(2) comment '盘点仓库',
   VERIFIER             char(20) comment '验收人',
   OPERATOR_ID          varchar(20) comment '操作员ID',
   REMARK               longtext comment '备注',
   primary key (PK_ID)
);

alter table PRE_PK comment '预盘库单';

/*==============================================================*/
/* Table: PRE_PK_DETAIL                                         */
/*==============================================================*/
create table PRE_PK_DETAIL
(
   PK_ID                char(14) not null comment '盘库单ID',
   STOCK_REMAIN_ID      char(14) not null comment '存货批次流水',
   GOODS_ID             char(16) comment '商品ID',
   PDSL                 numeric(12,6) comment '盘点数量',
   ZMSL                 numeric(12,6) comment '账面数量',
   BATCH_ID             char(14),
   primary key (PK_ID, STOCK_REMAIN_ID)
);

alter table PRE_PK_DETAIL comment '预盘库单明细';

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

alter table PRE_STR_IN_BILL_DETAIL comment '预入库单明细';

/*==============================================================*/
/* Table: PRE_STR_OUT_BILL                                      */
/*==============================================================*/
create table PRE_STR_OUT_BILL
(
   STR_OUT_BILL_ID      char(14) not null comment 'ID',
   STR_OUT_BILL_NO      char(20) comment '出库单号',
   DFDH                 char(14) comment '对方单号',
   STR_OUT_TYPE_ID      char(1) comment '出库类别ID',
   STR_OUT_DATE         timestamp comment '出库日期',
   STORE_ID             char(2) comment '出库仓库ID',
   OPERATOR_ID          varchar(20) comment '操作员ID',
   TRANSACTOR           char(20) comment '经办人',
   VERIFIER             char(20) comment '验收人',
   COME_TO              char(40) comment '出库来源',
   REMARK               longtext comment '备注',
   INVOICE_TYPE_ID      char(1) comment '发票类别ID',
   BILL_NUM             int comment '单据张数',
   OPERATOR_DATE        timestamp comment '操作日期',
   CUSTOMER_ID          char(12) comment '客户代码',
   XSHT_TYPE_ID         char(1) comment '销售合同类型代码',
   XSHT_PROP_ID         char(1) comment '销售或退货',
   IS_OTC               char(1) comment '是否otc',
   POS_ID               char(2) comment '消费区代码',
   COUNTER_ID           char(2) comment '柜台代码',
   SALES_ID             char(12) comment 'SALES_ID',
   primary key (STR_OUT_BILL_ID)
);

alter table PRE_STR_OUT_BILL comment '预出库单';

/*==============================================================*/
/* Table: PRE_STR_OUT_BILL_DETAIL                               */
/*==============================================================*/
create table PRE_STR_OUT_BILL_DETAIL
(
   STR_OUT_BILL_ID      char(14) not null comment 'ID',
   GOODS_ID             char(16) not null comment '商品ID',
   BATCH_ID             char(14) not null comment '入库批次ID',
   QTY                  numeric(12,6) comment '数量',
   PIECE                numeric(12,2) comment '件数',
   pch                  char(20) comment '批次号',
   price                numeric(16,6) default 0 comment '批数量',
   orderby              int comment '排序',
   remark               varchar(200) comment '备注',
   primary key (STR_OUT_BILL_ID)
);

alter table PRE_STR_OUT_BILL_DETAIL comment '预出库明细表';

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
   SCCJ_TYPE_ID         char(2) comment 'ID',
   SCCJ_TYPE_NAME       char(20) comment '名称'
);

alter table SCCJ_TYPE comment '生产厂家类型';

/*==============================================================*/
/* Table: STOCK_REMAIN                                          */
/*==============================================================*/
create table STOCK_REMAIN
(
   STOCK_REMAIN_ID      char(14) not null comment '库存ID',
   GOODS_ID             char(16) comment '商品代码',
   BATCH_ID             char(14) not null comment '批次代码',
   STORE_ID             char(2) comment '仓库ID',
   QTY                  numeric(12,6) comment '现库存数量',
   PRICE                numeric(12,6) comment '价格',
   STOCK_TYPE_ID        char(1) comment '存货方式',
   IS_CAN_SALE          char(1) comment '是否可售',
   up_flag              char(1) default '0' comment '同步标志位',
   primary key (STOCK_REMAIN_ID)
);

alter table STOCK_REMAIN comment '库存表';

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
   STORE_ID             char(2) not null comment 'ID',
   STORE_NAME           char(20) comment '名称',
   primary key (STORE_ID)
);

alter table STORE comment '仓库表';

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
   STR_IN_BILL_ID       char(14) not null comment '库库单ID',
   BATCH_ID             char(14) not null comment '入库批次ID',
   GOODS_ID             char(16) comment '商明代码',
   QTY                  numeric(12,6) comment '数量',
   PIECE                numeric(12,2) comment '件数',
   price                numeric(12,6) comment '价格',
   discount             numeric(12,2) default 1 comment '折扣',
   yxq                  timestamp comment '有效期',
   pch                  char(20) comment '批次号',
   total                numeric(16,2) comment '合计金额',
   remark               varchar(200) comment '备注',
   come_to              varchar(30) comment '入库来源',
   primary key (STR_IN_BILL_ID, BATCH_ID)
);

alter table STR_IN_BILL_DETAIL comment '入库单明细';

/*==============================================================*/
/* Table: STR_IN_TYPE                                           */
/*==============================================================*/
create table STR_IN_TYPE
(
   STR_IN_TYPE_ID       char(1) not null comment 'ID',
   STR_IN_TYPE_NAME     char(20) comment '名称',
   primary key (STR_IN_TYPE_ID)
);

alter table STR_IN_TYPE comment '入库方式';

/*==============================================================*/
/* Table: STR_OUT_BILL                                          */
/*==============================================================*/
create table STR_OUT_BILL
(
   STR_OUT_BILL_ID      char(14) not null comment '出库单ID',
   STR_OUT_BILL_NO      char(20) comment '出库单号',
   DFDH                 char(14) comment '对方单号',
   STR_OUT_TYPE_ID      char(1) comment '出库方式',
   STR_OUT_DATE         timestamp comment '出库日期',
   OPERATOR_DATE        timestamp comment '操作员',
   STORE_ID             char(2) comment '出库仓库ID',
   TRANSACTOR           char(20) comment '经办人',
   OPERATOR_ID          varchar(20) comment '操作员',
   COME_TO              char(40) comment '出库来源',
   VERIFIER             char(20) comment '验收人',
   MODIFIER_ID          char(4) comment '修改人ID',
   MODIFY_DATE          timestamp comment '修改日期',
   AUDITER_ID           char(4) comment '审核人员',
   AUDIT_DATE           timestamp comment '审核日期',
   BILL_NUM             int comment '单据张数',
   REMARK               longtext comment '备注',
   IS_STATICS           char(1) comment '是否参与统计',
   primary key (STR_OUT_BILL_ID)
);

alter table STR_OUT_BILL comment '出为单表';

/*==============================================================*/
/* Table: STR_OUT_BILL_DETAIL                                   */
/*==============================================================*/
create table STR_OUT_BILL_DETAIL
(
   STR_OUT_BILL_ID      char(14) not null comment '出库单号',
   GOODS_ID             char(16) comment '商品代码',
   BATCH_ID             char(14) not null comment '库存ID',
   QTY                  numeric(12,6) comment '出库数量',
   PIECE                numeric(12,2) comment '出库件数',
   price                numeric(12,6) comment '出库参考单价',
   orderby              int comment '排序',
   remark               varchar(200) comment '备注',
   primary key (STR_OUT_BILL_ID)
);

alter table STR_OUT_BILL_DETAIL comment '出库单明细';

/*==============================================================*/
/* Table: STR_OUT_TYPE                                          */
/*==============================================================*/
create table STR_OUT_TYPE
(
   STR_OUT_TYPE_ID      char(1) not null comment 'ID',
   STR_OUT_TYPE_NAME    char(20) comment '名称',
   primary key (STR_OUT_TYPE_ID)
);

alter table STR_OUT_TYPE comment '出库方式';

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

alter table VENDOR comment '供货商';

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
   VENDOR_TYPE_ID       char(2) not null comment 'ID',
   VENDOR_TYPE          char(20) comment '名称',
   primary key (VENDOR_TYPE_ID)
);

alter table VENDOR_TYPE comment '货货商类型';

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

alter table pk_del comment '盘库单删除表';

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

alter table pk_detail_del comment '盘库明细删除';

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

alter table str_in_bill_del comment '入库单删单表';

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

alter table str_out_bill_del comment '出库单删除客单表';

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

alter table str_out_bill_detail_del comment '出库明细删除表';

/*==============================================================*/
/* Table: str_zk                                                */
/*==============================================================*/
create table str_zk
(
   zk_id                varchar(14) not null comment '转库单ID',
   zk_no                varchar(20) comment '转库单号',
   zk_date              timestamp comment '转库日期',
   store_out            char(10) comment '出库仓库',
   store_in             char(10) comment '入库仓库',
   operator_id          char(4) comment '操作员',
   operator_date        timestamp comment '操作日期',
   modifier_id          char(4) comment '修改人员ID',
   modify_date          timestamp comment '修改日期',
   auditer_id           char(4) comment '审核人员ID',
   audit_date           timestamp comment '审核日期',
   remark               varchar(100) comment '备注',
   primary key (zk_id)
);

alter table str_zk comment '转库单';

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

alter table str_zk_del comment '转库单删除';

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
   batch_id_out         varchar(14) comment '转出ID',
   batch_id_in          varchar(14) comment '转入ID',
   goods_id             varchar(16) comment '商品代码',
   qty                  decimal(16,6) comment '数量',
   piece                decimal(16,6) comment '批次',
   price                decimal(16,6) comment '价格',
   orderby              int comment '排序',
   remark               varchar(100) comment '备注'
);

alter table str_zk_detail comment '转库明细';

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

alter table str_zk_detail_del comment '转库明细删除';

/*==============================================================*/
/* Table: vendor_goods                                          */
/*==============================================================*/
create table vendor_goods
(
   iserial              int not null auto_increment,
   vendor_id            char(12) comment 'ID',
   goods_id             char(16) comment '商品ID',
   recprice             numeric(16,4) comment '价格',
   recdate              timestamp comment '日期',
   flag                 varchar(2) default '',
   remark               varchar(250) comment '备注',
   primary key (iserial)
);

alter table vendor_goods comment '供货商供货明细';

/*==============================================================*/
/* Table: 商品表                                                   */
/*==============================================================*/
create table 商品表
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

alter table 商品表 comment 'GOODS';

alter table CONTACT_DETAIL add constraint FK_CONTACT__REF_7835_CONTACT foreign key (CONTACT_ID)
      references CONTACT (CONTACT_ID) on delete restrict on update restrict;

alter table PRE_PCH_CONTACT_DETAIL add constraint FK_PRE_PCH__REF_9159_PRE_PCH_ foreign key (CONTACT_ID)
      references PRE_PCH_CONTACT (CONTACT_ID) on delete restrict on update restrict;

alter table PRE_PK_DETAIL add constraint FK_PRE_PK_D_REF_23222_PRE_PK foreign key (PK_ID)
      references PRE_PK (PK_ID) on delete restrict on update restrict;

alter table PRE_STR_OUT_BILL_DETAIL add constraint FK_PRE_STR__REF_84132_PRE_STR_ foreign key (STR_OUT_BILL_ID)
      references PRE_STR_OUT_BILL (STR_OUT_BILL_ID) on delete restrict on update restrict;

alter table vendor_goods add constraint fk_vendor_goods_ref_goods foreign key (goods_id)
      references 商品表 (GOODS_ID) on delete cascade on update restrict;

alter table vendor_goods add constraint fk_vendor_goods_ref_vendor foreign key (vendor_id)
      references VENDOR (VENDOR_ID) on delete cascade on update restrict;

