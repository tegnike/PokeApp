class User < ApplicationRecord
  has_many :my_pokemons, dependent: :destroy

  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def get_image_url
     if image.url.blank?
       gravatar_id = Digest::MD5.hexdigest(email.downcase)
       "https://secure.gravatar.com/avatar/#{gravatar_id}"
     else
       image.url
     end
   end
end
