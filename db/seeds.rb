# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!(
    :full_name => 'Admin',
    :email => 'admin@mail.com',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
    :admin => true
)
