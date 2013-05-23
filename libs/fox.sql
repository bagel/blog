-- MySQL dump 10.13  Distrib 5.1.69, for redhat-linux-gnu (x86_64)
--
-- Host: 127.7.22.129    Database: fox
-- ------------------------------------------------------
-- Server version	5.1.69

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` text NOT NULL,
  `content` longtext NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'2012-12-31 15:46:23','ä¸€å¹´åˆç»“æŸäº†','2012æ²¡äº†ï¼Œ2013æ¥äº†ï¼\r\næŽ¥ä¸‹æ¥ä¸€å¹´è¦å¹²ç‚¹å•¥å‘¢ï¼Ÿï¼Ÿ','æ‚è°ˆ','æ‚è°ˆ'),(2,'2012-12-31 16:34:24','2013è¿™å°±æ¥äº†','2013 è¿™å°±æ¥äº†ã€‚ã€‚ã€‚','',''),(3,'2012-12-31 17:04:30','about','è”ç³»æˆ‘ freetgm@gmail.com','',''),(4,'2013-01-21 05:13:57','è™šæ‹Ÿæœºqemu','1ã€ç½‘ç»œæ¡¥æŽ¥\r\nåœ¨hostä¸Šæ–°å»ºbr0 , #brctl addbr br0 , #brctl addif br0 eth0 , é‡å¯network\r\n\r\n2ã€ä½¿ç”¨qemu\r\nåˆ›å»ºimgï¼Œqemu-img create node.img 10G\r\n\r\nå¯åŠ¨qemu\r\nkvm -m 512 -vga vmware -usb -rtc base=localtime -net nic,macaddr=DE:6A:C2:4A:7A:01 -net tap,ifname=tap1,script=/path-to-ifup/qemu-ifup,downscript=no -vnc 127.0.0.1:1 -daemonize disks/node.img\r\n\r\nå„å‚æ•°\r\n-m 512 , åˆ†é…å†…å­˜512M\r\n-vga vmware , ä½¿ç”¨vmwareè™šæ‹Ÿvgaè®¾å¤‡\r\n-rtc base=localtime  , guestæ—¶é—´ä½¿ç”¨localtime\r\n-net nic,macaddr=DE:6A:C2:4A:7A:01 -net tap,ifname=tap1,script=/path-to-ifup/qemu-ifup,downscript=no   ï¼Œåˆ†é…guestç½‘å¡è®¾å¤‡macåœ°å€ï¼Œqemu-ifupä¸ºå¯åŠ¨æ—¶åœ¨hoståˆ›å»ºtapè®¾å¤‡ä½¿ç”¨ï¼Œå¦‚ï¼š\r\n#!/bin/sh\r\n#set -x\r\nswitch=br0\r\nif [ -n \"$1\" ];then\r\n        /usr/bin/sudo /usr/bin/tunctl -u `whoami` -t $1\r\n        /usr/bin/sudo /sbin/ip link set $1 up\r\n        sleep 0.5s\r\n        /usr/bin/sudo /usr/sbin/brctl addif $switch $1\r\n        exit 0\r\nelse\r\n        echo \"Error: no interface specified\"\r\n        exit 1\r\nfi\r\n-vnc 127.0.0.1:1  ï¼Œvncè¿žæŽ¥ï¼Œ$vncviewer 127.0.0.1:1\r\n-daemonize , qemuè½¬å…¥åŽå°è¿è¡Œ\r\n-nographic  , ä¸æ˜¾ç¤ºå›¾å½¢ç•Œé¢\r\n-net user,hostfwd=tcp::33-:22  , hostçš„33ç«¯å£ä¸Žguestçš„22ç«¯å£å¯¹åº”\r\n-usb -usbdevice host:0951:1643  , æ·»åŠ usbè®¾å¤‡host:0951:1643 , lsusbå¯èŽ·å¾—usbä¿¡æ¯\r\n\r\n3ã€rdesktopè¿žæŽ¥guest\r\nrdesktop $guest-ip:3389 -u guest-user -p guest-pass -g 1366x748 -z -x l -P -r sound:local -r disk:Mydisk=/host-path\r\n-g 1366x748 , è®¾ç½®åˆ†è¾¨çŽ‡\r\n-r sound:local , å°†guestçš„å£°éŸ³åœ¨hostä¸­æ’­æ”¾\r\n-r disk:Mydisk=/host-path  , å°†hostä¸Šç›®å½•ä½œä¸ºç£ç›˜æŒ‚è½½åˆ°guest\r\n\r\n4ã€qemuçš„monitor\r\nCtrl+Alt+2å¯ä»¥è¿›å…¥qemuçš„monitorç•Œé¢ï¼ŒCtrl+Alt+1è¿”å›žï¼Œ\r\næ·»åŠ usbè®¾å¤‡ï¼Œusb_add host:0951:1643\r\n<br>\r\næŸ¥çœ‹usbè®¾å¤‡çŠ¶æ€ï¼Œinfo usb\r\n\r\n5ã€å…¶ä»–\r\næ ¹æ®tapçš„æ•°é‡éšæœºç”Ÿæˆguestçš„macåœ°å€\r\nnum=`ip addr show | grep \"tap[[:digit:]]\" | wc -l`\r\nmac=`printf \"DE:6A:C2:%02X:%02X:%02X\" $(($RANDOM/256)) $(($RANDOM/256)) $num`\r\n\r\næ ¹æ®tapèŽ·å–guestçš„IPåœ°å€\r\ninet=`ip addr show | grep inet | grep br0 | awk \'{print $2}\'`\r\nnum=`printf \"%02X\" $1`\r\nip=`sudo nmap -sn $inet | grep \"DE:6A:C2:.*:$num\" -B 2 | head -1 | cut -d \'(\' -f2 | cut -d \')\' -f1`\r\nimg=`ps -ef | grep kvm | grep tap$1 | awk \'{if ($NF ~ /.*\\.img/) print $NF}\'`\r\necho \"tap$1: $ip `basename $img`\"\r\n','qemu','linux, kvm, qemu'),(5,'2013-01-28 00:36:55','ä½¿ç”¨pptpclient vpn','åœ¨Linuxè¿žæŽ¥pptpï¼Œå¦‚æžœæ˜¯gnomeï¼Œå¯ä»¥ç›´æŽ¥ä½¿ç”¨NetworkManager-pptpè¿›è¡Œè¿žæŽ¥ï¼ŒGUIé…ç½®å¾ˆæ–¹ä¾¿ã€‚\r\nå¦‚æžœå–œæ¬¢å‘½ä»¤è¡Œï¼Œpptpclientå°±æ˜¯é¦–é€‰ï¼Œpptpclientä½¿ç”¨pppè¿›è¡Œvpnè¿žæŽ¥pptpã€‚\r\n\r\n1ã€åˆ›å»ºé…ç½®æ–‡ä»¶\r\nä½¿ç”¨pptpsetupåˆ›å»ºé…ç½®æ–‡ä»¶ï¼ŒpptpsetupåŒ…å«åœ¨pptpclientåŒ…ä¸­ï¼Œæœ‰çš„linuxæ˜¯åœ¨pptp-linuxåŒ…ä¸­ï¼Œ\r\n#pptpsetup --create vpnName --server \"vpn server name or ip address\" --username user --password password\r\nä¼šåˆ›å»ºé…ç½®æ–‡ä»¶/etc/ppp/chap-secrets, /etc/ppp/peers/vpnNameï¼ŒåŒæ ·ä½ å¯ä»¥ç›´æŽ¥ç¼–è¾‘è¿™ä¸¤ä¸ªæ–‡ä»¶ï¼Œè€Œä¸å¿…ä½¿ç”¨pptpsetup\r\nå¦‚æžœæ˜¯ä½¿ç”¨PAPéªŒè¯ï¼Œè¿˜éœ€è¦/etc/ppp/pap-secretsæ–‡ä»¶ï¼ŒåŒ/etc/ppp/chap-secrets\r\n\r\n2ã€è¿žæŽ¥pptp\r\n#pon vpnName\r\næ–­å¼€è¿žæŽ¥\r\n#poff vpnName\r\n\r\nå¯åŠ¨è„šæœ¬\r\n#!/bin/sh\r\n\r\n\r\nif [ $# -lt 2 ] ; then\r\n    echo \"`basename $0` provider user [-d]\"\r\n    exit 0\r\nfi\r\n\r\nPROVIDER=$1\r\n\r\nif [ ! -f /etc/ppp/peers/$PROVIDER ] ; then\r\n    echo \"use pptpsetup create $PROVIDER first\"\r\n    exit 1\r\nfi\r\n\r\nUSER=$2\r\necho -n \"password: \"\r\nstty -echo\r\nread PASSWORD\r\nstty echo\r\n\r\nPAP_SECRETS=/etc/ppp/pap-secrets\r\nCHAP_SECRETS=/etc/ppp/chap-secrets\r\n\r\necho -e \"${USER}\\t*\\t${PASSWORD}\\t*\" > $PAP_SECRETS\r\necho -e \"${USER}\\t*\\t${PASSWORD}\\t*\" > $CHAP_SECRETS\r\n\r\nshift 2\r\nif [ \"$1\" == \"-d\" -o \"$1\" == \"--debug\" ] ; then\r\n    pon $PROVIDER debug dump logfd 2 nodetach \r\nelse\r\n    pon $PROVIDER\r\nfi\r\n\r\necho\r\n\r\n3ã€è¿žæŽ¥æ—¶æ·»åŠ è·¯ç”±\r\nponä¼šè¿è¡Œpppï¼Œpppä¼šæ‰§è¡Œ/etc/ppp/ip-up.d/ç›®å½•ä¸‹çš„*.shå¯æ‰§è¡Œè„šæœ¬ï¼Œ\r\nåœ¨/etc/ppp/ip-up.d/ä¸‹åˆ›å»º10-route.shæ–‡ä»¶ï¼Œå†…å®¹å¦‚ä¸‹ï¼Œ\r\n#!/bin/sh\r\n\r\n#add route\r\nroute add -net 10.0.0.0/8 dev ppp0\r\nroute add -net 172.16.0.0/16 dev ppp0\r\nè¿™æ ·å°±ä¸å¿…æ¯æ¬¡éƒ½åŽ»æ·»åŠ vpnè·¯ç”±\r\n\r\n4ã€å…¶ä»–\r\né…ç½®æ–‡ä»¶/etc/ppp/options.pptpä¸­æ˜¯å…³äºŽpptpè®¤è¯æ–¹å¼é…ç½®ï¼Œç±»ä¼¼NetworkManager-pptpä¸­çš„é«˜çº§è®¾ç½®\r\n','vpn','pptp, pptpclient, vpn');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `count`
