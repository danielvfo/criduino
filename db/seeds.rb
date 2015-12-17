# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create(
    [
        { email: 'a@a.com', encrypted_password: 'a'},
        { email: 'b@b.com', encrypted_password: 'b'}
    ]
)

devices = Device.create(
    [
        { mac: '1E-CE-11-80-F9-51', status: true, user_id: users[0].id},
        { mac: '78-08-CE-E2-9D-59', status: false, user_id: users[0].id},
        { mac: '60-49-A9-F2-8D-9F', status: true, user_id: users[0].id},
        { mac: '76-45-72-A4-5A-A5', status: false, user_id: users[0].id},
        { mac: '09-56-28-19-71-35', status: true, user_id: users[1].id},
        { mac: '6B-5D-D7-D2-22-8F', status: false, user_id: users[1].id},
        { mac: '06-8E-76-20-52-E8', status: true, user_id: users[1].id},
        { mac: '9D-C5-3E-D2-98-CB', status: false, user_id: users[1].id}
    ]
)