CREATE TABLE `adv_audit_comment` (
`adv_id` int(11) NOT NULL,
`audit_timestamp` datetime NOT NULL,
`audit_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`auditor_id` int(11) NOT NULL,
PRIMARY KEY (`adv_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `adv_base` (
`adv_id` int(11) NOT NULL,
`adv_owner_id` int(11) NULL DEFAULT NULL,
`adv_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`adv_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'picture/video',
`adv_length` decimal(2,2) NULL DEFAULT NULL,
`adv_pic_number` tinyint(2) NULL DEFAULT NULL,
`adv_direction` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '  横屏：landscape； 竖屏：portrait',
`adv_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`adv_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'waiting, paid, auditing, fail, expired, ready',
PRIMARY KEY (`adv_id`) ,
INDEX `adv_owner_id` (`adv_owner_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `adv_classification` (
`adv_classification_id` smallint(11) NOT NULL,
`adv_class_id` smallint(11) NOT NULL COMMENT 'id',
`adv_class_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
`adv_class_descripition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
`sub_adv_class_id` smallint(11) NULL DEFAULT NULL COMMENT 'id',
`sub_adv_class_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
`sub_adv_class_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
PRIMARY KEY (`adv_classification_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '广告内容（对照广告法）分类'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `adv_deploy_type` (
`deploy_type_id` tinyint(2) NOT NULL,
`deploy_type_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'normal_deploy/self_deploy/platform_deploy/public_deploy/exchange_deploy 普通/自投/平台/公益/交换',
`charge_rate` double(255,0) NULL DEFAULT NULL,
PRIMARY KEY (`deploy_type_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `adv_detail` (
`adv_id` int(11) NOT NULL,
`timestamp` datetime NOT NULL COMMENT 'status变化发生的时间记录',
`audit_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'waiting/paid/processing/pass/fail\r\n',
`adv_classification_id` tinyint(3) NOT NULL COMMENT '参照adv_classification表：广告内容分大类小类',
`adv_material_quality_id` tinyint(2) NULL DEFAULT NULL COMMENT '参照adv_material_quality表：广告素材质量等级 1~10级',
`adv_product_level_id` tinyint(2) NULL DEFAULT NULL COMMENT '参照adv_product_level表：广告宣传产品的档次 针对消费群体 1~10级',
`audit_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'normal/express',
`audit_charge` decimal(2,2) NULL DEFAULT NULL COMMENT '广告审核费',
`adv_expire_date` date NULL DEFAULT NULL COMMENT '广告有效日期：食品药品/某些促销服务等是有有效期限',
PRIMARY KEY (`adv_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `adv_material_quality` (
`adv_material_quality_id` tinyint(1) NOT NULL COMMENT '1~10级',
`material_quality_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告素材图片/视频质量级别的解释',
PRIMARY KEY (`adv_material_quality_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '广告素材（图片视频质量）等级'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `adv_owner_wallet_recorder` (
`timestamp` datetime NOT NULL,
`user_id` int(11) NOT NULL,
`order_id` int(11) NOT NULL,
`adv_id` int(11) NOT NULL,
`panel_id` int(11) NOT NULL,
`transaction_type_id` tinyint(4) NOT NULL COMMENT '参考transaction_type表:deposit/audit_payment/depoly_freeze/order_cancel_refund/order_cancel_compensation/   daily_order_gain/daily_order_pay/daily_order_refund/display_pay/display_refund',
`transaction_value` double(255,0) NOT NULL,
PRIMARY KEY (`timestamp`, `user_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `adv_product_level` (
`adv_product_level_id` int(11) NOT NULL COMMENT '1~10级',
`adv_product_level_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于前端用户解释广告级别(素材）',
PRIMARY KEY (`adv_product_level_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '广告产品（高中低端）等级'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `authority_base` (
`authority_id` int(11) NOT NULL,
`authority` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限等级',
PRIMARY KEY (`authority_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'user权限表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `daily_adv_owner_panel_report` (
`adv_owner_id` int(11) NOT NULL,
`order_id` int(11) NOT NULL,
`adv_id` int(11) NOT NULL,
`panel_id` int(11) NOT NULL,
`date` datetime NULL DEFAULT NULL,
`display_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每日结束，由daily_panel_runtime_recorder表得到当日广告轮播次数n，再由panel_base表获得屏幕当日最低播放次数N，n>=N播放够次数pass/n<N播放不够fail',
`panel_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'normal/repair/disable/enable/drop',
`day_payment` double(255,0) NOT NULL,
PRIMARY KEY (`adv_owner_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `daily_adv_panel_deploy` (
`adv_id` int(11) NOT NULL COMMENT '中间表，用于准备每天晚上生成第二天屏幕播放列表',
`panel_id` int(11) NOT NULL,
PRIMARY KEY (`adv_id`, `panel_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '中间表，用于准备每天晚上生成第二天屏幕播放列表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `daily_display_detail_recorder` (
`panel_id` int(11) NOT NULL,
`adv_id` int(11) NOT NULL,
`order_id` int(11) NOT NULL,
`display_count` int(11) NOT NULL COMMENT '每日截止时间，由panel_runtime_recorder记录得到结果：当日总播放次数',
`display_status` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '每日截止时间，由panel_runtime_recorder记录得到结果：播放够次数pass/播放不够fail',
`panel_owner_income` double(255,0) NULL DEFAULT NULL COMMENT '根据display_status算出',
`adv_owner_pay` double(255,0) NULL DEFAULT NULL COMMENT '根据display_status算出',
`platform_income` double(255,0) NULL DEFAULT NULL COMMENT '根据display_status算出',
PRIMARY KEY (`panel_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `daily_panel_owner_income` (
`panel_owner_id` int(11) NOT NULL,
`date` datetime NOT NULL,
`daily_income` double(255,0) NOT NULL,
PRIMARY KEY (`panel_owner_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `daily_panel_owner_report` (
`user_id` int(11) NOT NULL,
`panel_id` int(11) NOT NULL,
`date` datetime NOT NULL,
`adv_count` int(255) UNSIGNED ZEROFILL NOT NULL,
`online_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每日结束，由daily_panel_runtime_recorder表在线和离线记录计算出：60%时间在线good，20%时间在线ok，5%时间在线poor，less than时间在线2% offline',
`work_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'normal/repair/disable/enable/drop',
`unoccupied_space` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`income` double(255,0) NULL DEFAULT NULL,
PRIMARY KEY (`user_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `daily_panel_runtime_recorder` (
`panel_id` int(11) NOT NULL,
`price` decimal(3,2) NOT NULL COMMENT '5秒单位广告价格，每天可以更新无数次，最后一次第二天生效',
`90days_panel_space_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '90天广告空位string，每天可以更新无数次',
`panel_max_space` tinyint(2) NOT NULL COMMENT '每天可以更新无数次，最后一次第二天生效',
`online_status_count` int(4) NOT NULL,
`offline_status_count` int(4) UNSIGNED ZEROFILL NOT NULL,
`apk_timestamp` datetime NULL DEFAULT NULL COMMENT 'apk记录的最后更新时间',
`display_count` smallint(6) NULL DEFAULT NULL COMMENT 'apk反馈当日累计播放次数',
`daily_min_display` smallint(3) NOT NULL COMMENT '每天可以更新无数次，最后一次第二天生效',
PRIMARY KEY (`panel_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `monthly_adv_owner_panel_report` (
`adv_owner_id` int(11) NOT NULL,
`order_id` int(11) NOT NULL,
`adv_id` int(11) NOT NULL,
`panel_id` int(11) NOT NULL,
`nth_month` tinyint(255) NULL DEFAULT NULL,
`month_payment` double(255,0) NOT NULL,
PRIMARY KEY (`adv_owner_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `monthly_panel_owner_income` (
`panel_owner_id` int(11) NOT NULL,
`nth_month` tinyint(255) NULL DEFAULT NULL,
`monthly_income` double(255,0) NULL DEFAULT NULL,
PRIMARY KEY (`panel_owner_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `monthly_panel_owner_report` (
`panel_owner_id` int(11) NOT NULL,
`panel_id` int(11) NOT NULL,
`nth_month` tinyint(255) NOT NULL,
`adv_count` tinyint(255) NOT NULL,
`online_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`work_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`unoccupied_space` int(255) NOT NULL,
`income` double(255,0) NOT NULL,
PRIMARY KEY (`panel_owner_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `order_base` (
`order_id` int(11) NOT NULL COMMENT '广告订单ID',
`adv_id` int(11) NOT NULL COMMENT '广告ID',
`description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单描述',
`timestamp` datetime NOT NULL COMMENT '状态更改时间',
`order_status_id` tinyint(4) NOT NULL COMMENT ' 订单状态：waiting、canceling、canceled、paid、finished\r\n',
`adv_length` float NOT NULL COMMENT '广告长度',
`date_start` datetime NOT NULL COMMENT '广告开播日期',
`date_end` datetime NOT NULL COMMENT '广告停播日期',
`deploy_type_id` tinyint(4) NOT NULL COMMENT '订单种类：普通投放（自投，插播等以后添加)',
`total_fee` double(255,0) NULL DEFAULT NULL COMMENT '订单总费用',
PRIMARY KEY (`order_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `order_detail` (
`order_id` int(11) NOT NULL COMMENT '订单ID',
`adv_id` int(11) NOT NULL COMMENT '广告ID',
`panel_id` int(11) NOT NULL COMMENT '屏幕ID',
`panel_deploy_plan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '屏幕可投放计划1可投0不可投',
`panel_adv_price` decimal(4,2) NOT NULL COMMENT '根据屏幕单价和广告长度算出的屏幕广告价格',
PRIMARY KEY (`order_id`, `adv_id`, `panel_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `order_status` (
`order_status_id` tinyint(4) NOT NULL,
`order_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`order_status_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `panel_base` (
`panel_id` int(6) NOT NULL AUTO_INCREMENT,
`panel_mac_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`panel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`panel_direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`panel_dimension` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`panel_brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`panel_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`panel_model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`panel_location_id` int(6) NULL DEFAULT NULL,
`panel_classification_id` smallint(6) NULL DEFAULT NULL,
`panel_spot_id` smallint(6) NULL DEFAULT NULL,
`panel_exclusion_class_id` smallint(6) NULL DEFAULT NULL,
`panel_work_status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'normal/repair/disable/enable/drop',
`panel_min_display` smallint(4) NULL DEFAULT NULL COMMENT '每日最小播放次数',
`panel_max_space` tinyint(2) NULL DEFAULT NULL COMMENT '最大承载广告数',
`panel_unit_price` decimal(5,2) NULL DEFAULT NULL COMMENT '5秒单位价格',
PRIMARY KEY (`panel_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `panel_classification` (
`id` int(11) NOT NULL,
`panel_class_id` int(11) NULL DEFAULT NULL,
`panel_class_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
`panel_class_descripition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
`sub_panel_class_id` int(11) NULL DEFAULT NULL,
`sub_panel_class_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
`sub_panel_class_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '屏幕地点行业分类'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `panel_online_status` (
`online_status_id` tinyint(2) NOT NULL,
`online_status` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '60%时间在线good，20%时间在线ok，5%时间在线poor，less than时间在线2% offline\r\n',
PRIMARY KEY (`online_status_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '屏幕状态表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `panel_owner_wallet_recorder` (
`timestamp` datetime NOT NULL,
`user_id` int(11) NOT NULL,
`order_id` int(11) NOT NULL,
`adv_id` int(11) NOT NULL,
`panel_id` int(11) NOT NULL,
`transaction_type_id` tinyint(4) NOT NULL COMMENT '参考transaction_type表',
`transanction_value` double(255,0) NOT NULL,
PRIMARY KEY (`user_id`, `timestamp`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `panel_spot` (
`spot_id` int(11) NOT NULL AUTO_INCREMENT,
`spot_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '广告机安装具体场景：洗手间，电梯口，候车大厅，餐馆大堂，餐馆包间，展厅，吸烟区，游乐区等',
PRIMARY KEY (`spot_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '屏幕位置分类'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `platform_wallet_recorder` (
`timestamp` date NOT NULL,
`user_id` int(11) NOT NULL,
`order_id` int(11) NOT NULL,
`panel_id` int(11) NOT NULL,
`transaction_type_id` tinyint(4) NOT NULL COMMENT '参考transaction_type表',
`transaction_value` double(255,0) NOT NULL,
PRIMARY KEY (`timestamp`, `user_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `transaction_type` (
`transaction_type_id` tinyint(4) NOT NULL,
`transaction_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'deposit/audit_payment/depoly_freeze/order_cancel_refund/order_cancel_compensation/   daily_order_gain/daily_order_payment/daily_order_refund/display_payment/display_refund',
PRIMARY KEY (`transaction_type_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `user_base` (
`id` int(11) NOT NULL,
`account` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号 unique',
`password` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
`payment_password` int(6) NULL DEFAULT NULL,
`name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
`identity_number` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证 unique',
`phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话 unique',
`authority_id` int(11) NULL DEFAULT NULL COMMENT '权限码',
`province_id` smallint(10) NULL DEFAULT NULL COMMENT '地址省',
`city_id` smallint(10) NULL DEFAULT NULL COMMENT '地址市',
`status_id` tinyint(2) NULL DEFAULT NULL COMMENT '账户状态: 正常/冻结/取消',
`create_date` datetime NULL DEFAULT NULL COMMENT '生成日期',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '用户基础表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `wallet_base` (
`user_id` int(11) NOT NULL,
`total_balance` double(255,0) NULL DEFAULT NULL,
`frozen_balance` double(255,0) NULL DEFAULT NULL,
`liquid_balance` double(255,0) NULL DEFAULT NULL,
`timestamp` datetime NULL DEFAULT NULL,
PRIMARY KEY (`user_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `weekly_adv_owner_panel_report` (
`adv_owner_id` int(11) NOT NULL,
`order_id` int(11) NOT NULL,
`adv_id` int(11) NOT NULL,
`panel_id` int(11) NOT NULL,
`nth_week` tinyint(255) NULL DEFAULT NULL,
`week_payment` double(255,0) NOT NULL,
PRIMARY KEY (`adv_owner_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `weekly_display_detail_recorder` (
`panel_id` int(11) NOT NULL,
`display_count` int(255) NULL DEFAULT NULL,
`display_date` datetime NULL DEFAULT NULL,
`display_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`panel_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `weekly_panel_owner_income` (
`panel_owner_id` int(11) NOT NULL,
`nth_week` tinyint(255) NULL DEFAULT NULL,
`weekly_income` double(255,0) NULL DEFAULT NULL,
PRIMARY KEY (`panel_owner_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `weekly_panel_owner_report` (
`panel_owner_id` int(11) NOT NULL,
`panel_id` int(11) NOT NULL,
`nth_week` tinyint(255) NOT NULL,
`adv_count` tinyint(255) NOT NULL,
`online_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`work_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`unoccupied_space` int(255) NOT NULL,
`income` double(255,0) NOT NULL,
PRIMARY KEY (`panel_owner_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `yearly_display_detail_recorder` (
`panel_id` int(11) NOT NULL,
`display_count` int(255) NULL DEFAULT NULL,
`display_rate` decimal(2,2) NULL DEFAULT NULL,
`display_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`panel_id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
