class User < ActiveRecord::Base
   
   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy

   def before_save 
      self.email = self.email.downcase
   end
   
   before_save { self.role ||= :member }
   
   before_save :format_name

   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
   validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
   validates :password, length: { minimum: 6 }, allow_blank: true
   validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 254 }

   has_secure_password
   
   enum role: [:member, :admin]
   
   def format_name
      if name
         name_array = []
         name.split.each do |name_part|
            name_array << name_part.capitalize
         end
         self.name = name_array.join(" ")
      end
   end
end
