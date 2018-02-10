SET NAMES UTF8;
DROP DATABASE IF EXISTS steam;
CREATE DATABASE steam CHARSET = UTF8;
USE steam;

-- ----------------------------
-- Tbale of steam_apps
-- ----------------------------
CREATE TABLE IF NOT EXISTS `steam_apps` (
  `appid` int(7) unsigned NOT NULL auto_increment,
  `app_type` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `name` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'Unknown App',
  `price` decimal(10,2) NOT NULL,
  `developer` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `publisher` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `release_date` bigint(20) NOT NULL,
  `desc` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `desc_full` TEXT CHARACTER SET utf8mb4,
  `genres` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `supported_systems` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `tag_list` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  PRIMARY KEY  (`appid`)
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
    '<h2>关于这款游戏</h2><img src="img/app/524220/524220_Nier_PRE_Launch-ENG_UK_Multi_06_Mod.gif"><br>NieR: Automata tells the story of androids 2B, 9S and A2 and their battle to reclaim the machine-driven dystopia overrun by powerful machines.<br><br>Humanity has been driven from the Earth by mechanical beings from another world. In a final effort to take back the planet, the human resistance sends a force of android soldiers to destroy the invaders. Now, a war between machines and androids rages on... A war that could soon unveil a long-forgotten truth of the world.<br><br>Key Features:<br><ul class="bb_ul"><li><strong>Action-Packed Battles</strong> – Players will switch between using melee and ranged attacks in battle against hordes of enemies and challenging bosses across a variety of open field maps. The tight controls and incredibly fluid combat are simple to learn for newcomers while offering plenty of depth for more experienced action gamers. Players can perform high-speed battle actions—combining light and heavy attacks—and switch through an arsenal of weaponry while evading enemies with speed and style. <br></li><li><strong>Beautifully Desolate Open-World</strong> – The game seamlessly joins together hauntingly beautiful vistas and locations with no area loading. The environments are rendered in 60fps and contain a wealth of sub-events in addition to the main storyline. <br></li><li><strong>Masterfully Crafted Story and Characters</strong> – NieR: Automata tells the story of androids 2B, 9S and A2 and their ferocious battle to reclaim a machine-driven dystopia overrun by powerful weapons known as machine lifeforms.<br></li><li><strong>Elements of an RPG</strong> – Players will obtain a variety of weapon types, level up in battle, learn new combat skills, and customise a loadout that caters to their playstyle.<br></li><li><strong>Utilise the Pod Support System to Assist In and Outside of Battle</strong> – Pods can attack the enemy in both manual and lock-on modes. They can also assist outside of battle, such as allowing the player to glide through the air. Pods can be enhanced throughout the game, with upgrades including new attack methods and variations.<br></li><li><strong>“Auto Mode” Available for Beginners </strong>– Novice players can elect “Auto Mode” for easy attacks and evasions.</li></ul>',
    'Action',
    'win',
    'Great Soundtrack,Story Rich,Action,Hack and Slash,RPG,Female Protagonist,Open World,Post-apocalyptic,Anime,JRPG,Singleplayer,Robots,Atmospheric,Sci-fi,Bullet Hell,Spectacle fighter,Character Action Game,Adventure,Nudity,Violent+');
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
    'win,mac',
    'Difficult,Psychological Horror,Physics,Singleplayer,Memes,Funny,Horror,Action,Indie,Platformer,Casual,Nudity,Parkour,Adventure,Survival Horror,Atmospheric,Illuminati,Walking Simulator,Story Rich,Strategy+');
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
    'Action','win','Early Access,Survival,Shooter,Multiplayer,Open World,PvP,Massively Multiplayer,FPS,Action,Third-Person Shooter,Tactical,Online Co-Op,Co-op,Walking Simulator,Violent,First-Person,Strategy,Memes,Adventure,Casual+,');
INSERT INTO `steam_apps` VALUES('365590',
    '1',
    'Tom Clancy\’s The Division™',
    '208',
    'Massive Entertainment',
    'Ubisoft',
    '1457366400000',
    '我们生于一个复杂的世界，她越先进，就会变得越易受攻击。我们创造了一个纸牌之屋：只需拿走一张纸牌，便全盘坍塌。在黑色星期五——一种毁坏性的流行病席卷了整个纽约，基础设施接二连三地慢慢瘫痪。在短短几天内，失去生活必需品的整个社会陷入了混乱。',
    '<h2>关于这款游戏</h2>我们生于一个复杂的世界，她越先进，就会变得越易受攻击。我们创造了一个纸牌之屋：只需拿走一张纸牌，便全盘坍塌。在黑色星期五——一种毁坏性的流行病席卷了整个纽约，基础设施接二连三地慢慢瘫痪。在短短几天内，失去生活必需品的整个社会陷入了混乱。The Division，一个由战术特工组成的团体被唤醒了。这些特工以普通人的身份藏身于人群中，他们受过专门训练，以在危机中拯救社会。<br>
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
眼动追踪特性可由Tobii眼动追踪技术实现',
    'Action',
    'win',
    'Open World,Third-Person Shooter,Multiplayer,Action,Co-op,Shooter,RPG,Post-apocalyptic,Online Co-Op,Survival,Tactical,Massively Multiplayer,Third Person,MMORPG,Adventure,Atmospheric,Singleplayer,Stealth,FPS,Sandbox+');
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
    'win',
    'Open World,RPG,Story Rich,Atmospheric,Mature,Fantasy,Adventure,Choices Matter,Singleplayer,Third Person,Nudity,Great Soundtrack,Action,Medieval,Dark Fantasy,Multiple Endings,Action RPG,Magic,Dark,Sandbox+');
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
    'win',
    'Open World,Assassin,Action,Parkour,Stealth,Adventure,RPG,Third Person,Historical,Singleplayer,Story Rich,Atmospheric,Action RPG,Exploration,Multiplayer,Great Soundtrack,Walking Simulator,Illuminati,Sandbox,Heist+');
INSERT INTO `steam_apps` VALUES('306130',
    '1',
    'The Elder Scrolls® Online: Tamriel Unlimited™',
    '79',
    'Zenimax Online Studios',
    'Bethesda Softworks',
    '1396540800000',
    'The Elder Scrolls® Online: Tamriel Unlimited™, the latest chapter of the award-winning series, brings the legendary experience online for the first time. Explore the vast world with friends or embark upon the adventure alone - the choices you will make will shape your destiny. No game subscription required.',
    '<h2>关于这款游戏</h2>The award-winning fantasy role-playing series, The Elder Scrolls goes online – no game subscription required. Experience this multiplayer role-playing game on your own or together with your friends, guild mates, and thousands of alliance members.  Explore dangerous caves and dungeons in Skyrim, or craft quality goods to sell in the city of Daggerfall.  Embark upon adventurous quests across Tamriel and engage in massive player versus player battles, or spend your days at the nearest fishing hole or reading one of many books of lore.  The choices are yours in the persistent world of The Elder Scrolls Online: Tamriel Unlimited.<h2 class="bb_tag"> Key Features:</h2><ul class="bb_ul"><li><strong>NO SUBSCRIPTION REQUIRED</strong><br>Purchase the game and enjoy your adventures without a monthly fee.<br><br></li><li><strong>THE FIGHT FOR TAMRIEL BEGINS!</strong><br>Three alliances vie for control of the Empire. As these powers battle for supremacy, darker forces move to destroy the world.<br><br></li><li><strong>PLAY THE WAY YOU LIKE </strong><br>Battle, craft, fish, steal, siege, or explore. The choice is yours to make in a persistent Elder Scrolls world.<br><br></li><li><strong>A MULTIPLAYER RPG </strong><br>Adventure alone, quest with friends, or join an army of thousands in epic PVP battles.<br><br></li><li><strong>TELL YOUR OWN STORY </strong><br>Discover the secrets of Tamriel as you quest to regain your lost soul and save the world from Oblivion.</li></ul>',
    'Massively Multiplayer',
    'win,mac',
    'RPG,Open World,MMORPG,Massively Multiplayer,Fantasy,Multiplayer,Adventure,First-Person,Third Person,Exploration,Action,Great Soundtrack,Atmospheric,Story Rich,Magic,Co-op,Action RPG,Sandbox,Singleplayer,Female Protagonist+,');
INSERT INTO `steam_apps` VALUES('582880',
    '1',
    'The Elder Scrolls Online - Morrowind',
    '129',
    'Zenimax Online Studios',
    'Bethesda Softworks',
    '1495900800000',
    'Adventure awaits in this new chapter of the award-winning online series. Morrowind is on the verge of destruction, and it’s up to you to save it from a deadly Daedric threat. Embark on a dangerous journey through legendary locales.',
    '<h2>关于这款游戏</h2>Adventure awaits in this new chapter of the award-winning online series. Morrowind is on the verge of destruction, and it’s up to you to save it from a deadly Daedric threat. Embark on a dangerous journey through legendary locales, from volcanic ashlands to mushroom-filled forests.<br><br><ul class="bb_ul"><li>SAVE MORROWIND - Stop a meteor from crashing into Vivec City by helping a demi-god regain his lost powers.<br></li><li>BECOME THE WARDEN – Harness the nature-based magic of an all-new class with a War Bear battle companion at your side. <br></li><li>PARTNER WITH AN ASSASSIN – Aid a legendary elite member of the Morag Tong who will guide you through deadly political intrigue.<br></li><li>FIGHT TOGETHER IN PVP BATTLEGROUNDS – Take the battle to the Ashlands with new 4v4v4 player vs. player combat set in competitive arena-style environments.</li></ul>',
    'Massively Multiplayer',
    'win,mac',
    'Massively Multiplayer,RPG,MMORPG,Fantasy,Open World,Adventure,Multiplayer,Medieval,Great Soundtrack,Action,First-Person,Singleplayer,Online Co-Op,Free to Play+,');
INSERT INTO `steam_apps` VALUES('346110',
    '1',
    'ARK: Survival Evolved',
    '196',
    'Studio Wildcard',
    'Studio Wildcard',
    '1504022400000',
    '由虚幻4引擎打造的一款多人在线生存竞技网游，在一个超高自由度的开放世界里，可以体验采集、制造、打猎、收获、建造、研究以及驯服恐龙等超多自由内容，感受酷热白昼、冰冷夜晚的动态天气系统以及饥饿口渴等现实中的生存挑战，还要面对其它生存者的威胁，合作生存还是竞技厮杀，由你决定！',
    '<h2>关于这款游戏</h2>Adventure awaits in this new chapter of the award-winning online series. Morrowind is on the verge of destruction, and it’s up to you to save it from a deadly Daedric threat. Embark on a dangerous journey through legendary locales, from volcanic ashlands to mushroom-filled forests.<br><br><ul class="bb_ul"><li>SAVE MORROWIND - Stop a meteor from crashing into Vivec City by helping a demi-god regain his lost powers.<br></li><li>BECOME THE WARDEN – Harness the nature-based magic of an all-new class with a War Bear battle companion at your side. <br></li><li>PARTNER WITH AN ASSASSIN – Aid a legendary elite member of the Morag Tong who will guide you through deadly political intrigue.<br></li><li>FIGHT TOGETHER IN PVP BATTLEGROUNDS – Take the battle to the Ashlands with new 4v4v4 player vs. player combat set in competitive arena-style environments.</li></ul>',
    'Action',
    'win,mac,linux',
    'Survival,Dinosaurs,Open World,Multiplayer,Crafting,Building,Adventure,Base Building,Co-op,Action,First-Person,Sandbox,Massively Multiplayer,Singleplayer,Dragons,RPG,Sci-fi,MMORPG,Indie,Free to Play+,');
