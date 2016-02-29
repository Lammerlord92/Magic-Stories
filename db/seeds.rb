# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Cura.create(name: 'Emmanuel', city: cities.first, rol: 'cazador')


############################################################################
#   Creación de categorías. TABLA: categories
############################################################################
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
############################################################################
#   Creación de usuarios. TABLA: users
############################################################################

user1 = User.create!({email: 'user1@mail.com', password: '123456789', password_confirmation: '123456789',
         username: 'user1', name: 'user1', surname1: 'surname11', surname2: 'suername12', phone: 619663023,
         birthday: '30/10/1993', sku: '132563'})

user2 = User.create!({email: 'user2@mail.com', password: '123456789', password_confirmation: '123456789',
                      username: 'user2', name: 'user2', surname1: 'surname21', surname2: 'suername22', phone: 619663023,
                      birthday: '03/11/1993', sku: '145845'})

user3 = User.create!({email: 'user3@mail.com', password: '123456789', password_confirmation: '123456789',
                      username: 'user3', name: 'user3', surname1: 'surname31', surname2: 'suername32', phone: 619663023,
                      birthday: '30/10/1993', sku: '586931'})

user4 = User.create!({email: 'user4@mail.com', password: '123456789', password_confirmation: '123456789',
                      username: 'user4', name: 'user4', surname1: 'surname41', surname2: 'suername42', phone: 619663023,
                      birthday: '06/09/1993', sku: '586974'})

user5 = User.create!({email: 'user5@mail.com', password: '123456789', password_confirmation: '123456789',
                      username: 'user5', name: 'user5', surname1: 'surname51', surname2: 'suername52', phone: 619663023,
                      birthday: '14/08/1993', sku: '885410'})

user6 = User.create!({email: 'user6@mail.com', password: '123456789', password_confirmation: '123456789',
                      username: 'user6', name: 'user6', surname1: 'surname61', surname2: 'suername62', phone: 619663023,
                      birthday: '21/01/1993', sku: '556398'})

user7 = User.create!({email: 'user7@mail.com', password: '123456789', password_confirmation: '123456789',
                      username: 'user7', name: 'user7', surname1: 'surname71', surname2: 'suername72', phone: 619663023,
                      birthday: '23/05/1993', sku: '265412'})

user8 = User.create!({email: 'user8@mail.com', password: '123456789', password_confirmation: '123456789',
                      username: 'user8', name: 'user8', surname1: 'surname81', surname2: 'suername82', phone: 619663023,
                      birthday: '14/12/1993', sku: '258963'})

user9 = User.create!({email: 'user9@mail.com', password: '123456789', password_confirmation: '123456789',
                      username: 'user9', name: 'user9', surname1: 'surname91', surname2: 'suername92', phone: 619663023,
                      birthday: '17/02/1993', sku: '352698'})

user10 = User.create!({email: 'user10@mail.com', password: '123456789', password_confirmation: '123456789',
                      username: 'user10', name: 'user10', surname1: 'surname101', surname2: 'suername102', phone: 619663023,
                      birthday: '29/02/2004', sku: '159856'})

############################################################################
#   Creación de rols. TABLA: free_users y premium_users
############################################################################
userAcc1 = FreeUser.create()
userAcc2 = PremiumUser.create()


############################################################################
#   Actualización del rol de usuario. TABLA: users
############################################################################
user4.update_attribute(:role, userAcc2)
user2.update_attribute(:role, userAcc2)
user9.update_attribute(:role, userAcc2)


