# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new(
  name: "山田太郎",
  introduce:"宜しくお願いします",
  gender:1,
  age:3,
  email:"yamada@yamada.com",
  password:"aaaaaa")
user.save!