INSERT INTO `steam_apps` VALUES('666140',
    '1',
    'My Time At Portia',
    '68',
    'Pathea Games',
    'Team17 Digital Ltd',
    '1516723200000',
    '《波西亚时光》是一个开放世界模拟经营RPG游戏。末世后，文明开始逐渐复苏，玩家在边远地区的小镇上继承了一间旧工坊，故事从那里开始……',
    '<h2>关于这款游戏</h2>欢迎来到波西亚，开启一段美妙的冒险旅程！在这里你将继承父亲的工坊，体验种植，养殖的乐趣，还可以和城镇的居民成为朋友，并探索神秘的，被遗忘的后末日世界。<br><br>有了父亲留下的工坊手册的帮助，你可以在工具台上合成制作很多东西，当然前提是你得去搜索制作所需的物资，采集矿石。但可别小瞧了这些任务，因为获取方式都不简单。<br><br>为了丰富游戏世界，波西亚小镇里的居民们都拥有各自的性格特点，和独特的行为。他们会去上学，工作，锻炼，在工作之余还会有各自的娱乐生活。在这里，每个居民还有属于自己的故事等待你来发现。你还能够与镇上的居民们培养感情，可以是友情，也可以是爱情，到最后还能与居民结婚。<br><br>快来波西亚小镇体验一个不一样的生活，并留下一段美好的温馨的回忆吧。<h2 class="bb_tag"><strong>游戏特点:</strong></h2><br><strong>经营工坊:</strong> 在这里你的目标是将继承自父亲的工坊打造成波西亚最好的工坊！你可以通过接受订单和任务来收集资源并且升级工坊，在波西亚中闯出自己的一片天地。<br><br><img src="img/app/666140/Chopping_Trees.gif"><br><br><strong>经营农场:</strong>作为波西亚的工坊主，你还将拥有自己的农田，利用革新的农作工具，例如培养槽和半自动浇灌系统来培育农作物，同时开展自己的畜牧业。当看到原本贫瘠的土地最终变成精致农场的时候，你一定会很有成就感！<br><br><img src="img/app/666140/Running_with_a_Duck.gif"><br><br><strong>发挥创意:</strong>想要把你的家打扮得美观大方的？当然可以！你可以通过工具台制作出你喜欢的家具来装饰你的家。来尽情发挥你的创意和想象力吧。<br><br><img src="img/app/666140/Workshop.gif"><br><br><strong>发挥创意: </strong>想要把你的家打扮得美观大方的？当然可以！你可以通过工具台制作出你喜欢的家具来装饰你的家。来尽情发挥你的创意和想象力吧。<br><br><img src="img/app/666140/Community.gif"><br><br><strong>融入波西亚: </strong>来融入波西亚小镇，成为波西亚小镇的一员吧！波西亚小镇里居住着形形色色的居民，每个居民都有不一样的生活轨迹和属于自己的故事等待你的发现。来向他们打声招呼吧，或许你能获得友谊或是收获爱情呢。<br><br><img src="img/app/666140/Digging.gif"><br><br><strong>探险与战斗:</strong> 就像其他RPG游戏一样，你可以提升属性，升级人物，让你有更多的时间波西亚探险之旅<br><br><img src="img/app/666140/Fighting_New.gif"><br><br><strong>其他:</strong> 在波西亚世界里，你可以拥有一段丰富有趣的经历。那么如何来分配你的时间呢？你可以选择利用各种食材来烹饪，选择和村民玩石头剪刀布，选择与你的小伙伴们来场力量与操作的较量。又或者沉迷于游戏中的特色小游戏，骑动物，享受游戏中节日的氛围。亦或者你只是想安安静静的一个人享受钓鱼的美好时光；你的波西亚之旅，当然你来做主！<br>请享受《波西亚时光》为您准备的这段值得回忆的时光吧！<br><br><img src="img/app/666140/My_Time_at_Portia_Arrival_New.gif?">',
    'RPG',
    'win',
    'Simulation,Casual,RPG,Open World,Crafting,Sandbox,Singleplayer+,');
INSERT INTO `steam_apps` VALUES('477160',
    '1',
    'Human: Fall Flat',
    '48',
    'No Brakes Games',
    'Curve Digital',
    '1469203200000',
    '人类一败涂地是一款与众不同的基于物理特性的开放结局解谜探索游戏。游戏发生于若干飘浮在云中的幻境中。你的目标就是用你仅有的智慧和物理原理解开谜题，从这些荒诞梦境中逃出来。',
    '<h2>关于这款游戏</h2>"Bob是个平凡的人类。他没有什么超能力，但要是给他合适的工具，他还是能做不少事儿的。要是他没有合适的工具……他就能干出更多糗事儿！<br>
<br>
人类一败涂地的世界拥有先进的物理引擎和创新的操作，能够为您带来多种挑战。Bob的坠落之梦中夹杂了许多需要解决的谜题和让你忘记本来目的的小玩意儿，贸然尝试它们可能会闹出不少笑料。这些世界可能看上去很奇幻，但物理法则可是很真实的。<br>
<br>
你会想打开那扇神秘之门吗？还是说你只想看看你能把一套音响扔多远？<br>
<br>
特点<br>
<br>
对角色进行直接的完全控制。没有什么是脚本编好的，也没有什么会限制你进行尝试。<br>
<br>
可以充分互动的环境，你可以把任何想拿的东西拿起来，爬到任何想去的地方，或者带着任何想要的东西走。<br>
<br>
局域网联机模式让你可以与一位朋友一起磕磕绊绊地探索诸多梦境。<br>
<br>
给你的Bob涂上自己的特色，或者通过在线视频把你自己的脸替换成他的。<br>
<br>
8个美丽的梦境世界正等着你来探索其中的奥秘。"',
    'Indie',
    'win,mac,linux',
    'Funny,Physics,Indie,Multiplayer,Puzzle,Puzzle-Platformer,Local Co-Op,Adventure,Co-op,Sandbox,Local Multiplayer,Open World,Singleplayer,Split Screen,Parkour,3D Platformer,Casual,Comedy,Survival,Simulation+,');
INSERT INTO `steam_apps` VALUES('368360',
    '1',
    '60 Seconds!',
    '36',
    'Robot Gentleman',
    'Robot Gentleman',
    '1432569600000',
    '60 Seconds！是一款具有黑色喜剧风格的生存冒险游戏。在核灾难前，你需要尽可能收集生存物资，营救家人。躲进避难所求生。做困难的决定，分配食物，捕捉突变蟑螂。也许你会生存下去，也许不会。',
    '<h2>关于这款游戏</h2>
	Ted 是一个有责任心的公民和顾家的男人，但他快乐无忧的郊区生活受到了影响。核灾难！你只剩下 60 秒影响并指导 Ted 到他家里争分夺秒快速冲刺，寻找家人和有用的物资。一切都会成为你的阻碍——时间、家具，你每次去都会不一样的房子和最基础问题——你需要拿什么，把谁留下？活着及时进入放射性尘埃避难所只是刚刚开始。无论你拿了什么或救了谁都会对你的生存发挥至关重要的作用。每个生存故事都会有所不同，每天都会发生意想不到的事情令你惊叹。所有这些故事都会有美好的结局吗？这就要看你了。分配食物和水，充分利用物资，面对困难的选择，甚至冒险进入荒地。祝你好运。在发生于二十世纪五十年代与原子弹有关的黑色喜剧里，你的街道被原子弹炸了，体验一次郊区噩梦。在程序生成的房子里，你需要在 60 秒之内拿任何对你生存有帮助的物资，救你的家人。做好最坏的打算。不要胡乱抓取东西，做好生存计划，并注意利用紧急广播里有用的提示！在放射性尘埃避难所里利用一切可以利用的东西来生存。你可以坚持多少天？每个人都会活下来吗？当核灾难把你逼到角落时，你要决定接下来做什么。你会冒险出去吗？当几乎没有食物剩下时，谁会选择不进食？你会如何处理突变蟑螂的侵袭？',
    'Adventure',
    'win,mac',
    'Survival,Post-apocalyptic,Singleplayer,Strategy,Simulation,Dark Humor,Adventure,Indie,Funny,Comedy,Casual,Point & Click,Action,Choices Matter,Difficult,Dark Comedy,War,Atmospheric,Rogue-like,Horror+,');
INSERT INTO `steam_apps` VALUES('105600',
    '1',
    'Terraria',
    '36',
    'Re-Logic',
    'Re-Logic',
    '1305388800000',
    '挖掘，战斗，探索，建造！在这个动感十足的冒险游戏里没有什么是不可能的。',
    '<h2>关于这款游戏</h2>挖掘，战斗，探索，建造！在这个动感十足的冒险游戏里没有什么是不可能的。世界是你的画布，地面是你的油漆。 <br>拿起你的工具出发！制造武器和各种各样的敌人作战。前往地下寻找配件，金钱，以及其他有用的东西。收集资源创造你的世界所需要的一切。建造一栋房子，一个堡垒，甚至是一座城堡。人们会搬到那里居住，而或许他们还会卖给你不同的商品来协助你完成旅程。<br>但要注意，那有很多挑战在等着你……你能完成任务吗？<br><strong>主要特点：</strong><br><ul class="bb_ul"><li>沙盒游戏<br></li><li> 随机生成的世界<br></li><li>免费的内容更新</li></ul>',
    'Indie',
    'win,mac,linux',
    'Adventure,Action,Indie,RPG,Sandbox,Music,2D,Survival,Multiplayer,Great Soundtrack+,');
INSERT INTO `steam_apps` VALUES('518030',
    '1',
    'Aim Hero',
    '21',
    'ProGames Studio',
    'ProGames Studio',
    '1473004800000',
    'Aim Hero is an ultimate solution for practicing firing accuracy to do better in FPS games.',
    '<h2>关于这款游戏</h2>Aim Hero is an ultimate solution for practicing firing accuracy to do better in FPS games.<h2 class="bb_tag">Features:</h2><ul class="bb_ul"><li>Mouse sensitivity settings imported from popular games;<br></li><li>More than 5 training modes, 3 difficulty levels each (We are going to add 5 modes in few weeks);<br></li><li>Detailed statistics is provided as each training is completed;<br></li><li>The best scores are saved automatically;</li></ul><h2 class="bb_tag">Games you may use to set your mouse sensitivity:</h2><ul class="bb_ul"><li>Counter-Strike: Global Offensive;<br></li><li>Overwatch.</li></ul><br>We are going to add more games on the list.',
    'Action',
    'win',
    'Early Access,Action,FPS,e-sports,Shooter,Singleplayer,Fast-Paced,Competitive,Score Attack,Difficult+,');
INSERT INTO `steam_apps` VALUES('4000',
    '1',
    'Garry\'s Mod',
    '36',
    'Facepunch Studios',
    'Valve',
    '1164729600000',
    'Garry\'s Mod is a physics sandbox. There arent any predefined aims or goals. We give you the tools and leave you to play.',
    '<h2>关于这款游戏</h2>Garry\'s Mod 是一个物理实验场。 与普通游戏不同，这款游戏并没有预定的目标或目的。 我们给您工具，您决定游戏内容。<br>您可以调出各种对象互相组合，创造新的道具，不论汽车、火箭、投石车还是连名字都没有的机器，一切都由您决定。<br>如果您对设计工程并不在行，也别担心！ 您还能把许多不同角色放在好笑的地方。',
    'Indie',
    'win,mac,linux',
    'Adventure,Action,Indie,RPG,Sandbox,Music,');
