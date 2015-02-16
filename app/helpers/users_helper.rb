module UsersHelper
  def UsersHelper.extract_uid(oauth_hash)
    oauth_hash[:uid]
  end

  def UsersHelper.extract_user_fields(oauth_hash)
    {
        :name => oauth_hash[:info][:name],
        "#{oauth_hash[:provider]}_auth".to_sym => true,
        "#{oauth_hash[:provider]}_id".to_sym => oauth_hash[:uid],
        :admin => false,
        :email => oauth_hash[:info][:email],
        :nickname => oauth_hash[:info][:nickname],
        :image => oauth_hash[:info][:image]

    }
  end

end
