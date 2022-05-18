Rails.application.routes.draw do
  get 'lists/new'
  post 'lists'=>'lists#create' #コントローラにフォームのデータを送信する際にHTTPメソッドである[POST(データの新規保存)]を使用する
  get 'lists/index'
  get 'lists/show'
  get 'lists/edit'
  get '/top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
