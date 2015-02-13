class Author < ActiveRecord::Base
  attr_accessible :email, :pw, :username
  validates :email, :presence => true
  validates :pw, :presence => true
  validates :username, :presence => true, :uniqueness => true
  has_many :articles
end
