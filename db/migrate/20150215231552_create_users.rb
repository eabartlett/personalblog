class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.boolean :twitter_auth
      t.boolean :facebook_auth
      t.integer :twitter_id
      t.integer :facebook_id
      t.boolean :admin
      t.text :email
      t.text :nickname
      t.text :image

      t.timestamps
    end
  end
end
