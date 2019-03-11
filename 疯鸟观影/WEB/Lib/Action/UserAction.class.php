<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST, PUT');


Class UserAction extends Action{

	public function test(){
		$user = M('user') -> where("`username` = 'effort' ") ->find();
		echo $user['password'];
	}
	//注册
	public function register(){
		$username = $_GET['user_data'];
		$password = $_GET['password_data'];

		//判断用户是否存在
		$arr = M('user') -> where("`username` = '$username'") -> find();
		if($arr){
			echo -1;
			exit;
		}
		$data['username'] = $username;
		$data['password'] = $password;
		$data['qq'] = '';
		$data['phone'] = '';
		$data['qianming'] = '';
		$data['vip_data'] = '尚未开通VIP';
		$t = time();
		$data['zhuce_data'] = date("Y-m-d",$t);

		$re = M('user') -> add($data);

		echo $re;
	}
	//登录
	public function login(){
		$username = $_GET['user_data'];
   
		$password = $_GET['password_data'];
		$user = M('user') -> where("username= '$username'") -> find();

      if($user == ''){
			echo -1;
		}
		else{
			//对比密码
			if($password == $user['password']){
				echo 1;
			}
			else{
				echo 0;
			}
		}
	
	}

	//获得用户登录信息
	public function get_user_info(){
		$username = $_GET['user_data'];
		$arr = M('user') -> where("username = '$username'") ->find();
		echo json_encode($arr);
	}

	//确认密码
	public  function queren_pass(){
		$username = $_GET['user_data'];
		$password = $_GET['password_data'];

		$user = M('user') -> where("username = '$username'") ->find();
		if($user == ''){
			echo -1;
		}
		else{
			//对比密码
			if($password == $user['password']){
				echo 1;
			}
			else{
				echo 0;
			}
		}

	}

	//更改密码
	public function change_pass(){
		$username = $_GET['user_data'];

		$data['password'] = $_GET['new_pass'];
		// $data['password'] = '123456';
		// $username = '26324636';

		$re= M('user') -> where("username = '$username'") -> save($data);

		echo $re;
	}
    
    //更新资料
	public function update_mes(){
		$username = $_GET['user_data'];

		$data['qq'] = $_GET['qq_data'];
		$data['phone'] = $_GET['phone_data'];
		$data['qianming'] = $_GET[qianming_data];

		$re = M('user') -> where("username = '$username'") -> save($data);

		echo $re;
	}

	//VIP激活
	public function vip_jihuo(){
		$username = $_GET['user_data'];
		$jihuoma = $_GET['jihuoma_data'];

		// $jihuoma = 'a';
		$re = M('vip') -> where("`jihuoma` = '$jihuoma'") -> find();
		$dingdan =M('dingdan') -> where("`code` = '$jihuoma'") -> find();
		// echo $re['day'];
		if($re == ''){
			echo 2;
		}else{
			if($re['is_use'] == '1'){
				echo -1;
			}else{
				$day = $re['day'];
				// echo $day;
				$arr = M('user') -> where("username = '$username'") ->find();
				if($arr['vip_data'] != '尚未开通VIP'){
					$t = $arr['vip_data'];
				}else{
					$t = date("Y-m-d",time());
				}
				// echo $t;
				$arr['vip_data'] = date('Y-m-d',strtotime("{$t} +{$day} day"));
				// echo $arr['vip_data'];
				$data = M('user') -> where("username = '$username'") -> save($arr);
				$re['is_use'] = '1';
				$dingdan['is_use'] = '是';
				M('vip') -> where("`jihuoma` = '$jihuoma'") -> save($re);
				M('dingdan') -> where("`code` = '$jihuoma'") -> save($dingdan);
				echo $data;

			}
		}

	}
	
	//判断是否是VIP
	public function judge_vip(){
		$username = $_GET['user_data'];
		$arr = M('user') -> where("username = '$username'") ->find();
		//echo $arr['password'];
		$t1 = $arr['vip_data'];
		//echo $t1;
		if($t1 == '尚未开通VIP'){
			echo -1;
		}else{
			$t2 = date("Y-m-d",time());
		//echo $t1;
		//echo $t2;
		if(strtotime($t1) - strtotime($t2) < 0){
			echo -1;
		}else{
			echo 1;
		}
		}
		
	}




	
}


?>