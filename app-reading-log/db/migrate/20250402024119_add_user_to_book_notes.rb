class AddUserToBookNotes < ActiveRecord::Migration[8.0]
  def change
    # 一時的にnull制約を外してカラムを追加
    add_reference :book_notes, :user, null: true, foreign_key: true

    # 既存のレコードにデフォルトユーザーを設定
    reversible do |dir|
      dir.up do
        # デフォルトユーザーを作成
        execute <<-SQL
          INSERT INTO users (user_name, encrypted_password, created_at, updated_at)
          VALUES ('default_user', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj1ZxQQxq3re', datetime('now'), datetime('now'))
        SQL

        # 既存のbook_notesにデフォルトユーザーを設定
        execute <<-SQL
          UPDATE book_notes SET user_id = (SELECT id FROM users WHERE user_name = 'default_user')
        SQL

        # null制約を追加
        change_column_null :book_notes, :user_id, false
      end

      dir.down do
        remove_reference :book_notes, :user
      end
    end
  end
end
