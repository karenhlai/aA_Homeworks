class User < ApplicationRecord
    validates :username, :session_token, presence: true
    validates :password_digest, length: { minimum: 6, allow_nil: true}
    validates :
    # before_validation :ensure_session_token
    after_initialize :ensure_session_token

    def self.find_by_credentials(username, password) 
        #returns the user that matches
        user = User.find_by(username: username)
        
        if user && user.password.is_password?(password) #if user is found, and password is encrypted
            return user  #found - Woohoo!
        else 
            nil #oh poo...
        end
    end

    def self.generate_session_token
        #use SecureRandom::urlsafe_base64 and returns a 16-digit pseudorandom string
        self.session_token = SecureRandom::urlsafe_base64
    end

    def reset_session_token
        #resets the user's session_token and saves the user
        self.session_token = SecureRandom::urlsafe_base64
        self.save! #updates DB with user's resstted session token
        self.session_token #return user's resetted session token 
    end

    def ensure_session_token
        #makes sure that the user has a session_token set, setting one if none exists
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def password=(password)
        #sets @password equal to the argument given so that the appropriate validation can happen
        #also encrypts the argument given and saves it as this user's password_digest
        #Remember: you have to add an attr_reader for password for the validation to occur!
        @password = password
        self.password_digest = Bcrypt::Password.create(password)
    end

end
