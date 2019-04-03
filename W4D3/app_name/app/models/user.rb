class User < ApplicationRecord
    validates :username, :session_token, presence: true
    validates :password_digest, length: { minimum: 6, allow_nil: true}
    before_validation :ensure_session_token

    def self.find_by_credentials(username, password)
        #returns the user that matches
    end

    def self.generate_session_token
        #use SecureRandom::urlsafe_base64 and returns a 16-digit pseudorandom string
    end

    def reset_session_token
        #resets the user's session_token and saves the user
    end

    def ensure_session_token
        #makes sure that the user has a session_token set, setting one if none exists
    end

    def password=()
        #sets @password equal to the argument given so that the appropriate validation can happen
        #also encrypts the argument given and saves it as this user's password_digest
        #Remember: you have to add an attr_reader for password for the validation to occur!
    end

end
