class CreateAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :authentications, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.datetime :created_at, null: false
    end

    add_index :authentications, [:provider, :uid], unique: true
  end
end
