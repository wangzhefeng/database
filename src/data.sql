-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: mysite_db
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add blog type',7,'add_blogtype'),(26,'Can change blog type',7,'change_blogtype'),(27,'Can delete blog type',7,'delete_blogtype'),(28,'Can view blog type',7,'view_blogtype'),(29,'Can add blog',8,'add_blog'),(30,'Can change blog',8,'change_blog'),(31,'Can delete blog',8,'delete_blog'),(32,'Can view blog',8,'view_blog'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$hVfBrJaoj4pT$PFTutQmybtRVe+nExiTTC1a/DfZ+HMchMjjrlg9ledY=','2020-05-23 15:31:00.000000',1,'wangzf','wang','zhefeng','wangzhefengr@163.com',1,1,'2020-04-15 17:02:00.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_update_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `blog_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_author_id_8791af69_fk_auth_user_id` (`author_id`),
  KEY `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` (`blog_type_id`),
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (1,'Keras II','<p>Multi-backend Keras and tf.keras: At this time, we recommend that Keras users who use multi-backend Keras with the TensorFlow backend switch to tf.keras in TensorFlow 2.0. tf.keras is better maintained and has better integration with TensorFlow features (eager execution, distribution support and other). Keras 2.2.5 was the last release of Keras implementing the 2.2.* API. It was the last release to only support TensorFlow 1 (as well as Theano and CNTK). The current release is Keras 2.3.0, which makes significant API changes and add support for TensorFlow 2.0. The 2.3.0 release will be the last major release of multi-backend Keras. Multi-backend Keras is superseded by tf.keras. Bugs present in multi-backend Keras will only be fixed until April 2020 (as part of minor releases). For more information about the future of Keras, see the Keras meeting notes. Guiding principles User friendliness. Keras is an API designed for human beings, not machines. It puts user experience front and center. Keras follows best practices for reducing cognitive load: it offers consistent &amp; simple APIs, it minimizes the number of user actions required for common use cases, and it provides clear and actionable feedback upon user error. Modularity. A model is understood as a sequence or a graph of standalone, fully configurable modules that can be plugged together with as few restrictions as possible. In particular, neural layers, cost functions, optimizers, initialization schemes, activation functions and regularization schemes are all standalone modules that you can combine to create new models. Easy extensibility. New modules are simple to add (as new classes and functions), and existing modules provide ample examples. To be able to easily create new modules allows for total expressiveness, making Keras suitable for advanced research. Work with Python. No separate models configuration files in a declarative format. Models are described in Python code, which is compact, easier to debug, and allows for ease of extensibility. Getting started: 30 seconds to Keras The core data structure of Keras is a model, a way to organize layers. The simplest type of model is the Sequential model, a linear stack of layers. For more complex architectures, you should use the Keras functional API, which allows to build arbitrary graphs of layers. Here is the Sequential model: from keras.models import Sequential model = Sequential() Stacking layers is as easy as .add(): from keras.layers import Dense model.add(Dense(units=64, activation=&#39;relu&#39;, input_dim=100)) model.add(Dense(units=10, activation=&#39;softmax&#39;)) Once your model looks good, configure its learning process with .compile(): model.compile(loss=&#39;categorical_crossentropy&#39;, optimizer=&#39;sgd&#39;, metrics=[&#39;accuracy&#39;]) If you need to, you can further configure your optimizer. A core principle of Keras is to make things reasonably simple, while allowing the user to be fully in control when they need to (the ultimate control being the easy extensibility of the source code). model.compile(loss=keras.losses.categorical_crossentropy, optimizer=keras.optimizers.SGD(lr=0.01, momentum=0.9, nesterov=True)) You can now iterate on your training data in batches: # x_train and y_train are Numpy arrays --just like in the Scikit-Learn API. model.fit(x_train, y_train, epochs=5, batch_size=32) Alternatively, you can feed batches to your model manually: model.train_on_batch(x_batch, y_batch) Evaluate your performance in one line: loss_and_metrics = model.evaluate(x_test, y_test, batch_size=128) Or generate predictions on new data: classes = model.predict(x_test, batch_size=128) Building a question answering system, an image classification model, a Neural Turing Machine, or any other model is just as fast. The ideas behind deep learning are simple, so why should their implementation be painful? For a more in-depth tutorial about Keras, you can check out: Getting started with the Sequential model Getting started with the functional API In the examples folder of the repository, you will find more advanced models: question-answering with memory networks, text generation with stacked LSTMs, etc. Installation Before installing Keras, please install one of its backend engines: TensorFlow, Theano, or CNTK. We recommend the TensorFlow backend. TensorFlow installation instructions. Theano installation instructions. CNTK installation instructions. You may also consider installing the following optional dependencies: cuDNN (recommended if you plan on running Keras on GPU). HDF5 and h5py (required if you plan on saving Keras models to disk). graphviz and pydot (used by visualization utilities to plot model graphs). Then, you can install Keras itself. There are two ways to install Keras: Install Keras from PyPI (recommended): Note: These installation steps assume that you are on a Linux or Mac environment. If you are on Windows, you will need to remove sudo to run the commands below. sudo pip install keras If you are using a virtualenv, you may want to avoid using sudo: pip install keras Alternatively: install Keras from the GitHub source: First, clone Keras using git: git clone https://github.com/keras-team/keras.git Then, cd to the Keras folder and run the install command: cd keras sudo python setup.py install Configuring your Keras backend By default, Keras will use TensorFlow as its tensor manipulation library. Follow these instructions to configure the Keras backend. Support You can ask questions and join the development discussion: On the Keras Google group. On the Keras Slack channel. Use this link to request an invitation to the channel. You can also post bug reports and feature requests (only) in GitHub issues. Make sure to read our guidelines first. Why this name, Keras? Keras (&kappa;έ&rho;&alpha;&sigmaf;) means horn in Greek. It is a reference to a literary image from ancient Greek and Latin literature, first found in the Odyssey, where dream spirits (Oneiroi, singular Oneiros) are divided between those who deceive men with false visions, who arrive to Earth through a gate of ivory, and those who announce a future that will come to pass, who arrive through a gate of horn. It&#39;s a play on the words &kappa;έ&rho;&alpha;&sigmaf; (horn) / &kappa;&rho;&alpha;ί&nu;&omega; (fulfill), and ἐ&lambda;έ&phi;&alpha;&sigmaf; (ivory) / ἐ&lambda;&epsilon;&phi;&alpha;ί&rho;&omicron;&mu;&alpha;&iota; (deceive). Keras was initially developed as part of the research effort of project ONEIROS (Open-ended Neuro-Electronic Intelligent Robot Operating System). &quot;Oneiroi are beyond our unravelling --who can be sure what tale they tell? Not all that men look for comes to pass. Two gates there are that give passage to fleeting Oneiroi; one is made of horn, one of ivory. The Oneiroi that pass through sawn ivory are deceitful, bearing a message that will not be fulfilled; those that come out through polished horn have truth behind them, to be accomplished for men who see them.&quot; Homer, Odyssey 19. 562 ff (Shewring translation).</p>\r\n\r\n<div class=\"content-27EWd_0\" id=\"translate-man-app\" style=\"background-color:#ffffff; display:none\">\r\n<div class=\"outputBox-mGAYH_0\" data-v-14be448c=\"\">\r\n<div class=\"outputBox-6zQWc_0\" data-v-14be448c=\"\">&nbsp;</div>\r\n\r\n<div class=\"outputBox-23yoE_0\" data-v-14be448c=\"\">\r\n<div class=\"outputBox-mOJr9_0\" data-v-14be448c=\"\"><img class=\"icon-2A0TR_0\" src=\"chrome-extension://fnjoonbenhhijnoegpfkpagjamomgjjm/static/sound.svg\" /></div>\r\n</div>\r\n\r\n<div class=\"outputBox-2JiL2_0\" data-v-14be448c=\"\">&nbsp;</div>\r\n\r\n<div class=\"outputBox-EXeNH_0\" data-v-14be448c=\"\" style=\"display:none\">\r\n<div data-v-14be448c=\"\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>','2020-04-15 17:14:08.544000','2020-05-08 16:38:48.724914',1,4),(2,'Keras I','<p>Keras: The Python Deep Learning library You have just found Keras. Keras is a high-level neural networks API, written in Python and capable of running on top of TensorFlow, CNTK, or Theano. It was developed with a focus on enabling fast experimentation. Being able to go from idea to result with the least possible delay is key to doing good research. Use Keras if you need a deep learning library that: Allows for easy and fast prototyping (through user friendliness, modularity, and extensibility). Supports both convolutional networks and recurrent networks, as well as combinations of the two. Runs seamlessly on CPU and GPU. Read the documentation at Keras.io. Keras is compatible with: Python 2.7-3.6</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/media/upload/2020/05/08/l_hires_5RFU3hR.jpg\" style=\"height:1000px; width:468px\" /></p>\r\n\r\n<div class=\"content-27EWd_0\" id=\"translate-man-app\" style=\"background-color:#ffffff; display:none\">\r\n<div class=\"outputBox-mGAYH_0\" data-v-14be448c=\"\">\r\n<div class=\"outputBox-6zQWc_0\" data-v-14be448c=\"\">&nbsp;</div>\r\n\r\n<div class=\"outputBox-23yoE_0\" data-v-14be448c=\"\">\r\n<div class=\"outputBox-mOJr9_0\" data-v-14be448c=\"\"><img class=\"icon-2A0TR_0\" src=\"chrome-extension://fnjoonbenhhijnoegpfkpagjamomgjjm/static/sound.svg\" /></div>\r\n</div>\r\n\r\n<div class=\"outputBox-2JiL2_0\" data-v-14be448c=\"\">&nbsp;</div>\r\n\r\n<div class=\"outputBox-EXeNH_0\" data-v-14be448c=\"\" style=\"display:none\">\r\n<div data-v-14be448c=\"\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>','2020-04-20 13:53:46.419000','2020-05-08 16:38:22.584026',1,4),(3,'Book 1','<p>ESL 指的是&nbsp;<a href=\"https://esl.hohoweiya.xyz/book/The%20Elements%20of%20Statistical%20Learning.pdf\">The Elements of Statistical Learning</a>。因为自己也是统计学专业，所以想研读这本书，同时实现书中的算法及其例子，并尝试解决习题。</p>\r\n\r\n<h1>说明<a href=\"https://esl.hohoweiya.xyz/#_2\" title=\"Permanent link\">&para;</a></h1>\r\n\r\n<ol>\r\n	<li>参考文献保留原书的写法，如 &ldquo;Efron and Tibshirani (1993)&rdquo; 指的是 &ldquo;Efron, B. and Tibshirani, R. (1993). An Introduction to the Bootstrap, Chapman and Hall, London.&rdquo;；并且为了查阅方便，特别在每章的 &ldquo;Bibliographic Notes&rdquo; 中用脚注列出了相应的参考文献，查阅过的文献，还附上了下载链接。</li>\r\n	<li>该项目不仅仅是单纯地翻译原书，也在实现书中的一些算法或者例子。这些代码都可以在<a href=\"https://github.com/szcf-weiya/ESL-CN\">这里</a>找到，也可以在 Issues 中找到部分习题的解答。</li>\r\n	<li>限于本人英语水平以及统计知识，很多地方可能翻译不到位，欢迎大家指出来，Issue 或者评论均可，错别字以及数学公式解析错误的也可以指出。</li>\r\n</ol>\r\n\r\n<div class=\"content-27EWd_0\" id=\"translate-man-app\" style=\"background-color:#ffffff; display:none\">\r\n<div class=\"outputBox-mGAYH_0\" data-v-14be448c=\"\">\r\n<div class=\"outputBox-6zQWc_0\" data-v-14be448c=\"\">&nbsp;</div>\r\n\r\n<div class=\"outputBox-23yoE_0\" data-v-14be448c=\"\">\r\n<div class=\"outputBox-mOJr9_0\" data-v-14be448c=\"\"><img class=\"icon-2A0TR_0\" src=\"chrome-extension://fnjoonbenhhijnoegpfkpagjamomgjjm/static/sound.svg\" /></div>\r\n</div>\r\n\r\n<div class=\"outputBox-2JiL2_0\" data-v-14be448c=\"\">&nbsp;</div>\r\n\r\n<div class=\"outputBox-EXeNH_0\" data-v-14be448c=\"\" style=\"display:none\">\r\n<div data-v-14be448c=\"\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>','2020-05-09 17:24:51.393496','2020-05-09 17:24:51.393527',1,2),(4,'shell下第一篇','xxxxxxxxxxxxxx','2020-05-11 15:10:11.931412','2020-05-11 15:10:11.931458',1,1),(75,'Blog Django 1','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.284255','2020-05-11 15:25:21.284283',1,1),(76,'Blog Book 1','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.288029','2020-05-11 15:25:21.288053',1,2),(77,'Blog Python 1','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.291414','2020-05-11 15:25:21.291438',1,3),(78,'Blog Keras 1','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.294739','2020-05-11 15:25:21.294763',1,4),(79,'Blog Django 2','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.298510','2020-05-11 15:25:21.298536',1,1),(80,'Blog Book 2','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.302024','2020-05-11 15:25:21.302056',1,2),(81,'Blog Python 2','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.305657','2020-05-11 15:25:21.305684',1,3),(82,'Blog Keras 2','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.308568','2020-05-11 15:25:21.308590',1,4),(83,'Blog Django 3','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.311859','2020-05-11 15:25:21.311878',1,1),(84,'Blog Book 3','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.314211','2020-05-11 15:25:21.314231',1,2),(85,'Blog Python 3','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.316603','2020-05-11 15:25:21.316623',1,3),(86,'Blog Keras 3','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.318936','2020-05-11 15:25:21.318956',1,4),(87,'Blog Django 4','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.321873','2020-05-11 15:25:21.321892',1,1),(88,'Blog Book 4','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.324193','2020-05-11 15:25:21.324213',1,2),(89,'Blog Python 4','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.326584','2020-05-11 15:25:21.326604',1,3),(90,'Blog Keras 4','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.328877','2020-05-11 15:25:21.328896',1,4),(91,'Blog Django 5','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.331766','2020-05-11 15:25:21.331785',1,1),(92,'Blog Book 5','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.334077','2020-05-11 15:25:21.334096',1,2),(93,'Blog Python 5','XXXXXXXXXXXXXXXX','2020-05-11 15:25:21.336260','2020-05-11 15:25:21.336278',1,3),(94,'Blog Keras 5','<p>XXXXXXXXXXXXXXX</p>','2020-05-11 15:25:21.338514','2020-05-19 15:23:18.014028',1,4);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogtype`
--

DROP TABLE IF EXISTS `blog_blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogtype`
--

LOCK TABLES `blog_blogtype` WRITE;
/*!40000 ALTER TABLE `blog_blogtype` DISABLE KEYS */;
INSERT INTO `blog_blogtype` VALUES (1,'Django'),(2,'Book'),(3,'Python'),(4,'Keras');
/*!40000 ALTER TABLE `blog_blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_content_type_id_fbfb9793_fk_django_co` (`content_type_id`),
  KEY `comment_comment_user_id_6078e57b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_comment_content_type_id_fbfb9793_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
