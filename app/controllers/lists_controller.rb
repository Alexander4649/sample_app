class ListsController < ApplicationController
  
  def new #新規投稿していく為のアクション
    #Viweへデータを渡す為のインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end
  
  def create
    #1.&2. データを受け取り新規登録をするためのインスタンス作成
    #list変数にはList(Model)のメソッドであるnewメソッドが呼び出され、引数list_paramsが呼び出される。
    #保存機能の為、ローカル変数を利用している。
    list = List.new(list_params)
    #3. 呼び出したModelインスタンスデータをデータベースに保存するためのsaveメゾット実行
    list.save
    #4. トップ画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index # 一覧表示アクション、今回は一覧画面に投稿したList全てを表示させるので全データを取得する
   @lists = List.all # @listsはインスタンス変数、allはメソッドの一種で、listsテーブルに保存されている全データを取得する。
                     # 取得したデータを@lists(インスタンス変数)に代入するという意味
  end

  def show
    @list = List.find(params[:id]) #findメソッドは引数を受取り、idカラムを引数と比べてレコード取得する。URL毎に取得するレコードを変えれる。
  end

  def edit
  end
  
  #privateとは一種の境界線で「ここから下はこのcontrollerの中でしか呼び出せません」という意味がある。
  private
  #ストロングパラメータ...マスアサインメント脆弱性を防ぐパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
