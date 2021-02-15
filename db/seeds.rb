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


categories = ['Shirt', 'Shoes', 'Pants']
colors = ['White', "Red", "Yellow"]
size = ['sm', 'md', 'lg', 'xl']
description = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum optio reprehenderit est ex dolorem ipsum! Voluptates omnis animi numquam ullam assumenda distinctio, vitae, magni dicta quis laboriosam dolorum. Dicta quas adipisci nam in commodi, explicabo aperiam. Rem dolore beatae deleniti commodi facere aliquid, odit voluptates adipisci dolorum sed? Tempora, soluta?'
nike = Company.create!(name: 'nike inc', description: description, business_type: 'Retail', product_categories: categories)
apple = Company.create!(name: 'Apple', description: description, business_type: 'Retail', product_categories: categories)
cocacola = Company.create!(name: 'CocaCola', description: description, business_type: 'Retail', product_categories: categories)

p "Created #{Company.count} companies"
companies = Company.all
companies.each do |company|
    10.times do
        product = Product.create!(company_id: company.id, 
        description: description, 
        quantity: rand(30..100), 
        sku: rand(1000000..2000000).to_s, 
        name: "#{categories.sample} #{colors.sample}", 
        features: {'size': size.sample},
        category: company.product_categories.sample, price: rand(5.00..100.00).ceil(2))
        # product.save!
    end
end

p "Created #{Product.count} products"
