# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command.

# Create a dedicated user to own the templates
template_user = User.find_or_create_by!(email: 'templates@example.com') do |user|
  user.password = SecureRandom.hex(16)
  user.username = 'TemplateUser'
  puts "Created template owner user."
end

# Define template posts
template_posts = [
  {
    title: "Exploring the Serene Temples of Kyoto",
    content: "Discover the peace and beauty of ancient Japanese temples. This journey takes you through mossy gardens, towering pagodas, and tranquil koi ponds. A must-see for any traveler seeking a moment of calm.",
    image: "1.jpg"
  },
  {
    title: "Riding the Retro Wave",
    content: "A dive into the aesthetics of synthwave and retro-futurism. The iconic imagery of a setting sun, palm trees, and classic cars creates a powerful sense of nostalgia for a future that never was.",
    image: "2.jpg"
  },
  {
    title: "The Way of the Warrior",
    content: "A look into the discipline and artistry of the samurai. This post explores the history, philosophy, and enduring legacy of Japan's legendary warriors, whose code of honor continues to inspire.",
    image: "3.jpg"
  },
  {
    title: "Neon Nights in a Cyberpunk City",
    content: "The vibrant, rain-slicked streets of a futuristic city come alive after dark. Towering skyscrapers, glowing advertisements, and hidden alleyways create a world of high-tech marvels and noir mysteries.",
    image: "4.jpg"
  },
  {
    title: "The Mark of the Akatsuki",
    content: "A symbol recognized by fans worldwide. The red cloud represents the rain of blood that fell in Amegakure during its wars, and serves as a reminder of the pain that drives this shadowy organization.",
    image: "5.jpg"
  },
  {
    title: "The Anti-Coding Coding Club",
    content: "A tongue-in-cheek look at developer culture. Sometimes, the best code is the code you don't write. This post celebrates the art of simplicity, refactoring, and finding elegant solutions to complex problems.",
    image: "6.jpg"
  },
  {
    title: "A Journey into Abstract Patterns",
    content: "Exploring the mesmerizing world of generative art. These intricate, flowing patterns are created by algorithms, blending mathematics and creativity to produce something truly unique and beautiful.",
    image: "7.jpg"
  }
]

puts "Seeding template posts..."

template_posts.each do |post_attrs|
  # Find existing template post or create a new one
  post = Post.find_or_initialize_by(title: post_attrs[:title], user: template_user)

  # Only proceed if it's a new record to avoid re-attaching photos
  if post.new_record?
    post.content = post_attrs[:content]
    post.is_template = true
    
    image_path = Rails.root.join('app', 'assets', 'images', 'seed_photos', post_attrs[:image])
    if File.exist?(image_path)
      post.photo.attach(
        io: File.open(image_path),
        filename: post_attrs[:image]
      )
    else
      puts "Warning: Image not found at #{image_path}"
    end
    
    post.save!
    puts "Created template post: #{post.title}"
  end
end

puts "Seeding complete."
