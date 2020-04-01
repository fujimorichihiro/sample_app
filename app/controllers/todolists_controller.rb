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
    list = List.new(list_params)
   #datebaseへ保存
    list.save
   #    ↓
   #トップ画面へリダイレクト
    redirect_to '/top'
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

#--------------------------↓ストロングパラメータ↓-----------------------------------------------------
  private #境界線、private以下はコントロ―ラの中でしか呼び出せない。
          #またprivateより後に定義されたメソッドはアクションとして認識されない！

  def list_params                               #フォームで入力されたデータを受け取り格納する。
    params.require(:list).permit(:title, :body) #params Railsで送られてきた値を受け取るメソッド
  end                                           #require データのオブジェクト名を指定
                                                #permitでキーを指定
                                                #params.require(:モデル名).permit(:カラム名1、カラム名2、、)

#----------------------------------------------------------------------------
end
