# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
roles = Role.create([{ name: 'SuperAdmin' }, { name: 'Admin'}, { name: 'User' }])
users = User.create([ email: 'enricostn@gmail.com',
                      password: 'password',
                      password_confirmation: 'password',
                      ragionesociale: 'Stano s.a.s.',
                      partitaiva: '12345678901',
                      phone: '675465104',
                      address: 'Carrer Roger de Flor, 297',
                      city: 'Barcelona',
                      cap: '74024',
                      role_ids: '1' ])
