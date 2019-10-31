class Musician < ApplicationRecord
	has_many :instruments
	has_many :mastery_tracks, through: :instruments
	has_many :pieces, through: :mastery_tracks

	has_secure_password

	validates :user_name, presence: { message: "A user name is required" }
	validates :user_name, uniqueness: { message: "That user name is already taken" }
	validates :email, presence: { message: "A valid email is required to sign up" }
	validates :email, presence: { message: "An account with that email already exists.  If you already have an account go to Log In" }
	validates :password, presence: { message: "While this isn't a bank, c'mon!  Be serious!" }

end
