<?php 

require __DIR__ . '/header.php'; 
require __DIR__ . '/../db.php';
require __DIR__ . '/../../csrf.php';
require __DIR__ . '/util.php';

if(isset($_POST['export']) && CSRF::validateToken($_POST['token'])) {
    exportDB($host, $name, $user, $password);
}

if(isset($_POST['import']) && CSRF::validateToken($_POST['token'])) {
    importDB($pdo);
}

if(isset($_POST['send-email']) && CSRF::validateToken($_POST['token'])) {
    $title = filter_input(INPUT_POST, 'title');
    $message = filter_input(INPUT_POST, 'message');
    if($_POST['flexRadioDefault'] == 'all') {
        $emails = array();
        $statement = $pdo->prepare("SELECT * FROM users");
        $statement->execute();
        $results = $statement->fetchAll(PDO::FETCH_ASSOC);
        foreach($results as $data) {
            $emails[] = $data['email'];
        }
        sendEmail($emails, $title, $message, $key);
    } else {
        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
        sendEmail(array($email), $title, $message, $key);
    }
}

$dateRange = array(
    gmdate('Y-m-d') . ' 00:00:00 GMT',
    gmdate('Y-m-d') . ' 22:59:59 GMT'
);
$statement = $pdo->query("SELECT count(*) FROM transactions WHERE timestamp >= '$dateRange[0]' AND timestamp <= '$dateRange[1]'");
$orderCount = $statement->fetchColumn();
$revenue = 0;
$statement = $pdo->prepare("SELECT * FROM transactions WHERE timestamp >= ? AND timestamp <= ?");
$statement->execute($dateRange);
$transactions = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach($transactions as $transaction) {
    $details = unserialize($transaction['details']);
    foreach($details as $detail) {
        $revenue += $detail['price'] * $detail['quantity'];
    }
}

$userCount = $pdo->query("SELECT count(*) FROM users")->fetchColumn();

?>

<!-- Animaciones AOS -->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css">

<!-- Mis Estilos -->
<link rel="stylesheet" href="css/estilos.css">

<div class="container">
    <div class="row">
        <div class="col-md-12 page-header">
            <div class="page-pretitle">Supervision</div>
            <h2 class="page-title">Inicio</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-md-6 col-lg-4 mt-3">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="icon-big text-center">
                                <i class="teal fas fa-shopping-cart"></i>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="detail">
                                <p class="detail-subtitle">Ordenes</p>
                                <span class="number"><?= $orderCount ?></span>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        <hr />
                        <div class="stats">
                            <i class="fas fa-calendar"></i> Actividad por hoy
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-4 mt-3">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="icon-big text-center">
                                <i class="olive fas fa-money-bill-alt"></i>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="detail">
                                <p class="detail-subtitle">Ganancias</p>
                                <span class="number">$ <?= number_format($revenue, 2) ?></span>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        <hr />
                        <div class="stats">
                            <i class="fas fa-calendar"></i> Resumen diario
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-4 mt-3">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="icon-big text-center">
                                <i class="grey fas fa-users"></i>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="detail">
                                <p class="detail-subtitle">Usuarios</p>
                                <span class="number"><?= $userCount ?></span>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        <hr />
                        <div class="stats">
                            <i class="fas fa-calendar"></i> Todo
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="content">
                            <div class="head">
                                <h5 class="mb-0">Detalles de movimientos</h5>
                                <p class="text-muted">Movimientos en los ultimos 7 dias</p>
                            </div>
                            <div class="canvas-wrapper">
                                <canvas class="chart" id="orders"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="content">
                            <div class="head">
                                <h5 class="mb-0">Detalles de ventas y ganancias</h5>
                                <p class="text-muted">Ventas en los ultimos 7 dias</p>
                            </div>
                            <div class="canvas-wrapper">
                                <canvas class="chart" id="revenue"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"></h5>
                    <div class="mb-3 row">
                        <label class="col-sm-2">Enviar correo - No activo <br>
                            <!-- <small class="text-info">Normal Bootstrap elements</small> -->
                        </label>
                        <form action="/admin/home" method="post">
                        <?php CSRF::csrfInputField() ?>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="radio1" value="all">
                                <label class="form-check-label" for="radio1">Todos los clientes</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="radio2" checked value="specify">
                                <label class="form-check-label" for="radio2">Especificar correo</label>
                            </div>
                            <div class="form-check" id="email-field">
                                <input type="email" name="email" placeholder="Email" class="form-control">
                            </div><br>
                            <div class="form-check">
                                <input type="text" name="title" placeholder="Title" class="form-control">
                            </div><br>
                          <!--  <div class="form-check">
                                <label class="form-label">Attachment</label>
                                <input class="form-control" name="attachment" type="file" id="formFile1">
                                <small class="text-muted"></small>
                            </div><br>-->
                            <div class="form-check">
                                <textarea style="resize:none" type="text" name="message" placeholder="Message..." class="form-control" rows="3"></textarea>
                            </div><br>
                            <div class="form-check">
                                <button type="submit" name="send-email" class="btn btn-primary col-sm-4">Enviar</button>
                            </div>
                        </form>
                        </div>
                    </div>
                    <div class="line"></div><br>
                    <div class="mb-3 row">
                        <label class="col-sm-2">Base de datos:</label>
                        <div class="col-sm-10">
                            <div class="mb-3 row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <form action="/admin/home" id="import-form" method="post">
                                            <div class="col-sm-1">
                                                <?php CSRF::csrfInputField() ?>
                                                <input type="file" name="file" id="file" required>
                                            </div><br>
                                            <div class="col-sm-12">
                                                <button name="import" type="submit" class="btn btn-secondary mb-2"><i class="fas fa-file-import"></i> Importar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <form action="/admin/home" method="post">
                                        <?php CSRF::csrfInputField() ?>
                                        <button name="export" type="submit" class="btn btn-primary mb-2"><i class="fas fa-file-export"></i> Exportar</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php require __DIR__ . '/footer.php'; ?>