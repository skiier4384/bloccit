require 'random_data'

# Create Users
5.times do
 User.create!(
 name:     RandomData.random_name,
 email:    RandomData.random_email,
 password: RandomData.random_sentence
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
    user:   users.sample,
    topic:  topics.sample,
    title: "#{i}_" + RandomData.random_sentence,
    body:  "#{i}_" + RandomData.random_paragraph
  )
end
posts = Post.all
puts "#{Post.count} posts created"

 
# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)

# Create Comments
100.times do |i|
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

puts "Seed finished"
