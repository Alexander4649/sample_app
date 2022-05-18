Rails.application.routes.draw do
  get 'lists/new'
  get '/top' => 'homes#top'
  post 'lists'=>'lists#create' #コントローラにフォームのデータを送信する際にHTTPメソッドである[POST(データの新規保存)]を使用する
  get 'lists'=>'lists#index' #作成した一覧表示データを表示するため
  get 'lists/:id' => 'lists#show' #詳細画面はどの投稿データを表示させるか判別する為、投稿データのidもURLに含めます
                                  #詳細画面で呼び出される投稿データはURLの/lists/:idで判別します。 :idはアクション内にparams[:id]で取得。
  get 'lists/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
