# language: ja
フィーチャ: RubyKaigi2009への参加登録
  参加者として、
  rubykaigi.orgのページからPayPal経由でチケットを購入したい。
  購入が完了したら、参加者はrubykaigi.orgのサイトにて各参加者ごとで
  ユニークになる入場チケットの代わりになる「何か」を得ることができる。
  (画像ファイルでもいいんだけれど、PDFでもよいかもしれない)

  シナリオ: RubyKaigi2009の参加登録ページへのアクセス
    前提 言語は"英語"
	かつ ちょっとペンディング
	かつ RubyKaigi2009の"トップページ"にアクセスする
    もし "Registration"のリンクをクリックする
    ならば "RubyKaigi2009 Registration"が表示されていること


  シナリオ: RubyKaigi2009の参加登録ページへのアクセス
    前提 言語は"日本語"
	かつ ちょっとペンディング
	かつ RubyKaigi2009の"トップページ"にアクセスする
    もし "参加登録について"のリンクをクリックする
    ならば "RubyKaigi2009への参加登録"が表示されていること

  シナリオ: 言語の指定が抜けていた場合
    前提 言語は"英語"
	かつ ちょっとペンディング
    もし "/2009/registrations"にアクセスする
    ならば "RubyKaigi2009 Registration"が表示されていること

  シナリオ: BASIC認証経由でアクセス
    前提 "/2009/en/registrations"にアクセスする
    ならば "RubyKaigi2009 Registration"と表示されていないこと


  シナリオ: BASIC認証経由でアクセス
    前提 "admin"でBASIC認証している
	かつ "/2009/en/registrations"にアクセスする
    ならば "RubyKaigi2009 Registration"が表示されていること
