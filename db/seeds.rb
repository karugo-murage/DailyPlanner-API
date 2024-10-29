# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
User.destroy_all
Todo.destroy_all
Donation.destroy_all

# Seed Users
users = [
  { first_name: "John", last_name: "Doe", username: "johndoe", email: "johndoe@example.com", gender: "male", password: "password" },
  { first_name: "Jane", last_name: "Smith", username: "janesmith", email: "janesmith@example.com", gender: "female", password: "password" },
  { first_name: "Alice", last_name: "Johnson", username: "alicej", email: "alicej@example.com", gender: "female", password: "password" },
  { first_name: "Bob", last_name: "Brown", username: "bobbrown", email: "bobbrown@example.com", gender: "male", password: "password" },
  { first_name: "Charlie", last_name: "Davis", username: "charlied", email: "charlied@example.com", gender: "male", password: "password" }
]

users.each do |user_data|
  user = User.create!(user_data)

  # Seed Todos for each user
  5.times do |i|
    user.todos.create!(task: "Task #{i + 1} for #{user.username}", completed: [true, false].sample)
  end

  # Seed Donations for each user
  3.times do
    user.donations.create!(amount: rand(10..100), payment_method: ["Credit Card", "PayPal", "M-Pesa"].sample)
  end
end

puts "Seeding completed!"

