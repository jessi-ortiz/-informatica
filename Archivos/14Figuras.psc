Proceso FigurasJess
	Definir opcionf Como Entero;
	Definir nombre Como Caracter;
	
	Escribir "Escribe tu nombre: ";
	Leer nombre;
	Escribir "Hola!! " nombre " ¿qué figura te gustaria observar?";

	
	Repetir
		Escribir "Menu:";
		Escribir "1.- Triangulo";
		Escribir "2.- Cuadrado";
		Escribir "3.- Circulo";
		Escribir "4.- Rectangulo";
		Escribir "5.- Salir";
		Leer opcionf;
		
		Segun opcionf Hacer
			1:
				Escribir "aqui tienes un triangulo: ";
				Escribir "  *  ";
				Escribir " * * ";
				Escribir "*****";
			2:
				Escribir "aqui tienes un cuadrado: ";
				Escribir "***";
				Escribir "* *";
				Escribir "***";
			3:
				Escribir "aqui tienes un circulo: ";
				Escribir " *** ";
				Escribir "*   *";
				Escribir " *** ";
			4:
				Escribir "aqui tienes un rectangulo: ";
				Escribir "******";
				Escribir "*    *";
				Escribir "******";
			5:
				Escribir "saliendo... ";
				
			De Otro Modo:
				Escribir "Opcion no valida";
		Fin Segun
	Hasta Que opcionf = 5
FinProceso
