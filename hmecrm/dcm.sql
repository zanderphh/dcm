/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-12-15 12:46:52                          */
/*==============================================================*/


/*==============================================================*/
/* Table: Tables                                                */
/*==============================================================*/
create table Tables
(
   id                   int not null comment 'Id',
   shopId               int comment '店铺编号',
   name                 varchar(50) comment '名称',
   areaId               int comment '餐区Id',
   tableType            varchar(50) comment '台位类型',
   tableStatus          varchar(50) comment '台位状态',
   seatNum              int comment '座位数',
   roomFee              double comment '包房费',
   hasMinimumCharge     int comment '是否最低消费',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table Tables comment '桌位';

/*==============================================================*/
/* Table: areas                                                 */
/*==============================================================*/
create table areas
(
   id                   int not null comment 'Id',
   shopId               int comment '店铺编号',
   name                 varchar(50) comment '名称',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table areas comment '餐区';

/*==============================================================*/
/* Table: authority                                             */
/*==============================================================*/
create table authority
(
   id                   int not null comment 'Id',
   name                 varchar(50) comment '权限项名称',
   shopId               int comment '店铺编号',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table authority comment '权限项';

/*==============================================================*/
/* Table: bill                                                  */
/*==============================================================*/
create table bill
(
   id                   int not null auto_increment comment 'Id',
   shopId               int comment '店铺Id',
   billNo               varchar(50) not null comment '结帐单号',
   unionOrderNo         varchar(50) comment '连桌单号',
   orderNo              varbinary(255) comment '客单号(多个客单逗号分隔)',
   payType              varchar(40) comment '付款方式',
   actualPay            numeric(12,2) comment '实付金额',
   operator             varchar(20) comment '收银员',
   payTime              timestamp comment '付款日期',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table bill comment '收款流水';

/*==============================================================*/
/* Index: index_bill_orderno                                    */
/*==============================================================*/
create index index_bill_orderno on bill
(
   orderNo
);

/*==============================================================*/
/* Index: index_bill_paytype                                    */
/*==============================================================*/
create index index_bill_paytype on bill
(
   payType
);

/*==============================================================*/
/* Table: dict                                                  */
/*==============================================================*/
create table dict
(
   id                   int not null auto_increment comment 'Id',
   shopId               int comment '店铺编码',
   dicCategory          varchar(50) comment '类目',
   dicKey               varchar(50) comment '名称',
   value                longtext comment '值1',
   value2               longtext comment '值2',
   value3               longtext comment '值3',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table dict comment '用于存储key-value结构数据，例如设置是否打印';

/*==============================================================*/
/* Table: dish                                                  */
/*==============================================================*/
create table dish
(
   id                   int not null comment 'Id',
   shopId               int comment '店铺Id',
   name                 varchar(50) comment '名称',
   dishtypeId           int comment '菜品类别代码',
   dishtype             varchar(50) comment '菜品类别',
   unit                 varchar(8) comment '菜品单位',
   price                numeric(12,2) comment '价格',
   isSpetial            int comment '是否特色菜',
   isDiscount           int comment '能否打折',
   pinyinCode           varchar(50) comment '拼音代码',
   isStoped             int comment '是否停用',
   isTemp               int comment '是否临时菜品',
   indexNum             int comment '排序',
   isPrint              int comment '是否在结账单打印',
   barcode              varchar(50) comment '条码',
   isRecommended        int comment '是否推荐 ',
   isOnSale             int comment '是否特价',
   dishPicture          longblob comment '菜品图片',
   remark               longtext comment '菜品备注',
   essentialDishGroupId int comment '必点菜品所属组名称',
   isSetMeal            int comment '是否套餐',
   printId              int comment '分单厨打Id',
   printId2             int comment '分单厨打Id2',
   printId3             int comment '分单厨打Id3',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table dish comment '菜品';

/*==============================================================*/
/* Index: index_shopId                                          */
/*==============================================================*/
create index index_shopId on dish
(
   shopId
);

/*==============================================================*/
/* Index: index_dishType                                        */
/*==============================================================*/
create index index_dishType on dish
(
   dishtype
);

/*==============================================================*/
/* Index: index_dishName                                        */
/*==============================================================*/
create index index_dishName on dish
(
   name
);

/*==============================================================*/
/* Table: dishExchangeable                                      */
/*==============================================================*/
create table dishExchangeable
(
   id                   int not null comment 'Id',
   shopId               int comment '店铺Id',
   setMealId            varchar(10) comment '套餐主餐Id',
   childDishId          int comment '套餐明细Id',
   exchangeDishId       int comment '可换菜品Id',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table dishExchangeable comment '套餐明细可选菜品';

/*==============================================================*/
/* Table: dishType                                              */
/*==============================================================*/
create table dishType
(
   id                   int not null auto_increment comment 'Id',
   shopId               int comment '店铺Id',
   name                 varchar(50) comment '名称',
   displayColor         varchar(16) comment '显示颜色',
   indexNo              int comment '显示顺序',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table dishType comment '菜品类别';

/*==============================================================*/
/* Table: dishUnit                                              */
/*==============================================================*/
create table dishUnit
(
   id                   int not null auto_increment,
   shopId               int,
   unit                 varchar(8) not null comment '单位',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table dishUnit comment '菜品计量单位';

/*==============================================================*/
/* Table: essentialDishGroup                                    */
/*==============================================================*/
create table essentialDishGroup
(
   id                   int not null auto_increment comment 'Id',
   shopId               int comment '店铺Id',
   name                 varchar(50) comment '名称',
   groupType            int comment '组类别（人均、非人均）',
   qty                  int comment '每组必选菜数量',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table essentialDishGroup comment '必选菜品组';

/*==============================================================*/
/* Table: hmeMessage                                            */
/*==============================================================*/
create table hmeMessage
(
   id                   int not null auto_increment comment 'Id',
   recieveTime          timestamp comment '接收时间',
   data                 longtext comment '接收数据',
   busCode              varchar(50) comment '业务代码',
   message              varchar(500) comment '通知信息',
   isMessageSent        int comment '通知是否发送',
   status               int comment '状态（未读、已读）',
   orderNo              varchar(50) comment '订单号',
   tableId              varchar(50) comment '台位Id',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table hmeMessage comment '点餐猫消息表';

/*==============================================================*/
/* Table: kitchenPrinter                                        */
/*==============================================================*/
create table kitchenPrinter
(
   id                   int not null auto_increment comment 'id',
   shopId               int comment '店铺id',
   Name                 varchar(50) comment '厨房名称',
   isAllinOneBill       int comment '总单/分单',
   printBillType        varchar(50) comment '打印单据类型(58,80)',
   printer              varchar(50) comment '打印机名称',
   printerIp            varchar(50) comment '打印机ip',
   primary key (id)
);

alter table kitchenPrinter comment '厨打打印机设置';

/*==============================================================*/
/* Table: kitchenPrinterDish                                    */
/*==============================================================*/
create table kitchenPrinterDish
(
   id                   int not null comment 'id',
   shopId               int comment 'shopId',
   dishId               int comment '菜品id',
   dishName             varchar(50) comment '菜品名称',
   primary key (id)
);

alter table kitchenPrinterDish comment '厨打对应菜品';

/*==============================================================*/
/* Table: orderDetail                                           */
/*==============================================================*/
create table orderDetail
(
   id                   int not null comment 'Id',
   shopId               int comment '店铺Id',
   orderId              int comment '客单Id',
   orderNo              varchar(50) comment '客单号',
   dishId               int comment '菜品代码',
   dishTypeId           int comment '菜品类别Id',
   dishType             varchar(50) comment '菜品类别',
   dishName             varchar(100) comment '菜品名称',
   dishUnit             varchar(8) comment '菜品单位',
   quantity             numeric(14,3) comment '数量',
   price                numeric(12,2) comment '价格',
   discountRate         numeric(12,2) comment '折扣率',
   waiterId             int comment '点菜员Id',
   operator             varchar(50) comment '操作员',
   dishTime             timestamp comment '点菜时间',
   cost                 numeric(12,4) comment '成本',
   dishRequest          longtext comment '菜品需求',
   dishStatus           int comment '菜品状态',
   barcode              varchar(50) comment '条码',
   dishReturnId         int comment '退菜明细Id',
   commitionRate        numeric(14,4) default 0 comment '提成率',
   commition            numeric(14,4) default 0 comment '单位提成',
   returnReason         varchar(255) comment '退菜原因',
   isIntegral           int comment '是否可积分',
   orderDishType        int comment '点菜类型（线上、线下）',
   memberId             int comment '点菜用户Id',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table orderDetail comment '订单明细';

/*==============================================================*/
/* Index: index_orderNo                                         */
/*==============================================================*/
create index index_orderNo on orderDetail
(
   orderNo
);

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   id                   int not null auto_increment,
   shopId               int,
   orderNo              varchar(50) comment '单号',
   unionOrderNo         varchar(50) comment '连桌单号',
   areaName             varchar(50) comment '消费区',
   memberId             int comment '会员Id',
   tableId              int comment '台位Id',
   tableName            varchar(50) comment '台位名称',
   shift                varchar(10) comment '班次',
   bookedTime           timestamp comment '预定时间',
   orderTime            timestamp comment '创建时间',
   confirmTime          timestamp comment '确认时间',
   checkedTime          timestamp comment '结账时间',
   personNum            int default 0 comment '人数',
   waiter               varchar(20) comment '服务员',
   operator             varchar(20) comment '操作员名称',
   roomFee              decimal(16,2) default 0 comment '包房费',
   serviceFee           decimal(16,2) default 0 comment '服务费',
   discountRate         decimal(16,2) default 1 comment '折扣率',
   discount             decimal(16,2) default 0 comment '折扣额',
   amount               decimal(16,2) default 0 comment '客单总额',
   freeCharge           decimal(16,2) default 0 comment '免零金额',
   prePay               decimal(16,2) comment '预付金额',
   shouldPay            numeric(12,2) comment '应付款',
   payType              varchar(20) comment '付款方式',
   orderState           int comment '客单状态(如预定、未结、已结、已同步到服务器)',
   orderType            int comment '订单类型(如网上定单，店内定单，店内扫码)',
   payState             int comment '付款状态',
   contact              varchar(50) comment '联系人',
   contactPhone         varchar(50) comment '联系电话',
   isRoomNeeded         int comment '是否需要包房',
   remark               varchar(500) comment '备注',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table orders comment '订单';

/*==============================================================*/
/* Index: index_checkedTime                                     */
/*==============================================================*/
create index index_checkedTime on orders
(
   checkedTime
);

/*==============================================================*/
/* Index: index_orderNo                                         */
/*==============================================================*/
create index index_orderNo on orders
(
   orderNo
);

/*==============================================================*/
/* Index: index_shopId                                          */
/*==============================================================*/
create index index_shopId on orders
(
   shopId
);

/*==============================================================*/
/* Table: payType                                               */
/*==============================================================*/
create table payType
(
   id                   int not null auto_increment comment 'Id',
   shopId               int comment '店铺编码',
   payType              varchar(50) not null comment '付款方式',
   indexNo              int comment '序号',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table payType comment '付款方式';

/*==============================================================*/
/* Table: printQueue                                            */
/*==============================================================*/
create table printQueue
(
   id                   int not null comment 'id',
   orderNo              varchar(50) default CURRENT_TIMESTAMP comment '单号',
   tableName            varchar(50) comment '台位名称',
   dishId               int comment '菜品id',
   dishTypeId           int comment '菜品类别id',
   dishType             varchar(50) comment '菜品类别',
   dishTime             timestamp comment '点菜时间(唯一)',
   printerId            int comment '打印机id',
   printer              varchar(50) comment '打印机',
   printType            int comment '打印类型(如:点菜、转台)',
   isAllinOneBill       int comment '总单/分单',
   printBillType        varchar(50) comment '打印单据类型(58,80)',
   extraInfo            varchar(255) comment '额外信息',
   isPrinted            int comment '是否打印',
   printTime            timestamp comment '打印时间',
   primary key (id)
);

alter table printQueue comment '厨打队列';

/*==============================================================*/
/* Index: Index_print_orderby                                   */
/*==============================================================*/
create index Index_print_orderby on printQueue
(
   orderNo,
   dishId,
   dishTime
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   id                   int not null auto_increment comment '角色Id',
   name                 varchar(20) comment '角色名称',
   shopId               int comment '店铺编号(空值表示初始默认角色)',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table role comment '角色';

/*==============================================================*/
/* Table: roleAuthority                                         */
/*==============================================================*/
create table roleAuthority
(
   id                   int not null comment 'Id',
   shopId               int comment '店铺编号(空值表示初始默认预设角色对应权限)',
   roleId               int comment '角色Id',
   authId               int comment '权限Id',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table roleAuthority comment '色角权限';

/*==============================================================*/
/* Table: setMealDetail                                         */
/*==============================================================*/
create table setMealDetail
(
   id                   int not null comment 'Id',
   shopId               int comment '店铺Id',
   mainDishId           int comment '主菜品Id',
   childDishId          int comment '套餐明细Id',
   isChangeable         int comment '明细是否可换',
   childQuantity        numeric(12,3) comment '数量',
   setMealCategory      varchar(20) comment '套餐组别',
   addedPrice           numeric(12,2) comment '加价额度',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table setMealDetail comment '套餐明细';

/*==============================================================*/
/* Table: shift                                                 */
/*==============================================================*/
create table shift
(
   id                   int not null,
   shopId               int,
   name                 varchar(20) comment '班次名称',
   time_start           time comment '开始时间',
   time_end             time comment '结束时间',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table shift comment '班次';

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   id                   int not null auto_increment comment '店铺Id',
   name                 varchar(100) comment '店铺名称',
   loginId              varchar(10) comment '登录Id',
   loginPwd             varchar(10) comment '登录密码',
   uniqueCode           varchar(20) comment '唯一编号(用于标识唯一店铺)',
   phone                varchar(20) comment '电话',
   address              varchar(100) comment '地址',
   contact              varchar(20) comment '联系人',
   location             varchar(50) comment '地理位置',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table shop comment '店铺';

/*==============================================================*/
/* Table: tableStatus                                           */
/*==============================================================*/
create table tableStatus
(
   id                   int not null comment 'Id',
   name                 varchar(50) comment '名称',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table tableStatus comment '台位状态';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   int not null comment 'Id',
   userId               varchar(20) comment '操作员Id',
   name                 varchar(20) comment '操作员姓名',
   shopId               int comment '店铺编号',
   phone                varchar(20) comment '电话',
   email                varchar(50) comment '电子邮件',
   loginPwd             varchar(20) comment '登录密码',
   lastLoginTime        datetime comment '最后一次登录时间',
   lastModifyPwdTime    datetime comment '最后一次修改密码时间',
   validDate            datetime comment '有效期',
   status               int comment '状态(是否被禁用)',
   discountRate         double comment '最低折扣权限',
   discountAmount       double comment '最高免零权限',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table user comment '用户';

/*==============================================================*/
/* Table: userRole                                              */
/*==============================================================*/
create table userRole
(
   id                   int not null comment 'Id',
   shopId               int comment '店铺编号',
   roleId               int comment '角色Id',
   userId               int comment '用户Id',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table userRole comment '用户色角';

/*==============================================================*/
/* Table: waiter                                                */
/*==============================================================*/
create table waiter
(
   id                   int not null auto_increment,
   shopId               int,
   name                 varchar(50) comment '点菜员',
   createTime           timestamp comment '创建时间',
   createUser           varchar(50) comment '创建人员',
   updateTime           timestamp comment '更新时间',
   modifier             varchar(50) comment '修改人员',
   isDelete             int comment '逻辑删除标志,1代表删除',
   primary key (id)
);

alter table waiter comment '点菜员';

alter table dish add constraint FK_Reference_dishType_dish foreign key (dishtypeId)
      references dishType (id) on delete restrict on update restrict;

alter table dish add constraint FK_Reference_dishmustorder_group foreign key (essentialDishGroupId)
      references essentialDishGroup (id) on delete set null on update cascade;

alter table dishExchangeable add constraint FK_Reference_dishExchange_changeDish foreign key (exchangeDishId)
      references dish (id) on delete cascade on update cascade;

alter table dishExchangeable add constraint FK_Reference_dishExchange_childDish foreign key (childDishId)
      references dish (id) on delete cascade on update cascade;

alter table dishExchangeable add constraint FK_Reference_dishExchange_dishRela foreign key (childDishId)
      references setMealDetail (id) on delete cascade on update cascade;

alter table kitchenPrinterDish add constraint FK_Reference_kitchenPrintDish_Dish foreign key (dishId)
      references dish (id) on delete cascade on update cascade;

alter table orderDetail add constraint FK_Reference_orderDetail foreign key (orderId)
      references orders (id) on delete cascade on update cascade;

alter table roleAuthority add constraint FK_Reference_roleAuth_auth foreign key (authId)
      references authority (id) on delete cascade on update cascade;

alter table roleAuthority add constraint FK_Reference_roleAuth_role foreign key (roleId)
      references role (id) on delete cascade on update cascade;

alter table setMealDetail add constraint FK_Reference_dishRela_childDish foreign key (childDishId)
      references dish (id) on delete cascade on update cascade;

alter table setMealDetail add constraint FK_Reference_dishRela_mainDish foreign key (mainDishId)
      references dish (id) on delete cascade on update cascade;

alter table userRole add constraint FK_Reference_userRole_role foreign key (roleId)
      references role (id) on delete cascade on update cascade;

alter table userRole add constraint FK_Reference_userRole_user foreign key (userId)
      references user (id) on delete cascade on update cascade;

