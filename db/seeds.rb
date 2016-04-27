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
Category.delete_all
Addition.delete_all
User.delete_all
PremiumUser.delete_all
Administrator.delete_all
Friendship.delete_all
RequestFriendship.delete_all
Chapter.delete_all
Story.delete_all
Profile.delete_all
UserGroup.delete_all
ActorUserGroup.delete_all
Comment.delete_all
DiscountUserGroup.delete_all
FreeUser.delete_all
Option.delete_all
Report.delete_all


puts "Success: Todas las tablas han sido borradas"

############################################################################
#   Creación de categorías. TABLA: categories
############################################################################

category1 = Category.create!({
                                 name: 'Drama',
                                 description: 'Género dramático',
                                 icon: '/assets/categories_logos/drama.png'
                             })

category2 = Category.create!({
                                 name: 'Cuento',
                                 description: 'Género de cuentos',
                                 icon: '/assets/categories_logos/cuento.png'
                             })

category3 = Category.create!({
                                 name: 'Ficción',
                                 description: 'Género de ficción',
                                 icon: '/assets/categories_logos/ficcion.png'
                             })

category4 = Category.create!({
                                 name: 'Terror',
                                 description: 'Género de terror',
                                 icon: '/assets/categories_logos/terror.png'
                             })

category5 = Category.create!({
                                 name: 'Épico',
                                 description: 'Género épico',
                                 icon: '/assets/categories_logos/epico.png'
                             })

category6 = Category.create!({
                                 name: 'Aventura',
                                 description: 'Género de aventuras',
                                 icon: '/assets/categories_logos/aventura.png'
                             })

puts "Success: Creación de categorías"

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

userAcc1 = PremiumUser.create({expiration: Date.today + 600})
userAcc2 = PremiumUser.create({expiration: Date.today + 600})
userAcc3 = PremiumUser.create({expiration: Date.today + 600})
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

user1.profile.update!({name: 'Profile1', description: 'This is my profile1', signature: 'My sign1'})
user2.profile.update!({name: 'Profile2', description: 'This is my profile2', signature: 'My sign2'})
user3.profile.update!({name: 'Profile3', description: 'This is my profile3', signature: 'My sign3'})
user4.profile.update!({name: 'Profile4', description: 'This is my profile4', signature: 'My sign4'})
user5.profile.update!({name: 'Profile5', description: 'This is my profile5', signature: 'My sign5'})
user6.profile.update!({name: 'Profile6', description: 'This is my profile6', signature: 'My sign6'})
user7.profile.update!({name: 'Profile7', description: 'This is my profile7', signature: 'My sign7'})
user8.profile.update!({name: 'Profile8', description: 'This is my profile8', signature: 'My sign8'})
user9.profile.update!({name: 'Profile9', description: 'This is my profile9', signature: 'My sign9'})
user10.profile.update!({name: 'Profile10', description: 'This is my profile10', signature: 'My sign10'})
user11.profile.update!({name: 'David', description: 'Descripción de David', signature: 'My sign11', avatar: 'http://cdn.teknlife.com/wp-content/uploads/2014/02/Bellotas_de_encina.jpg'})
puts "Success: Actualización de usuarios con perfiles"

=begin

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

=end

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
                        published: true, num_purchased: 0, creatorProfile: user1.profile, cover: '/assets/categories_covers/drama.jpg', categories: [category1.id, category4.id]})

story2 = Story.create!({title: 'Title2', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user1.profile, cover: '/assets/categories_covers/cuento.jpg', categories: [category2.id, category5.id]})