INSERT INTO `steam_apps` VALUES('569480',
    '1',
    'Kingdoms and Castles',
    '36',
    'Facepunch Studios',
    'Valve',
    '1164729600000',
    '王国与城堡是一个关于王国发展的游戏。从一个小村庄慢慢发展成大城市甚至是宏伟的城堡。',
    '<h2>关于这款游戏</h2>王国与城堡是一个关于王国发展的游戏。从一个小村庄慢慢发展成大城市甚至是宏伟的城堡。<br><br>你的王国必须在一个充满生机和危险的世界里生存。 是海盗入侵者抢走了你的市民？ 还是被挡在充满弓箭的城门外? 是龙摧毁了你的粮仓，你的人民在冬天里饿死，还是你有能力把怪兽打回去？你的王国会否成功完全根据你的城市管理或者城堡设计。<h3 class="bb_tag">城市设计</h3>战略性的布置你的城镇来提高你的农民的幸福感并吸引新居民。向他们征税来建造你的城堡。确保你的农民在冬天温饱和治好瘟疫。建造教堂让他们远离绝望，而酒馆可以让他们快乐。如果你建造了城市广场还能举办节庆活动！派遣伐木工去采集木头，建造采石场来修筑你的城堡，高效利用土地耕作，让你的城镇迅速发展。<br><br><h3 class="bb_tag">巩固和防御</h3>你安家的这片新大陆充满着海盗的入侵。这些入侵者绑架并杀死你的农民，偷窃你的资源，还摧毁你的家园。使用到处可建的城墙来建筑一套强大的城堡系统。 动态的安排建造防御塔和城墙。位于高处的箭塔和其他武器炮台具有更远的射程。尝试不同的布局来保护你的王国并向世界宣布你是一位国王或女王。<br><br><h3 class="bb_tag">生动的世界</h3>这一切都发生在一个充满活力，拥有程式化的云层系统和四季交替的世界里。 真实算法的树木生长，模拟森林形成的过程。根据你的需要，伐木工可以砍光或者照看你的森林。<br><br>王国与城堡是Fig网站上第一个众筹并发布的游戏。众筹以725%的目标资金结束并拥有1,400个支持者。游戏的支持者均在Fig网站项目上承诺并出资了。',
    'Simulation',
    'win,mac,linux',
    'City Builder,Strategy,Simulation,Medieval,Building,Indie,Singleplayer,Sandbox,Action,Casual,Resource Management,Voxel,Survival,Multiplayer,Base Building,Pixel Graphics,RTS,Management,Colorful,Great Soundtrack+,');
INSERT INTO `steam_apps` VALUES('322330',
    '1',
    'Don\'t Starve Together',
    '24',
    'Klei Entertainment',
    'Klei Entertainment',
    '1164729600000',
    '《饥荒联机版》是原生态生存游戏《饥荒》的多人联机独立资料片。',
    '<h2>关于这款游戏</h2>《饥荒联机版》是原生态荒野生存游戏《饥荒》的多人联机独立资料片。现在，它包含资料片《A New Reign: Part 1》，即一系列更新的第一弹。《A New Reign》（新王朝）专为多人联机游戏而打造，能带领玩家探索查理统治之下的《饥荒》游戏世界。<br>
<br>
此外，《饥荒联机版》还包含资料片《巨人国》，为游戏添加了新的角色、季节、生物、生物群落以及各种巨型敌人所带来的新挑战。<br>
<br>
进入一个光怪陆离而未经探索的世界，这里充满了奇怪的生物以及形形色色的危险和意外。收集资源以制作符合你的生存风格的物品和建筑。一路解开这块奇怪大陆上的各种谜团。<br>
<br>
你可以在非公开游戏中与好友并肩作战，或者与陌生玩家在线组队去探险。携手其他玩家克服恶劣的环境，或者自力更生，求得生存。<br>
<br>
你必须懂得随机应变，且谨记一点：千万别饿死。',
    'Indie',
    'win,mac,linux',
    'Survival,Multiplayer,Co-op,Open World,Adventure,Crafting,Sandbox,Indie,Difficult,Online Co-Op,2D,Survival Horror,Atmospheric,Strategy,Simulation,Funny,Action,Singleplayer,Horror,Rogue-like+,');

-- fake app data start

-- fake app data end



-- ----------------------------
-- Table structure for `steam_apps_type`
-- ----------------------------

