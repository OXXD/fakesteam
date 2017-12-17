SET NAMES UTF8;
DROP DATABASE IF EXISTS steam;
CREATE DATABASE steam CHARSET = UTF8;
USE steam;

-- ----------------------------
-- Tbale of steam_apps
-- ----------------------------
CREATE TABLE IF NOT EXISTS `steam_apps` (
  `app_id` int(7) unsigned NOT NULL auto_increment,
  `app_type` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `name` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'Unknown App',
  `price` decimal(10,2) NOT NULL,
  `developer` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `publisher` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `release_date` bigint(20) NOT NULL,
  `desc` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `desc_full` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `genres` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `supported_systems` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `tag_list` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  PRIMARY KEY  (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of steam_apps
-- ----------------------------

INSERT INTO `steam_apps` VALUES('524220',
    '1',
    'NieR:Automata™',
    '412',
    'Square Enix',
    'Square Enix',
    '1489766400000',
    'NieR: Automata tells the story of androids 2B, 9S and A2 and their battle to reclaim the machine-driven dystopia overrun by powerful machines.',
    '<h2>关于这款游戏</h2><img src="img/product/524220_Nier_PRE_Launch-ENG_UK_Multi_06_Mod.gif"><br>NieR: Automata tells the story of androids 2B, 9S and A2 and their battle to reclaim the machine-driven dystopia overrun by powerful machines.<br><br>Humanity has been driven from the Earth by mechanical beings from another world. In a final effort to take back the planet, the human resistance sends a force of android soldiers to destroy the invaders. Now, a war between machines and androids rages on... A war that could soon unveil a long-forgotten truth of the world.<br><br>Key Features:<br><ul class="bb_ul"><li><strong>Action-Packed Battles</strong> – Players will switch between using melee and ranged attacks in battle against hordes of enemies and challenging bosses across a variety of open field maps. The tight controls and incredibly fluid combat are simple to learn for newcomers while offering plenty of depth for more experienced action gamers. Players can perform high-speed battle actions—combining light and heavy attacks—and switch through an arsenal of weaponry while evading enemies with speed and style. <br></li><li><strong>Beautifully Desolate Open-World</strong> – The game seamlessly joins together hauntingly beautiful vistas and locations with no area loading. The environments are rendered in 60fps and contain a wealth of sub-events in addition to the main storyline. <br></li><li><strong>Masterfully Crafted Story and Characters</strong> – NieR: Automata tells the story of androids 2B, 9S and A2 and their ferocious battle to reclaim a machine-driven dystopia overrun by powerful weapons known as machine lifeforms.<br></li><li><strong>Elements of an RPG</strong> – Players will obtain a variety of weapon types, level up in battle, learn new combat skills, and customise a loadout that caters to their playstyle.<br></li><li><strong>Utilise the Pod Support System to Assist In and Outside of Battle</strong> – Pods can attack the enemy in both manual and lock-on modes. They can also assist outside of battle, such as allowing the player to glide through the air. Pods can be enhanced throughout the game, with upgrades including new attack methods and variations.<br></li><li><strong>“Auto Mode” Available for Beginners </strong>– Novice players can elect “Auto Mode” for easy attacks and evasions.</li></ul>',
    'Action',
    ',win,',
    ',
    ,Great Soundtrack
    ,Story Rich
    ,Action
    ,Female Protagonist
    ,Hack and Slash
    ,RPG
    ,Open World
    ,Post-apocalyptic
    ,Anime
    ,JRPG
    ,Singleplayer
    ,Robots
    ,Atmospheric
    ,Sci-fi
    ,Bullet Hell
    ,Spectacle fighter
    ,Character Action Game
    ,Adventure
    ,Nudity
    ,Violent+,');
INSERT INTO `steam_apps` VALUES('240720',
    '1',
    'Getting Over It with Bennett Foddy',
    '32',
    'Bennett Foddy',
    'Bennett Foddy',
    '1512576000000',
    '我做的这个游戏， 是为了某种特定类型的人 为了伤害他们。',
    '<h2>关于这款游戏</h2>我做的这个游戏，<br>是为了某种特定类型的人<br>为了伤害他们。<br><br>《和Bennett Foddy 一起攻克难关》是一个惩罚性的攀岩游戏，对Jazzuo的2002推出的B类游戏经典《迷人远足》表示敬意。你用鼠标移动锤子可可以了。通过练习，你可以跳跃，摇摆，爬升和飞跃。伟大的奥秘和美秒的回报等待着登顶的远足者。<br>引用Jazzuo的话：“游戏中的徒步和现实生活中的非常相似，记住这一点，你会做得很好”。<br><br><ul class="bb_ul"><li>只用一把锤子和一个锅攀越高山。<br></li><li>像我对手头的问题进行哲学观察一样倾听。<br></li><li>这段痛苦的游戏至少要两个小时及以上的时间才能完成。我们的测试者结束游戏的中位时间是5小时，但平均值接近于正无穷。<br></li><li>一次次地退后。<br></li><li>体会你曾不知道能承受的新型挫折。<br></li><li>不可思议的奖励等待登顶的远足者。</li></ul>',
    'Action',
    ',win,',
    ',
    ,Difficult
    ,Psychological Horror
    ,Physics
    ,Singleplayer
    ,Memes
    ,Funny
    ,Horror
    ,Action
    ,Indie
    ,Platformer
    ,Casual
    ,Nudity
    ,Parkour
    ,Adventure
    ,Survival Horror
    ,Atmospheric
    ,Illuminati
    ,Walking Simulator
    ,Story Rich
    ,Strategy+,');
INSERT INTO `steam_apps` VALUES('578080',
    '1',
    'PLAYERUNKNOWN\'S BATTLEGROUNDS',
    '98',
    'PUBG Corporation',
    'PUBG Corporation',
    '1490198400000',
    '绝地求生(PLAYERUNKNOWN’S BATTLEGROUNDS)是大逃杀类型的游戏，每一局游戏将有100名玩家参与，他们将被投放在绝地岛(battlegrounds)的上空，游戏开始跳伞时所有人都一无所有。',
    '<h2>关于这款游戏</h2>绝地求生(PLAYERUNKNOWN’S BATTLEGROUNDS)是大逃杀类型的游戏，每一局游戏将有100名玩家参与，他们将被投放在绝地岛(battlegrounds)的上空，游戏开始跳伞时所有人都一无所有。<br>
    游戏展开的方式是：玩家赤手空拳地分布在岛屿的各个角落，利用岛上多样的武器与道具。<br>
    随着时间的流逝，岛上的安全地带越来越少，特定地区也会发生爆炸的情况，最终只有一人存活获得胜利。<br>
    游戏的每一局比赛都会随机转换安全区，这样玩家的很新鲜与紧张感会更加强烈。<br>
    <br>
    PLAYERUNKNOWN (Brendan Greene – 目前为Bluehole Creative Director )是大逃杀类游戏的开拓者。 <br>
    他在ARMA2初次展现大逃杀模式，他的大逃杀模式成为ARMA系列与H1Z1:King of the Kill的基础。<br>
    现在， 他为了开发真正的大逃杀游戏而在蓝洞(Bluehole)开发绝地求生(PLAYERUNKNOWN’S BATTLEGROUNDS)。<br>
    <br>
    NOT JUST A GAME, THIS IS BATTLE ROYALE。<br>
    (这不仅是游戏，是大逃杀。)',
    'Action',
    ',win,',
    ',
    ,Great Soundtrack
    ,Story Rich
    ,Action
    ,Female Protagonist
    ,Hack and Slash
    ,RPG
    ,Open World
    ,Post-apocalyptic
    ,Anime
    ,JRPG
    ,Singleplayer
    ,Robots
    ,Atmospheric
    ,Sci-fi
    ,Bullet Hell
    ,Spectacle fighter
    ,Character Action Game
    ,Adventure
    ,Nudity
    ,Violent+,');
INSERT INTO `steam_apps` VALUES('365590',
    '1',
    'Tom Clancy\’s The Division™',
    '208',
    'Massive Entertainment',
    'Ubisoft',
    '1457366400000',
    '我们生于一个复杂的世界，她越先进，就会变得越易受攻击。我们创造了一个纸牌之屋：只需拿走一张纸牌，便全盘坍塌。在黑色星期五——一种毁坏性的流行病席卷了整个纽约，基础设施接二连三地慢慢瘫痪。在短短几天内，失去生活必需品的整个社会陷入了混乱。',
    '
							<h2>关于这款游戏</h2>
							我们生于一个复杂的世界，她越先进，就会变得越易受攻击。我们创造了一个纸牌之屋：只需拿走一张纸牌，便全盘坍塌。在黑色星期五——一种毁坏性的流行病席卷了整个纽约，基础设施接二连三地慢慢瘫痪。在短短几天内，失去生活必需品的整个社会陷入了混乱。The Division，一个由战术特工组成的团体被唤醒了。这些特工以普通人的身份藏身于人群中，他们受过专门训练，以在危机中拯救社会。<br>
<br>
当社会倒塌时，我们便崛起。<br>
<br>
关键特性<br>
<br>
夺回纽约：欢迎体验新一代持续动态开放环境，这由地面建立直达合作公寓，在这里，开发和玩家的发展进程显得尤为重要。加入“The Division”，与特工合作，你的任务是恢复秩序、寻找病毒源头，并夺回纽约。<br>
<br>
生存世界：这个世界中的时间和天气都会给你带来不同的游戏体验。利用环境来取得战略优势，从而支配战斗、伏击敌人。使用防毒面具来防御病毒，并且通过升级面具来进入污染程度最高的区域。<br>
<br>
都市丛林：纽约充斥着想要从乱世中牟利的敌对帮派。留意身负行囊在城市中徘徊、掠夺弱者的暴徒。与清除者作战，他们身着防护服、挥舞着火焰喷射器，依靠烧毁所有事物与人类消灭病毒。一群罪犯在混乱爆发之时从雷克岛监狱逃出，想要报复这座城市并控制它，他们称之为“雷克帮”，你要歼灭他们。<br>
<br>
升级并定制特工：运用最先进的科技，广播网和蓝图都能为“全境封锁”提供帮助。制定您的角色、背包以及在深陷危机纽约中的生命线。使用智能手表，与其他特工随时保持联系。搜刮被击败的敌人，订制和升级您的武器、工具以及技能。<br>
<br>
前沿科技：选择升级技能，使队友更强大来增加赢得战斗的几率。转换技能，例如搜寻矿藏来找到敌人、探索能够高度分散注意力的塔楼、抑或是能够观察战略环境的无线电。利用回声技术（一种能冻结时间的数据收集工具）来了解宝贵的即时环境信息，并且找到隐藏的战利品，帮助揭开流行病扩散真相。<br>
                                                                         <br>
无缝多人游玩模式——暗区：进入位于曼哈顿中央的黑暗地带，这里是高墙林立的隔离区，有着在军队撤离时留下最为珍贵的战利品。这里同时也是在游戏中最危险的区域，充满了恐惧、背叛和不安。与其他玩家组队打到敌人，借助直升机发掘传奇战利品。是与其他特工合作、袭击他们或偷盗他们的物品。一切由你自己决定。<br>
<br>
雪莲花引擎：完全由次时代雪莲花引擎提供动力的《汤姆克兰西：全境封锁》，开创了游戏现实主义的一条全新界限和对开放世界的描绘。体验你从未见过，混乱残破的纽约。<br>
<br>
<br>
利用您的视野<br>
您的双眼支持着您的游戏体验。让它们穿越在纽约被破坏的街道去瞄准您的目标，在曼哈顿危机中进行隐蔽。Tobii的眼动追踪技术将给您带来一个令人兴奋的，快节奏的游戏体验。您可以仅仅依靠双眼就能找寻、瞄准敌人并向他们投掷手榴弹，用双眼旋转游戏镜头，开阔您的视野，增强对全局的感知。当您在操作时，通过将界面元素透明化，简洁的用户交互体验将给您带来更强的情境代入感。<br>
兼容全部Tobii眼动追踪游戏设备<br>
----<br>
补充信息: <br>
眼动追踪特性可由Tobii眼动追踪技术实现						',
    'Action',
    ',win,',
    ',
,Open World
,Third-Person Shooter
,Multiplayer
,Action
,Co-op
,Shooter
,RPG
,Post-apocalyptic
,Online Co-Op
,Survival
,Tactical
,Massively Multiplayer
,Third Person
,MMORPG
,Adventure
,Atmospheric
,Singleplayer
,Stealth
,FPS
,Sandbox+,');
INSERT INTO `steam_apps` VALUES('292030',
    '1',
    'The Witcher® 3: Wild Hunt',
    '127',
    'CD PROJEKT RED',
    'CD PROJEKT RED',
    '1431878400000',
    'The Witcher is a story-driven, next-generation open world role-playing game, set in a visually stunning fantasy universe, full of meaningful choices and impactful consequences. In The Witcher, you play as Geralt of Rivia, a monster hunter tasked with finding a child from an ancient prophecy.',
    '<h2>关于这款游戏</h2>The Witcher: Wild Hunt is a story-driven, next-generation open world role-playing game set in a visually stunning fantasy universe full of meaningful choices and impactful consequences. In The Witcher you play as the professional monster hunter, Geralt of Rivia, tasked with finding a child of prophecy in a vast open world rich with merchant cities, viking pirate islands, dangerous mountain passes, and forgotten caverns to explore.<br><br><strong>PLAY AS A HIGHLY TRAINED MONSTER SLAYER FOR HIRE</strong><br>Trained from early childhood and mutated to gain superhuman skills, strength and reflexes, witchers are a distrusted counterbalance to the monster-infested world in which they live.<br><ul class="bb_ul"><li>Gruesomely destroy foes as a professional monster hunter armed with a range of upgradeable weapons, mutating potions and combat magic.<br></li><li>Hunt down a wide range of exotic monsters from savage beasts prowling the mountain passes to cunning supernatural predators lurking in the shadows of densely populated towns.<br></li><li>Invest your rewards to upgrade your weaponry and buy custom armour, or spend them away in horse races, card games, fist fighting, and other pleasures the night brings.</li></ul><br><strong>EXPLORE A MORALLY INDIFFERENT FANTASY OPEN WORLD</strong><br>Built for endless adventure, the massive open world of The&nbsp; Witcher sets new standards in terms of size, depth and complexity.<br><ul class="bb_ul"><li>Traverse a fantastical open world: explore forgotten ruins, caves and shipwrecks, trade with merchants and dwarven smiths in cities, and hunt across the open plains, mountains and seas.<br></li><li>Deal with treasonous generals, devious witches and corrupt royalty to provide dark and dangerous services.<br></li><li>Make choices that go beyond good &amp; evil, and face their far-reaching consequences.</li></ul><br><strong>CHASE DOWN THE CHILD OF PROPHECY</strong><br>Take on the most important contract to track down the child of prophecy, a key to save or destroy this world.<br><ul class="bb_ul"><li>In times of war, chase down the child of prophecy, a living weapon of power, foretold by ancient elven legends.<br></li><li>Struggle against ferocious rulers, spirits of the wilds and even a threat from beyond the veil – all hell-bent on controlling this world.<br></li><li>Define your destiny in a world that may not be worth saving.</li></ul><br><strong>FULLY REALIZED NEXT GENERATION</strong><br><ul class="bb_ul"><li>Built exclusively for next generation hardware, the REDengine&nbsp;3 renders the world of The Witcher visually nuanced and organic, a real true to life fantasy.<br></li><li>Dynamic weather systems and day/night cycles affect how the citizens of the towns and the monsters of the wilds behave.<br></li><li>Rich with storyline choices in both main and subplots, this grand open world is influenced by the player unlike ever before.</li></ul>',
    'RPG',
    ',win,',
    ',
,Open World
,RPG
,Story Rich
,Atmospheric
,Mature
,Fantasy
,Adventure
,Choices Matter
,Singleplayer
,Third Person
,Nudity
,Great Soundtrack
,Action
,Medieval
,Dark Fantasy
,Multiple Endings
,Action RPG
,Magic
,Dark
,Sandbox+,');
INSERT INTO `steam_apps` VALUES('582160',
    '1',
    'Assassin\'s Creed® Origins',
    '248',
    'Ubisoft Montreal',
    'Ubisoft',
    '1509033600000',
    '《ASSASSIN’S CREED® ORIGINS》是嶄新的開始 充滿王權角力與陰謀詭計的古埃及時代，正在權力的殘酷鬥爭下逐漸消失。回到刺客兄弟會的緣起時刻，揭開黑暗秘辛和早已被世人遺忘的神話。',
    '<h2>关于这款游戏</h2>《ASSASSIN’S CREED® ORIGINS》是一次全新的开始<br><br>王权和阴谋统治下的古埃及时代正慢慢消失在争权夺位的冷酷之战中。重返刺客兄弟会起源的最初时刻，揭开不为人知的黑暗秘密和被遗忘的神秘事件。<br><br><strong>等待发现的国度</strong><br>朝着尼罗河下游航行，在探索这片巨大未知国度的过程中，逐步揭开金字塔的神秘面纱，与危险的古代宗教派别和野兽展开殊死一搏。<br><br><strong>每场游历都是全新故事</strong><br>从富有的权贵人士到绝望的被驱逐者，跟着众多色彩鲜明、令人难忘的角色一同参与各项任务，进入扣人心弦的故事情节。<br><br><strong>畅享动作角色扮演体验</strong><br>感受全新的战斗方式。掠夺并使用数十款特色和稀有程度各不相同的武器。精研深度发展的机械，并迎战独特强大的头目，发挥你的战术技能。<br><br><strong>奇迹之瞳</strong><br>在TOBII眼动追踪的帮助下拥有全新的动作体验。视野扩展功能让您更好的感知周围环境，动态光照和阳光效应功能可以根据视线所在提供更为逼真的浸入式体验,使用眼睛标记，瞄准或是锁定目标也显得愈加自然。让您的视线引领前进的道路，提升游戏体验。<br>兼容全部Tobii眼动追踪游戏设备<br>---<br>补充信息: <br>眼动追踪特性可由Tobii眼动追踪技术实现',
    'Action',
    ',win,',
    ',
,Open World
,Assassin
,Action
,Parkour
,Stealth
,Adventure
,RPG
,Third Person
,Historical
,Singleplayer
,Story Rich
,Atmospheric
,Action RPG
,Exploration
,Multiplayer
,Great Soundtrack
,Walking Simulator
,Illuminati
,Sandbox
,Heist+,');


-- ----------------------------
-- Table structure for `steam_apps_type`
-- ----------------------------

CREATE TABLE IF NOT EXISTS `steam_apps_type` (
  `app_type` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varbinary(15) NOT NULL UNIQUE,
  `display_name` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY  (`app_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `steam_apps_type` (`app_type`, `name`, `display_name`) VALUES
(0, 'unknown', 'Unknown'),
(1, 'game', 'Game'),
(2, 'application', 'Application'),
(3, 'demo', 'Demo'),
(4, 'dlc', 'DLC'),
(5, 'tool', 'Tool'),
(6, 'depotonly', 'Depot (not used)'),
(7, 'guide', 'Guide'),
(8, 'media', 'Legacy Media'),
(9, 'config', 'Config'),
(10, 'driver', 'Driver'),
(13, 'video', 'Video'),
(14, 'plugin', 'Plugin'),
(15, 'music', 'Music'),
(16, 'hardware', 'Hardware'),
(17, 'series', 'Series');


-- ----------------------------
-- Table structure for `steam_apps_pic`
-- ----------------------------
DROP TABLE IF EXISTS `steam_apps_pic`;
CREATE TABLE `steam_apps_pic` (
  `pid` int(11) NOT NULL auto_increment,
  `app_id` int(11) default NULL,
  `sm` varchar(128) default NULL,
  `md` varchar(128) default NULL,
  `lg` varchar(128) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `steam_user`
-- ----------------------------
DROP TABLE IF EXISTS `steam_user`;
CREATE TABLE `steam_user` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(32) default NULL,
  `upwd` varchar(32) default NULL,
  `email` varchar(64) default NULL,
  `phone` varchar(16) default NULL,
  `avatar` varchar(128) default NULL,
  `user_name` varchar(32) default NULL,
  `gender` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of steam_user
-- ----------------------------
INSERT INTO `steam_user` VALUES ('1', 'dingding', md5('123456'), 'ding@qq.com', '13511011000', 'img/avatar/default.png', '丁春秋', '0');
INSERT INTO `steam_user` VALUES ('2', 'dangdang', md5('123456'), 'dang@qq.com', '13501234568', 'img/avatar/default.png', '当当喵', '1');
INSERT INTO `steam_user` VALUES ('3', 'doudou', md5('123456'), 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1');
INSERT INTO `steam_user` VALUES ('4', 'yaya', md5('123456'), 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

-- ----------------------------
-- Table structure for `steam_shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `steam_shoppingcart`;
CREATE TABLE `steam_shoppingcart` (
  `iid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `app_id` int(11) default NULL,
  `count` int(11) default NULL,
  `is_checked` tinyint(1) default NULL,
  PRIMARY KEY  (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of steam_shoppingcart
-- ----------------------------
INSERT INTO `steam_shoppingcart` VALUES ('1', '10', '17', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('2', '11', '11', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('3', '12', '1', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('4', '13', '3', '9', '0');
INSERT INTO `steam_shoppingcart` VALUES ('5', '14', '1', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('13', '20', '1', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('14', '22', '17', '11', '1');
INSERT INTO `steam_shoppingcart` VALUES ('15', '20', '28', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('16', '25', '2', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('17', '3', '28', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('18', '3', '14', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('19', '28', '1', '99997', '0');
INSERT INTO `steam_shoppingcart` VALUES ('20', '29', '31', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('25', '3', '18', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('26', '32', '13', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('27', '32', '5', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('28', '32', '19', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('29', '33', '1', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('31', '3', '1', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('32', '35', '20', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('33', '2', '19', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('34', '39', '19', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('35', '1', '5', '15', '1');
INSERT INTO `steam_shoppingcart` VALUES ('36', '1', '28', '2', '1');
INSERT INTO `steam_shoppingcart` VALUES ('37', '1', '9', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('38', '45', '22', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('39', '46', '1', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('40', '48', '28', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('41', '1', '1', '6', '1');
INSERT INTO `steam_shoppingcart` VALUES ('42', '50', '28', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('43', '52', '28', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('44', '51', '5', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('45', '54', '1', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('46', '56', '28', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('47', '59', '5', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('48', '59', '9', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('49', '59', '19', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('50', '31', '1', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('51', '59', '1', '2', '0');
INSERT INTO `steam_shoppingcart` VALUES ('52', '60', '28', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('53', '46', '21', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('54', '1', '12', '2', '1');
INSERT INTO `steam_shoppingcart` VALUES ('55', '61', '5', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('56', '61', '6', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES ('57', '70', '1', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('58', '71', '1', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('59', '1', '4', '3', '1');
INSERT INTO `steam_shoppingcart` VALUES ('60', '36', '17', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('61', '35', '17', '7', '0');
INSERT INTO `steam_shoppingcart` VALUES ('62', '35', '5', '13', '0');
INSERT INTO `steam_shoppingcart` VALUES ('63', '72', '9', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('64', '82', '1', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('65', '83', '17', '1', '1');
INSERT INTO `steam_shoppingcart` VALUES ('66', '35', '28', '4', '0');
INSERT INTO `steam_shoppingcart` VALUES ('67', '65', '40', '2', '0');
