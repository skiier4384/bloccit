class User < ActiveRecord::Base
   
  enum role: [:member, :admin]
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 254 }
   
  before_save { email = email.downcase if email.present? }
  
  has_secure_password
  
  def favorite_for(post)
     favorites.where(post_id: post.id).first
  end
end