--

DROP TABLE IF EXISTS `count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `count` (
  `date` date DEFAULT NULL,
  `count` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count`
--

LOCK TABLES `count` WRITE;
/*!40000 ALTER TABLE `count` DISABLE KEYS */;
INSERT INTO `count` VALUES ('2012-12-30',37),('2012-12-31',34),('2013-01-01',183),('2013-01-02',10),('2013-01-03',13),('2013-01-04',10),('2013-01-05',4),('2013-01-06',3582),('2013-01-07',2),('2013-01-09',3),('2013-01-11',12),('2013-01-12',28),('2013-01-13',16),('2013-01-14',63),('2013-01-15',8),('2013-01-16',3),('2013-01-17',1),('2013-01-19',2),('2013-01-20',4),('2013-01-21',18),('2013-01-22',13),('2013-01-23',20),('2013-01-24',59),('2013-01-25',26),('2013-01-26',174),('2013-01-27',88),('2013-01-28',44),('2013-01-29',18),('2013-01-30',14),('2013-01-31',18),('2013-02-01',1),('2013-02-02',1),('2013-02-04',9),('2013-02-05',24),('2013-02-06',9),('2013-02-08',4),('2013-02-09',2),('2013-02-11',2),('2013-02-14',1),('2013-02-16',10),('2013-02-17',8),('2013-02-18',2),('2013-02-19',18),('2013-02-20',1),('2013-02-21',2),('2013-02-22',2),('2013-02-23',3),('2013-02-24',5),('2013-02-25',1),('2013-02-26',6),('2013-02-27',3),('2013-02-28',8),('2013-02-28',8),('2013-03-01',2),('2013-03-02',6),('2013-03-03',7),('2013-03-04',2),('2013-03-05',4),('2013-03-06',2),('2013-03-07',5),('2013-03-09',3),('2013-03-10',1),('2013-03-11',6),('2013-03-11',6),('2013-03-12',4),('2013-03-13',5),('2013-03-14',3),('2013-03-15',10),('2013-03-16',1),('2013-03-17',5),('2013-03-18',3),('2013-03-19',1),('2013-03-21',4),('2013-03-22',6),('2013-03-23',2),('2013-03-24',2),('2013-03-25',6),('2013-03-26',6),('2013-03-27',3),('2013-03-28',4),('2013-03-29',6),('2013-03-30',2),('2013-03-31',2),('2013-04-01',7),('2013-04-02',10),('2013-04-03',9),('2013-04-04',5),('2013-04-05',12),('2013-04-06',6),('2013-04-07',8),('2013-04-08',4),('2013-04-09',3),('2013-04-10',5),('2013-04-11',4),('2013-04-12',7),('2013-04-13',1),('2013-04-14',4),('2013-04-15',5),('2013-04-16',1),('2013-04-17',1),('2013-04-18',15),('2013-04-19',3),('2013-04-20',2),('2013-04-21',1),('2013-04-22',5),('2013-04-23',2),('2013-04-24',4),('2013-04-25',1),('2013-04-26',4),('2013-04-27',2),('2013-04-28',1),('2013-04-29',4),('2013-04-30',1),('2013-05-02',3),('2013-05-03',6),('2013-05-05',1),('2013-05-07',5),('2013-05-09',3),('2013-05-10',1),('2013-05-11',3),('2013-05-12',6),('2013-05-13',5),('2013-05-14',8),('2013-05-15',2),('2013-05-16',10),('2013-05-17',4),('2013-05-18',12),('2013-05-19',11),('2013-05-20',9);
/*!40000 ALTER TABLE `count` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20  9:38:56
