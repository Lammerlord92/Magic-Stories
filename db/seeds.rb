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

user3 = User.create({email: 'lanube@hotmail.com', password: 'judiaspintas', password_confirmation: 'judiaspintas',
                     username: 'carmelo', name: 'carmelo', surname1: 'camelino', surname2: 'mendoza', phone: 619663023,
                     birthday: '30/10/1993', sku: '586931'})

userAcc1 = FreeUser.create()
userAcc2 = PremiumUser.create()
userAcc3 = FreeUser.create()

user1.update_attribute(:role, userAcc1)
user2.update_attribute(:role, userAcc2)
user2.update_attribute(:role, userAcc3)

a = Friendship.createFriendship(user1, user2)
b = Friendship.createFriendship(user2, user3)
c = Friendship.createFriendship(user3, user1)

@ret = ""
User.all.each do |usuario|
  usuario.friends.each do |amigo|
    @ret << "-" << usuario.username << " es amigo de " << amigo.username << "\n"
  end
end


puts @ret


perfil1 = Profile.create({name: 'Hola bebés', avatar: 'http://www.image.es', description: 'This is my profile', signature: 'My sign Bebés', user_id: user1.id})
perfil2 = Profile.create({name: 'Hola bebés2', avatar: 'http://www.image1.es', description: 'This is my profile1', signature: 'My sign Bebés1', user_id: user2.id})
perfil3 = Profile.create({name: 'Hola bebés3', avatar: 'http://www.image2.es', description: 'This is my profile2', signature: 'My sign Bebés2', user_id: user3.id})


story1 = Story.create!({frontpage: 'https:www.frontpage.com', title: 'Titulo1', description: 'Descripcion1',
                       language: 'Español', price: 0.36, num_purchased: 3, release_date: '18/02/2016', published: true, creatorProfile: perfil1})

story2 = Story.create!({frontpage: 'https:www.frontpage.com', title: 'Titulo2', description: 'Descripcion2',
                        language: 'Español', price: 0.36, num_purchased: 3, release_date: '18/02/2016', published: true, creatorProfile: perfil2})

story3 = Story.create!({frontpage: 'https:www.frontpage.com', title: 'Titulo2', description: 'Descripcion2',
                        language: 'Español', price: 0.36, num_purchased: 3, release_date: '18/02/2016', published: true, creatorProfile: perfil2})

story3.readerProfiles << perfil3
story3.readerProfiles << perfil2
story3.readerProfiles << perfil1


