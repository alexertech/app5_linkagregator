class User < ApplicationRecord
    attr_accessor :password
    # validates_confirmation_of :password

    def self.authenticate(email, password)

        user = User.where(email: email).first

        if user && user.pass_hash == BCrypt::Engine.hash_secret(password, user.pass_salt)
            user
        else
            nil
        end
    end

end
