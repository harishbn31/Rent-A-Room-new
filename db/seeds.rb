


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: "admin")
Role.create(name: "host")
Role.create(name: "guest")

u = User.new
u.email = "admin@gmail.com"
u.password = "123456"
u.username = "admin"
u.mobile = 123456789
u.role_id = Role.first.id
u.save