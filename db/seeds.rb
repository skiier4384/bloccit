require 'random_data'

<<<<<<< HEAD
# Create Users
5.times do
 User.create!(
 name:     RandomData.random_name,
 email:    RandomData.random_email,
 password: RandomData.random_sentence
=======
 # Create Users
 5.times do
   User.create!(
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all
 
 # Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 # Create Posts
 50.times do |i|
   post = Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title: "#{i}_" + RandomData.random_sentence,
     body:  "#{i}_" + RandomData.random_paragraph
     
      post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
      rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
   )
 end
 
 post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
 #posts = Post.all
 #puts "#{Post.count} posts created"
 
 # Create Comments
 100.times do |i|
   Comment.create!(
     user: users.sample,
     post: posts.sample,
     body: "#{i}_" + RandomData.random_paragraph
   )
 end
 
 # Create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
>>>>>>> 43_checkpoint
 )
end

# Create an admin user
unless User.find_by(email: "admin@example.com")
  admin = User.create!(
    name: "Admin Example",
    email: "admin@example.com",
    password: "helloworld",
    role: "admin"
  )
  puts "created static Admin User."
  puts "Email: #{admin.email} Password: #{admin.password}"
else
  puts "Skipped creation of \"admin@example.com\""
end

# Create a member
unless User.find_by(email: "member@example.com")
  member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
  )
  puts "created static Member User."
  puts "Email: #{member.email} Password: #{member.password}"
else
  puts "Skipped creation of \"member@example.com\""
end
 
<<<<<<< HEAD
users = User.all
 
# Create Topics
15.times do
 Topic.create!(
   name:         RandomData.random_sentence,
   description:  RandomData.random_paragraph
 )
end
topics = Topic.all
puts "#{Topic.count} topics created"

# Create Posts
50.times do |i|
 Post.create!(
   topic:  topics.sample,
   user: users.sample,
   title: "#{i}_" + RandomData.random_sentence,
   body:  "#{i}_" + RandomData.random_paragraph
 )
end
posts = Post.all
puts "#{Post.count} posts created"


# Create Comments
100.times do |i|
 Comment.create!(
   post: posts.sample,
   user: users.sample,
   body: "#{i}_" + RandomData.random_paragraph
 )
end
puts "#{Comment.count} comments created"

puts "Seed finished"
=======
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Vote.count} votes created"
>>>>>>> 43_checkpoint
