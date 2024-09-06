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

Para instalar este gestor, se debe contar con el comando git, las librerías necesarias para compilar
programas escritos en C y algunas dependencias más. En la versión actual de Ubuntu 18, por ejemplo, los paquetes necesarios pueden instalarse con los siguientes comandos:

```
apt update -qq
```

```
sudo apt-get install build-essential
```

```
sudo apt-get install autoconf
```

```
sudo apt-get install bison
```

```
sudo apt-get install curl
```

```
sudo apt-get install libssl-dev
```

```
sudo apt-get install libyaml-dev
```

```
sudo apt-get install libsqlite3-dev
```

```
sudo apt-get install libreadline8
```

```
sudo apt-get install libreadline-dev
```

```
sudo apt-get install zlib1g
```

```
sudo apt-get install zlib1g-dev
```

```
sudo apt-get install libpq-dev
```

Una vez que se cuente con los requisitos, se puede proceder a realizar la instalación.
El primer paso es clonar el repositorio de rbenv localmente. Esto se hará en el directorio .rbenv den‐
tro del directorio personal ( $HOME ) del usuario que se deseee:

```
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
```

Después de esto, se debe configurar la shell para que cargue rbenv cada vez que se inicie, dejando
disponibles los shims que rbenv genera para poder cambiar automáticamente las versiones de las
herramientas. Esto se hace agregando al archivo de perfil ( ~/.bashrc en este caso) de la shell 2 líneas:

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

Y si se quiere instalar cualquiera de las versiones que se listan, sólo basta especificar la versión y ruby-build se encargará de instalarla. Por ejemplo, para instalar la versión 3.1.2 se debe ejecutar este
comando (que puede tardar):

```
rbenv install 3.1.2
```

Si todo salió bien, se puede corroborar que se disponga de la versión deseada con este comando:

```
rbenv versions
```

La salida del comando debería incluir 3.1.2 . De ser así, la instalación fue exitosa.
Aún cuando se tenga instalada una versión de Ruby, si se intenta ejecutar su intérprete es probable
que se obtenga un error como el siguiente:

```
ruby -v
rbenv: ruby: command not found
The `ruby' command exists in these Ruby versions:
3.1.2
```

Esto se debe a que aún no se ha especificado qué versión de Ruby utilizar. Esto se hará en la próxima
sección.

>Nota: esta forma de instalar rbenv hace deseable la actualización periódica de rbenv y ruby‐build
para poder tener acceso a las últimas versiones del lenguaje.
Para esto, basta con ejecutar cada tanto los siguientes comandos con el usuario que se haya instalado rbenv:

```
cd ~/.rbenv
git pull origin master
cd plugins/ruby-build
git pull origin master
```

### Uso

El uso de este gestor es, en general, totalmente transparente al usuario y automático. La herramienta
se encarga de cambiar la versión de Ruby a utilizar acorde a reglas bien definidas, que se conside‐
ran en el siguiente orden (toma la la primera versión que se especifique respetando este orden de
prioridad):
1. El valor de la variable de ambiente $RBENV_VERSION . Esta se llama versión de shell .
2. El contenido del primer archivo llamado .ruby-version encontrado desde el directorio don‐
de reside el script Ruby que se esté ejecutando, o subiendo de a un nivel en los directorios padre
hasta alcanzar la raiz del filesystem (el directorio / ).
3. El contenido del primer archivo llamado .ruby-version encontrado desde el directorio ac‐
tual donde esté posicionado el usuario, o subiendo de a un nivel en los directorios padre hasta
alcanzar la raiz del filesystem. Esta se llama versión local .
4. La versión global especificada en el archivo ~/.rbenv/global .
Rbenv provee algunos comandos que permiten generar o modificar la versión de Ruby deseada en
los distintos contextos:
* La versión shell se puede especificar con el comando rbenv shell 2.7.6 .
* La versión local se puede especificar con el comando rbenv local 2.7.6 .
* La versión global se puede especificar con el comando rbenv global 2.7.6 .
Con esto en mente, es conveniente definir la versión global de Ruby que se desea utilizar:

```
rbenv global 3.1.2
```

Luego de esto, se puede corroborar que ahora sí se puede utilizar el intérprete de Ruby en la versión
deseada:

```
ruby -v
```

Ese comando debería tener una salida que incluya:

```
ruby 3.1.2
```

Con esto se concluye con la instalación del ambiente de Ruby. En cualquier momento, se pueden
instalar otras versiones del intérprete de Ruby ejecutando simplemente:

```
rbenv install VERSION
```

Donde VERSION es la versión que se desea instalar, y que debe estar disponible entre las versiones
que aparecen al ejecutar rbenv install -l.

### Paso final: prueba

Una vez que se tiene el ambiente de desarrollo en Ruby instalado y configurado, se lo puede probar
ejecutando un script escrito en Ruby. Para ello, se puede tomar el que se incluye en el repositorio.
Para ejecutar cualquier archivo utilizando el intérprete de Ruby, se usa un comando como el siguiente:

```
ruby ruta/al/archivo.rb
```

>Notar que la extensión .rb es simplemente una convención, los archivos Ruby son archivos de texto
plano, más allá de su extensión (o la ausencia de la misma); es decir que el script podría llamarse
hello , hello.ruby o de cualquier otra manera, y sin importar eso si el archivo es de texto plano y el
contenido es código Ruby válido, el intérprete lo ejecutará sin problemas.
