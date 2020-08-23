class User < ActiveRecord::Base 
    has_many :records 
    has_secure_password 
    validates_uniqueness_of :email, :username, :password_digest, presence: true 
end 