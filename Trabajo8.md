Archivos/14Figuras.psc
Archivos/20MayorMenor.psc

```

Proceso MayorMenorJess
	Definir mayors,menors,num,i Como Entero;
	Definir prom,suma Como Real;
	
	Escribir "Introduce 25 numeros: ";
	
	Leer num;
	mayors=num;
	menors=num;
	suma=num;
	
	
	Para i=2 hasta 25 Hacer
		Leer num;
		suma = suma + num;
		
		si (num <= menors)
			menors=num;
		FinSi
		si (num >= mayors)
				mayors=num;
		FinSi
	FinPara
	
	
	prom = suma/25;
	
	Escribir "El promedio de los 25 numeros es: " prom;
	Escribir "El numero mayor es: " mayors;
	Escribir "El numero menor es: " menors;
	
FinProceso

```


```
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

```


[**Menu**](README.md)

