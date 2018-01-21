SET NAMES UTF8;
DROP DATABASE IF EXISTS xz;
CREATE DATABASE xz CHARSET=UTF8;
USE xz;


/**笔记本电脑型号家族**/
CREATE TABLE xz_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**笔记本电脑**/
CREATE TABLE xz_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/颜色

  lname VARCHAR(32),          #商品名称
  os VARCHAR(32),             #操作系统
  memory VARCHAR(32),         #内存容量
  resolution VARCHAR(32),     #分辨率
  video_card VARCHAR(32),     #显卡型号
  cpu VARCHAR(32),            #处理器
  video_memory VARCHAR(32),   #显存容量
  category VARCHAR(32),       #所属分类
  disk VARCHAR(32),           #硬盘容量及类型
  details VARCHAR(1024),      #产品详细说明

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**笔记本电脑图片**/
CREATE TABLE xz_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #笔记本电脑编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE xz_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE xz_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE xz_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE xz_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE xz_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE xz_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE xz_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**笔记本电脑型号家族**/
INSERT INTO xz_laptop_family VALUES
(NULL,'AppleMacBookAir'),
(NULL,'小米Air'),
(NULL,'ThinkPadE480C'),
(NULL,'华硕RX310UQ'),
(NULL,'联想小新700'),
(NULL,'戴尔燃7000'),
(NULL,'戴尔灵越15PR-5745B'),
(NULL,'ThinkPadE470 C'),
(NULL,'华硕FH5900V'),
(NULL,'神舟战神Z7M-KP7GT');

