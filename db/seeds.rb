# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Cura.create(name: 'Emmanuel', city: cities.first, rol: 'cazador')

############################################################################
#   BORRADO DE TABLAS: HACER UN RAKE DB:RESET
############################################################################
#Category.delete_all
#Addition.delete_all
#User.delete_all
#PremiumUser.delete_all
#Administrator.delete_all
#Friendship.delete_all
#RequestFriendship.delete_all
#Chapter.delete_all
#Story.delete_all
#Profile.delete_all
#UserGroup.delete_all
#ActorUserGroup.delete_all
#Comment.delete_all
#DiscountUserGroup.delete_all
#FreeUser.delete_all
#Option.delete_all
#Report.delete_all
#

puts "Success: Todas las tablas han sido borradas"

############################################################################
#   Creación de categorías. TABLA: categories
############################################################################
#category1=Category.create!({name: "Drogas", description: "Historia sobre drogas",
#                            icon: File.new("public/categories/original/1/seta-icono-new-super-mario-bros-wii-articulo-videojuegos-zehngames.png")})
#category2=Category.create!({name: "Relleno", description: "Esta historia tiene tanto relleno que se convirtió en Hokage",
#                            icon: File.new("public/categories/original/2/MagekyouSharingan_Riku.png")})
#category3=Category.create!({name: "Postapocalíptica", description: "Historia postapocalíptica",
#                            icon: File.new("public/categories/original/3/icono_app_izombie.jpg")})
#category4=Category.create!({name: "Terror", description: "Historia de terror",
#                            icon: File.new("public/categories/original/4/original.jpeg")})
#category6=Category.create!({ name: "Ninjas", description: "Katanas y shurikens",
#                             icon: File.new("public/categories/original/5/Mangekyou_Sharingan.png")})
#category7=Category.create!({name: "Estafa", description: "Cuando lo compres, te darás cuenta",
#                            icon: File.new("public/categories/original/6/tumblr_o20wx97uhe1r868elo1_400.gif")})
#category8=Category.create!({name: "+18", description: "Ejem, ejem....",
#                            icon: File.new("public/categories/original/7/tumblr_inline_n0sh29l3aN1qhxoyk.gif")})
#category9=Category.create!({name: "Romántica", description: "Amoríos y demas",
#                            icon: File.new("public/categories/original/8/tumblr_mj0vgg5TKE1rz4ni1o1_400.gif")})
#category10=Category.create!({name: "Política", description: "Guía de latrocinio",
#                             icon: File.new("public/categories/original/9/tumblr_n2l8l5aVaN1rvner1o1_500.jpg")})
#category5=Category.create!({name: "Vergonzante", description: "Es un espectaculo vergonzante - Shogun 2",
#                            icon: File.new("public/categories/original/10/puedo-eliminar-icono-celular-facebook_1_1720410.jpg")})
#puts "Success: Creación de categorías"

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
user11 = User.create!({email: 'winslopu@hotmail.com', password: 'Pegaso33', password_confirmation: 'Pegaso33',
                       username: 'Winslou', name: 'David', surname1: 'Rubio', surname2: 'Lucas', phone: 645544778,
                       birthday: '29/02/2004', sku: '159857'})
puts "Success: Creación de usuarios"

############################################################################
#   Creación de rols. TABLA:  premium_users
############################################################################

userAcc1 = PremiumUser.create()
userAcc2 = PremiumUser.create()
userAcc3 = PremiumUser.create()
puts "Success: Creación rol Premium"

############################################################################
#   Creación de rols. TABLA:  administrator
############################################################################

userAcc4 = Administrator.create()
userAcc5 = Administrator.create()
puts "Success: Creación usuario administrator"

############################################################################
#   Actualización del rol de usuario. TABLA: users
############################################################################
user4.update_attribute(:role, userAcc2)
user2.update_attribute(:role, userAcc2)
user9.update_attribute(:role, userAcc2)

user1.update_attribute(:role, userAcc4)
user3.update_attribute(:role, userAcc5)
puts "Success: Actualizado roles"

=begin

## Comentamos esta seccion porque con el after_create ya no es necesario
## Paso auxiliar para perfiles default
User.find_each do |usuario|
  Profile.create({user_id: usuario.id, avatar: "http://manualdeamarresyhechizos.com/wp-content/uploads/2014/11/huevos_gallina-180x180.jpg", profile_status: "PUBLIC"})
  usuario.update({role: FreeUser.create})
end

=end



# Creacion de Perfiles

