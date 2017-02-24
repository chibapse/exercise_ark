# exercise_ark
Arkチュートリアルをやる

## Memo

* cpanm https://github.com/Konboi/p5-Module-Setup-Flavor-ArkDBIC/archive/master.tar.gz  すると、```LWP::Protocol::https```に関するエラーが出る。  

```
cpanm LWP::Protocol::https
```  

でインストール


* ```use v5.20.8```　は、```use v5.22.1```に変更した

* 4日目```script/migrate.pl```の実行でGitDLLがないというエラーが出る。

cpanfileにインストールするモジュールを記述して、```carton install```すればいいらしい。


* テーブルのスキーマを更新して```./script/migrate.pl```実行するとテーブルが存在するというエラーが出る

[ここ](https://github.com/massanex/ark/issues/30)を参考にするも解決せず。。。

→　とりあえず後でじっくり考える


