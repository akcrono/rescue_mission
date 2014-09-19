class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.integer :uid, null: false
      t.string :provider, null: false
      t.string :avatar_url

      t.timestamps
    end
  end
end
