# PracticaRuby
Practicas del taller de Ruby

En esta explicación se trata de explicar en una guía paso a paso cómo preparar un ambiente de desa‐
rrollo local para Ruby.

#Gestores de ambiente

Los gestores de ambiente, también llamados manejadores de versiones, facilitan el uso de múltiples
versiones de un lenguaje (Ruby, en nuestro caso) en un mismo sistema.
Idealmente, el gestor de ambiente será una herramienta que no se note pero que estará presente en
la shell, cambiando la versión de Ruby automáticamente (acorde a reglas bien definidas) o según las
indicaciones particulares del usuario.

Los más populares:
    • RVM
        – Ruby enVironment Manager.
        – Herramienta pionera en su función.
    • rbenv
        – Ruby environment.
        – Alternativa más liviana y con menores pre‐requisitos que RVM.
        – Extensible mediante plugins.

#rbenv

En esta explicación nos vamos a centrar en rbenv, el gestor que desde la cátedra recomendamos
utilizar.

#Instalación de rbenv

Para instalar este gestor, se debe contar con el comando git , las librerías necesarias para compilar
programas escritos en C y algunas dependencias más. En la versión actual de Ubuntu (22.04 al mo‐
mento de escribir esta guía), por ejemplo, los paquetes necesarios pueden instalarse con los siguien‐
tes comandos:

