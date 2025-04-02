class AddUserToComments < ActiveRecord::Migration[8.0]
  def change
    
    add_reference :comments, :user, null: true, foreign_key: true

    # 既存のレコードにデフォルトユーザーを設定
    reversible do |dir|
      dir.up do
        # 既存のcommentsにデフォルトユーザーを設定
        execute <<-SQL
          UPDATE comments SET user_id = (SELECT id FROM users WHERE user_name = 'default_user')
        SQL

        # null制約を追加
        change_column_null :comments, :user_id, false
      end

      dir.down do
        remove_reference :comments, :user
      end
    end
  end
end
