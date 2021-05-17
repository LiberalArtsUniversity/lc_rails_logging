# LcRailsLogging

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/lc_rails_logging`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem "lc_rails_logging", git: 'https://github.com/LiberalArtsUniversity/lc_rails_logging.git'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install lc_rails_logging

## Usage
0. 導入前のGCP設定
https://cloud.google.com/logging/docs/setup/ruby
  - Cloud Logging API を有効にする
  https://console.cloud.google.com/flows/enableapi?apiid=logging.googleapis.com&_ga=2.182990053.2114394700.1621082467-1171139010.1610083469
  - サービスアカウントの作成
  https://console.cloud.google.com/iam-admin/serviceaccounts
  https://gyazo.com/4306a4d0d5d795d3e087e9733f202046
  - Logging管理者を選択する
  https://gyazo.com/f7ed714e4d4f5722b4612871bbbf7783
  - 秘密鍵の作成
  https://gyazo.com/a65c2bef7ab7e28a2adbddf0d8f913cf
  - 導入先プロジェクトへの導入
  秘密鍵の作成で生成したJSONを設置する

1. config/application.rbの設定
  ```
    config.google_cloud.logging.project_id = "copy-production" #プロジェクトIDを記入
    config.google_cloud.logging.keyfile    = "./copy-production-fc964d12e113.json" # 秘密鍵の作成で生成したJSONのpathを指定する
    config.google_cloud.use_logging = true
  ```
2. アプリ名の設定

config/initializers/lc_rails_logging.rb
にアプリ名を設定してください。
```
LcRailsLogging.configure do |config|
  config.app_name = 'libe-works'
end
```

3. ログの書き込み設定
app/controllers/application_controller.rb
```
def logging
  LcRailsLogging.send_log(request, current_user)
end
```
に共通methodを定義してください。

使いたいcontrollerに 
`before_action :logging` 
 と定義するとcontrollerのhttpリクエストを全てloggingします。
