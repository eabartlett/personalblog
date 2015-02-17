class Article < ActiveRecord::Base
  attr_accessible :text, :title, :user_id
  validates :text, :presence => true
  validates :title, :presence => true
  belongs_to :user

end