############################################################################
#   Peticiones de amistad. TABLA: request_friendships
############################################################################
friendShip1 = RequestFriendship.create!({message: "RequestFriendship16", sender_id: user1.id, recipient_id: user6.id, status: "ACCEPTED"})
friendShip2 = RequestFriendship.create!({message: "RequestFriendship71", sender_id: user7.id, recipient_id: user1.id, status: "ACCEPTED"})
friendShip3 = RequestFriendship.create!({message: "RequestFriendship62", sender_id: user6.id, recipient_id: user2.id, status: "ACCEPTED"})
friendShip4 = RequestFriendship.create!({message: "RequestFriendship28", sender_id: user2.id, recipient_id: user8.id, status: "ACCEPTED"})
friendShip5 = RequestFriendship.create!({message: "RequestFriendship37", sender_id: user3.id, recipient_id: user7.id, status: "ACCEPTED"})
friendShip6 = RequestFriendship.create!({message: "RequestFriendship93", sender_id: user9.id, recipient_id: user3.id, status: "ACCEPTED"})
friendShip7 = RequestFriendship.create!({message: "RequestFriendship84", sender_id: user8.id, recipient_id: user4.id, status: "ACCEPTED"})
friendShip8 = RequestFriendship.create!({message: "RequestFriendship410", sender_id: user4.id, recipient_id: user10.id, status: "ACCEPTED"})
friendShip9 = RequestFriendship.create!({message: "RequestFriendship59", sender_id: user5.id, recipient_id: user9.id, status: "ACCEPTED"})
friendShip10 = RequestFriendship.create!({message: "RequestFriendship105", sender_id: user10.id, recipient_id: user5.id, status: "ACCEPTED"})

############################################################################
#   Creación de amigos. TABLA: friendships
############################################################################
Friendship.createFriendship(friendShip1)
Friendship.createFriendship(friendShip2)
Friendship.createFriendship(friendShip3)
Friendship.createFriendship(friendShip4)
Friendship.createFriendship(friendShip5)
Friendship.createFriendship(friendShip6)
Friendship.createFriendship(friendShip7)
Friendship.createFriendship(friendShip8)
Friendship.createFriendship(friendShip9)
Friendship.createFriendship(friendShip10)

###############################################
# Metodo de active_record. Recorre un maximo de 1000 usuarios por defecto
# documentacion: http://guides.rubyonrails.org/active_record_querying.html
##################################################
@ret = ''
User.find_each do |usuario|
  usuario.friends.each do |amigo|
    @ret << '-' << usuario.username << ' es amigo de ' << amigo.username << '\n'
  end
end

puts @ret

############################################################################
#   Creación de perfiles de usuario. TABLA: profiles
############################################################################
perfil1 = Profile.create({name: 'Hola bebés', avatar: 'http://www.image.es', description: 'This is my profile', signature: 'My sign Bebés', user_id: user1.id, profile_status: true})
perfil2 = Profile.create({name: 'Hola bebés2', avatar: 'http://www.image1.es', description: 'This is my profile1', signature: 'My sign Bebés1', user_id: user2.id, profile_status: true})
perfil3 = Profile.create({name: 'Hola bebés3', avatar: 'http://www.image2.es', description: 'This is my profile2', signature: 'My sign Bebés2', user_id: user3.id, profile_status: true})
perfil4 = Profile.create({name: 'Juan', avatar: 'http://www.image.es', description: 'Perfil de Juan', signature: 'Mi firma mola', user_id: user1.id, profile_status: true})
perfil5 = Profile.create({name: 'Eustaquio', avatar: 'http://www.image1.es', description: 'Perfil de prueba', signature: 'My sign Bebés1', user_id: user2.id, profile_status: true})
perfil6 = Profile.create({name: 'Rodolfo', avatar: 'http://www.image2.es', description: 'This is my profile2', signature: 'My sign Bebés2', user_id: user3.id, profile_status: true})


############################################################################
#   Creación de historias. TABLA: stories
################################################################

story1 = Story.create({title: 'Caperucita', description: 'El cuento de caperucita', language: 'es', price: 10.00, release_date: Time.current.to_s, published: true, num_purchased: 232, profile_id: perfil4.id})
story2 = Story.create({title: 'Caperucita2', description: 'El cuento de caperucita 2', language: 'es', price: 13.00, release_date: Time.current.to_s, published: true, num_purchased: 231, profile_id: perfil3.id})
story3 = Story.create({title: 'Don Quijote', description: 'El cuento de Don quijote', language: 'es', price: 15.00, release_date: Time.current.to_s, published: true, num_purchased: 233, profile_id: perfil2.id})
story4 = Story.create({title: 'Rey León', description: 'El cuento del Rey Leon', language: 'es', price: 19.00, release_date: Time.current.to_s, published: true, num_purchased: 234, profile_id: perfil2.id})