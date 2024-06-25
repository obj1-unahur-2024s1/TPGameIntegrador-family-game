import wollok.game.*
import recursos.*
import personajes.*

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
    game.onCollideDo(guerrero, {el => 
      el.chocar()
    })
    game.onTick(1000,"movimiento",{orco1.mov()})
    game.onTick(1000,"movimiento",{orco2.mov()})
    game.onTick(1000,"movimiento",{orco3.mov()})
    game.onTick(1000,"movimiento",{orco4.mov()})
    game.onTick(1000,"movimiento",{orco5.mov()})
    game.onTick(1000,"movimiento",{orco6.mov()})
    game.onTick(1000,"movimiento",{orco7.mov()})
    // Movimientos del guerrero
    keyboard.right().onPressDo ({ guerrero.moverseALaDerecha() })
    keyboard.left().onPressDo ({ guerrero.moverseALaIzquierda() })
    keyboard.up().onPressDo ({ guerrero.moverseArriba() })
    keyboard.down().onPressDo ({ guerrero.moverseAbajo() })
    
    // Atacar al presionar la barra espaciadora
    keyboard.space().onPressDo ({
       guerrero.atacar()
        })
	}
	 method gameOver(){
    	if(guerrero.vidas() == 0)
    	game.clear()
    	game.addVisual(fotoOver)	
    }
}
object fotoOver{
	var property image = "assert/gameOver.png"
	var property position = game.at(0,0)
}
object foto{
	var property image = "assert/imagenInit.png"
	var property position = game.at(0,0)
}
object fotoWinner{
	var property image = "assert/winner1.jpg"
	var property position = game.at(6,5)
}