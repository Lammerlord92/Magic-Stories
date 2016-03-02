# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Cura.create(name: 'Emmanuel', city: cities.first, rol: 'cazador')

category1=Category.create!({name: "Drogas", description: "Historia sobre drogas",
                            icon: File.new("public/categories/original/1/seta-icono-new-super-mario-bros-wii-articulo-videojuegos-zehngames.png")})
category2=Category.create!({name: "Relleno", description: "Esta historia tiene tanto relleno que se convirtió en Hokage",
                            icon: File.new("public/categories/original/2/MagekyouSharingan_Riku.png")})
category3=Category.create!({name: "Postapocalíptica", description: "Historia postapocalíptica",
                            icon: File.new("public/categories/original/3/icono_app_izombie.jpg")})
category4=Category.create!({name: "Terror", description: "Historia de terror",
                            icon: File.new("public/categories/original/4/original.jpeg")})
category6=Category.create!({ name: "Ninjas", description: "Katanas y shurikens",
                             icon: File.new("public/categories/original/5/Mangekyou_Sharingan.png")})
category7=Category.create!({name: "Estafa", description: "Cuando lo compres, te darás cuenta",
                            icon: File.new("public/categories/original/6/tumblr_o20wx97uhe1r868elo1_400.gif")})
category8=Category.create!({name: "+18", description: "Ejem, ejem....",
                            icon: File.new("public/categories/original/7/tumblr_inline_n0sh29l3aN1qhxoyk.gif")})
category9=Category.create!({name: "Romántica", description: "Amoríos y demas",
                            icon: File.new("public/categories/original/8/tumblr_mj0vgg5TKE1rz4ni1o1_400.gif")})
category10=Category.create!({name: "Política", description: "Guía de latrocinio",
                             icon: File.new("public/categories/original/9/tumblr_n2l8l5aVaN1rvner1o1_500.jpg")})
category5=Category.create!({name: "Vergonzante", description: "Es un espectaculo vergonzante - Shogun 2",
                            icon: File.new("public/categories/original/10/puedo-eliminar-icono-celular-facebook_1_1720410.jpg")})


user1 = User.create!({email: 'kiny93@hotmail.com', password: 'judiaspintas', password_confirmation: 'judiaspintas',
         username: 'juaniemen', name: 'juanfran', surname1: 'nieto', surname2: 'mendoza', phone: 619663023,
         birthday: '30/10/1993', sku: '132563'})

user2 = User.create!({email: 'cani93@hotmail.com', password: 'judiaspintas', password_confirmation: 'judiaspintas',
                   username: 'themaoisha', name: 'juanfran', surname1: 'nieto', surname2: 'mendoza', phone: 619663023,
                   birthday: '30/10/1993', sku: '586936'})

user3 = User.create!({email: 'lanube@hotmail.com', password: 'judiaspintas', password_confirmation: 'judiaspintas',
                     username: 'carmelo', name: 'carmelo', surname1: 'camelino', surname2: 'mendoza', phone: 619663023,
                     birthday: '30/10/1993', sku: '586931'})

user4 = User.create!({email: 'curro@correo.es', password: '123456789', password_confirmation: '123456789',
                      username: 'curro', name: 'curro', surname1: 'gil', surname2: 'SC', phone: 690764841,
                      birthday: '06/02/1993', sku: '586974'})

userAcc1 = FreeUser.create()
userAcc2 = PremiumUser.create()
userAcc3 = FreeUser.create()

user1.update_attribute(:role, userAcc1)
user2.update_attribute(:role, userAcc2)
user2.update_attribute(:role, userAcc3)

friendShip1 = RequestFriendship.create!({message: "Kierez zer mi amigo?", sender_id: user1.id, recipient_id: user2.id, status: "ACCEPTED"})
friendShip2 = RequestFriendship.create!({message: "Kierez zer mi amigo?", sender_id: user3.id, recipient_id: user2.id, status: "ACCEPTED"})
friendShip3 = RequestFriendship.create!({message: "Kierez zer mi amigo?", sender_id: user1.id, recipient_id: user3.id, status: "ACCEPTED"})

Friendship.createFriendship(friendShip1)
Friendship.createFriendship(friendShip2)
Friendship.createFriendship(friendShip3)

@ret = ''
# Metodo de active_record. Recorre un maximo de 1000 usuarios por defecto
# documentacion: http://guides.rubyonrails.org/active_record_querying.html
User.find_each do |usuario|
  usuario.friends.each do |amigo|
    @ret << '-' << usuario.username << ' es amigo de ' << amigo.username << '\n'
  end
end


puts @ret


perfil1 = Profile.create({name: 'Hola bebés', avatar: 'http://www.image.es', description: 'This is my profile', signature: 'My sign Bebés', user_id: user1.id, profile_status: true})
perfil2 = Profile.create({name: 'Hola bebés2', avatar: 'http://www.image1.es', description: 'This is my profile1', signature: 'My sign Bebés1', user_id: user2.id, profile_status: true})
perfil3 = Profile.create({name: 'Hola bebés3', avatar: 'http://www.image2.es', description: 'This is my profile2', signature: 'My sign Bebés2', user_id: user3.id, profile_status: true})





