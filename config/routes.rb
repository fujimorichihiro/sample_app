Rails.application.routes.draw do

  get 'todolists/new' #
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top' #URL[top]にアクセスしたときhomesコントローラのtopアクションが呼び出される。

  post 'todolists' => 'todolists#create'

  get 'todolists' => 'todolists#index'

  get 'todolists/:id' => 'todolists#show', as: 'todolist'
end     #URL
#ルーティング
#---------------------------------------------------------------------------------
#ユーザーが特定のＵＲＬにアクセスしたときに、どのコントローラのどのアクションに振り分けるかを定義するファイル。
#→要するにURLとアクションを結びつける。
#HTTPメソッドを記述する。（get,post,delete....）
#GET Webページの取得
#POST URL以外のデータも送信して処理を命令
#DELETE URL以外のデータ削除の情報を送信して処理を命令
