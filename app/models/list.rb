class List < ApplicationRecord
  has_one_attached :image # Listモデルにtitleとbodyに加えて画像を扱う為のimageカラムが追記されたかのうように扱う事ができる。
  
  #validates :title, presence: true # validates(バリデーション設定)で対象となる項目を設定し、入力されたデータのpresence(存在)をチェックする。
  #validates :body, presence: true　 # trueと記述する事でデータが存在しなければならないと設定
  #validates :image, presence: true　# こちらの機能をコントローラで検出できるようにしていく⇨コントローラへ

  validates :title, presence: true
  validates :body, presence: true
  alidates :image, presence: true
end
