<?php $this->layout("master"); ?>
<style>
  body {
    background-color: #000917;
  }

  .container-content {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .card-transparent {
    min-width: 700px;
    width: 700px;
    height: 300px;
    position: relative;
    margin: 0 auto;
    background: #121214;
  }

  .card-inner {
    padding: 20px;
    width: inherit;
    height: inherit;
    background-color: #0a58ca12;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.25);
    backdrop-filter: blur(10px);
    border-radius: 8px;
  }

  .ball {
    width: 150px;
    height: 150px;
    background-color: #1abc9c;
    border-radius: 50%;
    position: absolute;
    left: -50px;
    top: -50px;
    animation: move 3s ease-in infinite alternate-reverse;
  }

  @keyframes move {
    to {
      transform: translate(150px, 250px);
    }
  }
</style>
<div class="container container-content">
  <div class="row">
    <div class="col-md-12 mx-auto">
      <div class="card-transparent">
        <div class="ball"></div>
        <div class="card-inner">
          <h1 class="text-white ">
            Hello, inflektion team! ✌️
          </h1>
          <p class="text-white">
            My name is Willian, and it's a pleasure for me to send this challenge.
          </p>
          <div class="accordion" id="accordionExample">
            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  About the project
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <p>For this project, I used the <b>Plates</b> library to render the views and the <b>Router</b> to manage the routes. I hope you enjoy it!</p>
                  <span>To run the project, you need to execute the command <b>composer update</b>. After that, run <b>php -S localhost:8000 -t public</b>.</span>
                  <span>It's necessary to create a database called <b>"successful_emails"</b> and a table named <b>"successful_emails"</b> with the fields <b>id</b>, <b>email</b>, and <b>raw_text</b>.</span>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  Endpoints
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <span>Method POST</span>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item">Store: <a class="text-decoration-none text-black fw-bold" href="<?= $_SERVER['HTTP_HOST'] ?>/store"><?= $_SERVER['HTTP_HOST'] ?>/store</a></li>
                    <li class="list-group-item">GetById: <a class="text-decoration-none text-black fw-bold" href="<?= $_SERVER['HTTP_HOST'] ?>/getbyid"><?= $_SERVER['HTTP_HOST'] ?>/getbyid</a></li>
                    <li class="list-group-item">GetAll: <a class="text-decoration-none text-black fw-bold" href="<?= $_SERVER['HTTP_HOST'] ?>/getall"><?= $_SERVER['HTTP_HOST'] ?>/getall</a></li>
                    <li class="list-group-item">Update: <a class="text-decoration-none text-black fw-bold" href="<?= $_SERVER['HTTP_HOST'] ?>/update"><?= $_SERVER['HTTP_HOST'] ?>/update</a></li>
                    <li class="list-group-item">Store: <a class="text-decoration-none text-black fw-bold" href="<?= $_SERVER['HTTP_HOST'] ?>/store"><?= $_SERVER['HTTP_HOST'] ?>/store</a></li>
                    <li class="list-group-item">DeleteById: <a class="text-decoration-none text-black fw-bold" href="<?= $_SERVER['HTTP_HOST'] ?>/store"><?= $_SERVER['HTTP_HOST'] ?>/deletebyid</a></li>
                  </ul>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>