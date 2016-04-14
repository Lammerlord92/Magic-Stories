class IdentityController < ApplicationController
  def create_session
    auth = request.env["omniauth.auth"]
    identity  = Identity.find_by_oauth(auth)
    puts auth
    puts 'Puts auth'
    puts auth["info"].to_hash
    puts auth.to_json

    #Twitter no provee el mail de sus usuarios por tanto se crea uno @treestory.es y se le asocia a la cuenta del usuario.
    #TODO Implementar un método por el que se pueda hacer un paso intermedio con devise para que se rellenen estos campos autogenerados
    #la password también se le autogenera y la edad (menor de 18 por defecto)
    #TODO Por ahora se debe poder cambiar estos campos pues son autogenerados
    if(identity.nil? && auth.provider == "twitter")
      info = auth["info"].to_hash
      identity = Identity.new({uid: auth["uid"], provider: auth["provider"]})
      username = generateUsernameForTwitter
      password = User.generateSKU
      begin
      user = User.create!({identity: identity, username: username, email: username + "@treestory.es", name: info["nickname"],
        password: password, password_confirmation: password, surname1: "Tree", surname2: "Story",
        birthday: Date.today - 3000.days, sku: User.generateSKU})

      # Saltamos validaciones
      user.profile.skip_update_validation = true

      user.profile.update_attributes!({description: info["description"], avatar: info['image']})
      sign_in_and_redirect user, event: :authentication, notice: "Su cuenta se ha generado automáticamente los campos de usuario y pefil deben ser editados \n
      Tu usuario es #{username} y tu contraseña #{password}, cambiela tan pronto como le sea posible."
      rescue
        redirect_to 'welcome/index', notice: 'Ya hay un usuario creado con esa dirección de correo electrónico'
      end

      # En el caso de facebook si aporta el mail por lo tanto se genera solo el nacimiento y la contraseña. En este elsif
      # se contempla que no nos logueamos si no que nos estamos registrando. Si el mail de facebook estuviera
      # persistido en un usuario de nuestra págino no intentaría crear nuevo usuario si no que haría login (siguiente elsif)
    elsif(identity.nil? and auth.provider == "facebook" and User.where({email: auth["info"]["email"]}).first.nil?)
      first_name = auth["info"]["first_name"]
      last_name = auth["info"]["last_name"]
      password = User.generateSKU

      user = User.create!({identity: identity, username: generateUsernameForFacebook, email: auth["info"]["email"], surname1: last_name, surname2: last_name,
        name: first_name, password: password, password_confirmation: password, birthday: Date.today - 3000.days, sku: User.generateSKU})

      # Saltamos validaciones
      user.profile.skip_update_validation = true


      user.profile.update_attributes!({name: auth["info"]["name"], avatar: auth["info"]["image"]})
      sign_in_and_redirect user, event: :authentication, notice: "Su cuenta se ha generado los campos de usuario y pefil deben ser cambiados \n
      Tu usuario es #{username} y tu contraseña #{password}, cambiela tan pronto como le sea posible."

      # En este caso hemos intentado conectar con facebook y nos da un mail que ya está en nuestra base de datos, hace loggin automaticamente.
    elsif(identity.nil? and auth.provider == "facebook" and !User.where({email: auth["info"]["email"]}).first.nil?)
      user = User.where({email: auth["info"]["email"]}).first
      sign_in_and_redirect user, event: :authentication

    else
      user = identity.user
      sign_in_and_redirect user, event: :authentication
    end


  end

# Si 9999 usuarios se conectan a facebook con el mismo nombre y apellido habrá que modificarlo
def generateUsernameForFacebook
  auth1 = request.env["omniauth.auth"]
  first_name = auth1["info"]["first_name"]
  last_name = auth1["info"]["last_name"]
  username = first_name[0..3] + last_name[0..3]
  prng = Random.new
  while(!User.where({username: username}).first.nil?)
    username = first_name[0..3] + last_name[0..3] + prng.rand(0..9999).to_s
  end
  username
end

#  Igualmente al anterior
def generateUsernameForTwitter
  auth = request.env["omniauth.auth"]
  username = auth["info"]["nickname"]
  prng = Random.new
  while(!User.where({username: username}).first.nil?)
    username = first_name[0..3] + last_name[0..3] + prng.rand(0..9999).to_s
  end
  username
end



end
