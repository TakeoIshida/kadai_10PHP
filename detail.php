<?php
session_start();

$id = $_GET["id"];
require_once('funcs.php');
loginCheck();
$pdo = db_conn();

// id 一番の人だったら、その人が登録したデータ
// だけが欲しいので、DBに接続して検索をして表示するため
/**
 * １．PHP
 * [ここでやりたいこと]
 * まず、クエリパラメータの確認 = GETで取得している内容を確認する
 * イメージは、select.phpで取得しているデータを一つだけ取得できるようにする。
 * →select.phpのPHP<?php ?>の中身をコピー、貼り付け
 * ※SQLとデータ取得の箇所を修正します。
 */


// SQLを準備する記述を書きます
$stmt = $pdo->prepare('SELECT * FROM sd_shutoku WHERE id=:id;');

// sqlが安全かチエックする
$stmt->bindValue(':id',$id,PDO::PARAM_INT);

// sqlを実行
$status = $stmt->execute();  //成功？失敗

## 結果表示

$view = '';

if ($status === false) {
    sql_error($status);
} else {
    $result = $stmt->fetch();   //fetch 1行だけ取ってくるおまじない
}

?>
<!--
２．HTML
以下にindex.phpのHTMLをまるっと貼り付ける！
(入力項目は「登録/更新」はほぼ同じになるから)
※form要素 input type="hidden" name="id" を１項目追加（非表示項目）
※form要素 action="update.php"に変更
※input要素 value="ここに変数埋め込み"
-->
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>サツドラ拾得物一覧データ更新</title>
</head>
<body>
    <header>
    <h1>編集</h1>
        <nav class="navbar">
            <div class="navbar_conteiner">
                <div class="navbar_header"><a href="sd_shuutoku.php">新規登録</a></div>
                <div class="navbar_header"><a href="select.php">拾得物一覧</a></div>
                <div class="navbar_header"><a href="login.php">ログイン</a></div>
                <div class="navbar_header"><a href="logout.php">ログアウト</a></div>
            </div>
        </nav>
    </header>
        <form method="POST" action="insert.php">
            <p>No.: <input type="text" name="no" value="<?= $result['no'] ?>"></p>
            <p>商品名: <input type="text" name="name" value="<?= $result['name'] ?>"></p>
            
            
            <p>貴重品選択: 
                <select name='kityouhinn' class="form-select" placeholder="選択" aria-label="Default select example" value="<?= $result['kityouhinn'] ?>">
                    <option selected></option>
                    <option value="貴重品">貴重品</option>
                    <option value="貴重品以外">貴重品以外</option>
                </select>
            </p>

            <p>保管場所: <input type="text" name="hokann" value="<?= $result['hokann'] ?>"></p>
            <p>備考: <input type="text" name="bikou" value="<?= $result['bikou'] ?>"></p>
            <p>使用期限: <input type="text" name="kigenn" value="<?= $result['kigenn'] ?>"></p>
            <input type="submit" value="登録">
        </form>
            
            

    
</body>
</html>

