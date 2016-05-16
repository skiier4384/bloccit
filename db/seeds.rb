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

# Create Admin User
unless User.find_by(email: 'admin@example.com')
  admin = User.create!(
    name: 'admin example',
    email: 'admin@example.com',
    password: 'helloworld',
    role: 'admin'
  )
  puts "created static Admin User."
  puts "Email: #{admin.email} Password: #{admin.password}"
else
  puts "Skipped creation of \"admin@example.com\""
end

unless User.find_by(email: "member@example.com")
  member = User.create!(
    name: "Member Example",
    email: "member@example.com",
    password: "helloworld"
  )
  puts "created static Member User."
  puts "Email: #{member.email} Password: #{member.password}"
else
  puts "Skipped creation of \"member@example.com\""
end

puts "#{User.count} users created."
users = User.all

#Create Labels
unless Label.all.any?
  label_names = %w(rogue red gold viper wolf bandit yellow blade blue dantooine)
  label_names.each do |label_name|
    Label.create!(
      name: label_name
      )
  end
end
labels = Label.all
 
# Create Topics
20.times do |i|
  Topic.create!(
    name:         "#{i}_" + RandomData.random_sentence,
    description:  "#{i}_" + RandomData.random_paragraph,
    public: rand(1..4) != 1,
    labels: labels.sample(rand(0..5)) 
  )
end
topics = Topic.all
puts "#{Topic.where(public: false).count} private topics created"
puts "#{Topic.count} topics created"

# Create Posts
50.times do |i|
  Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title: "#{i}_" + RandomData.random_sentence,
    body:  "#{i}_" + RandomData.random_paragraph,
    labels: labels.sample(rand(0..5)) 
  )
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end
posts = Post.all
puts "#{Post.count} posts created"

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

