<?php

/**
 * Local variables
 * @var \Phalcon\Mvc\Micro $app
 */

/**
 * Add your routes here
 */
$app->get('/', function () {
    echo $this['view']->render('index');
});

foreach(glob(BASE_PATH . '/config/routes/*.php') as $file)
    $app->mount(require $file);

/**
 * Not found handler
 */
$app->notFound(function () use($app) {
    $app->response->setStatusCode(404, "Not Found")->sendHeaders();
    echo $app['view']->render('404');
});

// $app->error(
//     function ($e) {
//         header('Content-Type: application/json');
//         http_response_code($e->getCode() ?: 401);

//         echo json_encode(
//             [
//                 'code'    => $e->getCode(),
//                 'status'  => 'error',
//                 'message' => $e->getMessage(),
//             ]
//         );
//     }
// );