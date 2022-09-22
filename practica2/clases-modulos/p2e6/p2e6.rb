
require_relative 'documento.rb'
require_relative 'usuario.rb'


un_usuario_lector        = Usuario.new('nuts','Lector')
un_usuario_redactor      = Usuario.new('gimena','Redactor')
un_usuario_director      = Usuario.new('matz','Director')
un_usuario_administrador = Usuario.new('agustin92','Administrador')

# Creando documentos

un_documento_publico = un_usuario_lector.crear_documento(true,"RBS es un lenguaje para describir la estructura de programas Ruby")
un_documento_privado = un_usuario_redactor.crear_documento(false,"Ruby es el mejor amigo de un desarollador")

# Probando borrar

p un_documento.borrado
p un_usuario_lector.borrar(un_documento)
p un_documento.borrado # No se borra porque lo borro un lector
p un_usuario_administrador.borrar(un_documento)
p un_documento.borrado # Se borra porque lo borro un administrador

# Probando puede ser visto por

p un_documento_publico.puede_ser_visto_por? un_usuario_lector
p un_documento_privado.puede_ser_visto_por? un_usuario_redactor
p un_documento_publico.puede_ser_visto_por? un_usuario_director
p un_documento_privado.puede_ser_visto_por? un_usuario_administrador

# Probando puede ser modificado por

p un_documento_publico.puede_ser_modificado_por? un_usuario_lector
p un_documento_privado.puede_ser_modificado_por? un_usuario_redactor
p un_documento_publico.puede_ser_modificado_por? un_usuario_director
p un_documento_privado.puede_ser_modificado_por? un_usuario_administrador

# Probando puede ser borrado por

p un_documento_publico.puede_ser_borrado_por? un_usuario_lector
p un_documento_privado.puede_ser_borrado_por? un_usuario_redactor
p un_documento_publico.puede_ser_borrado_por? un_usuario_director
p un_documento_privado.puede_ser_borrado_por? un_usuario_administrador