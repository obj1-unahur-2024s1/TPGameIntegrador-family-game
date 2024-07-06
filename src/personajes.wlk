import recursos.*
import wollok.game.*

class Animaciones{
	const entidad = "E"
	var fotograma = 0
	var property accion = "Mov"
	var property direccion = "quieto"
	
	method fotograma() = fotograma
	method siguienteFotograma(){
		fotograma = (fotograma+1) % 4
		if (fotograma == 3 and accion == "ataque"){
			game.removeTickEvent("golpeGuerrero")
			accion = "Mov"
			fotograma = 0
		}
	}
	method image(){
		return "assert/"+entidad+accion+direccion+fotograma.toString()+".png"
	}
	
}

class Entidad inherits Animaciones{
	const property x = 0
	const property y = 2
	var position = game.at(x,y)
	var property mapa = mapaDeLJuego   
   var ubicacion = self.position()
   
    method ubicacion()= ubicacion
    method position() = position
     method position(newX,newY){
    	if(self.puedeMoverseA([newX,newY])){
    		position = game.at(newX, newY)}

    }

   
    method puedeMoverseA(nuevaPosicion) {
    	return mapa.esUnaPosicionValida(nuevaPosicion)
    }    
  }

object guerrero inherits Entidad(entidad = "G"){
    
    const boardWidth = 26 // Ancho del tablero
    const boardHeight = 18 // Alto del tablero 
    
    var property vidas = 3
    var property bolsa = 0
     
    method vidas() = vidas
    method bajarUnaVida() {
        vidas = vidas - 1
    }
    method adquirirUnaVida() {
    	vidas =3.min( vidas + 1)
    }
   
    method bolsa() = bolsa

    method agarrarLlave(unaCantidad) {
        bolsa = bolsa + unaCantidad
    }

  
    method atacar() {
	   	self.accion("ataque")
	   	game.onTick(200,"golpeGuerrero",{ => self.siguienteFotograma()})
	   	if(self.direccion() == "Derecha"){ const bola= new Bola(position = position.right(1))}
    	else {const bola= new Bola(position = position.left(1))}
    	game.addVisual(bola)
    	bola.moverse()
	
	}
	

    method moverseALaDerecha() {
        self.position((self.position().x() + 1) % boardWidth,self.position().y())
        self.accion("Mov")
        self.direccion("Derecha")
        self.siguienteFotograma()
    }

    method moverseALaIzquierda() {
		self.position((self.position().x() - 1 + boardWidth) % boardWidth, self.position().y())
        self.accion("Mov")
        self.direccion("Izquierda")
        self.siguienteFotograma()
    }

    method moverseAbajo() {
		self.position(self.position().x(), 0.max(self.position().y() - 1))
	    self.accion("Mov")
        self.direccion("Subir")
	    self.siguienteFotograma()
    }

    method moverseArriba() {
    	self.position(self.position().x(), (self.position().y() + 1) % boardHeight)
        self.accion("Mov")
        self.direccion("Subir")
        self.siguienteFotograma()
    }
    method chocoPoder(){}
    
    
}
class Orco inherits Entidad(entidad = "E") {
        var pasos =0
    
 
	method chocar(){
		
		guerrero.bajarUnaVida()
		corazones.cantidadDeVidas()
		if(guerrero.vidas() == 2){game.say(guerrero, "AUUUCH!")}
		if(guerrero.vidas() == 1){game.say(guerrero, "Daaale papá, ponete las pilas")}	
		
	}
	method chocoPoder(){
		game.removeVisual(self)
		
	}
       
     	method moverDerecha(){
     		var nuevaX= position.x()+1   position=game.at(nuevaX,position.y())
		self.accion("Mov")
        self.direccion("Derecha")
        self.siguienteFotograma()
     	}
	
       method moverIzquierda() {
       	var nuevaX= position.x()-1  position=game.at(nuevaX,position.y())
		self.accion("Mov")
        self.direccion("Izquierda")
        self.siguienteFotograma()
       }
	
	
	
    method mov(){ 
      var nuevaPos= position.x()
        if(pasos<=2){self.moverDerecha() pasos=pasos+1 nuevaPos=position.x()}
        
      	else if(pasos.between(3,5)){self.moverIzquierda() pasos=pasos+1 nuevaPos=position.x()}
      	else if (pasos > 5){self.moverDerecha()pasos = pasos - 5 nuevaPos=position.x()}
    
    position= game.at(nuevaPos,position.y())
  }}
    const orco1 = new Orco(pasos = 5, x= 5, y=5)
    const orco2 = new Orco( x=6, y=8)
    const orco3 = new Orco(pasos =1, x=19, y=5)
    const orco4 = new Orco(x=21, y=8)
    const orco5 = new Orco( pasos=2,x=10, y=2)
    const orco6 = new Orco(pasos= 3,  x=4, y=11)
    const orco7 = new Orco( x=8, y=11)
    const orco8 = new Orco( pasos=2,x=21, y=2)
    const orco9 = new Orco(pasos= 3,  x=4, y=14)
    const orco10 = new Orco( x=17, y=11)
    
