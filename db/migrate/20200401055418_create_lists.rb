#マイグレーションファイル

#テーブルの作成や変更を管理するファイル。
#同じ名前のテーブルとモデルが関連付けられる。

class CreateLists < ActiveRecord::Migration[5.2]
	def change
        create_table :lists do |t| #create_table :table名 do |t|
            t.string :title #t.データ型　:カラム名
            t.string :body
            t.timestamps
        end
    end
end
