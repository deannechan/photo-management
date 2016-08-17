class User < ActiveRecord::Base
  def self.new_user(options)
    errors = []
    options[:password_salt] = User.generate_salt
    options[:password_hash] = User.hash_secret(options[:password], options[:password_salt])
    options.delete(:password)
  	user = User.create(options)
    {
      user: user,
      errors: errors ? errors : [],
    }
  end

  def self.authenticate(username, password)
    user_query = User.where(username: username).first
    user = nil
    errors = []
    if user_query.present? && user_query.password_hash == BCrypt::Engine.hash_secret(password, user_query.password_salt)
      user = user_query
      user.session_uuid = SecureRandom.uuid
      user.save
    else
      errors << "Invalid Login."
    end
    {
      user: user,
      errors: errors ? errors : [],
    }
  end

  def self.hash_secret(password, salt)
    BCrypt::Engine.hash_secret(password, salt)
  end

  def self.generate_salt
    BCrypt::Engine.generate_salt
  end
end
