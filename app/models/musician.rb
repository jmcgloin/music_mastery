class Musician < ApplicationRecord
	has_secure_password :password, validations: false

	has_many :instruments
	has_many :mastery_tracks, through: :instruments
	has_many :pieces, through: :mastery_tracks

	accepts_nested_attributes_for :instruments

	validates :user_name, presence: { message: "A user name is required" }
	validates :user_name, uniqueness: { message: "That user name is already taken" }
	
	if !:github_uid
		validates :email, presence: { message: "A valid email is required to sign up" }
		validates :email, uniqueness: { message: "An account with that email already exists.  If you already have an account go to Log In" }
	end

	validate :bc_password_validations
	before_create :has_password_digest

	def self.find_or_create(auth_hash)
		musician = Musician.find_by(github_uid: auth_hash["uid"])
		if !musician
			user_name = auth_hash["info"]["nickname"]
      Musician.find_by(user_name: user_name) && (user_name += "-#{auth_hash["uid"]}")
      musician = Musician.create(
        user_name: user_name,
        email: auth_hash["info"]["email"],
        github_uid: auth_hash["uid"]
      )
    end
    musician
	end

	private

	def bc_password_validations
		!!github_uid && (return true)
		validates_confirmation_of :password, if: lambda { |m| m.password.present? }
		validates_presence_of     :password, :on => :create
		validates_presence_of     :password_confirmation, if: lambda { |m| m.password.present? }
	end

	def has_password_digest
		if !github_uid
			raise "Password digest missing on new record" if password_digest.blank?
		else
			true
		end
	end
	
end