# Ruby

## Preparar nuestro ambiente de desarrollo

En esta explicación se trata de explicar en una guía paso a paso cómo preparar un ambiente de desarrollo local para Ruby.

### Gestores de ambiente

Los gestores de ambiente, también llamados manejadores de versiones, facilitan el uso de múltiples
versiones de un lenguaje (Ruby, en nuestro caso) en un mismo sistema.
Idealmente, el gestor de ambiente será una herramienta que no se note pero que estará presente en
la shell, cambiando la versión de Ruby automáticamente (acorde a reglas bien definidas) o según las
indicaciones particulares del usuario.

Los más populares:
* RVM
    * Ruby enVironment Manager.
    * Herramienta pionera en su función.
* rbenv
    * Ruby environment.
    * Alternativa más liviana y con menores pre‐requisitos que RVM.
    * Extensible mediante plugins.


### Instalación de rbenv

Para instalar este gestor, se debe contar con el comando git , las librerías necesarias para compilar
programas escritos en C y algunas dependencias más. En la versión actual de Ubuntu (22.04 al mo‐
mento de escribir esta guía), por ejemplo, los paquetes necesarios pueden instalarse con los siguien‐
tes comandos:

```
apt update -qq
```
```
apt install -y git \ build-essential \ autoconf \ bison \ curl \ lib{ssl,yaml,sqlite3}-dev \ libreadline{8,-dev} \ zlib1g{,-dev}
```

Una vez que se cuente con los requisitos, se puede proceder a realizar la instalación.
El primer paso es clonar el repositorio de rbenv localmente. Esto se hará en el directorio .rbenv den‐
tro del directorio personal ( $HOME ) del usuario que se deseee:

```
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
```

Después de esto, se debe configurar la shell para que cargue rbenv cada vez que se inicie, dejando
disponibles los shims que rbenv genera para poder cambiar automáticamente las versiones de las
herramientas. Esto se hace agregando al archivo de perfil ( ~/.bashrc en este caso) de la shell 2 lí‐
neas:
* una que agrega al principio de la variable de ambiente $PATH la ruta al directorio bin de rbenv
(donde están los shims ejecutables), y
* otra que carga el script de inicialización de rbenv.
Esto puede hacerse ejecutando los siguientes comandos:

```
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
```
```
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
```

> Nota: el archivo de perfil del usuario puede variar según el Sistema Operativo que se utilice y
según el intérprete de comandos (Bash, Zsh, Ksh, entre otros). El archivo al que se hace referencia
aquí es a uno que se cargue cuando la shell se inicie. En otras distribuciones de GNU/Linux, por
ejemplo, el archivo es `~/.bash_profile .`