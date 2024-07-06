
import wollok.game.*
import personajes.*
import inicio.*
import nivel2.*

object mapaDeLJuego {
const property caminoCorrecto = [
	[10,0],[9,0],[18,0],[19,0],
	[10,1],[9,1],[19,1],[20,1],
    [0,2],[1,2],[2,2],[3,2],[4,2],[5,2],[6,2],[7,2],[8,2],[9,2],[10,2],[11,2],[12,2],[13,2],[14,2],
    [19,2],[20,2],[21,2],[22,2],[23,2],[24,2],[25,2],
	[10,3],[9,3],
	[10,4],[9,4],
	[0,5],[1,5],[2,5],[3,5],[4,5],[5,5],[6,5],[7,5],[8,5],[9,5],[10,5],[11,5],[12,5],[13,5],[17,5],[18,5],[19,5],[20,5],[21,5],[22,5],[23,5],[24,5],[25,5],
    [3,6],
    [3,7],
    [0,8],[1,8],[2,8],[3,8],[4,8],[5,8],[6,8],[7,8],[8,8],[9,8],[10,8],[11,8],[19,8],[20,8],[21,8],[22,8],[23,8],[24,8],[25,8],
    [10,9],[9,9],
	[10,10],[9,10],
	[0,11],[1,11],[2,11],[3,11],[4,11],[5,11],[6,11],[7,11],[8,11],[9,11],[10,11],[11,11],[12,11],[13,11],[17,11],[18,11],[19,11],[20,11],[21,11],
    [5,12],[6,12],[21,12],[22,12],[23,12],
	[5,13],[6,13],[22,13],[23,13],[24,13],
	[0,14],[1,14],[2,14],[3,14],[4,14],[5,14],[6,14],[7,14],[8,14],[9,14],[10,14],[21,14],[22,14],[23,14],[24,14],[25,14],
	[5,15],[6,15],
	[5,16],[6,16]
	
	]

    const property nivel = 1
 method esUnaPosicionValida(unaPosicion) = caminoCorrecto.any({ pos => pos == unaPosicion })

method chocoPoder(){}
}

object corazones {
	const property position = game.at(16, 16)
	var image = "assert/cantidadDeVidas3.png"
	
	method image() = image
    method position() = position

    method image(nuevaImagen) { image = nuevaImagen }

    method cantidadDeVidas() {
        if(guerrero.vidas() == 3){
            self.image("assert/cantidadDeVidas3.png")
        }
        else if(guerrero.vidas() == 2){
        	
            self.image("assert/cantidadDeVidas2.png")
            
        }
        else if(guerrero.vidas() == 1){
        	 self.image("assert/cantidadDeVidas1.png")
            
        }
      else if(guerrero.vidas() == 0)
      inicio.gameOver()
    }

}
class Posion  {
	
	const property cantidadARecuperar = 100
	
	const property position = game.at(1, 11)
	const property image = "assert/Posion.png"
	
	 method chocar(){
	 	
  	game.removeVisual(self)
  	guerrero.adquirirUnaVida()
  	corazones.cantidadDeVidas()
  }
  method chocoPoder(){}
    
}
object cofre {
	var property position = game.at(17, 11)
	var image = "assert/cofreCerrado.png"
	
	const ubicacion = self.position()
   
    method ubicacion()= ubicacion
	method image() = image
    method position() = position

    method image(nuevaImagen) { image = nuevaImagen }
    method posicion(nuevaPosicion) { position = nuevaPosicion }

    method abrirCofre() {
        self.image("assert/cofreAbierto.png")
    }

    method vaciarCofre() {
      self.image("assert/cofreVacio.png")
    }
    method cerrarCofre() {
      self.image("assert/cofreCerrado.png")
    }
     method chocar(){
     	if(guerrero.bolsa() == 1 and self.image() == "assert/cofreCerrado.png"){
     		self.abrirCofre()
     		self.vaciarCofre()
     		
     		game.addVisual(fotoWinner)
     		
	 	game.onTick(2000, "nuevoNivel",
	 	{
	 	
	    nivel2.iniciar()
	   
	 })
     		
     	}
    
     if(self.image() == "assert/cofreCerrado.png"){
     		game.say(guerrero, "Te olvidaste la llave rey")
     		}
     		}
     method chocoPoder(){}
}


object llave {
	const property ubicacion = [21,8]
	var property position = game.at(19,8)
	const property image = "assert/LaLLave.png"
	method chocoPoder(){}
    method chocar(){
  	game.removeVisual(self)
  	guerrero.agarrarLlave(1)
  	
  }
}
class Bola{
	var position
	const property image = "assert/orbe.png"
	method position()= position
	method chocar(){}
	method chocoPoder(){}
	method moverse(){
		if(guerrero.direccion() == "Derecha"){
		game.onCollideDo(self, {o => o.chocoPoder() game.removeTickEvent("bola") game.removeVisual(self) })
		game.onTick(100,"bola", {self.moverseDerecha()})}
		if(guerrero.direccion() == "Izquierda"){
		game.onCollideDo(self, {o => o.chocoPoder()	game.removeTickEvent("bola") game.removeVisual(self) })
		game.onTick(100,"bola", {self.moverseIzquierda()})}
	}
		method moverseDerecha() {
	   position = position.right(1) 
	   if(position.x() > game.width()){
	   	game.removeTickEvent("bola")
	   	game.removeVisual(self)
	   } 
	}
	method moverseIzquierda() {
	   position = position.left(1) 
	   if(position.x() < 0){
	   	game.removeTickEvent("bola")
	   	game.removeVisual(self)
	   }
	}
}
object reloj{
	const property position= game.at(13,16)
	var property numero = 99
	const nombre = "imagenReloj"
	
	method nombre() = nombre
	method cuentaRegresiva(){
		numero = 0.max(numero - 1)
		if (numero == 0){
			game.removeTickEvent("cuenta regresiva")
			inicio.gameOver()
			}
		
	}
	method image()= "assert/imagenTiempoReloj/"+nombre+numero+".png"
	
}
const posion1 = new Posion()
const posion2 = new Posion(position = game.at(17,5))


