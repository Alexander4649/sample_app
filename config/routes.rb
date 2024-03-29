Rails.application.routes.draw do
  get 'lists/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :lists
  get '/top' => 'homes#top'
  post 'lists'=>'lists#create' #コントローラにフォームのデータを送信する際にHTTPメソッドである[POST(データの新規保存)]を使用する
  get 'lists'=>'lists#index' #作成した一覧表示データを表示するため
  get 'lists/:id' => 'lists#show',as:'list' #詳細画面はどの投稿データを表示させるか判別する為、投稿データのidもURLに含めます
                                  #詳細画面で呼び出される投稿データはURLの/lists/:idで判別します。 :idはアクション内にparams[:id]で取得。
                                  # as: オプションを追加することで'lists#show'の設定を'list'として利用するという
  get 'lists/:id/edit' => 'lists#edit',as: 'edit_list' #ルーティングのURLに:idを記述すると、lists/●●/editの全てのURLが対象になる。
  patch 'lists/:id' => 'lists#update', as: 'update_list' #更新のHTTPメソッドはPTACHで指定します。 URLはlists/:id、名前付パスはupdate_list
  delete 'lists/:id' => 'lists#destroy',as:'destroy_list' #削除機能のHTTPメソッドはdestroyで指定します。 URLはlists/:id、名前付パスはdestroy_list

end