/**笔记本电脑**/
INSERT INTO xz_laptop VALUES
(1,1,'Apple MacBook Air 13.3英寸笔记本 银色(Core i5 处理器/8GB内存/128GB SSD闪存 MMGF2CH/A)','5月焕新季，领券买新机！神券满6000减600！一体成型金属机身，纤薄轻巧，长达12小时续航',6988,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','双核i5/8GB内存/128GB闪存','AppleMacBook Air','MacOS','8G','1920*1080','集成显卡','Intel i5低功耗版','其它','轻薄本','128G固态','<div class="content_tpl"> <div class="formwork">   <div class="formwork_img"><br></div><div class="formwork_img">    <img alt="" class="" src="img/product/detail/57b15612N81dc489d.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_img">    <img alt="" class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_text">    技术规格请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150123456789,2968,true),
(2,1,'Apple MacBook Air 13.3英寸笔记本 银色(Core i5 处理器/8GB内存/256GB SSD闪存 MMGG2CH/A)','5月焕新季，领券买新机！神券满8000减800！一体成型金属机身，纤薄轻巧，长达12小时续航',8268,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','双核i5/8GB内存/256GB闪存','AppleMacBook Air','MacOS','8G','1920*1080','集成显卡','Intel i5低功耗版','其它','轻薄本','256G固态','<div class="content_tpl"> <div class="formwork">   <div class="formwork_img"><br></div><div class="formwork_img">    <img alt="" class="" src="img/product/detail/57b15612N81dc489d.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_img">    <img alt="" class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_text">    技术规格请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150223456789,1922,false),
(3,1,'Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i7 处理器/8GB内存/128GB SSD闪存 Z0TA0002L)','i7处理器在此！依旧纤薄轻盈，续航持久，能胜任更多高强度工作，办公利器！',7488,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','定制款：双核i7/8G内存/128G闪存','AppleMacBook Air','MacOS','8G','1920*1080','集成显卡','Intel i7低功耗版','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t3034/151/748569500/226790/d6cd86a2/57b15612N81dc489d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg"></div></div><div class="formwork"><div class="formwork_text">技术规格 请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150323456789,733,false),
(4,1,'Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i7 处理器/8GB内存/256GB SSD闪存 Z0TA0002L)','i7处理器在此！依旧纤薄轻盈，续航持久，能胜任更多高强度工作，办公利器！',7888,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','定制款：双核i7/8G内存/256G闪存','AppleMacBook Air','MacOS','8G','1920*1080','集成显卡','Intel i7低功耗版','其它','轻薄本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t3034/151/748569500/226790/d6cd86a2/57b15612N81dc489d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg"></div></div><div class="formwork"><div class="formwork_text">技术规格 请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150323456789,105,false),
(5,2,'小米(MI)Air 13.3英寸全金属超轻薄笔记本(i5-6200U 8G 256G PCIE固态 940MX独显 FHD WIN10)银','【i5 独立显卡】全高清窄边框 8G内存 256G固态硬盘 支持SSD硬盘扩容 薄至14.8mm 轻至1.28kg！AKG扬声器！',4999,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【13.3英寸】I5-6200U 8G 256G','小米Air','Windows 10','8G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i5低功耗版','1G','轻薄本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',154123456789,1527,true),
(6,2,'小米(MI)Air 12.5英寸全金属超轻薄笔记本(Core M-7Y30 4G 128G固态硬盘 全高清屏 背光键盘 Win10)银','【FHD窄边框】第七代处理器 128G SSD支持M.2接口SSD硬盘扩容 薄至12.9mm 轻至1.07kg！AKG扬声器！',3599,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【12.5银色】 M-7Y30 4G 128G','小米Air','Windows 10','4G','全高清屏(1920*1080)','集成显卡','Intel CoreM','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',153123456789,115,false),
(7,2,'小米(MI)Air 12.5英寸全金属超轻薄笔记本(Core M-7Y30 4G 128G固态硬盘 全高清屏 背光键盘 Win10)金','【FHD窄边框】第七代处理器 128G SSD支持M.2接口SSD硬盘扩容 薄至12.9mm 轻至1.07kg！AKG扬声器！',3599,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【12.5金色】 M-7Y30 4G 128G','小米Air','Windows 10','4G','全高清屏(1920*1080)','集成显卡','Intel CoreM','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',156123456789,812,true),
(8,2,'小米(MI)Air 12.5英寸全金属超轻薄笔记本(Core M-6Y30 4G 128G SSD固态硬盘 全高清屏 WIN10) 银','【FHD窄边框】库存紧张 128G固态硬盘 支持M.2接口SSD硬盘扩容 薄至12.9mm 轻至1.07kg！',3499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【12.5英寸】M-6Y30 4G 128G','小米Air','Windows 10','4G','全高清屏(1920*1080)','集成显卡','Intel CoreM','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',157123456789,1081,false),
(9,3,'联想(ThinkPad)轻薄系列E480c(20H3A00GCD)14英寸笔记本(i3-6006U 4G 500G 2G独显 Win10)黑色','2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',3499,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i3 4G 500G独显','ThinkPadE480c','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i3','2G','常规笔记本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',150423456789,1461,true),
(10,3,'联想(ThinkPad)轻薄系列E480c(20H3A000CD)14英寸笔记本(i5-6200U 4G 500G 2G独显 Win10)黑色','2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',4499,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i5 4G 500G','ThinkPadE480c','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',151423456789,733,false),
(11,3,'联想(ThinkPad)轻薄系列E480c(20H3A002CD)14英寸笔记本(i5-6200U 4G 256G SSD 2G独显 Win10)黑色','2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',5399,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i5 4G 256GSSD','ThinkPadE480c','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',152423456789,913,true),
(12,3,'联想(ThinkPad)轻薄系列E480c(20H3A001CD)14英寸笔记本电脑(i5-6200U 8G 256G SSD 2G独显 Win10)黑色','2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',5999,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i5 8G 256GSSD','ThinkPadE480c','Windows10','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',153423456789,112,false),
(13,4,'华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I3-7100U/4G/128G固态','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',4299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I3-7100U/4G/128G固态','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I3-7100U/4G/128G固态','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',151123456789,1197,true),
(14,4,'华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/128G固态','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',4999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I5/4G/128G固态','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/128G固态','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',152123456789,137,false),
(15,4,'华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/256G/2G独显','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I5/4G/256G/2G独显','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/256G/2G独显','Windows 10','4G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',153123456789,21,false),
(16,4,'华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/8G/256G/2G独显','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',5699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I5/8G/256G/2G独显','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/8G/256G/2G独显','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',152423456789,981,false),
(17,5,'联想(Lenovo)小新700电竞版 15.6英寸游戏笔记本电脑(i5-6300HQ 8G 500G+128G SSD GTX950M 4G IPS)黑','【小新家族2017闪耀换新！晒单得E卡！12期免息！】小新700电竞版！经典之选',5199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','小新700【i5 双硬盘 GTX950M】','联想小新700','Windows 10','8G','分辨率：全高清屏(1920×1080)','GTX950M','Intel i5标准电压版','4G','游戏本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58ca2b14Nd5c09fcd.jpg"><img class="" src="img/product/detail/58ca2b28Na5a22f83.jpg"><img class="" src="img/product/detail/58ca3012Nc99ab61f.jpg"><img class="" src="img/product/detail/58ca2b51Nbf258c3b.jpg"><img class="" src="img/product/detail/58ca2b67N436e60de.jpg"></div></div></div>',149123456789,192,true),
(18,5,'联想(Lenovo)小新700电竞版 15.6英寸游戏笔记本电脑(i7-6700HQ 8G 500G GTX950M 4G FHD IPS Office)黑','【小新家族2017闪耀换新！晒单得E卡！12期免息！】小新700电竞版！经典之选',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','小新700【i7 8G 500G GTX950M】','联想小新700','Windows 10','8G','分辨率：全高清屏(1920×1080)','GTX950M','Intel i7标准电压版','4G','游戏本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58ca2b14Nd5c09fcd.jpg"><img class="" src="img/product/detail/58ca2b28Na5a22f83.jpg"><img class="" src="img/product/detail/58ca3012Nc99ab61f.jpg"><img class="" src="img/product/detail/58ca2b51Nbf258c3b.jpg"><img class="" src="img/product/detail/58ca2b67N436e60de.jpg"></div></div></div>',151523456789,260,false),
(19,6,'戴尔DELL灵越燃7000 R1525S 14.0英寸轻薄窄边框笔记本电脑(i5-7200U 4G 128GSSD+500G 940MX 2G独显 FHD)银','【轻薄微边框、燃7000】七代i5双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【流光银】i5-7200u 4G 128 500G','戴尔燃7000','Windows 10','4G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d87221Na033954c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58e5e4b5N862f8aa1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/57bfa672N20953b71.jpg"></div></div></div>',151923456789,911,false),
(20,6,'戴尔DELL灵越燃7000 R1725G 14.0英寸轻薄窄边框笔记本电脑(i7-7500U 8G 128GSSD+1T 940MX 2G独显 FHD)金','【轻薄微边框、燃7000】七代i7双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',6599,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【溢彩金】i7-7500u 8G 128 1T','戴尔燃7000','Windows 10','8G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','轻薄本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d87221Na033954c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58e5e4b5N862f8aa1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/57bfa672N20953b71.jpg"></div></div></div>',150823456789,1930,true),
(21,6,'戴尔DELL灵越燃7000 R1525P 14.0英寸轻薄窄边框笔记本电脑(i5-7200U 4G 128GSSD+500G 2G独显 FHD)元気粉','【轻薄微边框、燃7000元気粉】七代i5双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【元気粉】i5-7200u 4G 128 500G','戴尔燃7000','Windows 10','4G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d87221Na033954c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58e5e4b5N862f8aa1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/57bfa672N20953b71.jpg"></div></div></div>',151023456789,987,true),
(22,7,'戴尔DELL灵越游匣15PR-5745B 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)黑','【白条6期免息 游匣“10”力出击】七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',6999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','宗师版 i7-7700HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5745B','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',148123456789,1901,true),
(23,7,'戴尔DELL灵越游匣15PR-5645SE 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)枪弹版','游匣枪弹版精装上市 3D立体喷涂画面 机身更酷炫 七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',6699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','枪弹版 i5-7300HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5645SE','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',153123456789,1231,false),
(24,7,'戴尔DELL灵越游匣15PR-5745SE 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)枪弹版','游匣枪弹版精装上市 3D立体喷涂画面 机身更酷炫 七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',7999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','枪弹版 i7-7700HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5645SE','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1539923456789,221,false),
(25,7,'戴尔DELL灵越游匣15PR-3848B 15.6英寸游戏笔记本电脑(i7-6700HQ 4G 128GSSD+500G GTX960M 4G FHD)黑','【强力散热保性能】 960M 4G独显 预装128SSD 双硬盘游戏更劲爽 我们比大多数产品 散热好一些',6099,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','精锐版 i7-6700HQ 4G GTX960 4G','戴尔游匣','Windows 10','4G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1519123456789,711,true),
(26,7,'戴尔DELL灵越游匣15PR-2648B 15.6英寸游戏笔记本电脑(i5-6300HQ 4G 128SSD+500G GTX960M 4G独显 FHD)黑','【选游戏本还得看散热】960M 4G独显 预装128SSD 双硬盘游戏更劲爽 ！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','精锐版 i5-6300HQ 4G GTX960 4G','戴尔游匣','Windows 10','4G','全高清屏(1920×1080)','GTX960M','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1529123456789,319,false),
(27,7,'戴尔DELL灵越游匣15PR-5645B 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)黑','【白条6期免息 游匣“10”力出击】七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',5999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','宗师版 i5-7300HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5645B','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1511123456789,2110,false),
(28,8,'联想(ThinkPad)轻薄系列E470c(20H3A000CD)14英寸笔记本电脑(i5-6200U 4G 500G 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',3998,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 4G 500G','ThinkPadE470 c','Linux','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',150123456789,117,true),
(29,8,'联想(ThinkPad)轻薄系列E470c(20H3A004CD)14英寸笔记本电脑(i5-6200U 8G 500G 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',4699,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 8G 500G','ThinkPadE470 c','Linux','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',151123456789,1862,false),
(30,8,'联想(ThinkPad)轻薄系列E470c(20H3A003CD)14英寸笔记本电脑(i5-6200U 8G 1T 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',5499,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 8G 1TB','ThinkPadE470 c','Linux','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',152123456789,812,true),
(31,8,'联想(ThinkPad)轻薄系列E470c(20H3A002CD)14英寸笔记本电脑(i5-6200U 4G 256G SSD 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',5399,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 4G 256GSSD','ThinkPadE470 c','Linux','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',153123456789,162,false),
(32,8,'联想(ThinkPad)轻薄系列E470c(20H3A001CD)14英寸笔记本电脑(i5-6200U 8G 256G SSD 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',5499,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 8G 256GSSD','ThinkPadE470 c','Linux','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',154123456789,1180,false),
(33,9,'华硕(ASUS)顽石电竞版FH5900 15.6英寸游戏笔记本电脑(i7-6700HQ 4G 1TB +128G SSD NV940MX 2G 独显 FHD)','顽石血统 标压电竞版 强劲动力带你畅快遨游',4999,' *退货补运费 *30天无忧退货 *72小时发货','【高速】顽石游戏本i74G1T128SSD','华硕FH5900V','Windows 10','4G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7标准电压版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1450123456789,1231,false),
(34,9,'华硕(ASUS) 顽石四代尊享版 15.6英寸笔记本电脑(i7-7500U 8G 1TB NV940MX 2G独显 深蓝 FHD )','第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境',4699,' *退货补运费 *30天无忧退货 *72小时发货','顽石经典【高配i7 8G 1T 深蓝】','华硕FL5900UQ','Windows 10','8G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1550123456789,1231,true),
(35,9,'华硕(ASUS) 顽石四代旗舰版FL5900 15.6英寸笔记本电脑(i7-7500U 4G 1TB +128GBSSD NV940MX 深蓝 FHD)','混合硬盘，1T搭载128G固态，读取速度更快，智能散热不烫手！！',4999,' *退货补运费 *30天无忧退货 *72小时发货','顽石双盘【i7 4G 1t加128SSD】','华硕FL5900UQ','Windows 10','4G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1531023456789,221,false),
(36,9,'华硕(ASUS)顽石四代疾速版 FL5900 15.6英寸笔记本电脑(i7-6500U 4G 512GB SSD NV940M 2G独显 红色)','【同样配置看主板，搭配华硕主板让您放心，屏幕无坏点保证】办公，游戏无压力！！！',4799,' *退货补运费 *30天无忧退货 *72小时发货','顽石高速【i7-4G 512SSD 炫红】','华硕FL5900U','Windows 10','4G','全高清屏(1920*1080)','GT940M','Intel i7低功耗版','2G','游戏本','512G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1510123456789,103,true),
(37,9,'华硕(ASUS) 顽石四代疾速版FL5900 15.6英寸笔记本电脑(i7-6500U 4G 512G SSD NV940MX 2G独显 红色 FHD)','疾速版，就是要你快！512G固态硬盘，第六代i7处理器搭载2G独显！',4799,' *退货补运费 *30天无忧退货 *72小时发货','顽石高速【i74G512SSD NV940MX】','华硕FL5900UQ','Windows 10','4G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本','512G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1450123456789,341,false),
(38,10,'神舟(HASEE)战神Z7M-KP7GT 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+128G SSD GTX1050Ti 1080P)IPS屏','超强性价比！！',6199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z7M GT【i7 128G+1T GTX1050Ti】','神舟战神Z7M-KP7GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050Ti','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',151123456789,441,false),
(39,10,'神舟(HASEE)战神Z7M-SL7D2 15.6英寸游戏本笔记本电脑(i7-6700HQ 8G 1T+128GB SSD GTX965M 1080P)IPS','六代i7 SSD GTX965M还预装WIN10，一步到位，你赢了！',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','战神Z7M【四核i7 GTX965M】','神舟战神Z7M','Windows 10','8G','全高清屏(1920×1080)','GTX965M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',152123456789,1289,true),
(40,10,'神舟(HASEE)战神Z7M-SL5D1 15.6英寸游戏本笔记本电脑(i5-6300HQ 8G 1TB GTX965M 1080P)IPS屏','超强性价比！！',4499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','战神Z7M【四核i5 GTX965M】','神舟战神Z7M-SL5D1','Windows 10','8G','全高清屏(1920×1080)','GTX965M','Intel i7标准电压版','2G','游戏本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',153123456789,231,false),
(41,10,'神舟(HASEE)战神Z6-KP5GT 15.6英寸游戏本笔记本电脑(i5-7300HQ 8G 1T+128G SSD GTX1050 1080P)黑色','超强性价比！！',5199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z6 GT【i5 128G+1T GTX1050】','神舟战神Z6-KP5GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',154123456789,469,true),
(42,10,'神舟(HASEE) 战神G6-SL7S2 17.3英寸游戏笔记本(i7-6700HQ 8G 256G SSD GTX960M 2G独显 1080P)黑色','17.3英寸大屏游戏本，纯固态硬盘，秒速开启超神之路！',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','战神G6【17.3英寸 GTX960M】','神舟战神G6','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','256固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',155123456789,1223,false),
(43,10,'神舟(HASEE)战神Z6-KP7GT 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+128G SSD GTX1050 1080P)黑色','预约享5499抢！【128G SSD+1T HDD】双硬盘，春风“十”里，期待是你！',5699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z6 GT【i7 128G+1T GTX1050】','神舟战神Z6-KP7GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i7标准电压版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',156123456789,1844,true);

/**笔记本电脑图片**/
INSERT INTO xz_laptop_pic VALUES
(NULL, 1, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 1, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 1, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 2, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 2, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 2, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 3, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 3, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 3, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 4, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 4, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 4, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 5, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 5, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 5, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 5, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 5, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 5, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 5, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 6, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 6, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 6, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 6, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 6, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 6, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 6, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 7, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 7, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 7, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 7, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 7, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 7, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 7, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 8, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 8, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 8, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 8, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 8, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 8, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 8, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 9, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 9, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 9, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 9, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 9, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 9, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 9, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 9, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 10, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 10, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 10, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 10, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 10, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 10, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 10, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 10, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 11, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 11, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 11, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 11, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 11, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 11, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 11, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 11, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 12, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 12, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 12, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 12, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 12, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 12, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 12, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 12, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 13, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 13, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 13, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 13, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 13, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 13, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 14, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 14, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 14, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 14, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 14, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 14, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 15, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 15, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 15, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 15, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 15, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 15, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 16, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 16, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 16, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 16, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 16, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 16, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 17, 'img/product/sm/587f476aNcfbf7869.jpg','img/product/md/587f476aNcfbf7869.jpg','img/product/lg/587f476aNcfbf7869.jpg'),
(NULL, 17, 'img/product/sm/57871083Nefe2d3d6.jpg','img/product/md/57871083Nefe2d3d6.jpg','img/product/lg/57871083Nefe2d3d6.jpg'),
(NULL, 17, 'img/product/sm/57871086N86c8f0ab.jpg','img/product/md/57871086N86c8f0ab.jpg','img/product/lg/57871086N86c8f0ab.jpg'),
(NULL, 17, 'img/product/sm/5787107bN73d05ad5.jpg','img/product/md/5787107bN73d05ad5.jpg','img/product/lg/5787107bN73d05ad5.jpg'),
(NULL, 17, 'img/product/sm/5787109cNaf26e3b0.jpg','img/product/md/5787109cNaf26e3b0.jpg','img/product/lg/5787109cNaf26e3b0.jpg'),
(NULL, 17, 'img/product/sm/578710a0N07795fe5.jpg','img/product/md/578710a0N07795fe5.jpg','img/product/lg/578710a0N07795fe5.jpg'),
(NULL, 17, 'img/product/sm/578710a3Nc498e3ea.jpg','img/product/md/578710a3Nc498e3ea.jpg','img/product/lg/578710a3Nc498e3ea.jpg'),
(NULL, 18, 'img/product/sm/587f476aNcfbf7869.jpg','img/product/md/587f476aNcfbf7869.jpg','img/product/lg/587f476aNcfbf7869.jpg'),
(NULL, 18, 'img/product/sm/57871083Nefe2d3d6.jpg','img/product/md/57871083Nefe2d3d6.jpg','img/product/lg/57871083Nefe2d3d6.jpg'),
(NULL, 18, 'img/product/sm/57871086N86c8f0ab.jpg','img/product/md/57871086N86c8f0ab.jpg','img/product/lg/57871086N86c8f0ab.jpg'),
(NULL, 18, 'img/product/sm/5787107bN73d05ad5.jpg','img/product/md/5787107bN73d05ad5.jpg','img/product/lg/5787107bN73d05ad5.jpg'),
(NULL, 18, 'img/product/sm/5787109cNaf26e3b0.jpg','img/product/md/5787109cNaf26e3b0.jpg','img/product/lg/5787109cNaf26e3b0.jpg'),
(NULL, 18, 'img/product/sm/578710a0N07795fe5.jpg','img/product/md/578710a0N07795fe5.jpg','img/product/lg/578710a0N07795fe5.jpg'),
(NULL, 18, 'img/product/sm/578710a3Nc498e3ea.jpg','img/product/md/578710a3Nc498e3ea.jpg','img/product/lg/578710a3Nc498e3ea.jpg'),
(NULL, 19, 'img/product/sm/57bbc38eN9def8042.jpg','img/product/md/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 19, 'img/product/sm/57ba6a27Nbb8d2dcf.jpg','img/product/md/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 19, 'img/product/sm/57ba6a38N4f4670bd.jpg','img/product/md/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 19, 'img/product/sm/57ba6a3dN54779e6a.jpg','img/product/md/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 19, 'img/product/sm/57ba6a47N19af9c97.jpg','img/product/md/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 19, 'img/product/sm/57ba6a4cNb83e292a.jpg','img/product/md/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 19, 'img/product/sm/57ba6a56N1e3e3d63.jpg','img/product/md/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 20, 'img/product/sm/57bbc38eN9def8042.jpg','img/product/md/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 20, 'img/product/sm/57ba6a27Nbb8d2dcf.jpg','img/product/md/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 20, 'img/product/sm/57ba6a38N4f4670bd.jpg','img/product/md/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 20, 'img/product/sm/57ba6a3dN54779e6a.jpg','img/product/md/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 20, 'img/product/sm/57ba6a47N19af9c97.jpg','img/product/md/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 20, 'img/product/sm/57ba6a4cNb83e292a.jpg','img/product/md/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 20, 'img/product/sm/57ba6a56N1e3e3d63.jpg','img/product/md/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 21, 'img/product/sm/57bbc38eN9def8042.jpg','img/product/md/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 21, 'img/product/sm/57ba6a27Nbb8d2dcf.jpg','img/product/md/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 21, 'img/product/sm/57ba6a38N4f4670bd.jpg','img/product/md/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 21, 'img/product/sm/57ba6a3dN54779e6a.jpg','img/product/md/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 21, 'img/product/sm/57ba6a47N19af9c97.jpg','img/product/md/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 21, 'img/product/sm/57ba6a4cNb83e292a.jpg','img/product/md/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 21, 'img/product/sm/57ba6a56N1e3e3d63.jpg','img/product/md/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 22, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 22, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 22, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 22, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 22, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 22, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 22, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 23, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 23, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 23, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 23, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 23, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 23, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 23, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 24, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 24, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 24, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 24, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 24, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 24, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 24, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 25, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 25, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 25, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 25, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 25, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 25, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 25, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 26, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 26, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 26, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 26, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 26, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 26, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 26, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 27, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 27, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 27, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 27, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 27, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 27, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 27, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 28, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 28, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 28, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 28, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 28, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 28, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 28, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 28, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 29, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 29, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 29, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 29, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 29, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 29, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 29, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 29, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 30, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 30, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 30, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 30, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 30, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 30, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 30, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 30, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 31, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 31, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 31, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 31, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 31, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 31, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 31, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 31, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 32, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 32, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 32, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 32, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 32, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 32, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 32, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 32, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 33, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 33, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 33, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 33, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 33, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 33, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 33, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 34, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 34, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 34, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 34, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 34, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 34, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 34, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 35, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 35, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 35, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 35, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 35, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 35, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 35, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 36, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 36, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 36, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 36, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 36, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 36, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 36, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 37, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 37, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 37, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 37, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 37, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 37, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 37, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 38, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 38, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 38, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 38, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 39, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 39, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 39, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 39, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 40, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 40, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 40, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 40, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 41, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 41, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 41, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 41, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 42, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 42, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 42, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 42, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 43, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 43, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 43, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 43, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg');

/**用户信息**/
INSERT INTO xz_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO xz_index_carousel VALUES
(NULL, 'img/index/banner1.png','轮播广告商品1','product_details.html?lid=28'),
(NULL, 'img/index/banner2.png','轮播广告商品2','product_details.html?lid=19'),
(NULL, 'img/index/banner3.png','轮播广告商品3','lookforward.html'),
(NULL, 'img/index/banner4.png','轮播广告商品4','lookforward.html');

/****首页商品****/
INSERT INTO xz_index_product VALUES
(NULL, 'Apple MacBook Air系列', '酷睿双核i5处理器|256GB SSD|8GB内存|英特尔HD显卡620含共享显卡内存', 'img/index/study_computer_img1.png', 6988, 'product_details.html?lid=1', 1, 1, 1),
(NULL, '小米Air 金属超轻薄', '酷睿双核i5处理器|512GB SSD|2GB内存|英特尔HD独立显卡', 'img/index/study_computer_img2.png', 3488, 'product_details.html?lid=5', 2, 2, 2),
(NULL, '联想E480C 轻薄系列', '酷睿双核i7处理器|256GB SSD|4GB内存|英特尔HD显卡680M', 'img/index/study_computer_img3.png', 5399, 'product_details.html?lid=9', 3, 3, 3),
(NULL, '华硕RX310 金属超极本', '酷睿双核i5处理器|512GB SSD|4GB内存|英特尔HD游戏级显卡', 'img/index/study_computer_img4.png', 4966, 'product_details.html?lid=13', 4, 4, 4),
(NULL, '联想小新700 电竞版游戏本', '酷睿双核i7处理器|1TGB SSD|8GB内存|英特尔HD显卡620含共享显卡内存', 'img/index/study_computer_img5.png', 6299, 'product_details.html?lid=17', 5, 5, 5),
(NULL, '戴尔灵越燃7000 轻薄窄边', '酷睿双核i5处理器|512GB SSD|2GB内存|英特尔HD显卡', 'img/index/study_computer_img3.png', 5199, 'product_details.html?lid=19', 6, 6, 6),
(NULL, '神州战神Z7M 高性价比游戏本', '酷睿双核i7处理器|1TGB SSD|8GB内存|英特尔HD游戏机独立显卡', 'img/index/study_computer_img4.png', 5799, 'product_details.html?lid=38', 0, 0, 0);

