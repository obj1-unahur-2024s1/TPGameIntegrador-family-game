import wollok.game.*
import recursos.*
import personajes.*
import inicio.*

object nivel2 {
	method iniciar(){
		cofre.position(game.at(19,2))
	 	llave.position(game.at(17,11))
	 	cofre.cerrarCofre()
	 	guerrero.bolsa(0)
	 	guerrero.position(0,8)
	 	guerrero.vidas(3)
	 	corazones.cantidadDeVidas()
	 	game.clear()
	 	reloj.numero(99)
	 	reloj.image(){"assert/imagenTiempoReloj/imagenReloj99.png"}
	 	game.addVisual(orco10)
        game.addVisual(orco9)
        game.addVisual(orco8)
        game.onTick(350,"movimiento",{orco1.mov()})
        game.onTick(350,"movimiento",{orco2.mov()})
        game.onTick(350,"movimiento",{orco3.mov()})
        game.onTick(350,"movimiento",{orco4.mov()})
        game.onTick(350,"movimiento",{orco5.mov()})
        game.onTick(350,"movimiento",{orco6.mov()})
        game.onTick(350,"movimiento",{orco7.mov()})
        game.onTick(350,"movimiento",{orco8.mov()})
        game.onTick(350,"movimiento",{orco9.mov()})
        game.onTick(350,"movimiento",{orco10.mov()})
   
	 	inicio.iniciar()
	}
		 
}
