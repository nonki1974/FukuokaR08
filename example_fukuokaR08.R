#
# example.R @ fukuoka.R#08
# 2017/07/07 @nonki1974
#

# 正規乱数を6個生成
rnorm(6)

# 数値も長さ1のベクトル
3+4

# 変数への代入
x <- rnorm(2)
x

# ベクトルの作成
y <- c(3, 4.5)
y

# 行列・配列
dim(x) <- c(2,3)
x

# 要素の参照
x[2, 3]

# ベクトルとしても扱える
x[5]

# リスト
date <- "2017-07-07"
name <- c("コイキング", "イーブイ")
cp <- c(23, 182)

pokemon <- list(date=date, name=name, cp=cp)
pokemon

# 要素名による要素の参照
pokemon$name
# 要素番号で
pokemon[[2]]
# []ならリストが返ってくる
pokemon[2]

# データフレーム
name <- c("コイキング", "イーブイ", "フシギダネ")
cp <- c(23, 182, 128)
weight <- c(7.95, 7.54, 6.95)
height <- c(0.78, 0.32, 0.65)
df <- data.frame(name, cp, weight, height)
df

# 要素の参照
df$cp
# 列の参照
df[,2]
# 行の参照
df[1,]

# 列名の参照
colnames(df)

# 行名の参照
rownames(df)

# csvファイルの読み込み

# 作業ディレクトリの設定
# csvファイルをそこに置いておく
setwd("~/temp/rwork")

# 読み込み
pokemon <- read.csv("pokemon.csv")

# 最初の数行を表示
head(pokemon[,c("id","name","CP","weight","height")])

# 要約
summary(pokemon)

# 散布図
plot(height~weight, data=pokemon)

# ヒストグラム
hist(pokemon$CP)

# パッケージのインストール
# 初回利用時のみでOK
install.packages(c("ggplot2", "dplyr"))

# パッケージのロード
library(ggplot2)
library(dplyr)

# パッケージ利用例
# type1ごとのweightとheightの平均を計算し、散布図を作成
pokemon %>%
  select(CP, weight, height, type1) %>%
  group_by(type1) %>%
  summarise_all(mean) %>%
  ggplot(aes(weight, height, label=type1)) +
  geom_text(aes(color=type1), size=8) +
  theme_bw(base_size=20) +
  theme(legend.position="none")
