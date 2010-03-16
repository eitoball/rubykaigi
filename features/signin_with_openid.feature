# language: ja
フィーチャ: OpenIDを使ってサインインする
  メールアドレスでactivationとか面倒なので、
  アカウントが無ければその場で作成される。
  テストにはopenid_fake_serverを利用。

  テンプレ: サインインページへの遷移
    前提 言語は"<言語>"
    かつ "トップページ"にアクセス
	かつ ちょっとペンディング
    もし "<サインインテキスト>"のリンクをクリックする
    ならば "<サインインページタイトル>"が表示されていること

  例:
    |言語|サインインテキスト|サインインページタイトル|
    |日本語|サインイン|サインイン|
    |英語|Sign in|Sign in|

  シナリオ: アカウントが無い状態でのサインイン
    前提 アカウント"kakutani"は存在しない
    かつ アカウント"kakutani"でのサインインを試みる
    かつ 言語は"英語"
    かつ "サインインページ"にアクセス

    もし OpenIDでrubykaigi.orgにサインイン
    かつ OpenID Providerで認証に成功する
    ならば "Sign up"と表示されていること
    かつ  OpenIDのURLが表示されていること

    もし "new_account"フォームを送信する
    ならば アカウントが作成されていること

  シナリオ: アカウントが存在する状態でサインインに成功する
    前提 アカウント"kakutani"が存在する
	かつ アカウント"kakutani"でのサインインを試みる
	かつ "サインインページ"にアクセス

	もし OpenIDでrubykaigi.orgにサインイン
    かつ OpenID Providerで認証に成功する
    ならば "Sign in successfully"と表示されていること


  シナリオ: OpenID Providerで認証に失敗する
    前提 アカウント"kakutani"でのサインインを試みる
    かつ "サインインページ"にアクセス

	もし OpenIDでrubykaigi.orgにサインイン
    かつ OpenID Providerで認証に失敗する
    ならば "Couldn't sign in"と表示されていること
