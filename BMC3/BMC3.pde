///================== Importar librerias =============////

import saito.objloader.*;
import netP5.*;
import oscP5.*;
import controlP5.*;

////===============Crear Objetos=====================////
/*
Tras importar las librerías pertinentes es necesario
crear los objetos de las clases que corresponden a
dichas librerías.

En este punto solo se crearán las instancias de estas
clases; sin embargo, estos objetos aún no están inicializados
Algunos podrías inicializarse en este punto, pero
usualmente es preferible inicializarlos en el setup() ya que
en este punto ya pueden acceder a información pertinente
como el tamño de la ventana o el frameRate del programa
*/


ControlP5 gui;  //objeto que maneja los controles del gui
OscP5 osc; //objeto que maneja las comunicaciones osc
NetAddress maxDir; //dirección de referencia del MAX
Slider vol; //Slider del volumen
Toggle mute; //Toggle button del Mute

OBJModel brain; //Objeto que maneja la imagen 3D del cerebro

////==================================================////
/*
En este punto se crearán los vectores que contendrán la 
información pertinente a la diagramación del cursor.

Cada representación del cursor corresponderá a
4 puntos de vértices y a 6 puntos de referencia 
para las curvas de Bezier que darán la curvatura de la 
línea que une a un par de vértices.

Se requieren 2 grupos de posiciones. La primera CurPos
que será lo que se dibujará en cada instante. La segunda
newPos que será hacia donde se transformará la diagramación
actual a través de una interpolación

Adicionalmente se definen 4 grupos de posiciones (elmPos)
cada una para un elemento: Agua, fuego, tierra y aire.

Finalmente se define un vector de coeficientes que determinarán
qué tanto se expresará cada una de los elementos dependiendo
de la posición en la pantalla.
*/

PVector[] curPos = new PVector[4];
PVector[] curAng = new PVector[6];
PVector[] newPos = new PVector[4];
PVector[] newAng = new PVector[6];

PVector[][] elmPos = new PVector[4][4];
PVector[][] elmAng = new PVector[4][6];
float[] coef = new float[4];

/*
Acá se crearán los vectores correpondientes
a cada elemento y un color actual que estará
presente en el fondo y en el color del cursor
en todo instante. El mismo se definirá a partir
de interpolaciones de los colores de los elementos
a través de los mismos coeficientes que determinan
la cantidad de expresión de cada elemento dentro
del cursor
*/

color[] elmCol = new color[4];
color curCol = color(0, 0, 0);

/*
Estos vectores se crearán para permitir la 
interpolación de la posición y lograr un movimiento
fluido del cursor. Se hace una doble interpolación
para lograr un movimiento curvilineo y no uno recto
al momento de hacer la interpolación
*/

PVector nPos = new PVector(0, 0);
PVector pos = new PVector(0, 0);
PVector pos_ = new PVector(0, 0);

/*
Algunos parámetros booleanos que determinarán la ejecución
de acciones en diferentes partes del programa. 
El oscFlag indica que se ha realizado alguna acción que requiere
comunicación OSC con MAX y por tanto determina que se envíen o no
mensajes OSC.
nextPosFlag por su parte determina que se llame una nueva posición
al simular el comando de teclado J.
*/

boolean oscFlag = false;
boolean nextPosFlag = false;

////=====Parametros para el dibjo del cerebro en 3D====////
/*
En esta sección se declaran las variables azimu y elevación
que corresponderán al estado de rotación del cerebro en 3D
Por otro lado se determina el color del cerebro con col y 
su factor de transparencia con alpha.
*/
float azimu;
float eleva;

float col = 200;
float alpha = 40;
////==================================================////

void setup()
{
  /* 
  En el setup se inicializa el tamaño de la ventana.
  Adicionalmente se especifica el protocolo de render P3D
  para poder dibujar en un espacio tri dimensional
  */
  size(700, 700, P3D);
  /*
  Se inicializan los objetos declarados anteriormetne.
  */
  gui = new ControlP5(this);
  osc = new OscP5(this, 12001);
  maxDir = new NetAddress("127.0.0.1", 12000);
  brain = new OBJModel(this, "brain-simple-mesh.obj", "relative", LINES);
  brain.scale(80);
  /*
  Se llaman dos funciones que permiten la inicialización de los vértices y
  puntos de control de los 4 elementos
  Adicionalemnte se inicializa el fader y el control de Mute correspondientes
  al control gui.
  
  Estas funciones están especificadas en la pestaña init.
  */
  initElements();
  initGui();

  //img = loadImage("Fire.jpg");


  /*
  Estas dos funciones determinan que las lineas se unan con una pequeña curva
  y que el extremo de una linea sea redonda y no recta.
  */
  strokeCap(ROUND);
  strokeJoin(ROUND);
}

void draw() {
  //nPos = new PVector(mouseX, mouseY);
  ///Continuous Calculus Stufff
  background(0);
  /*
  Las siguientes descripciones se cuentran
  definidas en sus respectivas pestañas.
  Para ver la descripción de las mismas
  ver sus pestañas.
  */
  calculations();
  drawLights();
  drawBrain();
  drawCursor();
  /*
  elimina las luces y las activa nuevamente para evitar
  que las mismas afecten los controles del gui
  */
  lights();
  noLights();
}

void controlEvent(ControlEvent newEvent) {
  /*
  Esta función es llamada en cuanto se genere algun evento
  por parte del gui.
  
  Los condicionales permiten filtrar como correr la función
  oscRoutine(). 
  */
  if (newEvent.isController()) {
    println(newEvent.getController().getName());
    if (newEvent.getController().getName().equals("volume")) {
      if (oscFlag) oscRoutine(0);
    } else if (newEvent.getController().getName().equals("mute")) {
      if (oscFlag) oscRoutine(1);
    }
  } else if (newEvent.isGroup()) {
  }
}

void keyPressed() {
  /*
  Al igual que en el caso anterior, acá se llama la función
  oscRoutine en cuanto se oprime la letra j.
  */
  if (key == 'j') {
    nextPosFlag = true;
    oscRoutine(2);
    nextPosFlag = false;
  }
}