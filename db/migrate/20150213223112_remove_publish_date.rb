class RemovePublishDate < ActiveRecord::Migration
  def up
    remove_column :articles, :publish_date
  end

  def down
  end
end
