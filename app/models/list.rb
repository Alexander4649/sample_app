class List < ApplicationRecord
  has_one_attached :image # Listモデルにtitleとbodyに加えて画像を扱う為のimageカラムが追記されたかのうように扱う事ができる。
end
