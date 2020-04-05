#コントローラ
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
    list = List.new(list_params) #ローカル変数
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
	list = List.find(params[:id])
	list.update(list_params)
	redirect_to todolist_path(list.id)
end

def destroy
	list = List.find(params[:id]) #データを一件取得
	list.desroy #削除
	radirect_to todolists_path #List一覧へリダイレクト
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
