# Ruby on Rails の migration 検証

## 検証環境

* Ruby 2.7.2
* Ruby on Rails 6.0
* MySQL 5.7

## インストール

```
$ cp config/skel/database.yml config/
$ bundle
$ yarn
$ bin/rails db:setup
```
※ `config/database.yml`は書き換えてください。

## migrationの検証

`rake log`をつけて、`db:migrate`などを実行すると標準ログが表示されます。

`lib/tasks/log.rake`を参照してください。

### 1. usersテーブルの準備:100件追加
```
$ rake log db:migrate:reset db:seed
```

### 2. migrationファイルを準備
`db/migrate/20201210031813_alter_user`は、拡張子が付いていません。

`db/migrate/20201210031813_alter_user.rb`に変更します。

### 3. railsコンソールを準備
**別のコンソール**
```
$ bin/rails c
$ user = User.find(1)
$ user.name = 'name'
```

### 4. migrateを実行
```
$ rake log db:migrate
```
`2.`で準備したmigrationファイルが実行されます。

SLEEPを20秒間に設定しています。

### 5. railsコンソールでsave実行
`3.`のコンソールを使い
```
$ user.save!
```

### 6. もう一度行いたい場合
`db/migrate/20201210031813_alter_user.rb`を

`db/migrate/20201210031813_alter_user`に戻し。

`1.`から実行