story3 = Story.create!({title: 'Title3', description: 'Description', language: 'ENGLISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user1.profile, cover: '/assets/categories_covers/ficcion.jpg', categories: [category3.id, category6.id]})

story4 = Story.create!({title: 'Title4', description: 'Description', language: 'ENGLISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user1.profile, cover: '/assets/categories_covers/drama.jpg', categories: [category1.id]})

story5 = Story.create!({title: 'Title5', description: 'Description', language: 'CHINESE', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile, cover: '/assets/categories_covers/epico.jpg', categories: [category5.id]})

story6 = Story.create!({title: 'Title6', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile, cover: '/assets/categories_covers/terror.jpg', categories: [category4.id]})

story7 = Story.create!({title: 'Title7', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile, cover: '/assets/categories_covers/aventura.jpg', categories: [category6.id]})

story8 = Story.create!({title: 'Title8', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile, cover: '/assets/categories_covers/cuento.jpg', categories: [category2.id]})

story9 = Story.create!({title: 'Title9', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '21/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user3.profile, cover: '/assets/categories_covers/ficcion.jpg', categories: [category3.id]})

story10 = Story.create!({title: 'Title10', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '21/10/2015',
                         published: true, num_purchased: 0, creatorProfile: user3.profile, cover: '/assets/categories_covers/drama.jpg', categories: [category1.id]})

story11 = Story.create!({title: 'Title11', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '21/10/2015',
                         published: true, num_purchased: 0, creatorProfile: user3.profile, cover: '/assets/categories_covers/cuento.jpg', categories: [category2.id, category4.id, category6.id]})

story12 = Story.create!({title: 'Title12', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '21/10/2015',
                         published: true, num_purchased: 0, creatorProfile: user3.profile, cover: '/assets/categories_covers/drama.jpg', categories: [category1.id, category3.id, category5.id]})
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

Addition.create({profile_id: user2.id, story_id: story11.id})
Addition.create({profile_id: user2.id, story_id: story10.id})
Addition.create({profile_id: user2.id, story_id: story9.id})
Addition.create({profile_id: user1.id, story_id: story9.id})
Addition.create({profile_id: user1.id, story_id: story10.id})
Addition.create({profile_id: user5.id, story_id: story9.id})
Addition.create({profile_id: user5.id, story_id: story9.id})
Addition.create({profile_id: user5.id, story_id: story9.id})

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



membership_card1 = MembershipCard.create({premiumMonths: 3})
membership_card2 = MembershipCard.create({premiumMonths: 6})
membership_card3 = MembershipCard.create({premiumMonths: 6.5})
membership_card4 = MembershipCard.create({premiumMonths: 9})
membership_card5 = MembershipCard.create({premiumMonths: 11})
membership_card6 = MembershipCard.create({premiumMonths: 12})
membership_card7 = MembershipCard.create({premiumMonths: 9})



membership_card1.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde1' })
membership_card2.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde2' })
membership_card3.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde3' })
membership_card4.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde4' })
membership_card5.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde5' })

puts 'Success: Creacion de tajetas premium'




puts 'Siguiendo'
user1.profile.toggle_follow!(user2.profile)
user1.profile.toggle_follow!(user3.profile)
user1.profile.toggle_follow!(user4.profile)
user1.profile.toggle_follow!(user5.profile)
user2.profile.toggle_follow!(user1.profile)
user2.profile.toggle_follow!(user3.profile)
user2.profile.toggle_follow!(user3.profile)
user3.profile.toggle_follow!(user1.profile)
user4.profile.toggle_follow!(user5.profile)

Profile.all.each do |f1|
  f1.followers(Profile).each  do |f2|
    puts f1.user.name << ' sigue a ' << f2.user.name
  end
end


Profile.all.each do |f1|
  f1.followees(Profile).each  do |f2|
    puts f1.user.name << ' es seguido por ' << f2.user.name
  end
end

node1 = <<-EOF

<p>
Había una vez una niña muy bonita. Su madre le había hecho una capa roja y la muchachita la llevaba tan a menudo que todo el mundo la llamaba caperucita roja.
</p>
<p>
Un día, su madre le pidió que llevase unos pasteles a su abuela que vivía en el otro lado del bosque, recomendándole que no se entretuviese por el camino, pues cruzar el bosque era muy peligroso, ya que siempre andaba acechando por alli el lobo.
</p>
<p>
Caperucita Roja recogió la cesta con los pasteles y se puso en camino. La niña tenía que atravesar el bosque para llegar a casa de la Abuelita, pero no le daba miedo, porque allí siempre se encontraba con muchos amigos: los pájaros, las ardillas...
</p>
<p>
De repente, vio al lobo, enorme, delante de ella.
</p>

EOF

node2 = <<-EOF

<p>
- ¿A dónde vas, niña? - le preguntó el lobo con su voz ronca.
</p>
<p>
- A casa de mi abuelita - le dijo Caperucita.
</p>
<p>
"No está lejos", pensó el lobo para sí, dándose media vuelta.
</p>
<p>
Caperucita puso su cesta en la hierba y se entretuvo cogiendo flores. "El lobo se ha ido", pensó. "No tengo nada que temer. La abuela se pondrá muy contenta cuando le lleve un hermoso ramo de flores además de los pasteles"
</p>
<p>
Mientras tanto, el lobo se fue a casa de la Abuelita y llamó suavemente a la puerta; la anciana le abrió pensando que era Caperucita. Un cazador que pasaba por allí había observado la llegada del lobo.
</p>
<p>
El lobo devoró a la Abuelita y se puso el gorro rosa de la desdichada, se metió en la cama y cerró los ojos. No tuvo que esperar mucho, pues Caperucita Roja llegó enseguida, toda contenta.
</p>
<p>
La niña se acercó a la cama y vio que su abuela estaba muy cambiada.
</p>
<p>
- Abuelita, abuelita, ¡qué ojos más grandes tienes!
</p>
<p>
- Son para verte mejor - dijo el lobo tratando de imitar la voz de la abuela.
</p>
<p>
- Abuelita, abuelita, ¡qué orejas más grandes tienes!
</p>
<p>
- Son para oírte mejor - siguió diciendo el lobo.
</p>
<p>
- Abuelita, abuelita, ¡qué dientes más grandes tienes!
</p>
<p>
- Son para... ¡comerte mejoooor! - y, diciendo esto, el lobo malvado se abalanzó sobre la niñita y la devoró, lo mismo que había hecho con la Abuelita.
</p>
<p>
Mientras tanto, el cazador se había quedado preocupado y, creyendo adivinar las malas intenciones del lobo, decidió echar un vistazo a ver si todo iba bien en la casa de la Abuelita. Pidió ayuda a un segador y los dos juntos llegaron al lugar. Vieron la puerta de la casa abierta y al lobo tumbado en la cama, dormido de tan harto que estaba.
</p>
<p>
El cazador sacó su cuchillo y rajó el vientre del lobo. La Abuelita y Caperucita estaban allí, ¡vivas!.
</p>
<p>
Para castigar al lobo malo, el cazador le llenó el vientre de piedras y luego lo volvió a cerrar. Cuando el lobo despertó de su pesado sueño, sintió muchísima sed y se dirigió a un estanque próximo para beber. Como las piedras pesaban mucho, cayó en el estanque de cabeza y se ahogó.
</p>
<p>
En cuanto a Caperucita y su abuela, no sufrieron más que un gran susto, pero Caperucita Roja había aprendido la lección. Prometió a su Abuelita no hablar con ningún desconocido que se encontrara en el camino. De ahora en adelante, seguiría las juiciosas recomendaciones de su Abuelita y de su Mamá.
</p>

EOF

node3 = <<-EOF

<p>
- ¿A dónde vas, niña? - le preguntó el lobo con su voz ronca.
</p>
<p>
- ¿Y a ti qué te importa? - le espetó Caperucita.
</p>
<p>
- Un poco borde para ser tan pequeña, ¿no? - le dijo el lobo, mientras se acercaba lentamente.
</p>
<p>
Caperucita intentaba contener sus nervios, pero le era imposible evitar temblar. El lobo le rozaba con la cola lentamente, mientras la rodeaba.
</p>
<p>
- ¡No me da miedo un lobo como tú! – gritó Caperucita, esperando que alguien la oyera.
</p>
<p>
-¿Como yo? – el lobo soltó una leve risa -. No existen lobos como yo.
</p>
<p>
- Déjame en paz – mientras decía esto, Caperucita le lanzó la cesta a la cabeza, y salió huyendo de vuelta a su casa.
</p>
<p>
El lobo se abalanzó sobre ella, mordiéndola en el cuello. La sangre caía a borbotones. El lobo empezó su propio festín.
</p>
<p>
Caperucita nunca llegó a casa de su abuela y el lobo volvió al bosque, y nunca se supo más de él.
</p>
<p>
Días más tarde la madre denunció su desaparición y un cazador encontró el cadáver desfigurado de la niña. Fue un día triste para todos.
</p>

EOF

node4 = <<-EOF

<p>
- ¿A dónde vas, niña? - le preguntó el lobo con su voz ronca.
</p>
<p>
- A casa de mi Abuelita, a no ser que me salga un plan mejor - le dijo pícaramente caperucita.
</p>
<p>
- Eres muy pequeña para tener esa mirada - el lobo se acercó lentamente -. ¿Cuántos años tienes?
</p>
<p>
- Lo dices como si con este cuerpo me fueran a preguntar en la discoteca.
</p>
<p>
- ¿Quieres que nos vayamos de fiesta?
</p>
<p>
- ¿Por qué no?
</p>
<p>
El lobo se quedó pensativo, mientras observaba el cuerpo de Caperucita. Parecía mayor para su edad, pero claro, tampoco sabía qué edad tenía. Al lobo le daba miedo que fuera menor.
</p>
<p>
- ¿Nos vamos o qué? – Caperucita estaba mascando un chicle y le daba vueltas a la cesta, impaciente.
</p>
<p>
- Espero que no me des problemas.
</p>
<p>
Ambos se fueron en la moto del lobo. Cuando salieron del bosque llegaron a una discoteca, donde pasaron parte de la tarde. Caperucita bebió bastante alcohol. Más adelante, la abuela de caperucita se presentó en la discoteca, ataviada con su bata de estar por casa, las sandalias y el pelo recogido con unos rulos.
</p>
<p>
La abuela sacó su cuchillo y rajó el vientre del lobo. Luego se llevó a Caperucita de las orejas.
</p>
<p>
Para castigar al lobo malo, el cazador que pasaba por allí le llenó el vientre de piedras y luego lo volvió a cerrar. Cuando el lobo despertó de su pesado sueño, sintió muchísima sed y se dirigió a un estanque próximo para beber. Como las piedras pesaban mucho, cayó en el estanque de cabeza y se ahogó.
</p>
<p>
En cuanto a Caperucita, estuvo castigada sin salir varios meses.

</p>

EOF


cr_story = Story.create!({title: 'Caperucita Roja', description: 'Description', language: 'ESP',
                          price: 16.30, release_date: '20/10/2015',
                          published: true, num_purchased: 0, creatorProfile: user2.profile, categories: [category2.id],
                          cover: 'data:image/jpeg;base64,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Pz4KPHg6eG1wbWV0YSB4bWxuczp4PSdhZG9iZTpuczptZXRhLycgeDp4bXB0az0nWE1QIHRvb2xraXQgMy4wLTI4LCBmcmFtZXdvcmsgMS42Jz4KPHJkZjpSREYgeG1sbnM6cmRmPSdodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjJyB4bWxuczppWD0naHR0cDovL25zLmFkb2JlLmNvbS9pWC8xLjAvJz4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0ndXVpZDpmOGVjYzRmZi1iY2Y2LTExZGItODQ2Yi05NWU1MzVmNDQ5YjgnCiAgeG1sbnM6ZXhpZj0naHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8nPgogIDxleGlmOkNvbG9yU3BhY2U+NDI5NDk2NzI5NTwvZXhpZjpDb2xvclNwYWNlPgogIDxleGlmOlBpeGVsWERpbWVuc2lvbj40NDU8L2V4aWY6UGl4ZWxYRGltZW5zaW9uPgogIDxleGlmOlBpeGVsWURpbWVuc2lvbj42MTI8L2V4aWY6UGl4ZWxZRGltZW5zaW9uPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9J3V1aWQ6ZjhlY2M0ZmYtYmNmNi0xMWRiLTg0NmItOTVlNTM1ZjQ0OWI4JwogIHhtbG5zOnBkZj0naHR0cDovL25zLmFkb2JlLmNvbS9wZGYvMS4zLyc+CiA8L3JkZjpEZXNjcmlwdGlvbj4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0ndXVpZDpmOGVjYzRmZi1iY2Y2LTExZGItODQ2Yi05NWU1MzVmNDQ5YjgnCiAgeG1sbnM6cGhvdG9zaG9wPSdodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvJz4KICA8cGhvdG9zaG9wOkhpc3Rvcnk+PC9waG90b3Nob3A6SGlzdG9yeT4KIDwvcmRmOkRlc2NyaXB0aW9uPgoKIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSd1dWlkOmY4ZWNjNGZmLWJjZjYtMTFkYi04NDZiLTk1ZTUzNWY0NDliOCcKICB4bWxuczp0aWZmPSdodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyc+CiAgPHRpZmY6T3JpZW50YXRpb24+MTwvdGlmZjpPcmllbnRhdGlvbj4KICA8dGlmZjpYUmVzb2x1dGlvbj45NS8xPC90aWZmOlhSZXNvbHV0aW9uPgogIDx0aWZmOllSZXNvbHV0aW9uPjk1LzE8L3RpZmY6WVJlc29sdXRpb24+CiAgPHRpZmY6UmVzb2x1dGlvblVuaXQ+MjwvdGlmZjpSZXNvbHV0aW9uVW5pdD4KIDwvcmRmOkRlc2NyaXB0aW9uPgoKIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSd1dWlkOmY4ZWNjNGZmLWJjZjYtMTFkYi04NDZiLTk1ZTUzNWY0NDliOCcKICB4bWxuczp4YXA9J2h0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8nPgogIDx4YXA6Q3JlYXRlRGF0ZT4yMDA3LTAyLTEzVDEzOjI0OjI1KzAxOjAwPC94YXA6Q3JlYXRlRGF0ZT4KICA8eGFwOk1vZGlmeURhdGU+MjAwNy0wMi0xM1QxMzoyNDoyNSswMTowMDwveGFwOk1vZGlmeURhdGU+CiAgPHhhcDpNZXRhZGF0YURhdGU+MjAwNy0wMi0xM1QxMzoyNDoyNSswMTowMDwveGFwOk1ldGFkYXRhRGF0ZT4KICA8eGFwOkNyZWF0b3JUb29sPkFkb2JlIFBob3Rvc2hvcCBDUyBNYWNpbnRvc2g8L3hhcDpDcmVhdG9yVG9vbD4KIDwvcmRmOkRlc2NyaXB0aW9uPgoKIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSd1dWlkOmY4ZWNjNGZmLWJjZjYtMTFkYi04NDZiLTk1ZTUzNWY0NDliOCcKICB4bWxuczpzdFJlZj0naHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIycKICB4bWxuczp4YXBNTT0naHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyc+CiAgPHhhcE1NOkRlcml2ZWRGcm9tIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz4KICAgPHN0UmVmOmluc3RhbmNlSUQ+dXVpZDozZjIyNDM1OC1iYzM0LTExZGItYmMzYi1lZWE3NmY0ZDU5NmU8L3N0UmVmOmluc3RhbmNlSUQ+CiAgIDxzdFJlZjpkb2N1bWVudElEPmFkb2JlOmRvY2lkOnBob3Rvc2hvcDpjMGJjMzM0My1iYzMyLTExZGItYmMzYi1lZWE3NmY0ZDU5NmU8L3N0UmVmOmRvY3VtZW50SUQ+CiAgPC94YXBNTTpEZXJpdmVkRnJvbT4KICA8eGFwTU06RG9jdW1lbnRJRD5hZG9iZTpkb2NpZDpwaG90b3Nob3A6ZjhlY2M0ZmUtYmNmNi0xMWRiLTg0NmItOTVlNTM1ZjQ0OWI4PC94YXBNTTpEb2N1bWVudElEPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9J3V1aWQ6ZjhlY2M0ZmYtYmNmNi0xMWRiLTg0NmItOTVlNTM1ZjQ0OWI4JwogIHhtbG5zOmRjPSdodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyc+CiAgPGRjOmZvcm1hdD5pbWFnZS9qcGVnPC9kYzpmb3JtYXQ+CiA8L3JkZjpEZXNjcmlwdGlvbj4KCjwvcmRmOlJERj4KPC94OnhtcG1ldGE+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo8P3hwYWNrZXQgZW5kPSd3Jz8+/+1CJlBob3Rvc2hvcCAzLjAAOEJJTQQEAAAAAAAHHAIAAAIAAgA4QklNBCUAAAAAABBGDPKJJrhW2rCcAaGwp5B3OEJJTQPqAAAAAB2mPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXBwbGUgQ29tcHV0ZXIvL0RURCBQTElTVCAxLjAvL0VOIiAiaHR0cDovL3d3dy5hcHBsZS5jb20vRFREcy9Qcm9wZXJ0eUxpc3QtMS4wLmR0ZCI+CjxwbGlzdCB2ZXJzaW9uPSIxLjAiPgo8ZGljdD4KCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhZ2VGb3JtYXQuUE1Ib3Jpem9udGFsUmVzPC9rZXk+Cgk8ZGljdD4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuY3JlYXRvcjwva2V5PgoJCTxzdHJpbmc+Y29tLmFwcGxlLnByaW50aW5nbWFuYWdlcjwvc3RyaW5nPgoJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5pdGVtQXJyYXk8L2tleT4KCQk8YXJyYXk+CgkJCTxkaWN0PgoJCQkJPGtleT5jb20uYXBwbGUucHJpbnQuUGFnZUZvcm1hdC5QTUhvcml6b250YWxSZXM8L2tleT4KCQkJCTxyZWFsPjcyPC9yZWFsPgoJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNsaWVudDwva2V5PgoJCQkJPHN0cmluZz5jb20uYXBwbGUucHJpbnRpbmdtYW5hZ2VyPC9zdHJpbmc+CgkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQubW9kRGF0ZTwva2V5PgoJCQkJPGRhdGU+MjAwNy0wMi0xMlQxNTowODoxOVo8L2RhdGU+CgkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuc3RhdGVGbGFnPC9rZXk+CgkJCQk8aW50ZWdlcj4wPC9pbnRlZ2VyPgoJCQk8L2RpY3Q+CgkJPC9hcnJheT4KCTwvZGljdD4KCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhZ2VGb3JtYXQuUE1PcmllbnRhdGlvbjwva2V5PgoJPGRpY3Q+CgkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNyZWF0b3I8L2tleT4KCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuaXRlbUFycmF5PC9rZXk+CgkJPGFycmF5PgoJCQk8ZGljdD4KCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhZ2VGb3JtYXQuUE1PcmllbnRhdGlvbjwva2V5PgoJCQkJPGludGVnZXI+MTwvaW50ZWdlcj4KCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5jbGllbnQ8L2tleT4KCQkJCTxzdHJpbmc+Y29tLmFwcGxlLnByaW50aW5nbWFuYWdlcjwvc3RyaW5nPgoJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0Lm1vZERhdGU8L2tleT4KCQkJCTxkYXRlPjIwMDctMDItMTJUMTU6MDg6MTlaPC9kYXRlPgoJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LnN0YXRlRmxhZzwva2V5PgoJCQkJPGludGVnZXI+MDwvaW50ZWdlcj4KCQkJPC9kaWN0PgoJCTwvYXJyYXk+Cgk8L2RpY3Q+Cgk8a2V5PmNvbS5hcHBsZS5wcmludC5QYWdlRm9ybWF0LlBNU2NhbGluZzwva2V5PgoJPGRpY3Q+CgkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNyZWF0b3I8L2tleT4KCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuaXRlbUFycmF5PC9rZXk+CgkJPGFycmF5PgoJCQk8ZGljdD4KCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhZ2VGb3JtYXQuUE1TY2FsaW5nPC9rZXk+CgkJCQk8cmVhbD4xPC9yZWFsPgoJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNsaWVudDwva2V5PgoJCQkJPHN0cmluZz5jb20uYXBwbGUucHJpbnRpbmdtYW5hZ2VyPC9zdHJpbmc+CgkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQubW9kRGF0ZTwva2V5PgoJCQkJPGRhdGU+MjAwNy0wMi0xMlQxNTowODoxOVo8L2RhdGU+CgkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuc3RhdGVGbGFnPC9rZXk+CgkJCQk8aW50ZWdlcj4wPC9pbnRlZ2VyPgoJCQk8L2RpY3Q+CgkJPC9hcnJheT4KCTwvZGljdD4KCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhZ2VGb3JtYXQuUE1WZXJ0aWNhbFJlczwva2V5PgoJPGRpY3Q+CgkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNyZWF0b3I8L2tleT4KCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuaXRlbUFycmF5PC9rZXk+CgkJPGFycmF5PgoJCQk8ZGljdD4KCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhZ2VGb3JtYXQuUE1WZXJ0aWNhbFJlczwva2V5PgoJCQkJPHJlYWw+NzI8L3JlYWw+CgkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuY2xpZW50PC9rZXk+CgkJCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5tb2REYXRlPC9rZXk+CgkJCQk8ZGF0ZT4yMDA3LTAyLTEyVDE1OjA4OjE5WjwvZGF0ZT4KCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5zdGF0ZUZsYWc8L2tleT4KCQkJCTxpbnRlZ2VyPjA8L2ludGVnZXI+CgkJCTwvZGljdD4KCQk8L2FycmF5PgoJPC9kaWN0PgoJPGtleT5jb20uYXBwbGUucHJpbnQuUGFnZUZvcm1hdC5QTVZlcnRpY2FsU2NhbGluZzwva2V5PgoJPGRpY3Q+CgkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNyZWF0b3I8L2tleT4KCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuaXRlbUFycmF5PC9rZXk+CgkJPGFycmF5PgoJCQk8ZGljdD4KCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhZ2VGb3JtYXQuUE1WZXJ0aWNhbFNjYWxpbmc8L2tleT4KCQkJCTxyZWFsPjE8L3JlYWw+CgkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuY2xpZW50PC9rZXk+CgkJCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5tb2REYXRlPC9rZXk+CgkJCQk8ZGF0ZT4yMDA3LTAyLTEyVDE1OjA4OjE5WjwvZGF0ZT4KCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5zdGF0ZUZsYWc8L2tleT4KCQkJCTxpbnRlZ2VyPjA8L2ludGVnZXI+CgkJCTwvZGljdD4KCQk8L2FycmF5PgoJPC9kaWN0PgoJPGtleT5jb20uYXBwbGUucHJpbnQuc3ViVGlja2V0LnBhcGVyX2luZm9fdGlja2V0PC9rZXk+Cgk8ZGljdD4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC5QYWdlRm9ybWF0LlBNQWRqdXN0ZWRQYWdlUmVjdDwva2V5PgoJCTxkaWN0PgoJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuY3JlYXRvcjwva2V5PgoJCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0Lml0ZW1BcnJheTwva2V5PgoJCQk8YXJyYXk+CgkJCQk8ZGljdD4KCQkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC5QYWdlRm9ybWF0LlBNQWRqdXN0ZWRQYWdlUmVjdDwva2V5PgoJCQkJCTxhcnJheT4KCQkJCQkJPHJlYWw+MC4wPC9yZWFsPgoJCQkJCQk8cmVhbD4wLjA8L3JlYWw+CgkJCQkJCTxyZWFsPjc4MzwvcmVhbD4KCQkJCQkJPHJlYWw+NTU5PC9yZWFsPgoJCQkJCTwvYXJyYXk+CgkJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNsaWVudDwva2V5PgoJCQkJCTxzdHJpbmc+Y29tLmFwcGxlLnByaW50aW5nbWFuYWdlcjwvc3RyaW5nPgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5tb2REYXRlPC9rZXk+CgkJCQkJPGRhdGU+MjAwNy0wMi0xM1QxMjoxODowOFo8L2RhdGU+CgkJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LnN0YXRlRmxhZzwva2V5PgoJCQkJCTxpbnRlZ2VyPjA8L2ludGVnZXI+CgkJCQk8L2RpY3Q+CgkJCTwvYXJyYXk+CgkJPC9kaWN0PgoJCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhZ2VGb3JtYXQuUE1BZGp1c3RlZFBhcGVyUmVjdDwva2V5PgoJCTxkaWN0PgoJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuY3JlYXRvcjwva2V5PgoJCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0Lml0ZW1BcnJheTwva2V5PgoJCQk8YXJyYXk+CgkJCQk8ZGljdD4KCQkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC5QYWdlRm9ybWF0LlBNQWRqdXN0ZWRQYXBlclJlY3Q8L2tleT4KCQkJCQk8YXJyYXk+CgkJCQkJCTxyZWFsPi0xODwvcmVhbD4KCQkJCQkJPHJlYWw+LTE4PC9yZWFsPgoJCQkJCQk8cmVhbD44MjQ8L3JlYWw+CgkJCQkJCTxyZWFsPjU3NzwvcmVhbD4KCQkJCQk8L2FycmF5PgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5jbGllbnQ8L2tleT4KCQkJCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQubW9kRGF0ZTwva2V5PgoJCQkJCTxkYXRlPjIwMDctMDItMTNUMTI6MTg6MDhaPC9kYXRlPgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5zdGF0ZUZsYWc8L2tleT4KCQkJCQk8aW50ZWdlcj4wPC9pbnRlZ2VyPgoJCQkJPC9kaWN0PgoJCQk8L2FycmF5PgoJCTwvZGljdD4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC5QYXBlckluZm8uUE1QYXBlck5hbWU8L2tleT4KCQk8ZGljdD4KCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNyZWF0b3I8L2tleT4KCQkJPHN0cmluZz5jb20uYXBwbGUucHJpbnQucG0uUG9zdFNjcmlwdDwvc3RyaW5nPgoJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuaXRlbUFycmF5PC9rZXk+CgkJCTxhcnJheT4KCQkJCTxkaWN0PgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhcGVySW5mby5QTVBhcGVyTmFtZTwva2V5PgoJCQkJCTxzdHJpbmc+aXNvLWE0PC9zdHJpbmc+CgkJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNsaWVudDwva2V5PgoJCQkJCTxzdHJpbmc+Y29tLmFwcGxlLnByaW50LnBtLlBvc3RTY3JpcHQ8L3N0cmluZz4KCQkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQubW9kRGF0ZTwva2V5PgoJCQkJCTxkYXRlPjIwMDMtMDctMDFUMTc6NDk6MzZaPC9kYXRlPgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5zdGF0ZUZsYWc8L2tleT4KCQkJCQk8aW50ZWdlcj4xPC9pbnRlZ2VyPgoJCQkJPC9kaWN0PgoJCQk8L2FycmF5PgoJCTwvZGljdD4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC5QYXBlckluZm8uUE1VbmFkanVzdGVkUGFnZVJlY3Q8L2tleT4KCQk8ZGljdD4KCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNyZWF0b3I8L2tleT4KCQkJPHN0cmluZz5jb20uYXBwbGUucHJpbnQucG0uUG9zdFNjcmlwdDwvc3RyaW5nPgoJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuaXRlbUFycmF5PC9rZXk+CgkJCTxhcnJheT4KCQkJCTxkaWN0PgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhcGVySW5mby5QTVVuYWRqdXN0ZWRQYWdlUmVjdDwva2V5PgoJCQkJCTxhcnJheT4KCQkJCQkJPHJlYWw+MC4wPC9yZWFsPgoJCQkJCQk8cmVhbD4wLjA8L3JlYWw+CgkJCQkJCTxyZWFsPjc4MzwvcmVhbD4KCQkJCQkJPHJlYWw+NTU5PC9yZWFsPgoJCQkJCTwvYXJyYXk+CgkJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNsaWVudDwva2V5PgoJCQkJCTxzdHJpbmc+Y29tLmFwcGxlLnByaW50aW5nbWFuYWdlcjwvc3RyaW5nPgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5tb2REYXRlPC9rZXk+CgkJCQkJPGRhdGU+MjAwNy0wMi0xMlQxNTowODoxOVo8L2RhdGU+CgkJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LnN0YXRlRmxhZzwva2V5PgoJCQkJCTxpbnRlZ2VyPjA8L2ludGVnZXI+CgkJCQk8L2RpY3Q+CgkJCTwvYXJyYXk+CgkJPC9kaWN0PgoJCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhcGVySW5mby5QTVVuYWRqdXN0ZWRQYXBlclJlY3Q8L2tleT4KCQk8ZGljdD4KCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LmNyZWF0b3I8L2tleT4KCQkJPHN0cmluZz5jb20uYXBwbGUucHJpbnQucG0uUG9zdFNjcmlwdDwvc3RyaW5nPgoJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuaXRlbUFycmF5PC9rZXk+CgkJCTxhcnJheT4KCQkJCTxkaWN0PgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LlBhcGVySW5mby5QTVVuYWRqdXN0ZWRQYXBlclJlY3Q8L2tleT4KCQkJCQk8YXJyYXk+CgkJCQkJCTxyZWFsPi0xODwvcmVhbD4KCQkJCQkJPHJlYWw+LTE4PC9yZWFsPgoJCQkJCQk8cmVhbD44MjQ8L3JlYWw+CgkJCQkJCTxyZWFsPjU3NzwvcmVhbD4KCQkJCQk8L2FycmF5PgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5jbGllbnQ8L2tleT4KCQkJCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludGluZ21hbmFnZXI8L3N0cmluZz4KCQkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQubW9kRGF0ZTwva2V5PgoJCQkJCTxkYXRlPjIwMDctMDItMTJUMTU6MDg6MTlaPC9kYXRlPgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5zdGF0ZUZsYWc8L2tleT4KCQkJCQk8aW50ZWdlcj4wPC9pbnRlZ2VyPgoJCQkJPC9kaWN0PgoJCQk8L2FycmF5PgoJCTwvZGljdD4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC5QYXBlckluZm8ucHBkLlBNUGFwZXJOYW1lPC9rZXk+CgkJPGRpY3Q+CgkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5jcmVhdG9yPC9rZXk+CgkJCTxzdHJpbmc+Y29tLmFwcGxlLnByaW50LnBtLlBvc3RTY3JpcHQ8L3N0cmluZz4KCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0Lml0ZW1BcnJheTwva2V5PgoJCQk8YXJyYXk+CgkJCQk8ZGljdD4KCQkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC5QYXBlckluZm8ucHBkLlBNUGFwZXJOYW1lPC9rZXk+CgkJCQkJPHN0cmluZz5BNDwvc3RyaW5nPgoJCQkJCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5jbGllbnQ8L2tleT4KCQkJCQk8c3RyaW5nPmNvbS5hcHBsZS5wcmludC5wbS5Qb3N0U2NyaXB0PC9zdHJpbmc+CgkJCQkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0Lm1vZERhdGU8L2tleT4KCQkJCQk8ZGF0ZT4yMDAzLTA3LTAxVDE3OjQ5OjM2WjwvZGF0ZT4KCQkJCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQuc3RhdGVGbGFnPC9rZXk+CgkJCQkJPGludGVnZXI+MTwvaW50ZWdlcj4KCQkJCTwvZGljdD4KCQkJPC9hcnJheT4KCQk8L2RpY3Q+CgkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LkFQSVZlcnNpb248L2tleT4KCQk8c3RyaW5nPjAwLjIwPC9zdHJpbmc+CgkJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LnByaXZhdGVMb2NrPC9rZXk+CgkJPGZhbHNlLz4KCQk8a2V5PmNvbS5hcHBsZS5wcmludC50aWNrZXQudHlwZTwva2V5PgoJCTxzdHJpbmc+Y29tLmFwcGxlLnByaW50LlBhcGVySW5mb1RpY2tldDwvc3RyaW5nPgoJPC9kaWN0PgoJPGtleT5jb20uYXBwbGUucHJpbnQudGlja2V0LkFQSVZlcnNpb248L2tleT4KCTxzdHJpbmc+MDAuMjA8L3N0cmluZz4KCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC5wcml2YXRlTG9jazwva2V5PgoJPGZhbHNlLz4KCTxrZXk+Y29tLmFwcGxlLnByaW50LnRpY2tldC50eXBlPC9rZXk+Cgk8c3RyaW5nPmNvbS5hcHBsZS5wcmludC5QYWdlRm9ybWF0VGlja2V0PC9zdHJpbmc+CjwvZGljdD4KPC9wbGlzdD4KOEJJTQPpAAAAAAB4AAMAAABIAEgAAAAAAw8CL//u/+4DOAJBA2cFewPgAAIAAABIAEgAAAAAAtgCKAABAAAAZAAAAAEAAwMDAAAAAX//AAEAAQAAAAAAAAAAAAAAAGgIABkBkAAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOEJJTQPtAAAAAAAQAF8AAAABAAIAXwAAAAEAAjhCSU0EJgAAAAAADgAAAAAAAAAAAAA/gAAAOEJJTQQNAAAAAAAEAAAAHjhCSU0EGQAAAAAABAAAAB44QklNA/MAAAAAAAkAAAAAAAAAAAEAOEJJTQQKAAAAAAABAAA4QklNJxAAAAAAAAoAAQAAAAAAAAACOEJJTQP1AAAAAABIAC9mZgABAGxmZgAGAAAAAAABAC9mZgABAKGZmgAGAAAAAAABADIAAAABAFoAAAAGAAAAAAABADUAAAABAC0AAAAGAAAAAAABOEJJTQP4AAAAAABwAAD/////////////////////////////A+gAAAAA/////////////////////////////wPoAAAAAP////////////////////////////8D6AAAAAD/////////////////////////////A+gAADhCSU0ECAAAAAAAEAAAAAEAAAJAAAACQAAAAAA4QklNBB4AAAAAAAQAAAAAOEJJTQQaAAAAAANPAAAABgAAAAAAAAAAAAACZAAAAb0AAAANADkANwA4ADgANAAyADQAMQAxADkAMgAwADEAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAb0AAAJkAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAEAAAAAAABudWxsAAAAAgAAAAZib3VuZHNPYmpjAAAAAQAAAAAAAFJjdDEAAAAEAAAAAFRvcCBsb25nAAAAAAAAAABMZWZ0bG9uZwAAAAAAAAAAQnRvbWxvbmcAAAJkAAAAAFJnaHRsb25nAAABvQAAAAZzbGljZXNWbExzAAAAAU9iamMAAAABAAAAAAAFc2xpY2UAAAASAAAAB3NsaWNlSURsb25nAAAAAAAAAAdncm91cElEbG9uZwAAAAAAAAAGb3JpZ2luZW51bQAAAAxFU2xpY2VPcmlnaW4AAAANYXV0b0dlbmVyYXRlZAAAAABUeXBlZW51bQAAAApFU2xpY2VUeXBlAAAAAEltZyAAAAAGYm91bmRzT2JqYwAAAAEAAAAAAABSY3QxAAAABAAAAABUb3AgbG9uZwAAAAAAAAAATGVmdGxvbmcAAAAAAAAAAEJ0b21sb25nAAACZAAAAABSZ2h0bG9uZwAAAb0AAAADdXJsVEVYVAAAAAEAAAAAAABudWxsVEVYVAAAAAEAAAAAAABNc2dlVEVYVAAAAAEAAAAAAAZhbHRUYWdURVhUAAAAAQAAAAAADmNlbGxUZXh0SXNIVE1MYm9vbAEAAAAIY2VsbFRleHRURVhUAAAAAQAAAAAACWhvcnpBbGlnbmVudW0AAAAPRVNsaWNlSG9yekFsaWduAAAAB2RlZmF1bHQAAAAJdmVydEFsaWduZW51bQAAAA9FU2xpY2VWZXJ0QWxpZ24AAAAHZGVmYXVsdAAA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'})


cr_ch1 = Chapter.create!({title: "CR Capitulo1", body: node1, story: story1})
cr_ch2 = Chapter.create!({title: "CR Capitulo2", body: node2, story: story1})
cr_ch3 = Chapter.create!({title: "CR Capitulo3", body: node3, story: story1})
cr_ch4 = Chapter.create!({title: "CR Capitulo4", body: node4, story: story1})

cr_story.chapters << cr_ch1
cr_story.chapters << cr_ch2
cr_story.chapters << cr_ch3
cr_story.chapters << cr_ch4

cr_story.save!

cr_o12 = Option.create!({option: "Historia tradicional", parent: cr_ch1, child: cr_ch2})
cr_o13 = Option.create!({option: "Caperucita valiente", parent: cr_ch1, child: cr_ch3})
cr_o14 = Option.create!({option: "Caperucita fiestera", parent: cr_ch1, child: cr_ch4})
