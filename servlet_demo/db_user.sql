/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : db_user

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-08-08 21:58:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `content`
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `gmtCreate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `gmtModify` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', 'sss', '### Java多线程', 'java', '2018-07-01 14:30:25', '2019-08-03 15:38:17');
INSERT INTO `content` VALUES ('2', 'Springboot', '### Springboot快速开发框架怎么学？', 'springboot,java', '2018-08-02 14:30:20', '2019-08-03 15:38:24');
INSERT INTO `content` VALUES ('3', 'python人工智能', '> python人工智能', 'python', '2019-08-02 14:29:10', '2019-08-02 14:29:10');
INSERT INTO `content` VALUES ('4', 'SpringBoot2.X使用拦截器后静态资源访问404', 'SpringBoot2.X使用拦截器后静态资源访问404\r\n今天在项目中添加了Intercptor后,发现我的前端页面的静态资源不能访问了。\r\n```java\r\n@Configuration\r\n@EnableWebMvc\r\npublic class WebConfig implements WebMvcConfigurer {\r\n    @Autowired\r\n    private SessionInterceptor sessionInterceptor;\r\n    @Override\r\n    public void addInterceptors(InterceptorRegistry registry) {\r\n         registry.addInterceptor(sessionInterceptor).addPathPatterns(\"/**\");\r\n    }\r\n```\r\n\r\n经过百度后，终于解决了，SpringBoot2之后发现继承了WebMvcConfigurer类之后所有的静态资源都404了.\r\n\r\n解决方法\r\n\r\n重写 addResourceHandlers 方法\r\n\r\n    @Configuration\r\n    @EnableWebMvc\r\n    public class WebConfig implements WebMvcConfigurer {\r\n        @Autowired\r\n        private SessionInterceptor sessionInterceptor;\r\n        @Override\r\n        public void addInterceptors(InterceptorRegistry registry) {\r\n             registry.addInterceptor(sessionInterceptor).addPathPatterns(\"/**\");\r\n        }\r\n\r\n    /**\r\n     * SpringBoot 2.x要重写该方法，不然css、js、image 等静态资源路径无法访问\r\n     * @param registry\r\n     */\r\n    @Override\r\n    public void addResourceHandlers(ResourceHandlerRegistry registry) {\r\n        registry.addResourceHandler(\"/**\")\r\n                .addResourceLocations(\"classpath:/META-INF/resources/\")\r\n                .addResourceLocations(\"classpath:/resources/\")\r\n                .addResourceLocations(\"classpath:/static/\")\r\n                .addResourceLocations(\"classpath:/public/\");\r\n    }\r\n}\r\n', 'springboot', '2019-08-02 20:27:50', '2019-08-02 20:27:50');
INSERT INTO `content` VALUES ('5', '关于', '关于我', 'about', '2019-08-03 11:17:47', '2019-08-03 11:17:47');
INSERT INTO `content` VALUES ('6', 'Java8特性', '#### Java有什么新特性\r\n![LeetCode.jpeg](https://i.loli.net/2019/08/04/VSWxE8G2kMQYIAK.jpg)\r\n\r\n\r\n在Java8之前，接口中只能包含抽象方法。那么这有什么样弊端呢？比如，想再Collection接口中添加一个spliterator抽象方法，那么也就意味着之前所有实现Collection接口的实现类，都要重新实现spliterator这个方法才行。而接口的默认方法就是为了解决接口的修改与接口实现类不兼容的问题，作为代码向前兼容的一个方法。\r\n\r\n那么如何在接口中定义一个默认方法呢？来看下JDK中Collection中如何定义spliterator方法的:\r\n```java\r\ndefault Spliterator<E> spliterator() {\r\n    return Spliterators.spliterator(this, 0);\r\n}\r\n```\r\n可以看到定义接口的默认方法是通过default关键字。因此，在Java8中接口能够包含抽象方法外还能够包含若干个默认方法（即有完整逻辑的实例方法）。\r\n', 'Java', '2019-08-04 10:36:12', '2019-08-04 10:36:12');
INSERT INTO `content` VALUES ('7', 'dd', 'ddd\r\n![my_logo.jpg](https://i.loli.net/2019/08/04/SLu4ZaXxwBv56Wq.jpg)\r\n>简单一点\r\n\r\n```java\r\npublic class PaginationDTO<T> {\r\n    private List<T> data;\r\n    private boolean showPrevious;\r\n    private boolean showFirstPage;\r\n    private boolean showNext;\r\n    private boolean showEndPage;\r\n    private Integer totalPage;\r\n    private Integer page;\r\n    private List<Integer> pages = new ArrayList<>();\r\n```', 'java', '2019-08-04 14:39:49', '2019-08-04 14:39:49');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'jiuyue', '123', '1003@qq.com', '雨女无瓜');
