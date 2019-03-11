<?php 
	//配置我们的thinkphp的站点

	//配置我们的站点名称 这里的app不是咱们玩的app 指应用的意思
	define("APP_NAME", "WEB");

	// 配置我们站点的存放目录 通常没有这个文件夹 系统会帮我们自动创建
	define('APP_PATH', './WEB/');

	// 配置调试模式 有调试模式，出错的时候 会明确告诉我们 是哪一行错了
	define("APP_DEBUG", true);

	//引入框架文件
	require("./ThinkPHP/ThinkPHP.php");

	// Common 类文件 如果php的自带的类不能满足我们的需求，我们可以自己写个函数处理 文件名一定要是Common
	// Conf   站点配置文件
	// Lang   语言目录
	// Lib    ->Action *** 控制器文件夹
	// Runtime 缓存文件夹 可以随时删 删了还会自己创建
	// Tpl    ->view 视图 放我们html代码
	


 ?>