CREATE TABLE IF NOT EXISTS `steam_apps_type` (
  `app_type` tinyint(2) unsigned NOT NULL,
  `name` varchar(15) NOT NULL DEFAULT '',
  `display_name` varchar(30) COLLATE utf8_bin NOT NULL
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
  `appid` int(11) default NULL,
  `sm` varchar(128) default NULL,
  `md` varchar(128) default NULL,
  `lg` varchar(128) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_Purchase_Offer_615x405.png', null, null);
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_8ac1dc847388e59b1be1c5ea5ca592d5861756cc.116x65.jpg', 'img/app/292030/292030_ss_8ac1dc847388e59b1be1c5ea5ca592d5861756cc.600x338.jpg', 'img/app//292030/292030_ss_8ac1dc847388e59b1be1c5ea5ca592d5861756cc.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_64eb760f9a2b67f6731a71cce3a8fb684b9af267.116x65.jpg', 'img/app/292030/292030_ss_64eb760f9a2b67f6731a71cce3a8fb684b9af267.600x338.jpg', 'img/app//292030/292030_ss_64eb760f9a2b67f6731a71cce3a8fb684b9af267.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_90a33d7764a2d23306091bfcb52265c3506b4fdb.116x65.jpg', 'img/app/292030/292030_ss_90a33d7764a2d23306091bfcb52265c3506b4fdb.600x338.jpg', 'img/app//292030/292030_ss_90a33d7764a2d23306091bfcb52265c3506b4fdb.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_608af6cfe0eab3f37265550b391732a3e88d1a4f.116x65.jpg', 'img/app/292030/292030_ss_608af6cfe0eab3f37265550b391732a3e88d1a4f.600x338.jpg', 'img/app//292030/292030_ss_608af6cfe0eab3f37265550b391732a3e88d1a4f.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_849ec8dcc6f8df1c0b2c509584c9fc9e51f88cfa.116x65.jpg', 'img/app/292030/292030_ss_849ec8dcc6f8df1c0b2c509584c9fc9e51f88cfa.600x338.jpg', 'img/app//292030/292030_ss_849ec8dcc6f8df1c0b2c509584c9fc9e51f88cfa.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_07812c174bb6b96c29895ddc27404143df7aba6d.116x65.jpg', 'img/app/292030/292030_ss_07812c174bb6b96c29895ddc27404143df7aba6d.600x338.jpg', 'img/app//292030/292030_ss_07812c174bb6b96c29895ddc27404143df7aba6d.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_107600c1337accc09104f7a8aa7f275f23cad096.116x65.jpg', 'img/app/292030/292030_ss_107600c1337accc09104f7a8aa7f275f23cad096.600x338.jpg', 'img/app//292030/292030_ss_107600c1337accc09104f7a8aa7f275f23cad096.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.116x65.jpg', 'img/app/292030/292030_ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.600x338.jpg', 'img/app//292030/292030_ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_b74d60ee215337d765e4d20c8ca6710ae2362cc2.116x65.jpg', 'img/app/292030/292030_ss_b74d60ee215337d765e4d20c8ca6710ae2362cc2.600x338.jpg', 'img/app//292030/292030_ss_b74d60ee215337d765e4d20c8ca6710ae2362cc2.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_dc33eb233555c13fce939ccaac667bc54e3c4a27.116x65.jpg', 'img/app/292030/292030_ss_dc33eb233555c13fce939ccaac667bc54e3c4a27.600x338.jpg', 'img/app//292030/292030_ss_dc33eb233555c13fce939ccaac667bc54e3c4a27.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_dc55eeb409d6e187456a8e159018e8da098fa468.116x65.jpg', 'img/app/292030/292030_ss_dc55eeb409d6e187456a8e159018e8da098fa468.600x338.jpg', 'img/app//292030/292030_ss_dc55eeb409d6e187456a8e159018e8da098fa468.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.116x65.jpg', 'img/app/292030/292030_ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.600x338.jpg', 'img/app//292030/292030_ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 292030, 'img/app/292030/292030_ss_eda99e7f705a113d04ab2a7a36068f3e7b343d17.116x65.jpg', 'img/app/292030/292030_ss_eda99e7f705a113d04ab2a7a36068f3e7b343d17.600x338.jpg', 'img/app//292030/292030_ss_eda99e7f705a113d04ab2a7a36068f3e7b343d17.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_capsule_616x353.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_2f4b0627598f09090dcb17f32fbe2cf29b4e0222.116x65.jpg', 'img/app/578080/578080_ss_2f4b0627598f09090dcb17f32fbe2cf29b4e0222.600x338.jpg', 'img/app/578080/578080_ss_2f4b0627598f09090dcb17f32fbe2cf29b4e0222.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_4b9f1a2334180a2e70576aa1defe97b3072afefe.116x65.jpg', 'img/app/578080/578080_ss_4b9f1a2334180a2e70576aa1defe97b3072afefe.600x338.jpg', 'img/app/578080/578080_ss_4b9f1a2334180a2e70576aa1defe97b3072afefe.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_4f97f2957cc4808652fe8993a4fa85e89114427d.116x65.jpg', 'img/app/578080/578080_ss_4f97f2957cc4808652fe8993a4fa85e89114427d.600x338.jpg', 'img/app/578080/578080_ss_4f97f2957cc4808652fe8993a4fa85e89114427d.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_15f25d045c3be1f158520a2b32aba5f1b6fbb836.116x65.jpg', 'img/app/578080/578080_ss_15f25d045c3be1f158520a2b32aba5f1b6fbb836.600x338.jpg', 'img/app/578080/578080_ss_15f25d045c3be1f158520a2b32aba5f1b6fbb836.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_45b0f3bca3714b087f1627cf72bc448b5bf91adf.116x65.jpg', 'img/app/578080/578080_ss_45b0f3bca3714b087f1627cf72bc448b5bf91adf.600x338.jpg', 'img/app/578080/578080_ss_45b0f3bca3714b087f1627cf72bc448b5bf91adf.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_47c8740e26273a8f89a7c515205824fcac0b6846.116x65.jpg', 'img/app/578080/578080_ss_47c8740e26273a8f89a7c515205824fcac0b6846.600x338.jpg', 'img/app/578080/578080_ss_47c8740e26273a8f89a7c515205824fcac0b6846.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_3477d04431bbcef047c1025510bb6ad794acb2d2.116x65.jpg', 'img/app/578080/578080_ss_3477d04431bbcef047c1025510bb6ad794acb2d2.600x338.jpg', 'img/app/578080/578080_ss_3477d04431bbcef047c1025510bb6ad794acb2d2.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_be97f52c3a557ce31ad5acd0d90dd097caa0ffe6.116x65.jpg', 'img/app/578080/578080_ss_be97f52c3a557ce31ad5acd0d90dd097caa0ffe6.600x338.jpg', 'img/app/578080/578080_ss_be97f52c3a557ce31ad5acd0d90dd097caa0ffe6.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_bebdfd8a48f0fcdf88ed10609bd521d74cf029cb.116x65.jpg', 'img/app/578080/578080_ss_bebdfd8a48f0fcdf88ed10609bd521d74cf029cb.600x338.jpg', 'img/app/578080/578080_ss_bebdfd8a48f0fcdf88ed10609bd521d74cf029cb.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_d9ca09b78ebd943bca8268921c4404a99b611cad.116x65.jpg', 'img/app/578080/578080_ss_d9ca09b78ebd943bca8268921c4404a99b611cad.600x338.jpg', 'img/app/578080/578080_ss_d9ca09b78ebd943bca8268921c4404a99b611cad.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 578080, 'img/app/578080/578080_ss_f1c0ed10225f6896f9d377067123c56afbe1e80e.116x65.jpg', 'img/app/578080/578080_ss_f1c0ed10225f6896f9d377067123c56afbe1e80e.600x338.jpg', 'img/app/578080/578080_ss_f1c0ed10225f6896f9d377067123c56afbe1e80e.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 240720, 'img/app/240720/240720_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 240720, 'img/app/240720/240720_capsule_616x353.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 240720, 'img/app/240720/240720_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 240720, 'img/app/240720/240720_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 240720, 'img/app/240720/240720_ss_7b0cb6b5294d7deffa3afafe6d00aa8e5c958e47.116x65.jpg', 'img/app/240720/240720_ss_7b0cb6b5294d7deffa3afafe6d00aa8e5c958e47.600x338.jpg', 'img/app/240720/240720_ss_7b0cb6b5294d7deffa3afafe6d00aa8e5c958e47.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 240720, 'img/app/240720/240720_ss_80cc75048208a65db694a42ba65b67c3df0c3d57.116x65.jpg', 'img/app/240720/240720_ss_80cc75048208a65db694a42ba65b67c3df0c3d57.600x338.jpg', 'img/app/240720/240720_ss_80cc75048208a65db694a42ba65b67c3df0c3d57.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 240720, 'img/app/240720/240720_ss_413828bfd197dae1e356f6b43c4c38a9d3466591.116x65.jpg', 'img/app/240720/240720_ss_413828bfd197dae1e356f6b43c4c38a9d3466591.600x338.jpg', 'img/app/240720/240720_ss_413828bfd197dae1e356f6b43c4c38a9d3466591.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 240720, 'img/app/240720/240720_ss_b0efcf546b861e6fbb6f6a703c2374536af761f5.116x65.jpg', 'img/app/240720/240720_ss_b0efcf546b861e6fbb6f6a703c2374536af761f5.600x338.jpg', 'img/app/240720/240720_ss_b0efcf546b861e6fbb6f6a703c2374536af761f5.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 240720, 
'img/app/240720/240720_ss_ba1b345f67daf713bd94934e0d837eb7f3625e4e.116x65.jpg', 
'img/app/240720/240720_ss_ba1b345f67daf713bd94934e0d837eb7f3625e4e.600x338.jpg', 
'img/app/240720/240720_ss_ba1b345f67daf713bd94934e0d837eb7f3625e4e.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 365590, 'img/app/365590/365590_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 365590, 'img/app/365590/365590_capsule_616x353.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 365590, 'img/app/365590/365590_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 365590, 'img/app/365590/365590_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 365590, 
'img/app/365590/365590_ss_0f8d63fffe2e7477c5b15bd05450bb4338eafd84.116x65.jpg', 
'img/app/365590/365590_ss_0f8d63fffe2e7477c5b15bd05450bb4338eafd84.600x338.jpg', 
'img/app/365590/365590_ss_0f8d63fffe2e7477c5b15bd05450bb4338eafd84.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 365590, 
'img/app/365590/365590_ss_018b8d4960001c44ddf5d9c4d8f3af22ce9eb98d.116x65.jpg', 
'img/app/365590/365590_ss_018b8d4960001c44ddf5d9c4d8f3af22ce9eb98d.600x338.jpg', 
'img/app/365590/365590_ss_018b8d4960001c44ddf5d9c4d8f3af22ce9eb98d.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 365590, 
'img/app/365590/365590_ss_59ea986dd5448b4b539a79c4461feb835cb02abe.116x65.jpg', 
'img/app/365590/365590_ss_59ea986dd5448b4b539a79c4461feb835cb02abe.600x338.jpg', 
'img/app/365590/365590_ss_59ea986dd5448b4b539a79c4461feb835cb02abe.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 365590, 
'img/app/365590/365590_ss_1123f8768c55a8e8455b7a70cbda6265bfae26c4.116x65.jpg', 
'img/app/365590/365590_ss_1123f8768c55a8e8455b7a70cbda6265bfae26c4.600x338.jpg', 
'img/app/365590/365590_ss_1123f8768c55a8e8455b7a70cbda6265bfae26c4.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 365590, 
'img/app/365590/365590_ss_a454605ebb0e5038284f0d94c48ea39096dd9c6a.116x65.jpg', 
'img/app/365590/365590_ss_a454605ebb0e5038284f0d94c48ea39096dd9c6a.600x338.jpg', 
'img/app/365590/365590_ss_a454605ebb0e5038284f0d94c48ea39096dd9c6a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 365590, 
'img/app/365590/365590_ss_c499a4fcd1d72d859f52e0a9d558f43407ef6342.116x65.jpg', 
'img/app/365590/365590_ss_c499a4fcd1d72d859f52e0a9d558f43407ef6342.600x338.jpg', 
'img/app/365590/365590_ss_c499a4fcd1d72d859f52e0a9d558f43407ef6342.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 524220, 'img/app/524220/524220_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 524220, 'img/app/524220/524220_capsule_616x353.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 524220, 'img/app/524220/524220_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 524220, 'img/app/524220/524220_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_02d2f3f2b7b7add8e6ad50d6b9325d05fa1d7bc7.116x65.jpg', 
'img/app/524220/524220_ss_02d2f3f2b7b7add8e6ad50d6b9325d05fa1d7bc7.600x338.jpg', 
'img/app/524220/524220_ss_02d2f3f2b7b7add8e6ad50d6b9325d05fa1d7bc7.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_2c265df38c3d2d393d74ee8e74d79bdafa16b143.116x65.jpg', 
'img/app/524220/524220_ss_2c265df38c3d2d393d74ee8e74d79bdafa16b143.600x338.jpg', 
'img/app/524220/524220_ss_2c265df38c3d2d393d74ee8e74d79bdafa16b143.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_8b29f7e1ce9a8b9313dc3eb50dbe76a4cf94eef9.116x65.jpg', 
'img/app/524220/524220_ss_8b29f7e1ce9a8b9313dc3eb50dbe76a4cf94eef9.600x338.jpg', 
'img/app/524220/524220_ss_8b29f7e1ce9a8b9313dc3eb50dbe76a4cf94eef9.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_831e0e7c9d514393b711e9ed1d6796042521a80c.116x65.jpg', 
'img/app/524220/524220_ss_831e0e7c9d514393b711e9ed1d6796042521a80c.600x338.jpg', 
'img/app/524220/524220_ss_831e0e7c9d514393b711e9ed1d6796042521a80c.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_a6d164452c1aa00a0d7b7ca31aa76d787853b39e.116x65.jpg', 
'img/app/524220/524220_ss_a6d164452c1aa00a0d7b7ca31aa76d787853b39e.600x338.jpg', 
'img/app/524220/524220_ss_a6d164452c1aa00a0d7b7ca31aa76d787853b39e.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_b55c67ac11781513183391c18ea86819e047577d.116x65.jpg', 
'img/app/524220/524220_ss_b55c67ac11781513183391c18ea86819e047577d.600x338.jpg', 
'img/app/524220/524220_ss_b55c67ac11781513183391c18ea86819e047577d.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_c538e630c5cc224124104cc42ec6220ab90b5852.116x65.jpg', 
'img/app/524220/524220_ss_c538e630c5cc224124104cc42ec6220ab90b5852.600x338.jpg', 
'img/app/524220/524220_ss_c538e630c5cc224124104cc42ec6220ab90b5852.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_d0314b4c134329a483b5e43af951f60274abc66b.116x65.jpg', 
'img/app/524220/524220_ss_d0314b4c134329a483b5e43af951f60274abc66b.600x338.jpg', 
'img/app/524220/524220_ss_d0314b4c134329a483b5e43af951f60274abc66b.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_e926e3b5d440b4f244525745c7100edc2d717b85.116x65.jpg', 
'img/app/524220/524220_ss_e926e3b5d440b4f244525745c7100edc2d717b85.600x338.jpg', 
'img/app/524220/524220_ss_e926e3b5d440b4f244525745c7100edc2d717b85.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 524220, 
'img/app/524220/524220_ss_edcb7633ff42d7200bcb240a1ebb1116d602d9fe.116x65.jpg', 
'img/app/524220/524220_ss_edcb7633ff42d7200bcb240a1ebb1116d602d9fe.600x338.jpg', 
'img/app/524220/524220_ss_edcb7633ff42d7200bcb240a1ebb1116d602d9fe.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 582160, 'img/app/582160/582160_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 582160, 'img/app/582160/582160_capsule_616x353.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 582160, 'img/app/582160/582160_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 582160, 'img/app/582160/582160_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 582160, 
'img/app/582160/582160_ss_1a0ab42e93e51c48ad9a6bda7f408958e09a43b0.116x65.jpg', 
'img/app/582160/582160_ss_1a0ab42e93e51c48ad9a6bda7f408958e09a43b0.600x338.jpg', 
'img/app/582160/582160_ss_1a0ab42e93e51c48ad9a6bda7f408958e09a43b0.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 582160, 
'img/app/582160/582160_ss_4de2c8e9d81b3855bbee2708381aa7a56810ba70.116x65.jpg', 
'img/app/582160/582160_ss_4de2c8e9d81b3855bbee2708381aa7a56810ba70.600x338.jpg', 
'img/app/582160/582160_ss_4de2c8e9d81b3855bbee2708381aa7a56810ba70.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 582160, 
'img/app/582160/582160_ss_7edc3de6db0e6391158863f766c334c6eab1dbaa.116x65.jpg', 
'img/app/582160/582160_ss_7edc3de6db0e6391158863f766c334c6eab1dbaa.600x338.jpg', 
'img/app/582160/582160_ss_7edc3de6db0e6391158863f766c334c6eab1dbaa.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 582160, 
'img/app/582160/582160_ss_06861f6dd939c78a919db95bb8e75506216d3eb4.116x65.jpg', 
'img/app/582160/582160_ss_06861f6dd939c78a919db95bb8e75506216d3eb4.600x338.jpg', 
'img/app/582160/582160_ss_06861f6dd939c78a919db95bb8e75506216d3eb4.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 582160, 
'img/app/582160/582160_ss_c4a4545f51c6836ac11c31427944fc7df813edfb.116x65.jpg', 
'img/app/582160/582160_ss_c4a4545f51c6836ac11c31427944fc7df813edfb.600x338.jpg', 
'img/app/582160/582160_ss_c4a4545f51c6836ac11c31427944fc7df813edfb.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 582160, 
'img/app/582160/582160_ss_fbed28aec9059db9477e9bf8fb2ffa92c3ea9e56.116x65.jpg', 
'img/app/582160/582160_ss_fbed28aec9059db9477e9bf8fb2ffa92c3ea9e56.600x338.jpg', 
'img/app/582160/582160_ss_fbed28aec9059db9477e9bf8fb2ffa92c3ea9e56.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 306130, 'img/app/306130/306130_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 306130, 'img/app/306130/306130_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 306130, 'img/app/306130/306130_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 306130, 
'img/app/306130/306130_ss_5e0c14f9b39283bafbcd37fb33a1c79a87757154.116x65.jpg', 
'img/app/306130/306130_ss_5e0c14f9b39283bafbcd37fb33a1c79a87757154.600x338.jpg', 
'img/app/306130/306130_ss_5e0c14f9b39283bafbcd37fb33a1c79a87757154.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 306130, 
'img/app/306130/306130_ss_6ce59dcaa51a89208c643301f6e220d75c001b97.116x65.jpg', 
'img/app/306130/306130_ss_6ce59dcaa51a89208c643301f6e220d75c001b97.600x338.jpg', 
'img/app/306130/306130_ss_6ce59dcaa51a89208c643301f6e220d75c001b97.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 306130, 
'img/app/306130/306130_ss_48be777780be9babf0ffb6c77766d5b0776adc1f.116x65.jpg', 
'img/app/306130/306130_ss_48be777780be9babf0ffb6c77766d5b0776adc1f.600x338.jpg', 
'img/app/306130/306130_ss_48be777780be9babf0ffb6c77766d5b0776adc1f.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 306130, 
'img/app/306130/306130_ss_16688139333e39593af0eccc77342165eacae0d0.116x65.jpg', 
'img/app/306130/306130_ss_16688139333e39593af0eccc77342165eacae0d0.600x338.jpg', 
'img/app/306130/306130_ss_16688139333e39593af0eccc77342165eacae0d0.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 306130, 
'img/app/306130/306130_ss_c1cdae9879550709486774eed3a2760d18955349.116x65.jpg', 
'img/app/306130/306130_ss_c1cdae9879550709486774eed3a2760d18955349.600x338.jpg', 
'img/app/306130/306130_ss_c1cdae9879550709486774eed3a2760d18955349.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 306130, 
'img/app/306130/306130_ss_c839c16d7d8a1488467396ec3854bb405afbc835.116x65.jpg', 
'img/app/306130/306130_ss_c839c16d7d8a1488467396ec3854bb405afbc835.600x338.jpg', 
'img/app/306130/306130_ss_c839c16d7d8a1488467396ec3854bb405afbc835.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 306130, 
'img/app/306130/306130_ss_da66e194128088e46a5ecad2af455ae2ebe84be0.116x65.jpg', 
'img/app/306130/306130_ss_da66e194128088e46a5ecad2af455ae2ebe84be0.600x338.jpg', 
'img/app/306130/306130_ss_da66e194128088e46a5ecad2af455ae2ebe84be0.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 582880, 'img/app/582880/582880_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 582880, 'img/app/582880/582880_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 582880, 'img/app/582880/582880_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 582880, 
'img/app/582880/582880_ss_7d587fc530514b652eda0dd0631db74165017d68.116x65.jpg', 
'img/app/582880/582880_ss_7d587fc530514b652eda0dd0631db74165017d68.600x338.jpg', 
'img/app/582880/582880_ss_7d587fc530514b652eda0dd0631db74165017d68.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 582880, 
'img/app/582880/582880_ss_47a86e9abfde918d86526ba799182abe58c73f65.116x65.jpg', 
'img/app/582880/582880_ss_47a86e9abfde918d86526ba799182abe58c73f65.600x338.jpg', 
'img/app/582880/582880_ss_47a86e9abfde918d86526ba799182abe58c73f65.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 582880, 
'img/app/582880/582880_ss_140c3326d6d0ddc25e8c3f3d63e83d6d4460414a.116x65.jpg', 
'img/app/582880/582880_ss_140c3326d6d0ddc25e8c3f3d63e83d6d4460414a.600x338.jpg', 
'img/app/582880/582880_ss_140c3326d6d0ddc25e8c3f3d63e83d6d4460414a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 582880, 
'img/app/582880/582880_ss_739afba0c82da6aa106fb6531d9e495d34a5863a.116x65.jpg', 
'img/app/582880/582880_ss_739afba0c82da6aa106fb6531d9e495d34a5863a.600x338.jpg', 
'img/app/582880/582880_ss_739afba0c82da6aa106fb6531d9e495d34a5863a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 582880, 
'img/app/582880/582880_ss_0771b1dfda49e2394c937dfe33a95dfaf4f07c77.116x65.jpg', 
'img/app/582880/582880_ss_0771b1dfda49e2394c937dfe33a95dfaf4f07c77.600x338.jpg', 
'img/app/582880/582880_ss_0771b1dfda49e2394c937dfe33a95dfaf4f07c77.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 346110, 'img/app/346110/346110_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 346110, 'img/app/346110/346110_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 346110, 'img/app/346110/346110_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_01cbef83fe28d64ee5a3d39a86043fb1e49abd31.116x65.jpg', 
'img/app/346110/346110_ss_01cbef83fe28d64ee5a3d39a86043fb1e49abd31.600x338.jpg', 
'img/app/346110/346110_ss_01cbef83fe28d64ee5a3d39a86043fb1e49abd31.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_1a7f5508e5384a759ccc83fa484db04513213698.116x65.jpg', 
'img/app/346110/346110_ss_1a7f5508e5384a759ccc83fa484db04513213698.600x338.jpg', 
'img/app/346110/346110_ss_1a7f5508e5384a759ccc83fa484db04513213698.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_1e494e45758b4dd3323b1c359047aaaa5be101d5.116x65.jpg', 
'img/app/346110/346110_ss_1e494e45758b4dd3323b1c359047aaaa5be101d5.600x338.jpg', 
'img/app/346110/346110_ss_1e494e45758b4dd3323b1c359047aaaa5be101d5.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_2fd997a2f7151cb2187043a1f41589cc6a9ebf3a.116x65.jpg', 
'img/app/346110/346110_ss_2fd997a2f7151cb2187043a1f41589cc6a9ebf3a.600x338.jpg', 
'img/app/346110/346110_ss_2fd997a2f7151cb2187043a1f41589cc6a9ebf3a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_3dc2a30d50dc7f90a063dfdf522d33365531ee45.116x65.jpg', 
'img/app/346110/346110_ss_3dc2a30d50dc7f90a063dfdf522d33365531ee45.600x338.jpg', 
'img/app/346110/346110_ss_3dc2a30d50dc7f90a063dfdf522d33365531ee45.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_5cd31fadb3bf000f48dd7d15dfcdaabe3adfa143.116x65.jpg', 
'img/app/346110/346110_ss_5cd31fadb3bf000f48dd7d15dfcdaabe3adfa143.600x338.jpg', 
'img/app/346110/346110_ss_5cd31fadb3bf000f48dd7d15dfcdaabe3adfa143.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_5d60317fff984fcd8d8a7bee9c51f8e0729f7e8f.116x65.jpg', 
'img/app/346110/346110_ss_5d60317fff984fcd8d8a7bee9c51f8e0729f7e8f.600x338.jpg', 
'img/app/346110/346110_ss_5d60317fff984fcd8d8a7bee9c51f8e0729f7e8f.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_7f9c3429b86d65cd63beed4597a23148d7cadf08.116x65.jpg', 
'img/app/346110/346110_ss_7f9c3429b86d65cd63beed4597a23148d7cadf08.600x338.jpg', 
'img/app/346110/346110_ss_7f9c3429b86d65cd63beed4597a23148d7cadf08.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_120e315aa92fbbdd2f41b755308f9c3294aac4f8.116x65.jpg', 
'img/app/346110/346110_ss_120e315aa92fbbdd2f41b755308f9c3294aac4f8.600x338.jpg', 
'img/app/346110/346110_ss_120e315aa92fbbdd2f41b755308f9c3294aac4f8.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_164a92a53f9bcbb728b391fc0719f9769c2e1249.116x65.jpg', 
'img/app/346110/346110_ss_164a92a53f9bcbb728b391fc0719f9769c2e1249.600x338.jpg', 
'img/app/346110/346110_ss_164a92a53f9bcbb728b391fc0719f9769c2e1249.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_46778c08a1a5ac5bdbaf8a5bf844fa666f66a14b.116x65.jpg', 
'img/app/346110/346110_ss_46778c08a1a5ac5bdbaf8a5bf844fa666f66a14b.600x338.jpg', 
'img/app/346110/346110_ss_46778c08a1a5ac5bdbaf8a5bf844fa666f66a14b.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_99814e21d5079b9f614833666fa5f083e836ae97.116x65.jpg', 
'img/app/346110/346110_ss_99814e21d5079b9f614833666fa5f083e836ae97.600x338.jpg', 
'img/app/346110/346110_ss_99814e21d5079b9f614833666fa5f083e836ae97.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_b6e12f80b762779d72429b81f09cc1bff3a04502.116x65.jpg', 
'img/app/346110/346110_ss_b6e12f80b762779d72429b81f09cc1bff3a04502.600x338.jpg', 
'img/app/346110/346110_ss_b6e12f80b762779d72429b81f09cc1bff3a04502.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_cada382a940c062a1a5244db8da1326de55ddeae.116x65.jpg', 
'img/app/346110/346110_ss_cada382a940c062a1a5244db8da1326de55ddeae.600x338.jpg', 
'img/app/346110/346110_ss_cada382a940c062a1a5244db8da1326de55ddeae.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_d2167e4dfbaba128a1ff913fbe6dd17a1e500afb.116x65.jpg', 
'img/app/346110/346110_ss_d2167e4dfbaba128a1ff913fbe6dd17a1e500afb.600x338.jpg', 
'img/app/346110/346110_ss_d2167e4dfbaba128a1ff913fbe6dd17a1e500afb.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_f72af9a68df60b7299b13f07b8165c71b8eac2aa.116x65.jpg', 
'img/app/346110/346110_ss_f72af9a68df60b7299b13f07b8165c71b8eac2aa.600x338.jpg', 
'img/app/346110/346110_ss_f72af9a68df60b7299b13f07b8165c71b8eac2aa.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_fb806797fb216cad733dc70a3fc732134442b1e6.116x65.jpg', 
'img/app/346110/346110_ss_fb806797fb216cad733dc70a3fc732134442b1e6.600x338.jpg', 
'img/app/346110/346110_ss_fb806797fb216cad733dc70a3fc732134442b1e6.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_ffd48da603fa700d10738ae4ee44ce2b9113cb64.116x65.jpg', 
'img/app/346110/346110_ss_ffd48da603fa700d10738ae4ee44ce2b9113cb64.600x338.jpg', 
'img/app/346110/346110_ss_ffd48da603fa700d10738ae4ee44ce2b9113cb64.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 346110, 
'img/app/346110/346110_ss_ffe9f0e2e23892f3bb6188e5a3eed0f60a08baf4.116x65.jpg', 
'img/app/346110/346110_ss_ffe9f0e2e23892f3bb6188e5a3eed0f60a08baf4.600x338.jpg', 
'img/app/346110/346110_ss_ffe9f0e2e23892f3bb6188e5a3eed0f60a08baf4.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 666140, 'img/app/666140/666140_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 666140, 'img/app/666140/666140_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 666140, 'img/app/666140/666140_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_0a48dd669e86858d8a9433b845cee2194a3ce369.116x65.jpg', 
'img/app/666140/666140_ss_0a48dd669e86858d8a9433b845cee2194a3ce369.600x338.jpg', 
'img/app/666140/666140_ss_0a48dd669e86858d8a9433b845cee2194a3ce369.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_0ce484b5bd66ad5b9c25ee3f89d98f43898b123c.116x65.jpg', 
'img/app/666140/666140_ss_0ce484b5bd66ad5b9c25ee3f89d98f43898b123c.600x338.jpg', 
'img/app/666140/666140_ss_0ce484b5bd66ad5b9c25ee3f89d98f43898b123c.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_7ebe63f0396761ed597753a61e404814f261e4bd.116x65.jpg', 
'img/app/666140/666140_ss_7ebe63f0396761ed597753a61e404814f261e4bd.600x338.jpg', 
'img/app/666140/666140_ss_7ebe63f0396761ed597753a61e404814f261e4bd.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_26b9e03ba5722bb6a0d9ad2d7e69be40b45d34b0.116x65.jpg', 
'img/app/666140/666140_ss_26b9e03ba5722bb6a0d9ad2d7e69be40b45d34b0.600x338.jpg', 
'img/app/666140/666140_ss_26b9e03ba5722bb6a0d9ad2d7e69be40b45d34b0.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_32a815b22018495f4510dc03e999d6ca8e333645.116x65.jpg', 
'img/app/666140/666140_ss_32a815b22018495f4510dc03e999d6ca8e333645.600x338.jpg', 
'img/app/666140/666140_ss_32a815b22018495f4510dc03e999d6ca8e333645.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_54fa651b3a88f65e5a6a85b3464fd79948252091.116x65.jpg', 
'img/app/666140/666140_ss_54fa651b3a88f65e5a6a85b3464fd79948252091.600x338.jpg', 
'img/app/666140/666140_ss_54fa651b3a88f65e5a6a85b3464fd79948252091.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_241e84e2755e9597f9df67cbb792ec95982a4fab.116x65.jpg', 
'img/app/666140/666140_ss_241e84e2755e9597f9df67cbb792ec95982a4fab.600x338.jpg', 
'img/app/666140/666140_ss_241e84e2755e9597f9df67cbb792ec95982a4fab.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_7526324c87b81685820c2f0653422ab175cb0487.116x65.jpg', 
'img/app/666140/666140_ss_7526324c87b81685820c2f0653422ab175cb0487.600x338.jpg', 
'img/app/666140/666140_ss_7526324c87b81685820c2f0653422ab175cb0487.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_bb942912485bf103ecb97c29b2adcf8b89917803.116x65.jpg', 
'img/app/666140/666140_ss_bb942912485bf103ecb97c29b2adcf8b89917803.600x338.jpg', 
'img/app/666140/666140_ss_bb942912485bf103ecb97c29b2adcf8b89917803.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_d037c18dae770c9c01e8248dfd40cee068c9dfb2.116x65.jpg', 
'img/app/666140/666140_ss_d037c18dae770c9c01e8248dfd40cee068c9dfb2.600x338.jpg', 
'img/app/666140/666140_ss_d037c18dae770c9c01e8248dfd40cee068c9dfb2.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_d36123e51e194d8c5aec2f41c88b7bee942c5254.116x65.jpg', 
'img/app/666140/666140_ss_d36123e51e194d8c5aec2f41c88b7bee942c5254.600x338.jpg', 
'img/app/666140/666140_ss_d36123e51e194d8c5aec2f41c88b7bee942c5254.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_e1316009e3e5c936e9b112a2e51b74a4b5788c5a.116x65.jpg', 
'img/app/666140/666140_ss_e1316009e3e5c936e9b112a2e51b74a4b5788c5a.600x338.jpg', 
'img/app/666140/666140_ss_e1316009e3e5c936e9b112a2e51b74a4b5788c5a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_f24aacf56860c7ac2685927d5c7e9b0c808dff4a.116x65.jpg', 
'img/app/666140/666140_ss_f24aacf56860c7ac2685927d5c7e9b0c808dff4a.600x338.jpg', 
'img/app/666140/666140_ss_f24aacf56860c7ac2685927d5c7e9b0c808dff4a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 666140, 
'img/app/666140/666140_ss_fe48d5e430ff658c9c96c45e89e4609900dd854d.116x65.jpg', 
'img/app/666140/666140_ss_fe48d5e430ff658c9c96c45e89e4609900dd854d.600x338.jpg', 
'img/app/666140/666140_ss_fe48d5e430ff658c9c96c45e89e4609900dd854d.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 477160, 'img/app/477160/477160_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 477160, 'img/app/477160/477160_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 477160, 'img/app/477160/477160_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 477160, 
'img/app/477160/477160_ss_2e29dc50f61b018c3940ab57ea964f7cf8e9d9c6.116x65.jpg', 
'img/app/477160/477160_ss_2e29dc50f61b018c3940ab57ea964f7cf8e9d9c6.600x338.jpg', 
'img/app/477160/477160_ss_2e29dc50f61b018c3940ab57ea964f7cf8e9d9c6.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 477160, 
'img/app/477160/477160_ss_4cb369df645490d6597f7d3acf9133bb477cae1f.116x65.jpg', 
'img/app/477160/477160_ss_4cb369df645490d6597f7d3acf9133bb477cae1f.600x338.jpg', 
'img/app/477160/477160_ss_4cb369df645490d6597f7d3acf9133bb477cae1f.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 477160, 
'img/app/477160/477160_ss_44e55c053b762e8424b9f846c203ad39e791dfb2.116x65.jpg', 
'img/app/477160/477160_ss_44e55c053b762e8424b9f846c203ad39e791dfb2.600x338.jpg', 
'img/app/477160/477160_ss_44e55c053b762e8424b9f846c203ad39e791dfb2.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 477160, 
'img/app/477160/477160_ss_50d34bf8e2fbc4aafca961f2468bdc95e616b04a.116x65.jpg', 
'img/app/477160/477160_ss_50d34bf8e2fbc4aafca961f2468bdc95e616b04a.600x338.jpg', 
'img/app/477160/477160_ss_50d34bf8e2fbc4aafca961f2468bdc95e616b04a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 477160, 
'img/app/477160/477160_ss_ae83227506e0434942c6b9eacf1b771342c9705d.116x65.jpg', 
'img/app/477160/477160_ss_ae83227506e0434942c6b9eacf1b771342c9705d.600x338.jpg', 
'img/app/477160/477160_ss_ae83227506e0434942c6b9eacf1b771342c9705d.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 477160, 
'img/app/477160/477160_ss_b30c777c1967bf1f627951ff1c5431e7ee82e619.116x65.jpg', 
'img/app/477160/477160_ss_b30c777c1967bf1f627951ff1c5431e7ee82e619.600x338.jpg', 
'img/app/477160/477160_ss_b30c777c1967bf1f627951ff1c5431e7ee82e619.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 477160, 
'img/app/477160/477160_ss_bc87677b5a5d9f9041feb22e9a0a2e98051c4b6b.116x65.jpg', 
'img/app/477160/477160_ss_bc87677b5a5d9f9041feb22e9a0a2e98051c4b6b.600x338.jpg', 
'img/app/477160/477160_ss_bc87677b5a5d9f9041feb22e9a0a2e98051c4b6b.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 477160, 
'img/app/477160/477160_ss_fecc782b406ea59183ed804e2c5492e0e31d83b6.116x65.jpg', 
'img/app/477160/477160_ss_fecc782b406ea59183ed804e2c5492e0e31d83b6.600x338.jpg', 
'img/app/477160/477160_ss_fecc782b406ea59183ed804e2c5492e0e31d83b6.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 368360, 'img/app/368360/368360_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 368360, 'img/app/368360/368360_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 368360, 'img/app/368360/368360_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_0c7361555f53a6eba4e5b18887b9b532eec155d5.116x65.jpg', 
'img/app/368360/368360_ss_0c7361555f53a6eba4e5b18887b9b532eec155d5.600x338.jpg', 
'img/app/368360/368360_ss_0c7361555f53a6eba4e5b18887b9b532eec155d5.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_5cfbd4397d291182c9619db3a7d101c88b78236a.116x65.jpg', 
'img/app/368360/368360_ss_5cfbd4397d291182c9619db3a7d101c88b78236a.600x338.jpg', 
'img/app/368360/368360_ss_5cfbd4397d291182c9619db3a7d101c88b78236a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_8b25951910c719f3dfe7ef861e4d672fcd7f0563.116x65.jpg', 
'img/app/368360/368360_ss_8b25951910c719f3dfe7ef861e4d672fcd7f0563.600x338.jpg', 
'img/app/368360/368360_ss_8b25951910c719f3dfe7ef861e4d672fcd7f0563.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_8e316388dccaba31a5308588d0671f691a6bd6f1.116x65.jpg', 
'img/app/368360/368360_ss_8e316388dccaba31a5308588d0671f691a6bd6f1.600x338.jpg', 
'img/app/368360/368360_ss_8e316388dccaba31a5308588d0671f691a6bd6f1.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_9384ea16789f43c6964cb1ecb3b9e6f017425313.116x65.jpg', 
'img/app/368360/368360_ss_9384ea16789f43c6964cb1ecb3b9e6f017425313.600x338.jpg', 
'img/app/368360/368360_ss_9384ea16789f43c6964cb1ecb3b9e6f017425313.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_24610894033f3cbf551f8b436d18f28efff1929c.116x65.jpg', 
'img/app/368360/368360_ss_24610894033f3cbf551f8b436d18f28efff1929c.600x338.jpg', 
'img/app/368360/368360_ss_24610894033f3cbf551f8b436d18f28efff1929c.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_a97abf884b186b6e2b934406ac295ef30d2a5254.116x65.jpg', 
'img/app/368360/368360_ss_a97abf884b186b6e2b934406ac295ef30d2a5254.600x338.jpg', 
'img/app/368360/368360_ss_a97abf884b186b6e2b934406ac295ef30d2a5254.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_ac8f5dbfcf322b1191943a5f942f8d1dbe2e7a1c.116x65.jpg', 
'img/app/368360/368360_ss_ac8f5dbfcf322b1191943a5f942f8d1dbe2e7a1c.600x338.jpg', 
'img/app/368360/368360_ss_ac8f5dbfcf322b1191943a5f942f8d1dbe2e7a1c.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_ad84e5aaa93cd04a7786100ee8d969a0d1478ce3.116x65.jpg', 
'img/app/368360/368360_ss_ad84e5aaa93cd04a7786100ee8d969a0d1478ce3.600x338.jpg', 
'img/app/368360/368360_ss_ad84e5aaa93cd04a7786100ee8d969a0d1478ce3.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_cd1c90aa0fb73c3e4c143a52be33a035f5a81856.116x65.jpg', 
'img/app/368360/368360_ss_cd1c90aa0fb73c3e4c143a52be33a035f5a81856.600x338.jpg', 
'img/app/368360/368360_ss_cd1c90aa0fb73c3e4c143a52be33a035f5a81856.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_e5c4a00d818d330f5bc1a8ad5f51e000507b03f9.116x65.jpg', 
'img/app/368360/368360_ss_e5c4a00d818d330f5bc1a8ad5f51e000507b03f9.600x338.jpg', 
'img/app/368360/368360_ss_e5c4a00d818d330f5bc1a8ad5f51e000507b03f9.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_ee3678b208da75b7e53bd3122949f07764cdb9cf.116x65.jpg', 
'img/app/368360/368360_ss_ee3678b208da75b7e53bd3122949f07764cdb9cf.600x338.jpg', 
'img/app/368360/368360_ss_ee3678b208da75b7e53bd3122949f07764cdb9cf.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_f0a59719c2f89a57b64be0d80ebae2dcf651abb4.116x65.jpg', 
'img/app/368360/368360_ss_f0a59719c2f89a57b64be0d80ebae2dcf651abb4.600x338.jpg', 
'img/app/368360/368360_ss_f0a59719c2f89a57b64be0d80ebae2dcf651abb4.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 368360, 
'img/app/368360/368360_ss_f21f4fb091a2a6d684f2a4f235afe8094c5334e9.116x65.jpg', 
'img/app/368360/368360_ss_f21f4fb091a2a6d684f2a4f235afe8094c5334e9.600x338.jpg', 
'img/app/368360/368360_ss_f21f4fb091a2a6d684f2a4f235afe8094c5334e9.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 105600, 'img/app/105600/105600_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 105600, 'img/app/105600/105600_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 105600, 'img/app/105600/105600_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_0d805c81ef85dfd2a7a8b25da96f8066017fb3b3.116x65.jpg', 
'img/app/105600/105600_ss_0d805c81ef85dfd2a7a8b25da96f8066017fb3b3.600x338.jpg', 
'img/app/105600/105600_ss_0d805c81ef85dfd2a7a8b25da96f8066017fb3b3.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_1a091473c0b53e98d7a0708dd3ec0978dd56ba45.116x65.jpg', 
'img/app/105600/105600_ss_1a091473c0b53e98d7a0708dd3ec0978dd56ba45.600x338.jpg', 
'img/app/105600/105600_ss_1a091473c0b53e98d7a0708dd3ec0978dd56ba45.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_04dd9f0a5773b686a452ba480b951f83b3ed5061.116x65.jpg', 
'img/app/105600/105600_ss_04dd9f0a5773b686a452ba480b951f83b3ed5061.600x338.jpg', 
'img/app/105600/105600_ss_04dd9f0a5773b686a452ba480b951f83b3ed5061.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_6f57075d0d8f9d2fd963b74f9a4526bbf91aab10.116x65.jpg', 
'img/app/105600/105600_ss_6f57075d0d8f9d2fd963b74f9a4526bbf91aab10.600x338.jpg', 
'img/app/105600/105600_ss_6f57075d0d8f9d2fd963b74f9a4526bbf91aab10.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_8c03886f214d2108cafca13845533eaa3d87d83f.116x65.jpg', 
'img/app/105600/105600_ss_8c03886f214d2108cafca13845533eaa3d87d83f.600x338.jpg', 
'img/app/105600/105600_ss_8c03886f214d2108cafca13845533eaa3d87d83f.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_9edd98caaf9357c2f40758f354475a56e356e8b0.116x65.jpg', 
'img/app/105600/105600_ss_9edd98caaf9357c2f40758f354475a56e356e8b0.600x338.jpg', 
'img/app/105600/105600_ss_9edd98caaf9357c2f40758f354475a56e356e8b0.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_26c4a091c482be28efe1ecf4dfb498273e5a9107.116x65.jpg', 
'img/app/105600/105600_ss_26c4a091c482be28efe1ecf4dfb498273e5a9107.600x338.jpg', 
'img/app/105600/105600_ss_26c4a091c482be28efe1ecf4dfb498273e5a9107.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_75ea9a7e39eb34b40efa1e6dfd2536098dc4734b.116x65.jpg', 
'img/app/105600/105600_ss_75ea9a7e39eb34b40efa1e6dfd2536098dc4734b.600x338.jpg', 
'img/app/105600/105600_ss_75ea9a7e39eb34b40efa1e6dfd2536098dc4734b.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_830aa37570410b80947636785ff62096c0bf276f.116x65.jpg', 
'img/app/105600/105600_ss_830aa37570410b80947636785ff62096c0bf276f.600x338.jpg', 
'img/app/105600/105600_ss_830aa37570410b80947636785ff62096c0bf276f.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_782374517c1792debd74d24856203b876eba3a5d.116x65.jpg', 
'img/app/105600/105600_ss_782374517c1792debd74d24856203b876eba3a5d.600x338.jpg', 
'img/app/105600/105600_ss_782374517c1792debd74d24856203b876eba3a5d.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_900453507c3eb3df55175fb1362869cc75203594.116x65.jpg', 
'img/app/105600/105600_ss_900453507c3eb3df55175fb1362869cc75203594.600x338.jpg', 
'img/app/105600/105600_ss_900453507c3eb3df55175fb1362869cc75203594.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_a1dbbda90ea1669da35cf277e65b5191565bcb12.116x65.jpg', 
'img/app/105600/105600_ss_a1dbbda90ea1669da35cf277e65b5191565bcb12.600x338.jpg', 
'img/app/105600/105600_ss_a1dbbda90ea1669da35cf277e65b5191565bcb12.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_a34d1ebdc99634e012ea19759c12822802164b0e.116x65.jpg', 
'img/app/105600/105600_ss_a34d1ebdc99634e012ea19759c12822802164b0e.600x338.jpg', 
'img/app/105600/105600_ss_a34d1ebdc99634e012ea19759c12822802164b0e.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_a81bfb762197b0aafc207274a708d79e7c39e45f.116x65.jpg', 
'img/app/105600/105600_ss_a81bfb762197b0aafc207274a708d79e7c39e45f.600x338.jpg', 
'img/app/105600/105600_ss_a81bfb762197b0aafc207274a708d79e7c39e45f.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_ab3143003094dec454c5a76cc7d7948f17ca7517.116x65.jpg', 
'img/app/105600/105600_ss_ab3143003094dec454c5a76cc7d7948f17ca7517.600x338.jpg', 
'img/app/105600/105600_ss_ab3143003094dec454c5a76cc7d7948f17ca7517.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_ae168a00ab08104ba266dc30232654d4b3c919e5.116x65.jpg', 
'img/app/105600/105600_ss_ae168a00ab08104ba266dc30232654d4b3c919e5.600x338.jpg', 
'img/app/105600/105600_ss_ae168a00ab08104ba266dc30232654d4b3c919e5.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_b28125b8b8ccacbbb38a3ab4ceaf406ec94d98a4.116x65.jpg', 
'img/app/105600/105600_ss_b28125b8b8ccacbbb38a3ab4ceaf406ec94d98a4.600x338.jpg', 
'img/app/105600/105600_ss_b28125b8b8ccacbbb38a3ab4ceaf406ec94d98a4.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_fd3a47380882311f6ff80cb2d4491d1de4af9e8b.116x65.jpg', 
'img/app/105600/105600_ss_fd3a47380882311f6ff80cb2d4491d1de4af9e8b.600x338.jpg', 
'img/app/105600/105600_ss_fd3a47380882311f6ff80cb2d4491d1de4af9e8b.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 105600, 
'img/app/105600/105600_ss_fefd40cad50a10c09f928f9dc3f9017f8fe50213.116x65.jpg', 
'img/app/105600/105600_ss_fefd40cad50a10c09f928f9dc3f9017f8fe50213.600x338.jpg', 
'img/app/105600/105600_ss_fefd40cad50a10c09f928f9dc3f9017f8fe50213.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 518030, 'img/app/518030/518030_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 518030, 'img/app/518030/518030_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 518030, 'img/app/518030/518030_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_0f18d591cf98e95e79178b9ec98d8ef13dc74a0c.116x65.jpg', 
'img/app/518030/518030_ss_0f18d591cf98e95e79178b9ec98d8ef13dc74a0c.600x338.jpg', 
'img/app/518030/518030_ss_0f18d591cf98e95e79178b9ec98d8ef13dc74a0c.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_1b5bbc3be516e962b5a30acb4984ca7c97fc3b3e.116x65.jpg', 
'img/app/518030/518030_ss_1b5bbc3be516e962b5a30acb4984ca7c97fc3b3e.600x338.jpg', 
'img/app/518030/518030_ss_1b5bbc3be516e962b5a30acb4984ca7c97fc3b3e.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_5a36d5054410403c5b31fb8fd6a7a5fc131a9eca.116x65.jpg', 
'img/app/518030/518030_ss_5a36d5054410403c5b31fb8fd6a7a5fc131a9eca.600x338.jpg', 
'img/app/518030/518030_ss_5a36d5054410403c5b31fb8fd6a7a5fc131a9eca.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_5fcc34c9c1df8d57c6189d820920c007c74ef31d.116x65.jpg', 
'img/app/518030/518030_ss_5fcc34c9c1df8d57c6189d820920c007c74ef31d.600x338.jpg', 
'img/app/518030/518030_ss_5fcc34c9c1df8d57c6189d820920c007c74ef31d.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_06a077eb753ea08d746ec7a2bf7dfd4d594653e4.116x65.jpg', 
'img/app/518030/518030_ss_06a077eb753ea08d746ec7a2bf7dfd4d594653e4.600x338.jpg', 
'img/app/518030/518030_ss_06a077eb753ea08d746ec7a2bf7dfd4d594653e4.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_46db99018f2174025f4892e51f8d9be5c80e83df.116x65.jpg', 
'img/app/518030/518030_ss_46db99018f2174025f4892e51f8d9be5c80e83df.600x338.jpg', 
'img/app/518030/518030_ss_46db99018f2174025f4892e51f8d9be5c80e83df.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_ab1755343c5c5970acfa370b1d400810f6c23173.116x65.jpg', 
'img/app/518030/518030_ss_ab1755343c5c5970acfa370b1d400810f6c23173.600x338.jpg', 
'img/app/518030/518030_ss_ab1755343c5c5970acfa370b1d400810f6c23173.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_aeddc98c8eb9d615d7e4505c1f4ca887a605c057.116x65.jpg', 
'img/app/518030/518030_ss_aeddc98c8eb9d615d7e4505c1f4ca887a605c057.600x338.jpg', 
'img/app/518030/518030_ss_aeddc98c8eb9d615d7e4505c1f4ca887a605c057.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_d53182c87cad69be319cc7d7a5074161e25f8f15.116x65.jpg', 
'img/app/518030/518030_ss_d53182c87cad69be319cc7d7a5074161e25f8f15.600x338.jpg', 
'img/app/518030/518030_ss_d53182c87cad69be319cc7d7a5074161e25f8f15.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_dece546a035cab3cd6ddaa31999fd2e0f02278f9.116x65.jpg', 
'img/app/518030/518030_ss_dece546a035cab3cd6ddaa31999fd2e0f02278f9.600x338.jpg', 
'img/app/518030/518030_ss_dece546a035cab3cd6ddaa31999fd2e0f02278f9.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 518030, 
'img/app/518030/518030_ss_f62b557528f3b4e63e1736da418cd332cd9fb8a0.116x65.jpg', 
'img/app/518030/518030_ss_f62b557528f3b4e63e1736da418cd332cd9fb8a0.600x338.jpg', 
'img/app/518030/518030_ss_f62b557528f3b4e63e1736da418cd332cd9fb8a0.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 4000, 'img/app/4000/4000_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 4000, 'img/app/4000/4000_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 4000, 'img/app/4000/4000_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 4000, 
'img/app/4000/4000_ss_1a9b6c5aaf53e82c00daca46b108774d0d39c32f.116x65.jpg', 
'img/app/4000/4000_ss_1a9b6c5aaf53e82c00daca46b108774d0d39c32f.600x338.jpg', 
'img/app/4000/4000_ss_1a9b6c5aaf53e82c00daca46b108774d0d39c32f.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 4000, 
'img/app/4000/4000_ss_65ec9828538eac8db20efc8149990060911fefc4.116x65.jpg', 
'img/app/4000/4000_ss_65ec9828538eac8db20efc8149990060911fefc4.600x338.jpg', 
'img/app/4000/4000_ss_65ec9828538eac8db20efc8149990060911fefc4.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 4000, 
'img/app/4000/4000_ss_4162b10390d84aa600e5ed895fdc885482eb2e71.116x65.jpg', 
'img/app/4000/4000_ss_4162b10390d84aa600e5ed895fdc885482eb2e71.600x338.jpg', 
'img/app/4000/4000_ss_4162b10390d84aa600e5ed895fdc885482eb2e71.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 4000, 
'img/app/4000/4000_ss_6196ec6e5ad47ef40b27099cc77a3bf60b64b38c.116x65.jpg', 
'img/app/4000/4000_ss_6196ec6e5ad47ef40b27099cc77a3bf60b64b38c.600x338.jpg', 
'img/app/4000/4000_ss_6196ec6e5ad47ef40b27099cc77a3bf60b64b38c.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 4000, 
'img/app/4000/4000_ss_c13ffded1d71bedfa7ede94c11cbd21fbd21a32c.116x65.jpg', 
'img/app/4000/4000_ss_c13ffded1d71bedfa7ede94c11cbd21fbd21a32c.600x338.jpg', 
'img/app/4000/4000_ss_c13ffded1d71bedfa7ede94c11cbd21fbd21a32c.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 4000, 
'img/app/4000/4000_ss_d85d19db885f233a4790960978f362b556ec37be.116x65.jpg', 
'img/app/4000/4000_ss_d85d19db885f233a4790960978f362b556ec37be.600x338.jpg', 
'img/app/4000/4000_ss_d85d19db885f233a4790960978f362b556ec37be.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 4000, 
'img/app/4000/4000_ss_ff27d52a103d1685e4981673c4f700b860cb23de.116x65.jpg', 
'img/app/4000/4000_ss_ff27d52a103d1685e4981673c4f700b860cb23de.600x338.jpg', 
'img/app/4000/4000_ss_ff27d52a103d1685e4981673c4f700b860cb23de.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 569480, 'img/app/569480/569480_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 569480, 'img/app/569480/569480_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 569480, 'img/app/569480/569480_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 569480, 
'img/app/569480/569480_ss_03b433e45bf42c2d1eee09e34b9b9449f710a83a.116x65.jpg', 
'img/app/569480/569480_ss_03b433e45bf42c2d1eee09e34b9b9449f710a83a.600x338.jpg', 
'img/app/569480/569480_ss_03b433e45bf42c2d1eee09e34b9b9449f710a83a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 569480, 
'img/app/569480/569480_ss_ad9d76530745302ab9b9b970445168a892fd9447.116x65.jpg', 
'img/app/569480/569480_ss_ad9d76530745302ab9b9b970445168a892fd9447.600x338.jpg', 
'img/app/569480/569480_ss_ad9d76530745302ab9b9b970445168a892fd9447.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 569480, 
'img/app/569480/569480_ss_c95c62632c6638836dc670977d1f181e24039f73.116x65.jpg', 
'img/app/569480/569480_ss_c95c62632c6638836dc670977d1f181e24039f73.600x338.jpg', 
'img/app/569480/569480_ss_c95c62632c6638836dc670977d1f181e24039f73.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 569480, 
'img/app/569480/569480_ss_c99aa066c0575ce868a5e5f139729ff13cca6174.116x65.jpg', 
'img/app/569480/569480_ss_c99aa066c0575ce868a5e5f139729ff13cca6174.600x338.jpg', 
'img/app/569480/569480_ss_c99aa066c0575ce868a5e5f139729ff13cca6174.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 569480, 
'img/app/569480/569480_ss_cac6a130b06e296a3e189db3e9440b3637f2e6f5.116x65.jpg', 
'img/app/569480/569480_ss_cac6a130b06e296a3e189db3e9440b3637f2e6f5.600x338.jpg', 
'img/app/569480/569480_ss_cac6a130b06e296a3e189db3e9440b3637f2e6f5.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 569480, 
'img/app/569480/569480_ss_d20a36115a040cd82c47dbf8574daaee3b52fa9c.116x65.jpg', 
'img/app/569480/569480_ss_d20a36115a040cd82c47dbf8574daaee3b52fa9c.600x338.jpg', 
'img/app/569480/569480_ss_d20a36115a040cd82c47dbf8574daaee3b52fa9c.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 569480, 
'img/app/569480/569480_ss_edad9495ebd6831086dbe4ea08f75d9b073bc70c.116x65.jpg', 
'img/app/569480/569480_ss_edad9495ebd6831086dbe4ea08f75d9b073bc70c.600x338.jpg', 
'img/app/569480/569480_ss_edad9495ebd6831086dbe4ea08f75d9b073bc70c.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 569480, 
'img/app/569480/569480_ss_0b6d2395af77542f35371f5fd98b0c6b8630ba1f.116x65.jpg', 
'img/app/569480/569480_ss_0b6d2395af77542f35371f5fd98b0c6b8630ba1f.600x338.jpg', 
'img/app/569480/569480_ss_0b6d2395af77542f35371f5fd98b0c6b8630ba1f.1920x1080.jpg');

