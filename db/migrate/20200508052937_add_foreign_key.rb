class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    # rollback実行時は処理を反転させて勝手に実行されてしまうため、外部キーであるuser_idが無ければrollback時にエラーが生じる
    # postsテーブルに外部キーであるuser_idを追加
    add_reference :posts, :user, foreign_key: true
  end
end
