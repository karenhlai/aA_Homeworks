class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest, length: { minimum: 6, allow_nil: true}
      t.string :session_token

      t.timestamps
    end
  end
end
