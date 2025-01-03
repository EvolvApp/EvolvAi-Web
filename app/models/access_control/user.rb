# app/models/access_control/user.rb
module AccessControl
  class User < ApplicationRecord
    has_secure_password

    before_save :downcase_email

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }

    private

    def downcase_email
      self.email = email.downcase
    end
  end
end
