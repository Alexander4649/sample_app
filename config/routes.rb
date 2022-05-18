Rails.application.routes.draw do
  get 'lists/new'
  get '/top' => 'homes#top'
  post 'lists'=>'lists#create' #コントローラにフォームのデータを送信する際にHTTPメソッドである[POST(データの新規保存)]を使用する
  get 'lists'=>'lists#index' #作成したデータを表示するため
  get 'lists/show'
  get 'lists/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
