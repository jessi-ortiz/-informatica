Proceso MayorMenor20aJess
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
