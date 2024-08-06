-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2024 at 11:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emails`
--

-- --------------------------------------------------------

--
-- Table structure for table `successful_emails`
--

CREATE TABLE `successful_emails` (
  `id` int(11) NOT NULL,
  `affiliate_id` mediumint(9) NOT NULL,
  `envelope` text NOT NULL,
  `from` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `dkim` varchar(255) DEFAULT NULL,
  `SPF` varchar(255) DEFAULT NULL,
  `spam_score` float DEFAULT NULL,
  `email` longtext NOT NULL,
  `raw_text` longtext NOT NULL,
  `sender_ip` varchar(50) DEFAULT NULL,
  `to` text NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `successful_emails`
--

INSERT INTO `successful_emails` (`id`, `affiliate_id`, `envelope`, `from`, `subject`, `dkim`, `SPF`, `spam_score`, `email`, `raw_text`, `sender_ip`, `to`, `timestamp`) VALUES
(2, 1, 'env', 'willis.wg37@gmail.com', 'aaaaaa', 'teste', '111111111', 0, 'Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mxd [40.107.102.136]) by mx.sendgrid.net with ESMTP id j45S5hLwQtmMM7HHr-gv6A for <123@analyze.inflektion.ai>; Wed, 28 Feb 2024 00:18:18.883 +0000 (UTC)\\r\\nARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;\\r\\n b=Atn542iVf3cmGYJUSZ+hYMN0l/My1qmJXspa8W6f026kIkBeYKSzh7BwRyqfESCVZAqYmCW9z1/RXsOX/4gyVQnIyOvgINgN+zf8JWslvwEImXXU6Dl4YqYvB6dTwMqeDpLzMvy7otdzMbqRTvmfj3PZKratJVBahIZb3kDMNNSq+rRek3XBYZEMK97U8A60+NlUE8BCYZnaCbd7K6Hdjb/Ek0/mB09IsE68bwhWw1q7bbEmf4hxmBBYgyTJLSdBIWptf5l3M7zzK/9ws3lWkfo0yYE/6V4k2lEWecHvCZRP4hFAN+jj7W9xcLt3JWxHjDsIbxsuKzYj0wa0i8zA6A==\\r\\nARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;\\r\\n s=arcselector9901;\\r\\n h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;\\r\\n bh=MESjWquRzXvG46GIOyShWQOcfHK0kqIKlomXog4ZHIM=;\\r\\n b=U+5/4jMJ2A4DSwHUVfQRVb57sJlPgT+CrFiLanCuyKZTRItNbjY8anOGKWLZSWwzUILbBgCVOw/nQrsFQVKVT4SsApa60rmx9FK4ozvloEmMPt7ESzGbOJAwbM37h67v0HRHAn1RHkddFLYbnIq9x2KmaGYzPhTOmmQdHTRC3A4B+qxPspIWkyRMIKh62HOaWoP1bUaC49PCtvY5d4J3eWvGKQMqBPspfDlkQr/IVaKBrAjFOqzdepQvO53jATlzPcFK4mZ1kaYAm71POWfVIakKHe0+FOkcrr598VZ7Yfoe9JeyfG9SFCGl5jk8UyijnBTcGZS5roVYYvZah7oNuA==\\r\\nARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass\\r\\n smtp.mailfrom=haafiz.com; dmarc=pass action=none header.from=haafiz.com;\\r\\n dkim=pass header.d=haafiz.com; arc=none\\r\\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\\r\\n d=haafiz.onmicrosoft.com; s=selector2-haafiz-onmicrosoft-com;\\r\\n h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;\\r\\n bh=MESjWquRzXvG46GIOyShWQOcfHK0kqIKlomXog4ZHIM=;\\r\\n b=BiPcV3QrywraSZ3vvRAJtyFTzeABY6IQVYDG/MJCt2wi30vyumaJcQ6JV64QrJE/HVg5UQJoGeB6TRF1pCMNrOgwpVw3/86rfuX/occhqW2ld/rTQ4j66T2VE6D8j45iPUGUJCRle+pUkrymy/9Rv3xRApUF4TQ6Tjntv/9bX2M=\\r\\nReceived: from SJ2PR22MB5190.namprd22.prod.outlook.com (2603:10b6:a03:593::5)\\r\\n by LV8PR22MB5572.namprd22.prod.outlook.com (2603:10b6:408:233::17) with\\r\\n Microsoft SMTP Server (version=TLS1_2,\\r\\n cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb\\r\\n 2024 00:18:15 +0000\\r\\nReceived: from SJ2PR22MB5190.namprd22.prod.outlook.com\\r\\n ([fe80::6e12:3608:9a28:ceb7]) by SJ2PR22MB5190.namprd22.prod.outlook.com\\r\\n ([fe80::6e12:3608:9a28:ceb7%5]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024\\r\\n 00:18:15 +0000\\r\\nFrom: Haafiz Dossa <haafiz@haafiz.com>\\r\\nTo: \\\"123@analyze.inflektion.ai\\\" <123@analyze.inflektion.ai>\\r\\nSubject: hello world\\r\\nThread-Topic: hello world\\r\\nThread-Index: Adpp25wOccQ6slvEQbaIAYwG0b54Eg==\\r\\nDate: Wed, 28 Feb 2024 00:18:15 +0000\\r\\nMessage-ID:\\r\\n <SJ2PR22MB519075E71D2B442DD4F44FFEB5582@SJ2PR22MB5190.namprd22.prod.outlook.com>\\r\\nAccept-Language: en-CA, en-US\\r\\nContent-Language: en-US\\r\\nX-MS-Has-Attach:\\r\\nX-MS-TNEF-Correlator:\\r\\nauthentication-results: dkim=none (message not signed)\\r\\n header.d=none;dmarc=none action=none header.from=haafiz.com;\\r\\nx-ms-publictraffictype: Email\\r\\nx-ms-traffictypediagnostic: SJ2PR22MB5190:EE_|LV8PR22MB5572:EE_\\r\\nx-ms-office365-filtering-correlation-id: ff8bb788-bf8f-4b83-04ca-08dc37f2c1d8\\r\\nx-ms-exchange-senderadcheck: 1\\r\\nx-ms-exchange-antispam-relay: 0\\r\\nx-microsoft-antispam: BCL:0;\\r\\nx-microsoft-antispam-message-info:\\r\\n j3ukDH7zLOiHzePtGRXQfq6/bv6ApwZeY1ozgJ7/KlrOlcRWfQvrbQmEFg7HMNUBk9370mSfASXOfby0MIMwCFrtDeiMiddG49jZYeK4lKvZ47Niv6PPC7u6XSmJ9sHwmXhvQw2d+O/1tXmE6Rb18EqPvfhX+1AZ3I8jK3SsosS12X2Qh8qbI1gbhtZLApgeJp3xMjVl8rw3d3S+mROH/BYLx8rbd8P+NrPKZ2MpUIjVEJPWM5g711/m1kBLudTbUKyu9QC6QL4RpKXFRDRQw5QcjkGJlDUne7Tcz8N7I81MFQAzyfbLIxSAvilX5B/+v88rjllC02KZfgJVw4f+8klTf6P5QbWSb3MrG9akxnG4CXaDEJVX4z0jMZicvjGNLlkgLR36VhU3rofDQhDWxe9sLtpLdFoGKA1U8kvnYgfV/ObZOzevt4Ats7f0GEpJQzfIE5JKNidTvsF7K37KfZjIlnnbCvsy8DcixS8A5oPjE0QwoTP1C8ZWAwS0KMRHUyUeDog4mW7fPTttQIu8xONWS5ViD1Rhlj47q/jxgb9cMgcSuMlbgqW/MAh8EPed2pjXKvtOEmaA3OfpPPgK1gNz+h2psC1HBMIBA536b9MQlRP97fuJScEF0WNNV4AIm8Xoxrswrj3sHj/oU0MOs0QGrHmMdE6L83ZuR4DzKj9JV3IyPWxOaAjqm6Ruc3ngX+wpT+DFHSs++zX016V0u+LqeKZexaTY+FZQqas7S2k=\\r\\nx-forefront-antispam-report:\\r\\n CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR22MB5190.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;\\r\\nx-ms-exchange-antispam-messagedata-chunkcount: 1\\r\\nx-ms-exchange-antispam-messagedata-0:\\r\\n =?us-ascii?Q?6WD4zBGFVYKr+j3NQ/Xv+fM4syuC6sNC5nJ+reVhImBmCQW/oDP4ks6iKqpG?=\\r\\n =?us-ascii?Q?jUL2sd7eS6ZSu+f+8/9ZSOtR+aqZNnE25F53uA9JBupxNEvykcPa8KHVGPdG?=\\r\\n =?us-ascii?Q?wt8lmbJsc9YOtVuZgv5ha3Gq/2k6/QKW99s+7bMWXRIDxKHdGTrxjvOaOyGP?=\\r\\n =?us-ascii?Q?f4sWDETj/2/77tFZztVb46Jn2sqBJdHz/4TNGz4qhQg8KYdw8XMAss+ryQBT?=\\r\\n =?us-ascii?Q?hdsn05oP8hbBNxKxNk/tm39jd6VG60OMmthWdGAwtnNpRzw5Laf0l/TOrc0O?=\\r\\n =?us-ascii?Q?CMhOl0iVaet5sMNjBhxN2npqOJY+OaqFyblo19O/Lv5StZzZLU8c4+++Hf8I?=\\r\\n =?us-ascii?Q?TZQhu/IkcxYbJyKWFdxRUGFxCTm7zj73DjQE8aekfUHfTcJt6hcxPSgyueMb?=\\r\\n =?us-ascii?Q?zE+BAgg0G/+SM7r7PLWqaToC+TTMqewveBq3I0/Cjku1NoGiUvddEsv35dqj?=\\r\\n =?us-ascii?Q?mfIwy8mKeZJGkZArAz8wldGvX7UBHOaUKtMLc/H+vWJOVoQAB3XR9IaiKjN5?=\\r\\n =?us-ascii?Q?EkgWpIWIq0mXmypPE9IO34zi9p894psaOnPwDjOqcfoEHCIM/EW1B0aLVDB2?=\\r\\n =?us-ascii?Q?wHvEYzM3vpMssJjjpuJGFX7KWZwPO+PgIKzVe8ujvQw4BB+c3vkKaQ+ITp5y?=\\r\\n =?us-ascii?Q?ojR4D2Lx698Fq+XgKVYomrLgtOMviLeIgYAjGoO3RXU0sSbnnhlRAS866hNV?=\\r\\n =?us-ascii?Q?SWoq2hKYMXf9plfhPC2DeOdE9FG+gjoh2mCX4ouvT+B42Hu6pQOhLovukCnN?=\\r\\n =?us-ascii?Q?5K0nJEQEz8XSOYQJiVgBy3kSx56/xeWG4iFqh7CA5WdY/OoLR8sOYDIalUtG?=\\r\\n =?us-ascii?Q?+79NKFDmg8jj+l1mKWOTKOql7Xg6JCDuOmXs2UBGjvRpINeTGXXPwN06gAsh?=\\r\\n =?us-ascii?Q?zNd2Ew3ky9OACMp3jHjX5CSQhOfnGccy5UHoqILYuJ4cUqm31SmGQb3bR4p5?=\\r\\n =?us-ascii?Q?k/vmnYeHd4LzXLuNAY2nHJwgYGP28Y3zLKI0uJ3AEM55FIJMsOtRtHaXGESD?=\\r\\n =?us-ascii?Q?2Vhjy2s3NU8Qw5dchb0SqbQ9tAS6oxFvKTQcqqWuR71/C2AaFmON3TV2C+/U?=\\r\\n =?us-ascii?Q?r+rsexXGwJfL/BXzQbMs7d0w84FDRFQ49oPuGeDMhRZPF+wVk5gXUSPzfVuT?=\\r\\n =?us-ascii?Q?GHKQ5RRvkbutKDjAh9QM46YAoWZCp+0D+/2uTNaJBoFxaj8Q91gpb9k16mTu?=\\r\\n =?us-ascii?Q?LgLKsF5LizHo4XWDqreU0q++KlOKJfgyonWENVMaqvXAfxut0mVQwQg34gQ4?=\\r\\n =?us-ascii?Q?pKXhS6wMIU2BrXj6++gUPPz2WoNnpvmgjALAlpv1wB4k3N9qdnxZe9N3HcYl?=\\r\\n =?us-ascii?Q?fvERzYeZL6k/PSpKq7saxLPL+JTCth9TRoNf1B9vguMNoCMhkQIsOWIVuOwy?=\\r\\n =?us-ascii?Q?yrKD0d0+V5msodFICN+VouXYrMSsUFTJ91ry/eHwHEnEYuWmI7HS48KWoWrp?=\\r\\n =?us-ascii?Q?mqt7IqUjCB+jx1gjD2mKPGj71WaAW6f5M83mdoPduYJ3tIgoH09FDiDSVU1J?=\\r\\n =?us-ascii?Q?+40BRE6FXCxUODHgdRp5AjP3QGoyX+j3s85dPgAZK7XoXAoh2Vee0o+qwCE8?=\\r\\n =?us-ascii?Q?WFmMzEnV/rfm4rvJuOw=3D?=\\r\\nContent-Type: multipart/alternative;\\r\\n\\tboundary=\\\"_000_SJ2PR22MB519075E71D2B442DD4F44FFEB5582SJ2PR22MB5190namp_\\\"\\r\\nMIME-Version: 1.0\\r\\nX-OriginatorOrg: haafiz.com\\r\\nX-MS-Exchange-CrossTenant-AuthAs: Internal\\r\\nX-MS-Exchange-CrossTenant-AuthSource: SJ2PR22MB5190.namprd22.prod.outlook.com\\r\\nX-MS-Exchange-CrossTenant-Network-Message-Id: ff8bb788-bf8f-4b83-04ca-08dc37f2c1d8\\r\\nX-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 00:18:15.3503\\r\\n (UTC)\\r\\nX-MS-Exchange-CrossTenant-fromentityheader: Hosted\\r\\nX-MS-Exchange-CrossTenant-id: 79890496-a591-4aee-bd98-4b18e1398c4a\\r\\nX-MS-Exchange-CrossTenant-mailboxtype: HOSTED\\r\\nX-MS-Exchange-CrossTenant-userprincipalname: ohkjeL07qnvCVNWNQoh0E+YxuCCcEd9iqnn6O6MCh+k1kbOu1PJVgPl5h+PB50jf4Vgc4QN3b8jaer4sfp79HQ==\\r\\nX-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5572\\r\\n\\r\\n--_000_SJ2PR22MB519075E71D2B442DD4F44FFEB5582SJ2PR22MB5190namp_\\r\\nContent-Type: text/plain; charset=\\\"us-ascii\\\"\\r\\nContent-Transfer-Encoding: quoted-printable\\r\\n\\r\\nHello world 123\\r\\nThis is a test\\r\\n\\r\\n--_000_SJ2PR22MB519075E71D2B442DD4F44FFEB5582SJ2PR22MB5190namp_\\r\\nContent-Type: text/html; charset=\\\"us-ascii\\\"\\r\\nContent-Transfer-Encoding: quoted-printable\\r\\n\\r\\n<html xmlns:v=3D\\\"urn:schemas-microsoft-com:vml\\\" xmlns:o=3D\\\"urn:schemas-micr=\\r\\nosoft-com:office:office\\\" xmlns:w=3D\\\"urn:schemas-microsoft-com:office:word\\\" =\\r\\nxmlns:m=3D\\\"http://schemas.microsoft.com/office/2004/12/omml\\\" xmlns=3D\\\"http:=\\r\\n//www.w3.org/TR/REC-html40\\\">\\r\\n<head>\\r\\n<meta http-equiv=3D\\\"Content-Type\\\" content=3D\\\"text/html; charset=3Dus-ascii\\\"=\\r\\n>\\r\\n<meta name=3D\\\"Generator\\\" content=3D\\\"Microsoft Word 15 (filtered medium)\\\">\\r\\n<style><!--\\r\\n/* Font Definitions */\\r\\n@font-face\\r\\n\\t{font-family:\\\"Cambria Math\\\";\\r\\n\\tpanose-1:2 4 5 3 5 4 6 3 2 4;}\\r\\n@font-face\\r\\n\\t{font-family:Aptos;}\\r\\n/* Style Definitions */\\r\\np.MsoNormal, li.MsoNormal, div.MsoNormal\\r\\n\\t{margin:0cm;\\r\\n\\tfont-size:11.0pt;\\r\\n\\tfont-family:\\\"Aptos\\\",sans-serif;\\r\\n\\tmso-ligatures:standardcontextual;\\r\\n\\tmso-fareast-language:EN-US;}\\r\\nspan.EmailStyle17\\r\\n\\t{mso-style-type:personal-compose;\\r\\n\\tfont-family:\\\"Aptos\\\",sans-serif;\\r\\n\\tcolor:windowtext;}\\r\\n.MsoChpDefault\\r\\n\\t{mso-style-type:export-only;\\r\\n\\tfont-size:11.0pt;\\r\\n\\tmso-fareast-language:EN-US;}\\r\\n@page WordSection1\\r\\n\\t{size:612.0pt 792.0pt;\\r\\n\\tmargin:72.0pt 72.0pt 72.0pt 72.0pt;}\\r\\ndiv.WordSection1\\r\\n\\t{page:WordSection1;}\\r\\n--></style><!--[if gte mso 9]><xml>\\r\\n<o:shapedefaults v:ext=3D\\\"edit\\\" spidmax=3D\\\"1026\\\" />\\r\\n</xml><![endif]--><!--[if gte mso 9]><xml>\\r\\n<o:shapelayout v:ext=3D\\\"edit\\\">\\r\\n<o:idmap v:ext=3D\\\"edit\\\" data=3D\\\"1\\\" />\\r\\n</o:shapelayout></xml><![endif]-->\\r\\n</head>\\r\\n<body lang=3D\\\"EN-CA\\\" link=3D\\\"#467886\\\" vlink=3D\\\"#96607D\\\" style=3D\\\"word-wrap:=\\r\\nbreak-word\\\">\\r\\n<div class=3D\\\"WordSection1\\\">\\r\\n<p class=3D\\\"MsoNormal\\\"><span lang=3D\\\"EN-US\\\">Hello world 123<o:p></o:p></spa=\\r\\nn></p>\\r\\n<p class=3D\\\"MsoNormal\\\"><span lang=3D\\\"EN-US\\\">This is a test<o:p></o:p></span=\\r\\n></p>\\r\\n</div>\\r\\n</body>\\r\\n</html>\\r\\n\\r\\n--_000_SJ2PR22MB519075E71D2B442DD4F44FFEB5582SJ2PR22MB5190namp_--\\r\\n', 'Hello world 123\nThis is a test\n', '1111.111.1111.111', 'contato.wvasconcelos@gmail.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `successful_emails`
--
ALTER TABLE `successful_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_index` (`affiliate_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `successful_emails`
--
ALTER TABLE `successful_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
