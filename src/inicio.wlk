import wollok.game.*
import recursos.*
import personajes.*
import nivel2.*

object inicio{
	
	
    method iniciar(){
    game.width(26)
    game.height(18)
    // fondo del tablero de juego
    

    // agregamos a nuestro objeto guerrero
    game.addVisual(guerrero)
    
    
    

    // creamos un enemigo Orco
    
    
    game.addVisual(orco1)
    game.addVisual(orco2)
    game.addVisual(orco3)
    game.addVisual(orco4)
    game.addVisual(orco5)
    game.addVisual(orco6)
    game.addVisual(orco7)
    game.addVisual(cofre)
    game.addVisual(corazones)
    game.addVisual(llave)
    game.addVisual(posion1)
    game.addVisual(posion2)
    game.addVisual(reloj)
    
    game.onCollideDo(guerrero, {el => 
      el.chocar()
    })
    game.onTick(1250,"cuenta regresiva",{reloj.cuentaRegresiva()})
    game.onTick(500,"movimiento",{orco1.mov()})
    game.onTick(500,"movimiento",{orco2.mov()})
    game.onTick(500,"movimiento",{orco3.mov()})
    game.onTick(500,"movimiento",{orco4.mov()})
    game.onTick(500,"movimiento",{orco5.mov()})
    game.onTick(500,"movimiento",{orco6.mov()})
    game.onTick(500,"movimiento",{orco7.mov()})
    // Movimientos del guerrero
    keyboard.right().onPressDo ({ guerrero.moverseALaDerecha() })
    keyboard.left().onPressDo ({ guerrero.moverseALaIzquierda() })
    keyboard.up().onPressDo ({ guerrero.moverseArriba() })
    keyboard.down().onPressDo ({ guerrero.moverseAbajo() })
    
    // Atacar al presionar la barra espaciadora
    keyboard.space().onPressDo ({
        if (guerrero.direccion() != "Subir"){
            guerrero.atacar()           
        }else{
            game.say(guerrero, "No se atacar en esa direccion man!")
        }
        })
	}
	 method gameOver(){
    	if(guerrero.vidas() == 0)
    	game.clear()
    	game.addVisual(fotoOver)
    	keyboard.del().onPressDo ({
	 	game.removeVisual(fotoOver)
	 	reloj.numero(99)
	 	reloj.image(){"assert/imagenTiempoReloj/imagenReloj99.png"}
	    cofre.position(game.at(17,11))
	 	llave.position(game.at(19,8))
	 	guerrero.bolsa(0)
	 	guerrero.vidas(3)
	 	corazones.cantidadDeVidas()
	    self.iniciar()
	    guerrero.position(0,2)
	 })
    		
    }
}
object fotoOver{
	var property image = "assert/gameOver.png"
	var property position = game.at(0,0)
}
object foto{
	var property image = "assert/InicioFinal.png"
	var property position = game.at(0,0)
}
object fotoWinner{
	var property image = "assert/winner1.jpg"
	var property position = game.at(6,5)
}