user1.profile.update!({name: 'Profile1', description: 'This is my profile1', signature: 'My sign1', profile_status: 'PRIVATE'})
user2.profile.update!({name: 'Profile2', description: 'This is my profile2', signature: 'My sign2'})
user3.profile.update!({name: 'Profile3', description: 'This is my profile3', signature: 'My sign3', profile_status: 'PRIVATE'})
user4.profile.update!({name: 'Profile4', description: 'This is my profile4', signature: 'My sign4'})
user5.profile.update!({name: 'Profile5', description: 'This is my profile5', signature: 'My sign5'})
user6.profile.update!({name: 'Profile6', description: 'This is my profile6', signature: 'My sign6', profile_status: 'PRIVATE'})
user7.profile.update!({name: 'Profile7', description: 'This is my profile7', signature: 'My sign7'})
user8.profile.update!({name: 'Profile8', description: 'This is my profile8', signature: 'My sign8'})
user9.profile.update!({name: 'Profile9', description: 'This is my profile9', signature: 'My sign9', profile_status: 'PRIVATE'})
user10.profile.update!({name: 'Profile10', description: 'This is my profile10', signature: 'My sign10'})
user11.profile.update!({name: 'David', description: 'Descripción de David', signature: 'My sign11', avatar: 'http://cdn.teknlife.com/wp-content/uploads/2014/02/Bellotas_de_encina.jpg'})
puts "Success: Actualización de usuarios con perfiles"

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
puts "Success: Creación de peticiones de amistad"

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
puts "Success: Creación de amigos"
# Creacion de UserGroups

uG1 = UserGroup.create!(name: 'UserGroup1', code: '1231')
uG2 = UserGroup.create!(name: 'UserGroup2', code: '1232')
uG3 = UserGroup.create!(name: 'UserGroup3', code: '1233')
uG4 = UserGroup.create!(name: 'UserGroup4', code: '1234')
puts "Success: Creación de grupos de usuarios"
# Creacion de ActorUserGroup

aUG1 = ActorUserGroup.create({usergroup_id: uG1.id, user_id: user1.id})
aUG2 = ActorUserGroup.create({usergroup_id: uG1.id, user_id: user2.id})
aUG3 = ActorUserGroup.create({usergroup_id: uG1.id, user_id: user3.id})
aUG4 = ActorUserGroup.create({usergroup_id: uG2.id, user_id: user4.id})
aUG5 = ActorUserGroup.create({usergroup_id: uG2.id, user_id: user5.id})
aUG6 = ActorUserGroup.create({usergroup_id: uG2.id, user_id: user6.id})
aUG7 = ActorUserGroup.create({usergroup_id: uG3.id, user_id: user7.id})
aUG8 = ActorUserGroup.create({usergroup_id: uG3.id, user_id: user8.id})
aUG9 = ActorUserGroup.create({usergroup_id: uG4.id, user_id: user9.id})
aUG10 = ActorUserGroup.create({usergroup_id: uG4.id, user_id: user10.id})

puts "Success: Creación de ActorUserGroup"


#
# LA OTRA PARTE DEL MODELO
#



# Creacion de Story  -- Unión a profile

story1 = Story.create!({title: 'Title1', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
              published: true, num_purchased: 0, creatorProfile: user1.profile})

story2 = Story.create!({title: 'Title2', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user1.profile})

