# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reservation.destroy_all
Boxe.destroy_all
User.destroy_all



user1 = User.create(first_name: "Wilfried", last_name: "Bessovi", email: "wbsvnet@gmail.com", password: "123456")


user2 = User.create(first_name: "Jessica", last_name: "Fiedler", email: "jess.fiedler83860@gmail.com", password: "123456")


user3 = User.create(first_name: "Florian", last_name: "Couraud", email: "f.couraud13@gmail.com", password: "123456")

user4 = User.create(first_name: "Brice", last_name: "Bickelmann", email: "bickelmann.b@gmail.com", password: "123456")

user5 = User.create(first_name: "John", last_name: "Doe", email: "jdoe@gmail.com", password: "123456")
user6 = User.create(first_name: "Maria", last_name: "Carey", email: "mcarey@gmail.com", password: "123456")
user7 = User.create(first_name: "Winston", last_name: "Churchill", email: "wchurchill@gmail.com", password: "123456")

