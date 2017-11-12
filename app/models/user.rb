class User < ApplicationRecord
    attr_accessor :password
    validates_confirmation_of :password

    # We need to add a method to the user object for authentication
    def self.authenticate(email, password)

        # First check the email, if exists
        user = User.where(email: email).first

        # Now we grab the salt of the user, and encrypt the password
        # if the new hash matches the one in the DB, the login is successful
        if user && user.pass_hash == BCrypt::Engine.hash_secret(password, user.pass_salt)
            user
        else
            nil
        end
    end

end
