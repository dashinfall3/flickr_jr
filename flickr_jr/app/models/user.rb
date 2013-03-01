class User < ActiveRecord::Base
  has_many :albums

  before_create :encrypt_password

  def self.authenticate(username, password)
    user = User.where(:password => Digest::MD5.hexdigest(password),
                      :username => username).first
    return user if user
    false
  end

  def encrypt_password 
    self.password = Digest::MD5.hexdigest(self.password)
  end
end
