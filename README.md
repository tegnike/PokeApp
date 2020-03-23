[![CircleCI](https://circleci.com/gh/tegnike/PokeApp/tree/master.svg?style=svg)](https://circleci.com/gh/tegnike/PokeApp/tree/master)

# PokeApp
PokeAppは、育成したポケモンを管理するためのアプリです。<br>
今後は対戦結果を記録できる機能も実装する予定です。

## URL
https://nike-poke.herokuapp.com/

## 使用技術

### 言語・FW
* Ruby 2.5.3
* Rails 5.2.3
* SASS, Bootstrap, JQuery

### 開発環境
* Dockerfile/docker-compose.yml
  - Spring
* RSpec
* CircleCi
  - Githubへpush時 及び プルリク時の自動テスト

### 本番環境
* Heroku
* CircleCi
  - masterへのマージ時に自動デプロイ

## 機能一覧
* ユーザー登録、ログイン機能全般(devise)
* 画像アップロード(carrierwave)
* 私のポケモン投稿機能
* ページネーション(kaminari)
* 管理画面(rails_admin)
