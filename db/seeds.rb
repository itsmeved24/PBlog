# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Make sure you have the 'open-uri' library required at the top
require 'open-uri'

# Clear existing records to prevent duplicates
puts "Destroying all posts and users..."
Post.destroy_all
User.destroy_all

# Create a template owner user
puts "Creating template owner user..."
template_user = User.create!(
  username: 'template_owner',
  email: 'template@example.com',
  password: 'password',
  password_confirmation: 'password'
)

# Function to attach a remote photo to a post
def attach_remote_photo(post, url, filename)
  begin
    post.photo.attach(
      io: URI.open(url),
      filename: filename,
      content_type: 'image/jpeg' # Assuming jpeg, but this is often auto-detected
    )
    puts "Attached #{filename} to post '#{post.title}'"
  rescue OpenURI::HTTPError => e
    puts "Could not attach #{filename}. Error: #{e.message}"
  rescue => e
    puts "An unexpected error occurred while attaching #{filename}: #{e.message}"
  end
end

# Array of posts with their corresponding image URLs
posts_to_create = [
  {
    title: "Vibrant Abstract Dimensions",
    content: "",
    image_url: "https://drive.google.com/uc?export=download&id=1zwgg2b10jjUWnMKlT8ssHlCtgWsnL_SJ",
    filename: "wallpaper-1.jpg"
  },
  {
    title: "Cyberpunk Cityscape at Night",
    content: "",
    image_url: "https://drive.google.com/uc?export=download&id=1Pif1G2q6zZwcpR9rbyhe4yT5MRnDwj7k",
    filename: "wallpaper-2.jpg"
  },
  {
    title: "Minimalist Design Philosophy",
    content: "",
    image_url: "https://drive.google.com/uc?export=download&id=1kHMi0T9HPcwVP7YWEG68wIfnRe2PlhCY",
    filename: "wallpaper-3.png"
  },
  {
    title: "The Solitude of the Cosmos",
    content: "",
    image_url: "https://drive.google.com/uc?export=download&id=1HHlD7YFeRr20B1El6dzC8gUpbii7SuYR",
    filename: "wallpaper-4.jpg"
  },
  {
    title: "Architectural Wonders",
    content: "",
    image_url: "https://drive.google.com/uc?export=download&id=15xTFmgCn2RXZOOyuRjHxZTXrO2EYctUe",
    filename: "wallpaper-5.jpg"
  },
  {
    title: "Nature's Unseen Patterns",
    content: "",
    image_url: "https://drive.google.com/uc?export=download&id=1pqn-mB_ErrXTl700cW91UmnsKlCasYpT",
    filename: "wallpaper-6.jpg"
  },
  {
    title: "The Art of Street Photography",
    content: "",
    image_url: "https://drive.google.com/uc?export=download&id=1q0XdTuJrnaDbYAoyJDJehp2w5me97l2e",
    filename: "wallpaper-7.jpg"
  }
]

puts "Seeding template posts..."
posts_to_create.each do |post_attrs|
  post = Post.new(
    title: post_attrs[:title],
    content: post_attrs[:content],
    user: template_user,
    is_template: true
  )
  
  # The attachment must happen before save for validation, or handle it after
  post.save! # Save the post first to get an ID
  attach_remote_photo(post, post_attrs[:image_url], post_attrs[:filename])
end

puts "Seeding complete. Created #{User.count} user and #{Post.count} posts."
