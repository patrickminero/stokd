# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Destroy all products'
p 'Destroy all companies'
Product.destroy_all
Company.destroy_all
User.destroy_all

user1 = User.create(email: 'test@email.com', password: 'asdasd', password_confirmation: 'asdasd')
user2 = User.create(email: 'test2@email.com', password: 'asdasd', password_confirmation: 'asdasd')
user3 = User.create(email: 'test3@email.com', password: 'asdasd', password_confirmation: 'asdasd')

categories = ['Shirt', 'Shoes', 'Pants', 'Sweater', 'T-shirt', 'Underwear', 'Sweatpants', 'Socks', 'Tie', 'Suits', 'Belt', 'Wallet']
colors = ['White', "Green", "Yellow", 'Blue', 'Brown', 'Grey', 'Black']
size = ['sm', 'md', 'lg', 'xl']
description = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum optio reprehenderit est ex dolorem ipsum! Voluptates omnis animi numquam ullam assumenda distinctio, vitae, magni dicta quis laboriosam dolorum. Dicta quas adipisci nam in commodi, explicabo aperiam. Rem dolore beatae deleniti commodi facere aliquid, odit voluptates adipisci dolorum sed? Tempora, soluta?'
Company.create!(name: 'My Cloathing Store', description: description, business_type: 'Retail', product_categories: categories, employees: [user1.id])
Company.create!(name: 'Zara', description: description, business_type: 'Retail', product_categories: categories, employees: [user2.id])
Company.create!(name: 'Primark', description: description, business_type: 'Retail', product_categories: categories, employees: [user3.id])

p "Created #{Company.count} companies"


categories.each do |category|
    
    30.times do
        company = Company.all.sample
        product = Product.create!(company_id: company.id, 
        description: description, 
        quantity: rand(30..100), 
        sku: rand(1000000..2000000).to_s, 
        name: "#{colors.sample} #{categories.sample}", 
        features: {'size': size.sample},
        category: company.product_categories.sample, price: rand(5.00..100.00).ceil(2))
        p "Created #{product.name}"
    end
end

p "Created #{Product.count} products"
