class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  after_create :send_favorite_emails
  
  def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
 
  private
 
  def send_favorite_emails
    post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
    end
  end
end
