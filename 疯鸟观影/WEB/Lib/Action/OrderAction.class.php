<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST, PUT');

Class OrderAction extends Action{

	public function test(){
		echo 1;
	}
	
	//增加订单
	public function addOrder(){
		$username = $_GET['user_data'];
		$price = $_GET['order_price'];
		$day = $_GET['day_data'];

		//查找激活码
		$arr = M('vip') -> where("is_buy = '0' and day = '$day' ") ->find();
		$jihuoma = $arr['jihuoma'];
		if($arr ==''){
			echo 2;
		}
		else{
			//更新激活码状态
			$re['is_buy'] = '1';
			M('vip') -> where("`jihuoma` = '$jihuoma'") -> save($re);

			//获取系统时间
			$t = date("Y-m-d",time());

			//数据增加到数据库
			$arr['code'] = $jihuoma;
			$arr['user'] = $username;
			$arr['day'] = $day;
			$arr['is_use'] = '否';
			$arr['order_date'] = date('Y-m-d',strtotime("{$t}"));
			$arr['order_price'] = $price;
			$ans = M('dingdan') -> add($arr);

			echo $ans;
		}	
	}

	//加载订单
	public function loadOrder(){
		$username = $_GET['user_data'];
		$arr=M('dingdan')-> where("user = '$username'")->select();

		echo json_encode($arr);
	}

	public function idenOrder(){
		$code = $_GET['code_data'];
		$arr = M('vip') -> where("jihuoma = '$code'") ->find();
		if($arr['is_use']){
			echo 1;
		}else{
			echo 0;
		}
	}


	
}


?>