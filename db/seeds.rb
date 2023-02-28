# Create 5 Gaming PCs
5.times do
  Product.create(
    name: "Gaming PC #{rand(1..100)}",
    description: "A powerful gaming PC for the ultimate gaming experience",
    price: rand(500..3000),
    product_type: "Gaming PC",
    pc_type: ["Laptop", "Desktop"].sample,
    pc_brand: ["Dell", "HP", "Asus", "Acer"].sample,
    bought_year: rand(2013..2023),
    cpu: ["Intel Core i7", "AMD Ryzen 7"].sample,
    gpu: ["Nvidia GeForce RTX 3080", "AMD Radeon RX 6800 XT"].sample,
    internal_storage: "#{rand(128..1024)} GB",
    ram: "#{rand(4..32)} GB",
    user: User.first
  )
end

# Create 5 Consoles
5.times do
  Product.create(
    name: "Console #{rand(1..100)}",
    description: "The latest gaming console for non-stop entertainment",
    price: rand(200..700),
    product_type: "Console",
    console_brand: ["Sony", "Microsoft", "Nintendo"].sample,
    console_model: ["Playstation 5", "Playstation 4", "Xbox Series S", "Xbox Series X", "Xbox One", "Nintendo Switch"].sample,
    console_submodel: ["Normal", "Pro", "Collector's Edition"].sample,
    bought_year: rand(2013..2023),
    user: User.first
  )
end

# Create 5 Games
5.times do
  Product.create(
    name: "Game #{rand(1..100)}",
    description: "An exciting game to keep you entertained for hours",
    price: rand(20..80),
    product_type: "Game",
    platform: ["Playstation 5", "Playstation 4", "Xbox Series S", "Xbox Series X", "Xbox One", "Nintendo Switch"].sample,
    user: User.first
  )
end

# Create a default user named Pokimane
User.create(
  email: "pokimane@example.com",
  password: "password"
)

# Assign each created product to the default user
Product.all.each do |product|
  product.user = User.first
  product.save
end

