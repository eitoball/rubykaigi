フィーチャ: CFPとスポンサーを日本語と英語で募集したい

  シナリオテンプレート: トップページで言語に応じた募集内容を表示する
    前提 言語は"<言語>"
    もし RubyKaigi2009の"トップページ"にアクセスする
    ならば "<イベント名>"が表示されていること
    かつ   "<言語ごとの文字列>"が表示されていること
    かつ   "<CFPタイトル>"が表示されていること
    かつ   "<スポンサー募集タイトル>"が表示されていること

    もし "Permalink"のリンクをクリックする
    ならば "<CFPタイトル>"が表示されていること

    例:
    |言語|イベント名|言語ごとの文字列|CFPタイトル|スポンサー募集タイトル|
    |ja-JP|日本Ruby会議2009|「変わる／変える」です。|プレゼンテーション募集概要|スポンサー募集について|
    |en-UP|RubyKaigi2009|RubyKaigi2009 will be held at Hitotsubashi|Call for presentations|Call for Sponsors|
    |zh-TW|RubyKaigi2009|RubyKaigi2009 will be held at Hitotsubashi|Call for presentations|Call for Sponsors|

  シナリオテンプレート: RubyKaigi2009での最初の募集ページの閲覧
    もし "/2009/<言語>/<ページ名>"にアクセスする
    ならば "<ページのタイトル>"が表示されていること

    例:
    |言語|ページ名|ページのタイトル|
    |ja  |CallForPresentations|プレゼンテーション募集概要|
    |en  |CallForPresentations|Call for presentations|
    |ja  |CallForSponsors|スポンサー募集について|
    |en  |CallForSponsors|Call for Sponsors|