 class Label < ActiveRecord::Base
   has_many :labelings
   has_many :topics, through: :labelings, source: :labelable, source_type: :Topic
   has_many :posts, through: :labelings, source: :labelable, source_type: :Post
   
   def self.update_labels(label_string)
     
     return Label.none if label_string.blank?
     
     label_string.split(",").map do |label|
       Label.find_or_create_by(name: label.strip)
     end
   end
   
   def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end
 end