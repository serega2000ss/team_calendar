# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin user
admin = User.find_or_create_by(email: 'admin@mail.com')
admin.update_attributes(
    :full_name => 'Admin',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
    :admin => true
)


#Users
user = User.find_or_create_by(email: 'obi_wan@republic.com')
user.update_attributes(
    :full_name => 'Obi Wan',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
)

user = User.find_or_create_by(email: 'han_solo@rebels.com')
user.update_attributes(
    :full_name => 'Han Solo',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
)

user = User.find_or_create_by(email: 'r2d2@rebels.com')
user.update_attributes(
    :full_name => 'R2D2',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
)

user = User.find_or_create_by(email: 'darth_vader@empire.org')
user.update_attributes(
    :full_name => 'Darth Vader',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
)

user = User.find_or_create_by(email: 'boba_fett@empire.org')
user.update_attributes(
    :full_name => 'Boba Fett',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
)


#Event types
event_type = EventType.find_or_create_by(name: 'meeting')
event_type.update_attributes(
    :title => 'Meeting',
    :description => 'Plan a meeting'
)

event_type = EventType.find_or_create_by(name: 'out_of_office')
event_type.update_attributes(
    :title => 'Out of office',
    :description => 'Out of office event'
)

event_type = EventType.find_or_create_by(name: 'conference')
event_type.update_attributes(
    :title => 'Conference',
    :description => 'Plan a conference'
)

event_type = EventType.find_or_create_by(name: 'project')
event_type.update_attributes(
    :title => 'Project',
    :description => 'This is a project'
)

event_type = EventType.find_or_create_by(name: 'task')
event_type.update_attributes(
    :title => 'Task',
    :description => 'This is a task'
)