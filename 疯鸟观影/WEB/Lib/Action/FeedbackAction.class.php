<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST, PUT');

Class FeedbackAction extends Action{

	public function test(){
		echo 1;
	}
	
	//增加意见反馈
	public function addFeedback(){
		$username = $_GET['user_data'];
		$feedbackCnt = $_GET['feedback_data'];

		//获取系统时间
			$t = date("Y-m-d",time());

			//数据增加到数据库
			$arr['user'] = $username;
			$arr['feedback'] = $feedbackCnt;
			$arr['feedback_date'] = date('Y-m-d',strtotime("{$t}"));
			$ans = M('fankui') -> add($arr);

			echo $ans;
	}	
}


?>