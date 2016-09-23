class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :apartments
  after_create :assign_role

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def assign_role
    add_role(:owner)
  end

  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.uid + "@twitter.com"
      #  user.password = Devise.friendly_token[0,20]
     end
   end

   def self.new_with_session(params,session)
     if session["devise.user_attributes"]
       new(session[devise.user_attributes], without_protection: true) do
         user.attributes = params
         user.valid?
       end
     else
       super
     end
   end

   def password_required?
     super && provider.blank?
   end

   def update_with_password(params, *options)
     if encrypted_password.blank?
       update_attributes(params, *options)
     else
      super
      end
    end
end
