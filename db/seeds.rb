# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'FunyonFreak96', email: 'me@you.com', google_token: 'abc123', uid: '12')
location = Location.create(geo_id: '16000US0820000')
favorite = user.locations << location
