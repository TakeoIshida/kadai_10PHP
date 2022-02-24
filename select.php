<?php
session_start();
//1.  DB接続します
// try {
//   //ID:'root', Password: 'root'
//   $pdo = new PDO('mysql:dbname=gs_db;charset=utf8;host=localhost','root','root');
// } catch (PDOException $e) {
//   exit('DBConnectError:'.$e->getMessage());
// };
require_once('funcs.php');
loginCheck();
$pdo = db_conn();

//２．データ取得SQL作成
$stmt = $pdo->prepare("SELECT * FROM sd_shutoku");
$status = $stmt->execute();

//３．データ表示
$view="";
if ($status==false) {
    //execute（SQL実行時にエラーがある場合）
  $error = $stmt->errorInfo();
  exit("ErrorQuery:".$error[2]);

}else{
  //Selectデータの数だけ自動でループしてくれる
  //FETCH_ASSOC=http://php.net/manual/ja/pdostatement.fetch.php
  while( $result = $stmt->fetch(PDO::FETCH_ASSOC)){
    $view .= '<p>';
    $view .= '<a href="detail.php?id='. $result["id"].'">';
    $view .= "No.".h($result['id']).'<br>'."●拾得日：".$result["indate"] .'<br>'."拾得物:".$result["name"] .'<br>'."貴重品/貴重品以外:". $result["kityouhinn"] .'<br>'."保管場所:". $result["hokann"] .'<br>'."備考:". $result["bikou"].'<br>'."使用期限:".$result["kigenn"];
    $view .= '</a>'.'<br>';
    //削除よう
    $view .= '<a href="delete.php?id=' . $result['id'] . '">';//追記
    $view .= '[削除]';//追記
    $view .= '</a>';//追記
    $view .= '</p>';
  };

};
?>


<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>拾得物一覧</title>
<link rel="stylesheet" href="css/range.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>div{padding: 10px;font-size:16px;}</style>
</head>

<body id="main" style="background:url(img/main_logo.png) no-repeat 0% 0%">
<!-- Head[Start] -->
<header>
<h1><img src="img/logo.svg">拾得物一覧</h1>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
      <a class="navbar-brand" href="sd_shuutoku.php">データ登録</a>
      </div>
    </div>
  </nav>
</header>
<!-- Head[End] -->

<!-- Main[Start] -->
<div>
    <div class="container jumbotron"><?= $view ?></div>
</div>
<!-- Main[End] -->

</body>
</html>
