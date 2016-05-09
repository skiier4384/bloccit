require 'random_data'

# Create Posts
50.times do |i|
  Post.create!(
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
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

# Create Questions
100.times do |i|
  Question.create!(
    title: "#{i}_" + RandomData.random_sentence,
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{Question.count} questions created"

puts "Seed finished"
