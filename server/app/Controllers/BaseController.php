<?php
declare(strict_types=1);

namespace SurfRider\Controllers;

use Phalcon\Http\Response;
use Phalcon\Mvc\Controller;

class BaseController extends Controller
{
    public function success($data = []){
        $this->response->setStatusCode(200);
        return $this->toJson(['status'=>'ok', 'data'=>$data]);
    }
    public function error(string $msg = 'ok', $data = [], $status = 401){
        $this->response->setStatusCode($status);
        return $this->toJson(['status'=>'error', 'message'=> $msg, 'data'=>$data]);
    }


    public function toJson($data){
        $this->response->setJsonContent($data);
        
        return $this->response;
    }
}