<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    

    <title>サツドラ拾得物管理表</title>
</head>
<body style="background:url(img/main_logo.png) no-repeat 0% 0%">
    <header>
        <h1><img src="img/logo.svg">拾得物管理表</h1>
            <nav class="navbar">
                <div class="navbar_conteiner">
                    <div class="navbar_header"><a href="select.php">拾得物一覧</a></div>
                    <div class="navbar_header"><a href="login.php">ログイン</a></div>
                    <div class="navbar_header"><a href="login.php">ログアウト</a></div>
                </div>
            </nav>
     </header>
        <form method="POST" action="insert.php">
            <p>No.: <input type="text" name="no"></p>
            <p>商品名: <input type="text" name="name"></p>
            <p>貴重品選択: 
                <select name='kityouhinn' class="form-select" placeholder="選択" aria-label="Default select example">
                    <option selected></option>
                    <option value="貴重品">貴重品</option>
                    <option value="貴重品以外">貴重品以外    </option>        
                </select>
            </p>
            <p>保管場所: <input type="text" name="hokann"></p>
            <p>備考: <input type="text" name="bikou"></p>
            <p>使用期限: <input type="text" name="kigenn"></p>
            <input type="submit" value="送信">
        </form>  
</body>
</html>

