<?php
namespace app\controllers;

use app\controllers\Controller;

class HomeController
{
  public function index($params)
  {
    return Controller::view("home");
  }
}
