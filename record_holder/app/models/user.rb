class User < ActiveRecord::Base 
    has_many :records 

    has_secure_password 
end 