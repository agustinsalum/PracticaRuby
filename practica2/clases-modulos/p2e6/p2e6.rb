
require_relative 'rol.rb'
require_relative 'usuario.rb'

rol_lector         = RolLector.new()
rol_redactor       = RolRedactor.new()
rol_director       = RolDirector.new()
rol_administrador  = RolAdministrador.new()

usuario_lector        = Usuario.new('yuki',rol_lector)
usuario_redactor      = Usuario.new('matz',rol_redactor)
usuario_director      = Usuario.new('gimena',rol_director)
usuario_administrador = Usuario.new('agustin92',rol_administrador)

documento_publico = usuario_lector.crear_documento(true,"RBS es un lenguaje para describir la estructura de programas Ruby")
documento_privado = usuario_redactor.crear_documento(false,"Ruby es el mejor amigo de un desarollador")


#Probando borrar

usuario_lector.borrar(documento_publico)
p documento_publico.borrado # No puede borrarlo
usuario_administrador.borrar(documento_publico)
p documento_publico.borrado # Se borra porque lo borro un administrador


# Probando puede ser visto por

p documento_publico.puede_ser_visto_por? usuario_lector
p documento_privado.puede_ser_visto_por? usuario_lector
p documento_privado.puede_ser_visto_por? usuario_administrador


# Probando puede ser modificado por

p documento_publico.puede_ser_modificado_por? usuario_lector
p documento_privado.puede_ser_modificado_por? usuario_redactor
p documento_publico.puede_ser_modificado_por? usuario_redactor
p documento_publico.puede_ser_modificado_por? usuario_director
p documento_privado.puede_ser_modificado_por? usuario_administrador


# Probando puede ser borrado por

p documento_publico.puede_ser_borrado_por? usuario_director
p documento_privado.puede_ser_borrado_por? usuario_administrador


