module ApplicationHelper
=begin

Métodos para controlar el acceso a las distintas operaciones.
Estos métodos son accesibles desde cualquier controlador.
Los métodos con interrogación devuelven true-false
Los métodos con exclamación lanzan una except.

=end
  def checkPrincipal?(user)
    current_user.id.equal?(user.id)
  end

  def checkRole?(user)
    current_user.role.equal?(user.role)
  end

  def checkRole!(user)
    if(current_user.id.equal?(user.id))
      raise 'Operacion no permitida'
    end
  end


  def checkRole!(user)
    if(current_user.role.equal?(user.role))
      raise "Operacion no permitida"
    end
  end
end
