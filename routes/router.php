<?php
DEFINE("TOKEN", "7c4a8d09ca3762af61e59520943dc26494f8941b");
function load(string $controller, string $action)
{
  try {
    // Check if the controller exists
    $controllerNamespace = "app\\controllers\\{$controller}";

    if (!class_exists($controllerNamespace)) {
      throw new Exception("The controller {$controller} does not exist");
    }

    $controllerInstance = new $controllerNamespace();

    if (!method_exists($controllerInstance, $action)) {
      throw new Exception(
        "The method {$action} does not exist in the controller {$controller}"
      );
    }
    if ((!isset($_REQUEST["token"]) ||  $_REQUEST["token"] != TOKEN) && $action != "index") {
      throw new Exception("Invalid token");
    }
    $controllerInstance->$action((object) $_REQUEST);
  } catch (Exception $e) {
    echo $e->getMessage();
  }
}

$router = [
  "GET" => [
    "/" => fn () => load("HomeController", "index"),

  ],
  "POST" => [
    "/store" => fn () => load("emailController", "store"),
    "/getbyid" => fn () => load("emailController", "getById"),
    "/update" => fn () => load("emailController", "update"),
    "/getall" => fn () => load("emailController", "getAll"),
    "/deletebyid" => fn () => load("emailController", "deleteById"),
  ],
];
