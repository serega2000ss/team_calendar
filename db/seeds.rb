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
    :email => 'admin@mail.com',
    :password => '1q2w3e4r',
    :password_confirmation => '1q2w3e4r',
    :admin => true
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