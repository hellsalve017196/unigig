<?php

defined('BASEPATH') OR exit('No direct script access allowed');


require_once APPPATH . 'libraries/REST_Controller.php';


class candidate_login extends REST_Controller
{
	// for candidate login
	public function login_post()
	{
		$this->load->model('candidate_login_model','c');

		$data = json_decode($this->post('customer'),true);

		$response = array();

		if(sizeof($data) > 0)
		{
			$temp = array("s_email"=>$data['email'],"s_password"=>$data['password']);

			if($this->c->log_in($temp))
			{
				$response = array("status"=>"success","error_type"=>"Successfully Logging In.");
			}
			else
			{
				$response = array("status"=>"error","error_type"=>"Invalid Email Address Or Password");
			}
		}
		else
		{
			$response = array("status"=>"error","error_type"=>$_POST);
		}

		$this->response($response,200);
	}



	// for signup
	public function signUp_post()
	{
		$this->load->model('candidate_login_model','c');

		$this->load->model('notification','n');

		$data = json_decode($this->post('customer'),true);

		$response = array();

		if(sizeof($data) > 0)
		{
			if($this->c->used_email_check($data))
			{
				$response = array("status"=>"error","error_type"=>"Email address has been previously registered.");
			}
			else {
				if($this->c->sign_up($data))
				{
					$confirmation = array("emails"=>$data['email'],"subject"=>"Welcome to Unigigg.com","message"=>"Congratulation,you have successfully Signed up in Unigigg.com");

					$this->n->send_mail($confirmation);

					$response = array("status"=>"success","error_type"=>"Successfully Registered.");
				}
				else {
					$response = array("status"=>"error","error_type"=>"Error in the Server.");
				}
			}
		}
		else
		{
			$response = array("status"=>"error","error_type"=>"post method is not working");
		}

		//$response = array("status"=>"error","error_type"=>"Email address has been previously registered.");
		//$response = array("status"=>"success","error_type"=>"Successfully Registered.");

		$this->response($response,200);
	}

	// for checking login or not
	public function session_get()
	{
		if($this->session->userdata('login') != NULL)
		{
			$res = $this->session->userdata('login');
		}
		else
		{
			$res = array("uid"=>"0");
		}

		$this->response($res,200);
	}

	// log out
	public function logout_get()
	{
		$this->load->model('candidate_login_model','c');

		$res = array("status"=>"success","error_type"=>"Successfully Logged Out.");

		if($this->c->session_destroying())
		{
			$response = array("status"=>"success","error_type"=>"Successfully Logged Out.");
		}
		else
		{
			$response = array("status"=>"error","error_type"=>"Error in the server");
		}

		$this->response($res,200);
	}

}




?>