INSERT INTO `comment_comment` VALUES (53,94,'<p><img alt=\"smiley\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /></p>','2020-05-23 14:19:53.231066',8,1),(54,2,'<p><img alt=\"heart\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/heart.png\" title=\"heart\" width=\"23\" /></p>','2020-05-23 14:22:33.712101',8,1),(55,94,'<p><img alt=\"mail\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/envelope.png\" title=\"mail\" width=\"23\" /></p>','2020-05-23 15:51:33.136248',8,1),(56,93,'<p><img alt=\"smiley\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /></p>','2020-05-23 16:00:42.187290',8,1);
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-04-15 17:09:38.745000','1','BlogType object (1)',1,'[{\"added\": {}}]',7,1),(2,'2020-04-15 17:09:59.603000','2','BlogType object (2)',1,'[{\"added\": {}}]',7,1),(3,'2020-04-15 17:10:10.043000','3','BlogType object (3)',1,'[{\"added\": {}}]',7,1),(4,'2020-04-15 17:10:25.092000','1','BlogType object (1)',2,'[]',7,1),(5,'2020-04-15 17:14:08.544000','1','<Blog: 第一篇博客>',1,'[{\"added\": {}}]',8,1),(6,'2020-04-15 17:14:15.061000','1','<Blog: 第一篇博客>',2,'[]',8,1),(7,'2020-04-20 13:53:46.421000','2','<Blog: 第二篇博客>',1,'[{\"added\": {}}]',8,1),(8,'2020-04-20 14:02:25.356000','1','<Blog: 第一篇博客>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(9,'2020-04-20 14:04:04.453000','1','<Blog: 第一篇博客>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(10,'2020-05-02 14:48:11.134000','3','Python',2,'[]',7,1),(11,'2020-05-08 15:37:02.828764','2','<Blog: 第二篇博客>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(12,'2020-05-08 15:37:20.489104','1','<Blog: 第一篇博客>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(13,'2020-05-08 15:38:02.228655','2','<Blog: 第二篇博客>',2,'[]',8,1),(14,'2020-05-08 15:38:23.755585','4','Keras',1,'[{\"added\": {}}]',7,1),(15,'2020-05-08 15:38:45.990990','1','<Blog: 第一篇博客>',2,'[{\"changed\": {\"fields\": [\"blog_type\"]}}]',8,1),(16,'2020-05-08 15:38:50.448322','2','<Blog: 第二篇博客>',2,'[{\"changed\": {\"fields\": [\"blog_type\"]}}]',8,1),(17,'2020-05-08 15:41:34.998253','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(18,'2020-05-08 15:41:44.971869','1','<Blog: Keras II>',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(19,'2020-05-08 16:00:35.765519','2','<Blog: Keras I>',2,'[]',8,1),(20,'2020-05-08 16:22:32.918444','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(21,'2020-05-08 16:22:47.927499','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(22,'2020-05-08 16:23:17.358603','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(23,'2020-05-08 16:23:22.368087','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(24,'2020-05-08 16:26:11.294672','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(25,'2020-05-08 16:27:52.393473','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(26,'2020-05-08 16:28:57.066815','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(27,'2020-05-08 16:29:36.377777','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(28,'2020-05-08 16:31:02.725519','2','<Blog: Keras I>',2,'[]',8,1),(29,'2020-05-08 16:31:41.217400','2','<Blog: Keras I>',2,'[]',8,1),(30,'2020-05-08 16:31:47.154690','1','<Blog: Keras II>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(31,'2020-05-08 16:37:53.490760','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(32,'2020-05-08 16:37:59.430019','1','<Blog: Keras II>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(33,'2020-05-08 16:38:22.585025','2','<Blog: Keras I>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(34,'2020-05-08 16:38:48.726149','1','<Blog: Keras II>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(35,'2020-05-09 17:24:51.394124','3','<Blog: Book 1>',1,'[{\"added\": {}}]',8,1),(36,'2020-05-11 15:19:20.664515','34','<Blog: for 30>',3,'',8,1),(37,'2020-05-11 15:19:20.666181','33','<Blog: for 29>',3,'',8,1),(38,'2020-05-11 15:19:20.668016','32','<Blog: for 28>',3,'',8,1),(39,'2020-05-11 15:19:20.669201','31','<Blog: for 27>',3,'',8,1),(40,'2020-05-11 15:19:20.670395','30','<Blog: for 26>',3,'',8,1),(41,'2020-05-11 15:19:20.671471','29','<Blog: for 25>',3,'',8,1),(42,'2020-05-11 15:19:20.672375','28','<Blog: for 24>',3,'',8,1),(43,'2020-05-11 15:19:20.673351','27','<Blog: for 23>',3,'',8,1),(44,'2020-05-11 15:19:20.674289','26','<Blog: for 22>',3,'',8,1),(45,'2020-05-11 15:19:20.675188','25','<Blog: for 21>',3,'',8,1),(46,'2020-05-11 15:19:20.676190','24','<Blog: for 20>',3,'',8,1),(47,'2020-05-11 15:19:20.677183','23','<Blog: for 19>',3,'',8,1),(48,'2020-05-11 15:19:20.678077','22','<Blog: for 18>',3,'',8,1),(49,'2020-05-11 15:19:20.679108','21','<Blog: for 17>',3,'',8,1),(50,'2020-05-11 15:19:20.680048','20','<Blog: for 16>',3,'',8,1),(51,'2020-05-11 15:19:20.681012','19','<Blog: for 15>',3,'',8,1),(52,'2020-05-11 15:19:20.682082','18','<Blog: for 14>',3,'',8,1),(53,'2020-05-11 15:19:20.683004','17','<Blog: for 13>',3,'',8,1),(54,'2020-05-11 15:19:20.683922','16','<Blog: for 12>',3,'',8,1),(55,'2020-05-11 15:19:20.684931','15','<Blog: for 11>',3,'',8,1),(56,'2020-05-11 15:19:20.685843','14','<Blog: for 10>',3,'',8,1),(57,'2020-05-11 15:19:20.687444','13','<Blog: for 9>',3,'',8,1),(58,'2020-05-11 15:19:20.688324','12','<Blog: for 8>',3,'',8,1),(59,'2020-05-11 15:19:20.689182','11','<Blog: for 7>',3,'',8,1),(60,'2020-05-11 15:19:20.690045','10','<Blog: for 6>',3,'',8,1),(61,'2020-05-11 15:19:37.957477','9','<Blog: for 5>',3,'',8,1),(62,'2020-05-11 15:19:37.959145','8','<Blog: for 4>',3,'',8,1),(63,'2020-05-11 15:19:37.960151','7','<Blog: for 3>',3,'',8,1),(64,'2020-05-11 15:19:37.961044','6','<Blog: for 2>',3,'',8,1),(65,'2020-05-11 15:19:37.962103','5','<Blog: for 1>',3,'',8,1),(66,'2020-05-11 15:24:13.570774','54','<Blog: Blog Keras>',3,'',8,1),(67,'2020-05-11 15:24:13.572283','53','<Blog: Blog Python>',3,'',8,1),(68,'2020-05-11 15:24:13.573350','52','<Blog: Blog Book>',3,'',8,1),(69,'2020-05-11 15:24:13.574342','51','<Blog: Blog Django>',3,'',8,1),(70,'2020-05-11 15:24:13.575357','50','<Blog: Blog Keras>',3,'',8,1),(71,'2020-05-11 15:24:13.576364','49','<Blog: Blog Python>',3,'',8,1),(72,'2020-05-11 15:24:13.577312','48','<Blog: Blog Book>',3,'',8,1),(73,'2020-05-11 15:24:13.578220','47','<Blog: Blog Django>',3,'',8,1),(74,'2020-05-11 15:24:13.579084','46','<Blog: Blog Keras>',3,'',8,1),(75,'2020-05-11 15:24:13.580028','45','<Blog: Blog Python>',3,'',8,1),(76,'2020-05-11 15:24:13.580963','44','<Blog: Blog Book>',3,'',8,1),(77,'2020-05-11 15:24:13.581852','43','<Blog: Blog Django>',3,'',8,1),(78,'2020-05-11 15:24:13.582748','42','<Blog: Blog Keras>',3,'',8,1),(79,'2020-05-11 15:24:13.583675','41','<Blog: Blog Python>',3,'',8,1),(80,'2020-05-11 15:24:13.584628','40','<Blog: Blog Book>',3,'',8,1),(81,'2020-05-11 15:24:13.585474','39','<Blog: Blog Django>',3,'',8,1),(82,'2020-05-11 15:24:13.586308','38','<Blog: Blog Keras>',3,'',8,1),(83,'2020-05-11 15:24:13.587181','37','<Blog: Blog Python>',3,'',8,1),(84,'2020-05-11 15:24:13.588050','36','<Blog: Blog Book>',3,'',8,1),(85,'2020-05-11 15:24:13.589159','35','<Blog: Blog Django>',3,'',8,1),(86,'2020-05-11 15:25:05.251994','74','<Blog: Blog Keras 3>',3,'',8,1),(87,'2020-05-11 15:25:05.253533','73','<Blog: Blog Python 2>',3,'',8,1),(88,'2020-05-11 15:25:05.254502','72','<Blog: Blog Book 1>',3,'',8,1),(89,'2020-05-11 15:25:05.255526','71','<Blog: Blog Django 0>',3,'',8,1),(90,'2020-05-11 15:25:05.256498','70','<Blog: Blog Keras 3>',3,'',8,1),(91,'2020-05-11 15:25:05.257492','69','<Blog: Blog Python 2>',3,'',8,1),(92,'2020-05-11 15:25:05.258434','68','<Blog: Blog Book 1>',3,'',8,1),(93,'2020-05-11 15:25:05.259355','67','<Blog: Blog Django 0>',3,'',8,1),(94,'2020-05-11 15:25:05.260248','66','<Blog: Blog Keras 3>',3,'',8,1),(95,'2020-05-11 15:25:05.261282','65','<Blog: Blog Python 2>',3,'',8,1),(96,'2020-05-11 15:25:05.262159','64','<Blog: Blog Book 1>',3,'',8,1),(97,'2020-05-11 15:25:05.263220','63','<Blog: Blog Django 0>',3,'',8,1),(98,'2020-05-11 15:25:05.264122','62','<Blog: Blog Keras 3>',3,'',8,1),(99,'2020-05-11 15:25:05.265040','61','<Blog: Blog Python 2>',3,'',8,1),(100,'2020-05-11 15:25:05.266050','60','<Blog: Blog Book 1>',3,'',8,1),(101,'2020-05-11 15:25:05.266939','59','<Blog: Blog Django 0>',3,'',8,1),(102,'2020-05-11 15:25:05.267863','58','<Blog: Blog Keras 3>',3,'',8,1),(103,'2020-05-11 15:25:05.268873','57','<Blog: Blog Python 2>',3,'',8,1),(104,'2020-05-11 15:25:05.269870','56','<Blog: Blog Book 1>',3,'',8,1),(105,'2020-05-11 15:25:05.270844','55','<Blog: Blog Django 0>',3,'',8,1),(106,'2020-05-18 16:39:45.266930','1','Comment object (1)',3,'',9,1),(107,'2020-05-18 17:09:21.159125','8','Comment object (8)',3,'',9,1),(108,'2020-05-18 17:09:21.162206','7','Comment object (7)',3,'',9,1),(109,'2020-05-18 17:09:21.164792','6','Comment object (6)',3,'',9,1),(110,'2020-05-18 17:11:28.555539','94','<Blog: Blog Keras 5>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(111,'2020-05-18 17:11:52.435566','94','<Blog: Blog Keras 5>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(112,'2020-05-19 15:23:18.014973','94','<Blog: Blog Keras 5>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(113,'2020-05-23 05:07:24.276062','17','Comment object (17)',3,'',9,1),(114,'2020-05-23 05:07:24.278427','16','Comment object (16)',3,'',9,1),(115,'2020-05-23 05:07:24.280105','14','Comment object (14)',3,'',9,1),(116,'2020-05-23 14:19:44.913601','52','Comment object (52)',3,'',9,1),(117,'2020-05-23 14:19:44.916518','51','Comment object (51)',3,'',9,1),(118,'2020-05-23 14:19:44.917465','50','Comment object (50)',3,'',9,1),(119,'2020-05-23 14:19:44.918555','49','Comment object (49)',3,'',9,1),(120,'2020-05-23 14:19:44.919728','48','Comment object (48)',3,'',9,1),(121,'2020-05-23 14:19:44.920864','47','Comment object (47)',3,'',9,1),(122,'2020-05-23 14:19:44.921784','46','Comment object (46)',3,'',9,1),(123,'2020-05-23 14:19:44.922647','45','Comment object (45)',3,'',9,1),(124,'2020-05-23 14:19:44.924545','44','Comment object (44)',3,'',9,1),(125,'2020-05-23 14:19:44.925983','43','Comment object (43)',3,'',9,1),(126,'2020-05-23 14:19:44.926786','42','Comment object (42)',3,'',9,1),(127,'2020-05-23 14:19:44.927654','41','Comment object (41)',3,'',9,1),(128,'2020-05-23 14:19:44.928535','40','Comment object (40)',3,'',9,1),(129,'2020-05-23 14:19:44.929259','39','Comment object (39)',3,'',9,1),(130,'2020-05-23 14:19:44.930004','38','Comment object (38)',3,'',9,1),(131,'2020-05-23 14:19:44.930741','37','Comment object (37)',3,'',9,1),(132,'2020-05-23 14:19:44.931826','36','Comment object (36)',3,'',9,1),(133,'2020-05-23 14:19:44.932884','35','Comment object (35)',3,'',9,1),(134,'2020-05-23 14:19:44.933679','34','Comment object (34)',3,'',9,1),(135,'2020-05-23 14:19:44.934467','33','Comment object (33)',3,'',9,1),(136,'2020-05-23 14:19:44.935188','32','Comment object (32)',3,'',9,1),(137,'2020-05-23 14:19:44.935903','31','Comment object (31)',3,'',9,1),(138,'2020-05-23 14:19:44.936733','30','Comment object (30)',3,'',9,1),(139,'2020-05-23 14:19:44.938046','29','Comment object (29)',3,'',9,1),(140,'2020-05-23 14:19:44.939040','28','Comment object (28)',3,'',9,1),(141,'2020-05-23 14:19:44.940303','27','Comment object (27)',3,'',9,1),(142,'2020-05-23 14:19:44.941456','26','Comment object (26)',3,'',9,1),(143,'2020-05-23 14:19:44.942427','25','Comment object (25)',3,'',9,1),(144,'2020-05-23 14:19:44.943396','24','Comment object (24)',3,'',9,1),(145,'2020-05-23 14:19:44.944250','23','Comment object (23)',3,'',9,1),(146,'2020-05-23 14:19:44.945653','22','Comment object (22)',3,'',9,1),(147,'2020-05-23 14:19:44.946457','21','Comment object (21)',3,'',9,1),(148,'2020-05-23 14:19:44.947280','20','Comment object (20)',3,'',9,1),(149,'2020-05-23 14:19:44.948765','19','Comment object (19)',3,'',9,1),(150,'2020-05-23 14:19:44.949744','18','Comment object (18)',3,'',9,1),(151,'2020-05-23 14:19:44.950903','15','Comment object (15)',3,'',9,1),(152,'2020-05-23 14:19:44.952291','13','Comment object (13)',3,'',9,1),(153,'2020-05-23 14:19:44.953742','12','Comment object (12)',3,'',9,1),(154,'2020-05-23 14:19:44.954785','11','Comment object (11)',3,'',9,1),(155,'2020-05-23 14:19:44.956262','10','Comment object (10)',3,'',9,1),(156,'2020-05-23 14:19:44.957295','9','Comment object (9)',3,'',9,1),(157,'2020-05-23 14:19:44.958241','5','Comment object (5)',3,'',9,1),(158,'2020-05-23 14:19:44.959145','4','Comment object (4)',3,'',9,1),(159,'2020-05-23 14:19:44.960147','3','Comment object (3)',3,'',9,1),(160,'2020-05-23 14:19:44.961141','2','Comment object (2)',3,'',9,1),(161,'2020-05-23 15:47:28.624298','1','wangzf',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"last_login\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'blog','blog'),(7,'blog','blogtype'),(9,'comment','comment'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-03 03:01:20.398589'),(2,'auth','0001_initial','2020-05-03 03:01:20.553708'),(3,'admin','0001_initial','2020-05-03 03:01:20.596086'),(4,'admin','0002_logentry_remove_auto_add','2020-05-03 03:01:20.604094'),(5,'admin','0003_logentry_add_action_flag_choices','2020-05-03 03:01:20.618547'),(6,'contenttypes','0002_remove_content_type_name','2020-05-03 03:01:20.656843'),(7,'auth','0002_alter_permission_name_max_length','2020-05-03 03:01:20.677449'),(8,'auth','0003_alter_user_email_max_length','2020-05-03 03:01:20.693920'),(9,'auth','0004_alter_user_username_opts','2020-05-03 03:01:20.700580'),(10,'auth','0005_alter_user_last_login_null','2020-05-03 03:01:20.721742'),(11,'auth','0006_require_contenttypes_0002','2020-05-03 03:01:20.723857'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-03 03:01:20.730764'),(13,'auth','0008_alter_user_username_max_length','2020-05-03 03:01:20.756054'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-03 03:01:20.780067'),(15,'blog','0001_initial','2020-05-03 03:01:20.837767'),(16,'sessions','0001_initial','2020-05-03 03:01:20.850199'),(17,'blog','0002_auto_20200508_1557','2020-05-08 15:58:02.665066'),(18,'blog','0003_auto_20200508_1605','2020-05-08 16:05:44.724776'),(19,'blog','0004_auto_20200508_1619','2020-05-08 16:19:45.935143'),(20,'blog','0005_auto_20200511_1536','2020-05-11 15:37:02.465290'),(21,'blog','0006_auto_20200517_1517','2020-05-17 15:17:19.824878'),(22,'comment','0001_initial','2020-05-17 15:43:46.145890');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3tuf8aery7o3w856adslu0h53xaqfu9w','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 14:31:26.677361'),('5jk08q1tp9zoa9ufo8lbknlg1j11b12x','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-06-06 05:37:03.976630'),('62k3ufqjxn3689ipxyoxkvgz3btj5g83','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-06-01 11:48:10.731546'),('7j18xb7sbw8i0ry3uz914u7a23myrc7s','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-06-06 03:07:02.677856'),('7nloa1so92lsua6ok66wypk5ukiunkby','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-06-06 05:12:04.423901'),('863bd9wm5lh4hherx0xivhlzdl1kemo1','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 14:32:18.653231'),('91nwk44manz9tdj1at4r1xmgk05p665i','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 14:11:10.027034'),('f62edejskzz1apm9pcn4uxwlxuwdsbk1','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 15:17:47.519382'),('hlh6y84rimrwvj634nzmbvm16hb5gipg','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-05-17 03:35:12.943310'),('jcnpaebr6fvw078w1skegnzosn4k1d7w','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-06-06 15:31:52.778403'),('kmoga3f6xxysormptcdyjrre0sl2yk4x','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-06-02 15:27:46.157633'),('lz5199t3r1i8fq02kbfwztscreobigsr','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-04-29 17:09:10.399000'),('msvp0e357jewzb2apn48vzg5ef4pa7pn','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 14:31:31.626329'),('n91t1rm3fk8pwniq5nvo711f4spsltlz','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 14:31:11.214424'),('ou10pro7zwa7ynaaewib6ohyojhlyfdo','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-06-01 17:09:07.719800'),('pozw67tsvfdskwhypiyd6gndpc1eungw','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 14:36:55.509846'),('q7vjxdtvt83b1czop0dh6zi055tjsq3o','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-05-31 16:26:10.084461'),('qwoil1c3ivgkqy1vgbsvz3e41a4xcdlx','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 15:17:35.559004'),('r18z98aaasj0gzcfj5bmyczi39sxjssy','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-06-02 15:22:50.937149'),('sbp15cajzp3aq8dkt9gaodxdcyozha7t','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 14:32:48.614025'),('vcq038mvdqfhvk55vp0lr8ebldy3nx5x','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-05-04 13:53:11.144000'),('xa39chfe5py8ekv0kgjqa49zibliw2zy','Zjk1NWYwN2M1NGE0ZjM5NDA4ZjMxYjM4ZGRiZDAzZjU3YzUwZGU5Njp7fQ==','2020-06-02 15:12:05.409337'),('z7jy81gaauk1qki6vvzbca98ejkgzodx','ODM5MWY4N2IwMGZmODI4YmEzNTAxNzk3NjFiNjFiMzUwY2ZhM2E4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWViNmNhNGY3N2MzMzViMzliMjg5MmFhNWU3N2I4YmU4MTZhZDM1In0=','2020-05-31 08:33:01.711015');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-24  1:09:57
