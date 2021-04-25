# shinyapps.io_japanese_font

<div align="right">
タナカケンタ<br />
https://mana.bi/
</div>

<br /><br />
[shinyapps.io](https://www.shinyapps.io/)で、グラフィックスに日本語を使用する設定のサンプルです。詳しくは[shinyapps.ioで任意の日本語フォントを使う](https://mana.bi/wiki.cgi?page=shinyapps%2Eio%A4%C7%C7%A4%B0%D5%A4%CE%C6%FC%CB%DC%B8%EC%A5%D5%A5%A9%A5%F3%A5%C8%A4%F2%BB%C8%A4%A6)をご覧ください。

といっても、Shinyアプリ内で、各種フォントをダウンロードし、fontconfig (fc-cache) を実行するだけですが。

## Shinyアプリの例

コードは https://github.com/rstudio-education/shiny.rstudio.com-tutorial/blob/master/part-1-code/app.R をそのまま使いました。`iris` データを k-Means法でクラスタリングしている例です。

### 日本語フォントの設定をしていない例

* https://ltl-manabi.shinyapps.io/shinyappsio_without_japanese_font/

### IPAexフォントの使用例

* [IPAexフォント](https://moji.or.jp/ipafont/): 例のアプリでは使用していませんが、IPAex明朝 (IPAexMincho) も指定できます。
* https://ltl-manabi.shinyapps.io/shinyappsio_with_ipaex_font/

### 源ノフォントの使用例

* [源ノフォント](https://github.com/adobe-fonts/source-han-sans): 例のアプリでは使用していませんが、源ノ明朝 (Source Han Serif) も指定できます。
* https://ltl-manabi.shinyapps.io/shinyappsio_with_sourcehan_font/

### Notoフォントの使用例

* [Notoフォント](https://www.google.com/get/noto/): 例のアプリでは使用していませんが、Noto明朝 (Noto Serif CJK JP) も指定できます。
* https://ltl-manabi.shinyapps.io/shinyappsio_with_noto_font/

### ggplot2での使用例

* 上記3フォントに加え、手書きフォントの[瀬戸フォント](https://ja.osdn.net/projects/setofont/)を使用するよう設定しました。
* https://ltl-manabi.shinyapps.io/shinyappsio_with_japanese_font_ggplot2/

## ご自身のアプリでの使い方

このリポジトリにある各種フォントをダウンロード、展開するシェルスクリプトを、Shinyアプリ内で `download.file()` 関数で取得し、`system()` 関数で実行してください。

### IPAexフォントの例

```r
# IPAexフォントをダウンロード、登録する
download.file("https://raw.githubusercontent.com/ltl-manabi/shinyapps.io_japanese_font/master/use_ipaex_font.sh", destfile = "use_ipaex_font.sh")
system("bash ./use_ipaex_font.sh")

...

plot(..., family = "IPAexGothic")
```

### 源ノフォントの例

```r
# 源ノフォントをダウンロード、登録する
download.file("https://raw.githubusercontent.com/ltl-manabi/shinyapps.io_japanese_font/master/use_sourcehan_font.sh", destfile = "use_sourcehan_font.sh")
system("bash ./use_sourcehan_font.sh")

...

plot(..., family = "Source Han Sans")
```

### Notoフォントの例

```r
# Notoフォントをダウンロード、登録する
download.file("https://raw.githubusercontent.com/ltl-manabi/shinyapps.io_japanese_font/master/use_noto_font.sh", destfile = "use_noto_font.sh")
system("bash ./use_noto_font.sh")

...

plot(..., family = "Noto Sans CJK JP")
```

### 瀬戸フォントの例

```r
# Notoフォントをダウンロード、登録する
download.file("https://raw.githubusercontent.com/ltl-manabi/shinyapps.io_japanese_font/master/use_seto_font.sh", destfile = "use_seto_font.sh")
system("bash ./use_seto_font.sh")

...

plot(..., family = "SetoFont")
```
