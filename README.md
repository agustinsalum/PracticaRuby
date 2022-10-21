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

Y por último, se debe reiniciar la shell para que tome los cambios. Esto puede hacerse saliendo (conel comando exit o presionando Ctrld, por ejemplo) de la sesión de shell y volviendo a entrar, o bien
ejecutando el siguiente comando:

```
exec $SHELL -l
```

Luego de esto, se puede comprobar si la instalación de rbenv fue exitosa al ejecutar el siguiente co‐
mando:

```
type rbenv
```

La salida esperada para ese comando debe ser similar a esto:

```
rbenv is a function
rbenv ()
{
    local command;
    command="${1:-}";
    if [ "$#" -gt 0 ]; then
        shift;
    fi;
    case "$command" in
        rehash | shell)
        eval "$(rbenv "sh-$command" "$@")"
        ;;
        *)
            command rbenv "$command" "$@"
        ;;
    esac
}
```

Si esa fue la salida, se pueden verificar las versiones de Ruby disponibles con el siguiente comando:

```
rbenv versions
```

Normalmente, esto debería indicar que no se encuentran versiones de Ruby en el sistema:

```
Warning: no Ruby detected on the system
```

Para poder instalar versiones de Ruby, se debe continuar con el siguiente apartado.

### Instalación de ruby‐build

La herramienta rbenv por si sola nos permite cambiar de versiones de Ruby, pero no instala nuevas
versiones. Para poder hacer eso, se debe contar con el plugin ruby-build para rbenv.
Su instalación es muy sencilla:

```
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins
/ruby-build
```

A partir de esto se pueden ver las versiones de Ruby disponibles para instalar ejecutando el siguiente
comando:

```
rbenv install -l
```

Y si se quiere instalar cualquiera de las versiones que se listan, sólo basta especificar la versión y ruby
-build se encargará de instalarla. Por ejemplo, para instalar la versión 2.7.6 se debe ejecutar este
comando (que puede tardar):

```
rbenv install 3.1.2
```

Si todo salió bien, se puede corroborar que se disponga de la versión deseada con este comando:

```
rbenv versions
```

La salida del comando debería incluir 2.7.6 . De ser así, la instalación fue exitosa.
Aún cuando se tenga instalada una versión de Ruby, si se intenta ejecutar su intérprete es probable
que se obtenga un error como el siguiente:


>ruby -v
>rbenv: ruby: command not found
>The `ruby' command exists in these Ruby versions:
>3.1.2


