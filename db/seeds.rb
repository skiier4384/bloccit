require 'random_data'
 
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
   Post.create!(
     topic:  topics.sample,
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
 
 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"