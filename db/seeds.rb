# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



user1 = User.create({email: 'kiny93@hotmail.com', password: 'judiaspintas', password_confirmation: 'judiaspintas',
         username: 'juaniemen', name: 'juanfran', surname1: 'nieto', surname2: 'mendoza', phone: 619663023,
         birthday: '30/10/1993', sku: '132563'})

user2 = User.create({email: 'cani93@hotmail.com', password: 'judiaspintas', password_confirmation: 'judiaspintas',
                   username: 'themaoisha', name: 'juanfran', surname1: 'nieto', surname2: 'mendoza', phone: 619663023,
                   birthday: '30/10/1993', sku: '586936'})

userAcc1 = FreeUser.create()
userAcc2 = PremiumUser.create()

user1.update_attribute(:role, userAcc1)
user2.update_attribute(:role, userAcc2)


