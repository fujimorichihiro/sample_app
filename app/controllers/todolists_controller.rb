#コントローラ
#ルーティングから指示を受けアクションを確認
#modelを介してＤＢからでーたを取得、更新、保存、削除を行う
#取得したデータをviewに渡しHTMLを作成、それをコントローラがもう一度受け取りブラウザに渡す。など
class TodolistsController < ApplicationController
 #------------------------------------------------------------------------
 #-----------
  def new
    #Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end
#------------
  def create
   #ストロングパラメータ
    list = List.new(list_params) #ローカル変数,paramsでフォームからデータを受け取っている
   #datebaseへ保存
    list.save
   #    ↓
   #詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
  end
#-----------
  def index
  	@lists = List.all #すべてのデータをとりだす。
  end
#-----------
  def show
  	@list = List.find(params[:id])
  end
#-----------
  def edit
  	@list = List.find(params[:id])
  end
#-----------
def update
	list = List.find(params[:id])#dでーたを一件取得
  list.update(list_params)#fフォームからでーたを受け取り更新
	redirect_to todolist_path(list.id)
end

def destroy
	list = List.find(params[:id]) #データを一件取得
	list.destroy #削除
	redirect_to todolists_path #List一覧へリダイレクト
end

#--------------------------↓ストロングパラメータ↓-----------------------------------------------------
  private #境界線
          #privateより後に定義されたメソッドはアクションとして認識されずコントローラの中でしか呼び出せない！

  def list_params                               #フォームで入力されたデータを受け取り格納する。
    params.require(:list).permit(:title, :body, :image) #params Railsで送られてきた値を受け取るメソッド
  end                                           #require データのオブジェクト名を指定
                                                #permitでキーを指定
                                                #params.require(:モデル名).permit(:カラム名1、カラム名2、、)

#----------------------------------------------------------------------------
end


#複数のレコードを呼び出すときは@blogsのように複数形
#viewに渡す変数は@をつける、保存する場合はローカル変数にする。
#DBからのデータの取得は@list = List.find(list_params[id])
#フォームからデータを受け取る場合、変数を記述し(list_params)をつけることで受け取れる。
