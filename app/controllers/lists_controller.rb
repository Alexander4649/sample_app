class ListsController < ApplicationController
  
  def new #新規投稿していく為のアクション
    @list = List.new  #Viweへデータを渡す為のインスタンス変数に空のModelオブジェクトを生成する。
  end
  
  def create
    list = List.new(list_params)   #1.&2. データを受け取り新規登録をするためのインスタンス作成
                                   # list変数にはList(Model)のメソッドであるnewメソッドが呼び出され、引数list_paramsが呼び出される。
                                   # 保存機能の為、ローカル変数を利用している。
    list.save                      #3. 呼び出したModelインスタンスデータをデータベースに保存するためのsaveメゾット実行
    redirect_to list_path(list.id) #4. トップ画面へリダイレクト
  end

  def index # 一覧表示アクション、今回は一覧画面に投稿したList全てを表示させるので全データを取得する
   @lists = List.all # @listsはインスタンス変数、allはメソッドの一種で、listsテーブルに保存されている全データを取得する。
                     # 取得したデータを@lists(インスタンス変数)に代入するという意味
  end

  def show
    @list = List.find(params[:id]) #findメソッドは引数を受取り、idカラムを引数と比べてレコード取得する。URL毎に取得するレコードを変えれる。
  end

  def edit
    @list = List.find(params[:id]) #投稿済みのデータを編集するので保存されているデータを見つける為にfindメソッドを使用する。
  end
  
  def update
    list = List.find(params[:id])  # 更新機能の為のアクション、updateアクションを作成する。
    list.update(list_params)       # showアクションにリダイレクトする為に、引数には必ずidが必要になります。
    redirect_to list_path(list.id) # idを付ける事で、どのデータを詳細画面で表示させるかを決定しています。
  end
  
  def destroy
    list = List.find(params[:id]) # データ(レコード)を1件取得
    list.destroy #データ(レコード)を削除
    redirect_to'/lists' #投稿一覧画面へリダイレクト
  end
  
  private #privateとは一種の境界線で「ここから下はこのcontrollerの中でしか呼び出せません」という意味がある。
          #ストロングパラメータ...マスアサインメント脆弱性を防ぐパラメータ
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
