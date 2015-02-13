class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.datetime :publish_date
      t.belongs_to :author, index: true
      t.timestamps
    end
  end
end
