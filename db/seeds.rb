# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({email: 'kiny93@hotmail.com', password: 'judiaspintas', password_confirmation: 'judiaspintas',
         username: 'juaniemen', name: 'juanfran', surname1: 'nieto', surname2: 'mendoza', phone: 619663023,
         birthday: '30/10/1993', sku: '132563'})

User.create!({email: 'cani93@hotmail.com', password: 'judiaspintas', password_confirmation: 'judiaspintas',
                   username: 'themaoisha', name: 'juanfran', surname1: 'nieto', surname2: 'mendoza', phone: 619663023,
                   birthday: '30/10/1993', sku: '586936'})

