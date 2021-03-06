class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many  :comments, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/  
end
