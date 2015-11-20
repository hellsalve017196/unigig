<?php

class candidate_login_model extends CI_Model
{
    public function sign_up($data)
    {
        $flag = false;

        if($this->db->insert('student_basic',array("s_email"=>$data['email'],"s_password"=>$data['password'],"s_name"=>$data['name'],"s_phone"=>$data['phone'],"s_address"=>$data['address'])))
        {
            $data['s_id'] = $this->db->insert_id();

            $this->session_creating($data);
            $flag = true;
        }

        return $flag;
    }

    public function log_in($data)
    {
        $flag = false;

        $query = $this->db->get_where('student_basic',$data);

        if($query->num_rows() == 1)
        {
            $data = $query->row_array();

            $temp = array("name"=>$data['s_name'],"email"=>$data['s_email'],"s_id"=>$data['s_id']);

            $this->session_creating($temp);

            $flag = true;
        }

        return $flag;
    }

    public function session_creating($data)
    {
        $flag = false;

        if($this->session->set_userdata('login',array('uid'=>$data['s_id'],'name'=>$data['name'],'email'=>$data['email'])))
        {
            $flag = true;
        }

        return $flag;
    }

    public function session_destroying()
    {
        $flag = true;

        $this->session->unset_userdata('login');

        return $flag;
    }

    public function used_email_check($data)
    {
        $flag = false;

        if($this->db->get_where('student_basic',array('s_email'=>$data['email']))->num_rows() > 0)
        {
            $flag = true;
        }

        return $flag;
    }

}


?>