story3 = Story.create!({title: 'Title3', description: 'Description', language: 'ENGLISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user1.profile})

story4 = Story.create!({title: 'Title4', description: 'Description', language: 'ENGLISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user1.profile})

story5 = Story.create!({title: 'Title5', description: 'Description', language: 'CHINESE', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile})

story6 = Story.create!({title: 'Title6', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile})

story7 = Story.create!({title: 'Title7', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile})

story8 = Story.create!({title: 'Title8', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile})

story9 = Story.create!({title: 'Title9', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '21/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user3.profile})

story10 = Story.create!({title: 'Title10', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '21/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user3.profile})

story11 = Story.create!({title: 'Title11', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '21/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user3.profile})

story12 = Story.create!({title: 'Title12', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '21/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user3.profile})
puts "Success: Creación de historias"

user1.profile.stories << story1
user1.profile.stories << story2
user1.profile.stories << story3
user1.profile.stories << story4

user2.profile.stories << story5
user2.profile.stories << story6
user2.profile.stories << story7
user2.profile.stories << story8

user3.profile.stories << story9
user3.profile.stories << story10
user3.profile.stories << story11
user3.profile.stories << story12

user1.save!
user2.save!
user3.save!

puts "Success: Actualizado usuarios con historias"



# Creación de Chapters

chapter1 = Chapter.create({title: 'Title1', body: 'Body1', story: story1})
chapter2 = Chapter.create({title: 'Title2', body: 'Body2', story: story1})
chapter3 = Chapter.create({title: 'Title3', body: 'Body3', story: story1})
chapter4 = Chapter.create({title: 'Title4', body: 'Body4', story: story1})
chapter5 = Chapter.create({title: 'Title5', body: 'Body5', story: story1})
chapter6 = Chapter.create({title: 'Title1', body: 'Body1', story: story2})
chapter7 = Chapter.create({title: 'Title2', body: 'Body2', story: story2})
chapter8 = Chapter.create({title: 'Title1', body: 'Body1', story: story3})
chapter9 = Chapter.create({title: 'Title1', body: 'Body1', story: story4})
chapter10 = Chapter.create({title: 'Title2', body: 'Body2', story: story4})
chapter11 = Chapter.create({title: 'Title3', body: 'Body3', story: story4})
chapter12 = Chapter.create({title: 'Title4', body: 'Body4', story: story4})
chapter13 = Chapter.create({title: 'Title5', body: 'Body5', story: story4})
chapter14 = Chapter.create({title: 'Title6', body: 'Body6', story: story4})
chapter15 = Chapter.create({title: 'Title1', body: 'Body1', story: story5})
chapter16 = Chapter.create({title: 'Title2', body: 'Body2', story: story5})
chapter17 = Chapter.create({title: 'Title1', body: 'Body1', story: story6})
chapter18 = Chapter.create({title: 'Title1', body: 'Body1', story: story7})
chapter19 = Chapter.create({title: 'Title1', body: 'Body1', story: story8})
chapter20 = Chapter.create({title: 'Title2', body: 'Body2', story: story8})
chapter21 = Chapter.create({title: 'Title1', body: 'Body1', story: story9})
chapter22 = Chapter.create({title: 'Title2', body: 'Body2', story: story9})
chapter23 = Chapter.create({title: 'Title3', body: 'Body3', story: story9})
chapter24 = Chapter.create({title: 'Title1', body: 'Body1', story: story10})
chapter25 = Chapter.create({title: 'Title2', body: 'Body2', story: story10})
chapter26 = Chapter.create({title: 'Title3', body: 'Body3', story: story10})
chapter27 = Chapter.create({title: 'Title1', body: 'Body1', story: story11})
chapter28 = Chapter.create({title: 'Title2', body: 'Body2', story: story11})
chapter29 = Chapter.create({title: 'Title3', body: 'Body3', story: story11})
chapter30 = Chapter.create({title: 'Title1', body: 'Body1', story: story12})
chapter31 = Chapter.create({title: 'Title2', body: 'Body2', story: story12})
chapter32 = Chapter.create({title: 'Title3', body: 'Body3', story: story12})

puts "Success: Creación de capitulos"

# Creacion de Options
option1 = Option.create!({option: 'Option1', parent: chapter1, child: chapter2})
option2 = Option.create!({option: 'Option2', parent: chapter1, child: chapter3})
option3 = Option.create!({option: 'Option3', parent: chapter1, child: chapter4})

puts 'Success: Creación de Options'

# Asignacion de categorias a historias
story1.save!


story3.save!

puts 'Success: Asignacion de categorias a historias'

<<<<<<< HEAD



=======
# Creacion de Comments'user7', surname1: 'surname71', surname2: 'suername72'
comment1 = Comment.create({title: 'Title1', body: 'Body1', date: '01/01/2016', rating: 1, author: 'user2 surname21 surname22', profile: user1.profile})
comment2 = Comment.create({title: 'Title2', body: 'Body2', date: '01/01/2016', rating: 10, author: 'user3 surname31 surname32', profile: user1.profile})
comment3 = Comment.create({title: 'Title3', body: 'Body3', date: '03/01/2016', rating: 5, author: 'user3 surname31 surname32', profile: user1.profile})
comment4 = Comment.create({title: 'Title4', body: 'Body4', date: '04/01/2016', rating: 8, author: 'user1 surname11 surname12', profile: user1.profile})
comment5 = Comment.create({title: 'Title5', body: 'Body5', date: '05/01/2016', rating: 1, author: 'user2 surname21 surname22', profile: user2.profile})
comment6 = Comment.create({title: 'Title6', body: 'Body6', date: '01/02/2016', rating: 7, author: 'user2 surname21 surname22', profile: user2.profile})
comment7 = Comment.create({title: 'Title7', body: 'Body7', date: '03/02/2016', rating: 5, author: 'user5 surname51 surname52', profile: user3.profile})
comment8 = Comment.create({title: 'Title8', body: 'Body8', date: '07/02/2016', rating: 8, author: 'user8 surname81 surname82', profile: user6.profile})

puts 'Success: Creacion de comentarios'
>>>>>>> d2875c1253d06c9a2a5fc0f1af910b7707e85e1d
