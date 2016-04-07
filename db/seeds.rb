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
                                 description: 'Género dramático'
                             })

category2 = Category.create!({
                                 name: 'Cuento',
                                 description: 'Género de cuentos'
                             })

category3 = Category.create!({
                                 name: 'Ficción',
                                 description: 'Género de ficción'
                             })

category4 = Category.create!({
                                 name: 'Terror',
                                 description: 'Género de terror'
                             })

category5 = Category.create!({
                                 name: 'Épico',
                                 description: 'Género épico'
                             })

category6 = Category.create!({
                                 name: 'Aventura',
                                 description: 'Género de aventuras'
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
                        published: true, num_purchased: 0, creatorProfile: user1.profile, cover: 'http://www.upl.co/uploads/drama1460039396.jpg'})

story2 = Story.create!({title: 'Title2', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user1.profile})

story3 = Story.create!({title: 'Title3', description: 'Description', language: 'ENGLISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user1.profile, cover: 'http://www.upl.co/uploads/ficcion1460039396.jpg'})

story4 = Story.create!({title: 'Title4', description: 'Description', language: 'ENGLISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user1.profile, cover: 'http://www.upl.co/uploads/Terror1460039396.jpg'})

story5 = Story.create!({title: 'Title5', description: 'Description', language: 'CHINESE', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile, cover: 'http://www.upl.co/uploads/epico1460039396.jpg'})

story6 = Story.create!({title: 'Title6', description: 'Description', language: 'SPANISH', price: 16.30, release_date: '20/10/2015',
                        published: true, num_purchased: 0, creatorProfile: user2.profile, cover: 'http://www.upl.co/uploads/aventura1460039396.jpg'})

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



membership_card1.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde01' })
membership_card2.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde02' })
membership_card3.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde03' })
membership_card4.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde04' })
membership_card5.update({premiumMonths: 3, expiration:  Date.today + 15, usage: nil, code: '0123456789abcde05' })

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
