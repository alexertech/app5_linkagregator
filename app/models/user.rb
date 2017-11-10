class User < ApplicationRecord
    attr_accessor :password
    validates_confirmation_of :password


    # def self.authenticate(username, password)

    #     user = User.where(username: username).first
    #     if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    #         user
    #     else
    #         nil
    #     end
    # end

end
