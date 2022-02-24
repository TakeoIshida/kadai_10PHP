<?php
//1. POSTデータ取得
$no   = $_POST['no'];
$name  = $_POST['name'];
$kityouhinn = $_POST['kityouhinn'];
$hokann    = $_POST['hokann']; 
$bikou    = $_POST['bikou'];
$kigenn    = $_POST['kigenn'];
//2. DB接続します
require_once('funcs.php');
$pdo = db_conn();

//３．データ登録SQL作成
$stmt = $pdo->prepare('INSERT INTO sd_shutoku(no,name,kityouhinn,hokann,indate,bikou,kigenn)VALUES(:no,:name,:kityouhinn,:hokann,sysdate(),:bikou,:kigenn);');
$stmt->bindValue(':no', $no, PDO::PARAM_STR);
$stmt->bindValue(':name', $name, PDO::PARAM_STR);
$stmt->bindValue(':kityouhinn', $kityouhinn, PDO::PARAM_STR);
$stmt->bindValue(':hokann', $hokann, PDO::PARAM_STR);
$stmt->bindValue(':bikou', $bikou, PDO::PARAM_STR);
$stmt->bindValue(':kigenn', $kigenn, PDO::PARAM_STR);
$status = $stmt->execute(); //実行

//４．データ登録処理後
if ($status == false) {
    sql_error($stmt);
} else {
    redirect('sd_shuutoku.php');
}
?>
