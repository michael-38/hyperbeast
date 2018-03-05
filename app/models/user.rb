class User < ActiveRecord::Base
    has_secure_password

    before_validation :downcase_email, :remove_whitespace

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    def self.authenticate_with_credentials(email, password)
        user = find_by_email(email.downcase.delete(' '))
            # If the user exists AND the password entered is correct.
        if user && user.authenticate(password)
            # Save the user id inside the browser cookie. This is how we keep the user 
            # logged in when they navigate around our website.
            user
        else
            nil
        end
    end


    private

    def downcase_email
    self.email = email.downcase if email.present?
    end

    def remove_whitespace
    self.email = email.delete(' ') if email.present?
    end

end
