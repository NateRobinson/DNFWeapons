-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-07-24 15:15:48
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dnf_sql`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_admin`
--

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_admin`
--

INSERT INTO `t_admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '123456');

-- --------------------------------------------------------

--
-- 表的结构 `t_category`
--

CREATE TABLE `t_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(200) NOT NULL,
  `category_logo` varchar(500) NOT NULL,
  `category_updated` date NOT NULL,
  `categorydesc` varchar(500) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_category`
--

INSERT INTO `t_category` (`id`, `category_name`, `category_logo`, `category_updated`, `categorydesc`, `is_delete`) VALUES
(2, '大将军', 'http://i-3.yiwan.com/2017/1/20/W3dtOjEucG5nLHI6MTMsYjoxM10=/415facba-92d1-49e0-8eda-4014444fc200.jpg', '2017-07-15', 'dnf大将军职业', 1),
(3, '狂战士', 'http://wenwen.soso.com/p/20100615/20100615120920-272946707.jpg', '2017-07-15', 'dnf狂战士职业', 1),
(4, '驱魔', 'http://up.qqjia.com/z/u/a09/tu26987_1.jpg', '2017-07-15', 'dnf驱魔师职业', 1),
(5, '鬼剑士', 'http://thumbnail0.baidupcs.com/thumbnail/83506b440113e6b56c199e27a3228033?fid=3221883380-250528-113980514575688&time=1500814800&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-5jc3xOVhlVsLW6ZqjYDPEZii90U%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4728618773225748477&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=videoTAER-DCb740ccc5511e5e8fedcff06b081203-5jc3xOVhlVsLW6ZqjYDPE', '2017-07-24', '鬼剑士在端游中可以转职为Berserker 狂战士（红眼）、Weapon Master 剑魂（白手） 、Asura 阿修罗（瞎子） 、SoulBringer鬼泣（鬼哭）四大职业，目前在DNF移动版中已经公布的职业有狂战士和剑魂，也是最受欢迎的两大鬼剑士转职职业。', 0),
(6, '神枪手', 'http://thumbnail0.baidupcs.com/thumbnail/e925d46e24fd5b2110cdb74f0d9fc587?fid=3221883380-250528-340199445744551&time=1500814800&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-UXP%2FBje8fQGwp2DSqVpHz6cJGI0%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4728705265128129108&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '2017-07-23', '天界人没有被魔法影响，慢慢理解了元素、金属加工、化学动力等现象。(相反阿拉德对魔法并没有太多的理解)金属与火药技术的发达使他们创造出了枪，从那以后大部分战争都变成了以枪做为主要武器的远距离战。使用枪的战士我们称为神枪手(Gunner)，他们也分为几个种类。巴卡尔被消灭时的无法地带的漫游枪手(Ranger)们发展了自己独创的射击术;1年以后，为了保护黄道，产生了以火力为主的职业：枪炮师(Launcher);最近受工业影响又产生了机械师(Mechanic)职业。', 0),
(7, '格斗家', 'http://thumbnail0.baidupcs.com/thumbnail/33b184c4a74895a4c2b57b7805fc768a?fid=3221883380-250528-446739857796658&time=1500814800&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-%2BdWx4jI%2BrBvEEp6SbPoRlMVDVFU%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4728733233693227943&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '2017-07-23', '格斗家职业倾向依照个人喜好，分别有防御力高，远进皆可打的街霸；以光为主要属性，并且可以用光来攻击敌人的气功师；可以拿特殊武器“拳击手套”精通各种拳击和踢技的散打；贴身战为主，基本上抓到敌人，就让敌人目光跟着你走的柔道家。\n街霸，通称街头，英文(Street Fighter)，特征是脸上有伤疤。推荐武器种类：爪。防具种类：重甲。\n散打，通称散打，英文(Striker)，特征是手上有一对金色护腕。推荐武器种类：拳击手套。防具种类：轻甲。\n气功师，通称气功，英文(NEN Master)，特征身后有金光闪闪的气息。推荐武器种类：东方棍、手套。防具种类：布系防具。\n柔道家，通称柔道，英文(Grappler), 特征头上绑着带子。推荐武器种类：臂铠、东方棍。 防具：轻甲。', 0),
(8, '圣职者', 'http://thumbnail0.baidupcs.com/thumbnail/510d711b5663d5d1b565879148115c2d?fid=3221883380-250528-31159541138980&time=1500814800&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-eeXArGWR65Od49HdCFgLfOXioyg%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4728750182120050029&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '2017-07-24', '圣使者介绍编辑圣骑士是唯一能在战斗中帮助队友快速恢复的职业，战场上的多面手。其强大的增益状态技也备受青睐。圣骑士们始终扮演着守护者的身份，他们无私的奉献着自己的圣光之力，挽救了无数的生命。', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`id`, `username`, `password`) VALUES
(1, 'test', '123456');

-- --------------------------------------------------------

--
-- 表的结构 `t_weapon`
--

CREATE TABLE `t_weapon` (
  `id` int(11) NOT NULL,
  `weapon_name` varchar(200) NOT NULL,
  `weapon_cagory_id` int(10) NOT NULL,
  `weapon_logo` varchar(500) NOT NULL,
  `weapon_desc` varchar(500) NOT NULL,
  `weapon_updated` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_weapon`
--

INSERT INTO `t_weapon` (`id`, `weapon_name`, `weapon_cagory_id`, `weapon_logo`, `weapon_desc`, `weapon_updated`, `is_delete`) VALUES
(4, '斧头', 4, 'http://i3.static.olcdn.com/cms/201406/09/Mzc41402303039326.jpg', '力驱的巨型斧头。', '2017-07-15', 1),
(5, '太刀', 3, 'http://wenwen.soso.com/p/20090805/20090805141300-374242845.jpg', '狂战士的太刀。', '2017-07-15', 1),
(6, '光明净化之剑', 5, 'http://thumbnail0.baidupcs.com/thumbnail/7e927026214c0d5a166eb7d21d3dd3c3?fid=3221883380-250528-897340290842697&time=1500822000&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-gNUa8mdAbrT0skmoED4hBqCuuVQ%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4730557718045714147&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '属性一：所有职业lv1-45全部技能+1(特性技能除外)可以加buff等级，但是略显鸡肋。\n属性二：所有攻击力+5%，在如今黄白爆普遍的情况下，新的提升伤害属性还是值得一看，缺点是作为武器部位，提升太小。\n属性三：攻击时，有3%的几率使100秒以内的当前剩余所有技能的冷却时间减少20%。(冷却时间25秒)。', '2017-07-24', 0),
(7, '加卡利娜的鬼面剑', 5, 'http://thumbnail0.baidupcs.com/thumbnail/02bf47644ff6e712fb972fba939b4501?fid=3221883380-250528-786402824572951&time=1500822000&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-e3GlW3HPPAoitD4V0jLAjEnmh8o%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4730732393547710613&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '物理攻击力+1005\n魔法攻击力+1111\n独立攻击力+642\n力量+72\n智力+107\n力量和智力中比较低的属性值增加30%\n所有职业的Lv40~45技能攻击力+30%\n暴击攻击时，额外增加7%的伤害增加量', '2017-07-24', 0),
(8, '六瓣花开', 5, 'http://thumbnail0.baidupcs.com/thumbnail/f4c809bc8808cfad4c583c23b9a554ee?fid=3221883380-250528-230399025020384&time=1500822000&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-EU2g9M6Ge%2FFmYV5k3Cg7qTym%2BKE%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4730855820991645292&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '90级传说巨剑，鬼剑士神器。', '2017-07-24', 0),
(9, '灭战者', 5, 'http://thumbnail0.baidupcs.com/thumbnail/b5c61683c5a435679708732384dcaf1b?fid=3221883380-250528-481737080053622&time=1500822000&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-Wa5g2tRfGv5lcEZw2hqEg651Vys%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4730894649654400608&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '灭战好些 ，你不用灭战 用幽火玄冥都比是释魂钝器收益高， 米斯特和90SS钝器首选。', '2017-07-23', 0),
(10, '死神之光', 5, 'http://thumbnail0.baidupcs.com/thumbnail/e3e24e20d27693493aa740ccc02420a4?fid=3221883380-250528-646469763023081&time=1500822000&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-Fwax1gqk8lBR43ajLGYWJo%2Fv44M%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4730920127843218598&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', 'dnf释魂之真灵光剑好，攻击附加12%的伤害，还随机加100点力量、智力，10%攻击速度、 移动速度和施放速度。', '2017-07-23', 0),
(11, 'A.B.兰帕德步枪', 6, 'http://thumbnail0.baidupcs.com/thumbnail/81f0a58a782ecfa1c1ea53bf1da5c1eb?fid=3221883380-250528-674778712801690&time=1500897600&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-Zw9XWYB4NSc8bEOofWG0WlTUXsw%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751480933841898454&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '物攻攻击力+1064\n魔攻攻击力+925\n独立攻击力+642\n力量+72\n智力+107\n双暴+8%\n暴击伤害+22%\n【装备属性指令】输入时，可以通过消耗2个无色晶体，向前方掉落钢钻。（冷却时间20秒）\n', '2017-07-24', 0),
(12, '特斯拉电磁炮', 6, 'http://thumbnail0.baidupcs.com/thumbnail/eef7572a1e999972c1dea30d40d7190a?fid=3221883380-250528-973244762909975&time=1500886800&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-bY6wiKyfL866QY63aishquJnoCg%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4748294550209731947&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '20的黄字，不算很强。武器毕业就得荒古和攻城炮，最差的也是鱼王。', '2017-07-24', 0),
(13, 'GAU-8迷你手枪', 6, 'http://thumbnail0.baidupcs.com/thumbnail/528a65aa416b0c021d5afac67dbb4127?fid=3221883380-250528-518555448071527&time=1500886800&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-Q6oO62GhP%2BZw2txpVx31QVWmhyc%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4748318598783855646&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '因为是90级的传送装备，在装备基础上还是不错的，5-48技能加3在的技能加成非常不错，因为1-50级这个分段有不少BUFF可以用来进行换装，200点智力的光环甚至可以在划水的时候都能给队友有所加成，总的上来说还是不错的装备。考虑堆BUFF换装的各位神枪手们可以考虑入手一个。', '2017-07-24', 0),
(14, '天锁流云', 6, 'http://thumbnail0.baidupcs.com/thumbnail/f2c7ff3e13732d074ec742aed57a5226?fid=3221883380-250528-592516531471196&time=1500886800&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-esaDubgTOw1lfbXabu7aUiJ1goU%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4748332489282272303&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '咸鱼们 冰强高的可以买把天锁流云，2000w 不到，有了它就可以当格兰迪噩梦级主 C 了，还不赶快行动。', '2017-07-24', 0),
(15, '月弧', 6, 'http://thumbnail0.baidupcs.com/thumbnail/41a726b069ea567c22c33eeb6ee29784?fid=3221883380-250528-469485003403174&time=1500886800&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-p6JzHgcgRBa4P%2BjMGsVfifi33dQ%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4748360976270128088&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '属性很好，只比SS差一点，没ss的可以入手，才1000多W一把。', '2017-07-24', 0),
(16, '血红战斧', 8, 'http://thumbnail0.baidupcs.com/thumbnail/fec5f95d87e4a81ea6a946cad0f8110f?fid=3221883380-250528-334323558600673&time=1500897600&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-P7q2anFKYmmWZrd2tr8bAqs88Wg%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751545381981100493&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '物攻+1269\n魔攻+900\n独立+642\n力量+72\n双暴+15%\n命中+2%\n驱魔师45技能+3，攻击时附加18%伤害，驱魔师35-40技能攻击力增加10%', '2017-07-24', 0),
(17, '古尔特的铁腕', 8, 'http://thumbnail0.baidupcs.com/thumbnail/88494acddb97d47cbc2814569022ee66?fid=3221883380-250528-962661423577095&time=1500897600&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-8dPs1L9fsZ5ZrolLsYh4mLLl9tA%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751565295642421832&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '物攻+1111\n魔攻+953\n独立+642\n力量+107\n命中+1%\n仲裁怒击攻击力增加45%，攻击速度大幅上升，范围增加45%；\n攻击时伤害增加15%（黄字）', '2017-07-24', 0),
(18, '科迪十字架', 8, 'http://thumbnail0.baidupcs.com/thumbnail/e9545426ab2e5098c3b389a5ada22c81?fid=3221883380-250528-212075518961675&time=1500897600&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-Jd39Xb4Q%2FKw910UFyNo1yC%2F3HOc%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751591743715224462&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '每次可能出现1-5个特效(3次以上几率很低)，即使只有一个敌人也可能触发多次特效，如果范围内有多个目标，出现多次特效会随机分配到目标上面，按照伪2L的说法，5个特效独立计算CD。', '2017-07-24', 0),
(19, '光之流明', 8, 'http://thumbnail0.baidupcs.com/thumbnail/cbe670c97443f2cd9539e8f014100567?fid=3221883380-250528-234859835213220&time=1500897600&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-Ui4vPbwx10sLOdHquToVeVnmFlY%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751619320162335767&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '物攻+953\n魔攻+1217\n独立+642\n智力+107\n释放+5%\n光强+33\n光属性攻击\n光属性强化越高，伤害增加值越大\n-光强50以上，攻击时增加18%的伤害（黄字伤害）\n-光强75以上，攻击时增加22%的伤害（黄字伤害）', '2017-07-24', 0),
(20, '无限之暗', 8, 'http://thumbnail0.baidupcs.com/thumbnail/00a9aaa361360b19c88101b059286dfc?fid=3221883380-250528-251860069988801&time=1500901200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-7r%2FNWc7Dzp%2BVTg%2B9oWZy0Z8p5bY%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751655615504555655&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '暗属性强化越高，对敌人的伤害越大。', '2017-07-24', 0),
(21, '千毒绽放拳套', 7, 'http://thumbnail0.baidupcs.com/thumbnail/043bea7d0db21e79e629950ae9fc433c?fid=3221883380-250528-904373558885345&time=1500901200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-9IAlE3orzaGn%2FNqmJQwQGzaAf%2BE%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751674565791505794&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '物理攻击力+1111\n魔法攻击力+1005\n独立攻击力+642\n力量+72\n装备时使500px范围内所有敌人的中毒抗性减少20\n攻击时，附加18%的伤害（白字）\n攻击中毒状态的敌人时，增加12%伤害（黄字）\n攻击时5%几率产生猛毒爆发（冷却时间5秒）\n攻击时20%几率使敌人进入中毒状态10秒，每0.5秒对中毒的敌人造成25攻击的伤害', '2017-07-24', 0),
(22, '天才的信仰', 7, 'http://thumbnail0.baidupcs.com/thumbnail/4e1fd48613dae70b8f4fa2f984d19bff?fid=3221883380-250528-1031805863182912&time=1500901200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-fgy7wOWwfVP6kZnqdeYewZCev28%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751736231565293096&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '90传说东方棍，附加10%的黄字伤害。', '2017-07-24', 0),
(23, '血红触须', 7, 'http://thumbnail0.baidupcs.com/thumbnail/1fe4bdd26e5b056c92738decfba11251?fid=3221883380-250528-54249942532044&time=1500901200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-qTsuKlwAuDrKalMkI04evbr1NwM%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751767386958451882&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '90传说手套，攻击时会出现红色触须。', '2017-07-24', 0),
(24, '铁腕之卡巴莉：核能拳', 7, 'http://thumbnail0.baidupcs.com/thumbnail/1e1f900eab7af73cb0f79f4df8aba2e4?fid=3221883380-250528-174658424042648&time=1500901200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-RGRZjo87mNqErTmxsusjkvIkfso%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751798274464708651&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '物理攻击+1269\n魔法攻击+953\n独立攻击+642\n力量+272\n命中+1%\n攻击时，附加10%的伤害\n施放【暴力抓取】时，技能持续时间内可以发动卡巴莉的铁腕意志buff（解除装备后效果消失）\n-物理攻击力，独立攻击力10%增加；\n-攻击时3%几率使500px范围内生成核能拳冲击波攻击范围内随机3个敌人。（冷却3秒）', '2017-07-24', 0),
(25, '兽血统治', 7, 'http://thumbnail0.baidupcs.com/thumbnail/43163c51fd529b272a6af1bbabea9f63?fid=3221883380-250528-877209443903067&time=1500901200&rt=sh&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-FiWos34a%2FkNmGn8LhlR2PTRCxIY%3D&expires=8h&chkv=0&chkbd=0&chkpc=&dp-logid=4751813814519817587&dp-callid=0&size=c710_u400&quality=100&vuk=-&ft=video', '只能说一般般，现在90传说武器大多都带属性附加，没有SS武器的话，这个当过度是可以的，但是还不是终极武器，最好的还是荒古跟90SS吧。', '2017-07-24', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `t_category`
--
ALTER TABLE `t_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `t_weapon`
--
ALTER TABLE `t_weapon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `weapon_name` (`weapon_name`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `t_category`
--
ALTER TABLE `t_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `t_weapon`
--
ALTER TABLE `t_weapon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
