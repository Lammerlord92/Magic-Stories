module ApplicationHelper
=begin

Métodos para controlar el acceso a las distintas operaciones.
Estos métodos son accesibles desde cualquier controlador.
Los métodos con interrogación devuelven true-false
Los métodos con exclamación lanzan un RuntimeError.

=end
  def checkPrincipal?(user)
    current_user.id.eql?(user.id)
  end

  def checkPrincipal!(user)
    if(!current_user.id.eql?(user.id))
      raise 'Operacion no permitida.'
    end
  end

  ## Recibe un usuario y un rol, comprueba que ese usuario tiene ese rol.
  ## Hay que pasarle la clase del rol, sería algo así checkRole?("Administrator", usuario1)
  def checkRole?(role, user)
    user.role_type.eql?(role)
  end

  def checkRole!(role, user)
    if(!user.role_type.eql?(role))
      raise 'Operacion no permitida. Su cuenta no dispone de privilegios suficientes'
    end
  end



  ## Métodos más especificos por usuarios actuales
  def checkAdmin?(user)
    checkRole?("Administrator", user)
  end

  def checkAdmin!(user)
    checkRole!("Administrator", user)
  end

  def checkFreeUser?(user)
    checkRole?("FreeUser", user)
  end

  def checkFreeUser!(user)
    checkRole!("FreeUser", user)
  end

  def checkPremiumUser?(user)
    checkRole?("PremiumUser", user)
  end

  def checkPremiumUser!(user)
    checkRole?("PremiumUser", user)
  end

  def unsigned_index
    if !user_signed_in?
      redirect_to "/user/"
    end
  end

end
