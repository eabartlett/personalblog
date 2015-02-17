class User < ActiveRecord::Base
  attr_accessible :name, :admin, :facebook_auth, :twitter_auth, :twitter_id, :facebook_id, :email, :nickname, :image, :is_author
  validates :twitter_id, :uniqueness => true
  validates :facebook_id, :uniqueness => true
  validates :name, :presence => true
  has_many :articles

  def User.create_or_find(oauth_hash)
    uid = UsersHelper.extract_uid(oauth_hash)
    user = send("find_by_#{oauth_hash[:provider]}_id", uid)
    return user if user
    new_user = new(UsersHelper.extract_user_fields(oauth_hash).merge({:is_author => true}))
    return new_user if new_user.save
    nil
  end

  def user_id
    twitter_id or facebook_id
  end
end