INSERT INTO steam_apps_pic VALUES(null, 322330, 'img/app/322330/322330_capsule_184x69.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 322330, 'img/app/322330/322330_capsule_sm_120.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 322330, 'img/app/322330/322330_header.jpg', null, null);
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_1feed35720b9529f526ec1f1e249513b73bc8bba.116x65.jpg', 
'img/app/322330/322330_ss_1feed35720b9529f526ec1f1e249513b73bc8bba.600x338.jpg', 
'img/app/322330/322330_ss_1feed35720b9529f526ec1f1e249513b73bc8bba.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_4c650d284de910061c0cbeed36edee653352ccfd.116x65.jpg', 
'img/app/322330/322330_ss_4c650d284de910061c0cbeed36edee653352ccfd.600x338.jpg', 
'img/app/322330/322330_ss_4c650d284de910061c0cbeed36edee653352ccfd.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_11dc14670f703a99884bbe479205727a3776d7b3.116x65.jpg', 
'img/app/322330/322330_ss_11dc14670f703a99884bbe479205727a3776d7b3.600x338.jpg', 
'img/app/322330/322330_ss_11dc14670f703a99884bbe479205727a3776d7b3.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_63bafde2f5677cccfb78aa8df6f09d83c78cd8ed.116x65.jpg', 
'img/app/322330/322330_ss_63bafde2f5677cccfb78aa8df6f09d83c78cd8ed.600x338.jpg', 
'img/app/322330/322330_ss_63bafde2f5677cccfb78aa8df6f09d83c78cd8ed.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_9268a2ab850c1ebe9cab8c1caad57abb20a33560.116x65.jpg', 
'img/app/322330/322330_ss_9268a2ab850c1ebe9cab8c1caad57abb20a33560.600x338.jpg', 
'img/app/322330/322330_ss_9268a2ab850c1ebe9cab8c1caad57abb20a33560.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_24608cbb9e37cfa46751c93312f14b3e18854137.116x65.jpg', 
'img/app/322330/322330_ss_24608cbb9e37cfa46751c93312f14b3e18854137.600x338.jpg', 
'img/app/322330/322330_ss_24608cbb9e37cfa46751c93312f14b3e18854137.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_87091f2ec581c20e1a941a70bb80355419a1f6ba.116x65.jpg', 
'img/app/322330/322330_ss_87091f2ec581c20e1a941a70bb80355419a1f6ba.600x338.jpg', 
'img/app/322330/322330_ss_87091f2ec581c20e1a941a70bb80355419a1f6ba.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_aebe049f1155c8875fcd46ffeb0fbe78d8142cba.116x65.jpg', 
'img/app/322330/322330_ss_aebe049f1155c8875fcd46ffeb0fbe78d8142cba.600x338.jpg', 
'img/app/322330/322330_ss_aebe049f1155c8875fcd46ffeb0fbe78d8142cba.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_c142fa3d60841229b6cf35aca1192882c1f31b9d.116x65.jpg', 
'img/app/322330/322330_ss_c142fa3d60841229b6cf35aca1192882c1f31b9d.600x338.jpg', 
'img/app/322330/322330_ss_c142fa3d60841229b6cf35aca1192882c1f31b9d.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_d7cea5f91a808ff20870ccc30247f694ebd1af95.116x65.jpg', 
'img/app/322330/322330_ss_d7cea5f91a808ff20870ccc30247f694ebd1af95.600x338.jpg', 
'img/app/322330/322330_ss_d7cea5f91a808ff20870ccc30247f694ebd1af95.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_ee86c53d09b2d2b3f93c7c060fbaacad018c63af.116x65.jpg', 
'img/app/322330/322330_ss_ee86c53d09b2d2b3f93c7c060fbaacad018c63af.600x338.jpg', 
'img/app/322330/322330_ss_ee86c53d09b2d2b3f93c7c060fbaacad018c63af.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_f94ff132f776463146136c57ee11b85604e5504a.116x65.jpg', 
'img/app/322330/322330_ss_f94ff132f776463146136c57ee11b85604e5504a.600x338.jpg', 
'img/app/322330/322330_ss_f94ff132f776463146136c57ee11b85604e5504a.1920x1080.jpg');
INSERT INTO steam_apps_pic VALUES(null, 322330, 
'img/app/322330/322330_ss_f59438f653e4e9a423777793bb366c94c59acc56.116x65.jpg', 
'img/app/322330/322330_ss_f59438f653e4e9a423777793bb366c94c59acc56.600x338.jpg', 
'img/app/322330/322330_ss_f59438f653e4e9a423777793bb366c94c59acc56.1920x1080.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of steam_user
-- ----------------------------
INSERT INTO `steam_user` VALUES ('1', 'dingding', '123456', 'ding@qq.com', '13511011000', 'img/avatar/default.png', '丁春秋', '0');
INSERT INTO `steam_user` VALUES ('2', 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '当当喵', '1');
INSERT INTO `steam_user` VALUES ('3', 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1');
INSERT INTO `steam_user` VALUES ('4', 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');
INSERT INTO `steam_user` VALUES ('5', 'dongdong', '123456', 'dong@qq.com', '13501234560', 'img/avatar/default.png', '东东', '1');

-- ----------------------------
-- Table structure for `steam_shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `steam_shoppingcart`;
CREATE TABLE `steam_shoppingcart` (
  `iid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `appid` int(11) default NULL,
  `count` int(11) default NULL,
  `is_checked` tinyint(1) default NULL,
  `expired` ENUM('0', '1') DEFAULT '0' NOT NULL, 
  PRIMARY KEY  (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of steam_shoppingcart
-- ----------------------------
INSERT INTO `steam_shoppingcart` VALUES (null, '1', '240720', '1', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '1', '292030', '2', '0', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '1', '306130', '1', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '1', '346110', '6', '0', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '1', '578080', '2', '0', '0');
-- INSERT INTO `steam_shoppingcart` VALUES (null, '1', '240720', '1', '1', '0');
-- INSERT INTO `steam_shoppingcart` VALUES (null, '1', '292030', '2', '0', '0');
-- INSERT INTO `steam_shoppingcart` VALUES (null, '1', '306130', '1', '1', '0');
-- INSERT INTO `steam_shoppingcart` VALUES (null, '1', '346110', '6', '0', '0');
-- INSERT INTO `steam_shoppingcart` VALUES (null, '1', '578080', '2', '0', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '2', '240720', '5', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '2', '292030', '2', '0', '0');
-- INSERT INTO `steam_shoppingcart` VALUES (null, '2', '306130', '1', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '2', '346110', '6', '0', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '2', '578080', '2', '0', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '3', '240720', '5', '1', '0');
-- INSERT INTO `steam_shoppingcart` VALUES (null, '3', '292030', '2', '0', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '3', '306130', '1', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '3', '346110', '6', '0', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '3', '578080', '2', '0', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '4', '240720', '5', '1', '0');
-- INSERT INTO `steam_shoppingcart` VALUES (null, '4', '292030', '2', '0', '0');
-- INSERT INTO `steam_shoppingcart` VALUES (null, '4', '306130', '1', '1', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '4', '346110', '6', '0', '0');
INSERT INTO `steam_shoppingcart` VALUES (null, '4', '578080', '2', '0', '0');
