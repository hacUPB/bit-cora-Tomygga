# INVESTIGACIÓN

## ACTIVIDAD 1

### ¿Qué son los vértices?
Los vértices son puntos que marcan la forma de un objeto 3D. Cada vértice tiene una posición en el espacio (x, y, z) y puede tener información adicional como color o coordenadas de textura. Al conectar varios vértices se crean los triángulos que forman el modelo.

### ¿Con qué figura geométrica se dibuja en 3D?
Se utiliza el triángulo. Es la figura básica en los gráficos 3D porque con tres puntos se puede definir cualquier superficie sin ambigüedades.

### ¿Qué es un shader?
Un shader es un programa que se ejecuta en la GPU y que le dice al sistema cómo debe mostrarse un objeto en pantalla. Controla aspectos como el color, la luz, las sombras o los efectos visuales.

### ¿Cómo se le llaman a los grupos de píxeles de un mismo triángulo?
A esos grupos se les conoce como fragmentos. Cada fragmento representa un píxel posible del triángulo que será procesado antes de mostrarse.

### ¿Qué es un fragment shader?
Es un tipo de shader que trabaja con los fragmentos. Su función es determinar el color final de cada píxel, aplicando efectos de iluminación, textura o transparencia.

### ¿Qué es un vertex shader?
Es el shader encargado de procesar los vértices de los modelos. Se usa para transformar las posiciones 3D al espacio de la cámara y luego a la pantalla, además de aplicar rotaciones, escalas o movimientos.

###  ¿Al proceso de determinar qué pixels del display va a cubrir cada triángulo de una mesh se le llama?
Ese proceso se llama rasterización. Es el paso donde los triángulos se convierten en fragmentos que luego se colorean.

### ¿Qué es el render pipeline?
Es la secuencia de pasos que realiza la GPU para pasar de los datos 3D a una imagen 2D visible. Incluye la transformación de los vértices, la rasterización, los shaders y la escritura en el framebuffer.

### ¿Hay alguna diferencia entre aplicar un color a una superficie de una mesh o aplicar una textura?
Sí. Aplicar un color significa pintar todo el objeto con un mismo tono, mientras que una textura es una imagen que se coloca sobre la superficie para darle más detalle y realismo.

###  ¿Cuál es la diferencia entre una textura y un material?
La textura es solo una imagen que da apariencia visual, pero el material incluye además propiedades físicas como el brillo, la transparencia o la forma en que refleja la luz.

### ¿Qué transformaciones se requieren para mover un vértice del 3D world al View Screen?
Se aplican tres tipos de transformaciones:

- Model: coloca el objeto en su posición dentro del mundo.

- View: ajusta la cámara o el punto de vista.

- Projection: transforma las coordenadas 3D en coordenadas de pantalla (2D).

### ¿Al proceso de convertir los triángulos en fragmentos se le llama?
Se llama rasterización, el mismo proceso que traduce la geometría en píxeles listos para ser dibujados.

### ¿Qué es el framebuffer?
Es una zona de memoria donde se almacena la imagen final que se mostrará en pantalla. Guarda el color y otros datos de cada píxel procesado.

### ¿Para qué se usa el Z-buffer o depth buffer en el render pipeline?
Sirve para guardar la distancia de cada píxel con respecto a la cámara. Así se puede saber qué objetos están delante o detrás y evitar que se dibujen partes que no deben verse.

### por qué la GPU tiene que funcionar tan rápido y de manera paralela. 

La GPU debe ser rápida y trabajar en paralelo porque necesita procesar millones de cálculos al mismo tiempo, como los colores y luces de cada píxel. Si lo hiciera uno por uno, sería muy lento y las imágenes o juegos se verían con retraso.

### ¿Te gustaron los videos?

Cumplen su proposito de dar a entender como funciona una GPU y CPU, pero de igual manera los videos de aprendizaje son en su mayoría aburridos, asi que no.

## ACTIVIDAD 2

## ACTIVIDAD 3

## ACTIVIDAD 4
