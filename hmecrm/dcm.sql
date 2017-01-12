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
   shopId               int comment '���̱��',
   name                 varchar(50) comment '����',
   areaId               int comment '����Id',
   tableType            varchar(50) comment '̨λ����',
   tableStatus          varchar(50) comment '̨λ״̬',
   seatNum              int comment '��λ��',
   roomFee              double comment '������',
   hasMinimumCharge     int comment '�Ƿ��������',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table Tables comment '��λ';

/*==============================================================*/
/* Table: areas                                                 */
/*==============================================================*/
create table areas
(
   id                   int not null comment 'Id',
   shopId               int comment '���̱��',
   name                 varchar(50) comment '����',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table areas comment '����';

/*==============================================================*/
/* Table: authority                                             */
/*==============================================================*/
create table authority
(
   id                   int not null comment 'Id',
   name                 varchar(50) comment 'Ȩ��������',
   shopId               int comment '���̱��',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table authority comment 'Ȩ����';

/*==============================================================*/
/* Table: bill                                                  */
/*==============================================================*/
create table bill
(
   id                   int not null auto_increment comment 'Id',
   shopId               int comment '����Id',
   billNo               varchar(50) not null comment '���ʵ���',
   unionOrderNo         varchar(50) comment '��������',
   orderNo              varbinary(255) comment '�͵���(����͵����ŷָ�)',
   payType              varchar(40) comment '���ʽ',
   actualPay            numeric(12,2) comment 'ʵ�����',
   operator             varchar(20) comment '����Ա',
   payTime              timestamp comment '��������',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table bill comment '�տ���ˮ';

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
   shopId               int comment '���̱���',
   dicCategory          varchar(50) comment '��Ŀ',
   dicKey               varchar(50) comment '����',
   value                longtext comment 'ֵ1',
   value2               longtext comment 'ֵ2',
   value3               longtext comment 'ֵ3',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table dict comment '���ڴ洢key-value�ṹ���ݣ����������Ƿ��ӡ';

/*==============================================================*/
/* Table: dish                                                  */
/*==============================================================*/
create table dish
(
   id                   int not null comment 'Id',
   shopId               int comment '����Id',
   name                 varchar(50) comment '����',
   dishtypeId           int comment '��Ʒ������',
   dishtype             varchar(50) comment '��Ʒ���',
   unit                 varchar(8) comment '��Ʒ��λ',
   price                numeric(12,2) comment '�۸�',
   isSpetial            int comment '�Ƿ���ɫ��',
   isDiscount           int comment '�ܷ����',
   pinyinCode           varchar(50) comment 'ƴ������',
   isStoped             int comment '�Ƿ�ͣ��',
   isTemp               int comment '�Ƿ���ʱ��Ʒ',
   indexNum             int comment '����',
   isPrint              int comment '�Ƿ��ڽ��˵���ӡ',
   barcode              varchar(50) comment '����',
   isRecommended        int comment '�Ƿ��Ƽ� ',
   isOnSale             int comment '�Ƿ��ؼ�',
   dishPicture          longblob comment '��ƷͼƬ',
   remark               longtext comment '��Ʒ��ע',
   essentialDishGroupId int comment '�ص��Ʒ����������',
   isSetMeal            int comment '�Ƿ��ײ�',
   printId              int comment '�ֵ�����Id',
   printId2             int comment '�ֵ�����Id2',
   printId3             int comment '�ֵ�����Id3',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table dish comment '��Ʒ';

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
   shopId               int comment '����Id',
   setMealId            varchar(10) comment '�ײ�����Id',
   childDishId          int comment '�ײ���ϸId',
   exchangeDishId       int comment '�ɻ���ƷId',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table dishExchangeable comment '�ײ���ϸ��ѡ��Ʒ';

/*==============================================================*/
/* Table: dishType                                              */
/*==============================================================*/
create table dishType
(
   id                   int not null auto_increment comment 'Id',
   shopId               int comment '����Id',
   name                 varchar(50) comment '����',
   displayColor         varchar(16) comment '��ʾ��ɫ',
   indexNo              int comment '��ʾ˳��',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table dishType comment '��Ʒ���';

/*==============================================================*/
/* Table: dishUnit                                              */
/*==============================================================*/
create table dishUnit
(
   id                   int not null auto_increment,
   shopId               int,
   unit                 varchar(8) not null comment '��λ',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table dishUnit comment '��Ʒ������λ';

/*==============================================================*/
/* Table: essentialDishGroup                                    */
/*==============================================================*/
create table essentialDishGroup
(
   id                   int not null auto_increment comment 'Id',
   shopId               int comment '����Id',
   name                 varchar(50) comment '����',
   groupType            int comment '������˾������˾���',
   qty                  int comment 'ÿ���ѡ������',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table essentialDishGroup comment '��ѡ��Ʒ��';

/*==============================================================*/
/* Table: hmeMessage                                            */
/*==============================================================*/
create table hmeMessage
(
   id                   int not null auto_increment comment 'Id',
   recieveTime          timestamp comment '����ʱ��',
   data                 longtext comment '��������',
   busCode              varchar(50) comment 'ҵ�����',
   message              varchar(500) comment '֪ͨ��Ϣ',
   isMessageSent        int comment '֪ͨ�Ƿ���',
   status               int comment '״̬��δ�����Ѷ���',
   orderNo              varchar(50) comment '������',
   tableId              varchar(50) comment '̨λId',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table hmeMessage comment '���è��Ϣ��';

/*==============================================================*/
/* Table: kitchenPrinter                                        */
/*==============================================================*/
create table kitchenPrinter
(
   id                   int not null auto_increment comment 'id',
   shopId               int comment '����id',
   Name                 varchar(50) comment '��������',
   isAllinOneBill       int comment '�ܵ�/�ֵ�',
   printBillType        varchar(50) comment '��ӡ��������(58,80)',
   printer              varchar(50) comment '��ӡ������',
   printerIp            varchar(50) comment '��ӡ��ip',
   primary key (id)
);

alter table kitchenPrinter comment '�����ӡ������';

/*==============================================================*/
/* Table: kitchenPrinterDish                                    */
/*==============================================================*/
create table kitchenPrinterDish
(
   id                   int not null comment 'id',
   shopId               int comment 'shopId',
   dishId               int comment '��Ʒid',
   dishName             varchar(50) comment '��Ʒ����',
   primary key (id)
);

alter table kitchenPrinterDish comment '�����Ӧ��Ʒ';

/*==============================================================*/
/* Table: orderDetail                                           */
/*==============================================================*/
create table orderDetail
(
   id                   int not null comment 'Id',
   shopId               int comment '����Id',
   orderId              int comment '�͵�Id',
   orderNo              varchar(50) comment '�͵���',
   dishId               int comment '��Ʒ����',
   dishTypeId           int comment '��Ʒ���Id',
   dishType             varchar(50) comment '��Ʒ���',
   dishName             varchar(100) comment '��Ʒ����',
   dishUnit             varchar(8) comment '��Ʒ��λ',
   quantity             numeric(14,3) comment '����',
   price                numeric(12,2) comment '�۸�',
   discountRate         numeric(12,2) comment '�ۿ���',
   waiterId             int comment '���ԱId',
   operator             varchar(50) comment '����Ա',
   dishTime             timestamp comment '���ʱ��',
   cost                 numeric(12,4) comment '�ɱ�',
   dishRequest          longtext comment '��Ʒ����',
   dishStatus           int comment '��Ʒ״̬',
   barcode              varchar(50) comment '����',
   dishReturnId         int comment '�˲���ϸId',
   commitionRate        numeric(14,4) default 0 comment '�����',
   commition            numeric(14,4) default 0 comment '��λ���',
   returnReason         varchar(255) comment '�˲�ԭ��',
   isIntegral           int comment '�Ƿ�ɻ���',
   orderDishType        int comment '������ͣ����ϡ����£�',
   memberId             int comment '����û�Id',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table orderDetail comment '������ϸ';

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
   orderNo              varchar(50) comment '����',
   unionOrderNo         varchar(50) comment '��������',
   areaName             varchar(50) comment '������',
   memberId             int comment '��ԱId',
   tableId              int comment '̨λId',
   tableName            varchar(50) comment '̨λ����',
   shift                varchar(10) comment '���',
   bookedTime           timestamp comment 'Ԥ��ʱ��',
   orderTime            timestamp comment '����ʱ��',
   confirmTime          timestamp comment 'ȷ��ʱ��',
   checkedTime          timestamp comment '����ʱ��',
   personNum            int default 0 comment '����',
   waiter               varchar(20) comment '����Ա',
   operator             varchar(20) comment '����Ա����',
   roomFee              decimal(16,2) default 0 comment '������',
   serviceFee           decimal(16,2) default 0 comment '�����',
   discountRate         decimal(16,2) default 1 comment '�ۿ���',
   discount             decimal(16,2) default 0 comment '�ۿ۶�',
   amount               decimal(16,2) default 0 comment '�͵��ܶ�',
   freeCharge           decimal(16,2) default 0 comment '������',
   prePay               decimal(16,2) comment 'Ԥ�����',
   shouldPay            numeric(12,2) comment 'Ӧ����',
   payType              varchar(20) comment '���ʽ',
   orderState           int comment '�͵�״̬(��Ԥ����δ�ᡢ�ѽᡢ��ͬ����������)',
   orderType            int comment '��������(�����϶��������ڶ���������ɨ��)',
   payState             int comment '����״̬',
   contact              varchar(50) comment '��ϵ��',
   contactPhone         varchar(50) comment '��ϵ�绰',
   isRoomNeeded         int comment '�Ƿ���Ҫ����',
   remark               varchar(500) comment '��ע',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table orders comment '����';

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
   shopId               int comment '���̱���',
   payType              varchar(50) not null comment '���ʽ',
   indexNo              int comment '���',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table payType comment '���ʽ';

/*==============================================================*/
/* Table: printQueue                                            */
/*==============================================================*/
create table printQueue
(
   id                   int not null comment 'id',
   orderNo              varchar(50) default CURRENT_TIMESTAMP comment '����',
   tableName            varchar(50) comment '̨λ����',
   dishId               int comment '��Ʒid',
   dishTypeId           int comment '��Ʒ���id',
   dishType             varchar(50) comment '��Ʒ���',
   dishTime             timestamp comment '���ʱ��(Ψһ)',
   printerId            int comment '��ӡ��id',
   printer              varchar(50) comment '��ӡ��',
   printType            int comment '��ӡ����(��:��ˡ�ת̨)',
   isAllinOneBill       int comment '�ܵ�/�ֵ�',
   printBillType        varchar(50) comment '��ӡ��������(58,80)',
   extraInfo            varchar(255) comment '������Ϣ',
   isPrinted            int comment '�Ƿ��ӡ',
   printTime            timestamp comment '��ӡʱ��',
   primary key (id)
);

alter table printQueue comment '�������';

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
   id                   int not null auto_increment comment '��ɫId',
   name                 varchar(20) comment '��ɫ����',
   shopId               int comment '���̱��(��ֵ��ʾ��ʼĬ�Ͻ�ɫ)',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table role comment '��ɫ';

/*==============================================================*/
/* Table: roleAuthority                                         */
/*==============================================================*/
create table roleAuthority
(
   id                   int not null comment 'Id',
   shopId               int comment '���̱��(��ֵ��ʾ��ʼĬ��Ԥ���ɫ��ӦȨ��)',
   roleId               int comment '��ɫId',
   authId               int comment 'Ȩ��Id',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table roleAuthority comment 'ɫ��Ȩ��';

/*==============================================================*/
/* Table: setMealDetail                                         */
/*==============================================================*/
create table setMealDetail
(
   id                   int not null comment 'Id',
   shopId               int comment '����Id',
   mainDishId           int comment '����ƷId',
   childDishId          int comment '�ײ���ϸId',
   isChangeable         int comment '��ϸ�Ƿ�ɻ�',
   childQuantity        numeric(12,3) comment '����',
   setMealCategory      varchar(20) comment '�ײ����',
   addedPrice           numeric(12,2) comment '�Ӽ۶��',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table setMealDetail comment '�ײ���ϸ';

/*==============================================================*/
/* Table: shift                                                 */
/*==============================================================*/
create table shift
(
   id                   int not null,
   shopId               int,
   name                 varchar(20) comment '�������',
   time_start           time comment '��ʼʱ��',
   time_end             time comment '����ʱ��',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table shift comment '���';

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   id                   int not null auto_increment comment '����Id',
   name                 varchar(100) comment '��������',
   loginId              varchar(10) comment '��¼Id',
   loginPwd             varchar(10) comment '��¼����',
   uniqueCode           varchar(20) comment 'Ψһ���(���ڱ�ʶΨһ����)',
   phone                varchar(20) comment '�绰',
   address              varchar(100) comment '��ַ',
   contact              varchar(20) comment '��ϵ��',
   location             varchar(50) comment '����λ��',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table shop comment '����';

/*==============================================================*/
/* Table: tableStatus                                           */
/*==============================================================*/
create table tableStatus
(
   id                   int not null comment 'Id',
   name                 varchar(50) comment '����',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table tableStatus comment '̨λ״̬';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   int not null comment 'Id',
   userId               varchar(20) comment '����ԱId',
   name                 varchar(20) comment '����Ա����',
   shopId               int comment '���̱��',
   phone                varchar(20) comment '�绰',
   email                varchar(50) comment '�����ʼ�',
   loginPwd             varchar(20) comment '��¼����',
   lastLoginTime        datetime comment '���һ�ε�¼ʱ��',
   lastModifyPwdTime    datetime comment '���һ���޸�����ʱ��',
   validDate            datetime comment '��Ч��',
   status               int comment '״̬(�Ƿ񱻽���)',
   discountRate         double comment '����ۿ�Ȩ��',
   discountAmount       double comment '�������Ȩ��',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table user comment '�û�';

/*==============================================================*/
/* Table: userRole                                              */
/*==============================================================*/
create table userRole
(
   id                   int not null comment 'Id',
   shopId               int comment '���̱��',
   roleId               int comment '��ɫId',
   userId               int comment '�û�Id',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table userRole comment '�û�ɫ��';

/*==============================================================*/
/* Table: waiter                                                */
/*==============================================================*/
create table waiter
(
   id                   int not null auto_increment,
   shopId               int,
   name                 varchar(50) comment '���Ա',
   createTime           timestamp comment '����ʱ��',
   createUser           varchar(50) comment '������Ա',
   updateTime           timestamp comment '����ʱ��',
   modifier             varchar(50) comment '�޸���Ա',
   isDelete             int comment '�߼�ɾ����־,1����ɾ��',
   primary key (id)
);

alter table waiter comment '���Ա';

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
