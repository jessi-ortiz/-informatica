
subproceso ingresarVehiculo(ingresado CANTIDADPUESTOS)
	Escribir "Funciones...";
FinSubProceso

Algoritmo Estacionamiento
	Definir opcion Como Numerica;
	Definir CANTIDADPUESTOS, opcion, ingresado como entero;
	Definir valorMinuto Como Real;
	CANTIDSDPUESTOS=10;
	//Definici�n de vectores
	dimension placa(CANTIDADPUESTOS);
	dimension puesto(CANTIDADPUESTOS);
	dimension horaIngreso(CANTIDADPUESTOS);
	dimension horaSalida(CANTIDADPUESTOS);
	dimension ocupados(CANTIDADPUESTOS);
	
	//Inicilizar variables
	opcion=0;
	valorMinuto=300;
	ingresado=0;
	Para i=0 Hasta CANTIDADPUESTOS=1 Con Paso 1 Hacer
		puesto(i)="A"+ConvertirAtexto(i);
		ocupados(i)=-1;
		
	FinPara
	Escribir"              Estacionamiento MaxTechnology 24/7";
	
	Repetir
		Escribir" 1. Ingresar veh�culo";
		Escribir " 2. Dar salida a un veh�culo";
		Escribir" 3. Consultar disponibilidad";
		Escribir" 4. Puestos asignados";
		Escribir" 5. Salida";
		Escribir "";
		leer opcion;
		
		Segun opcion Hacer
				1:
					Borrar Pantalla;
					ingresarVehiculo(ingresado);
				2:
				Escribir "Dar salida";
				3:
					Escribir "Disponibilidad";
				4:
					Escribir "Ocupados...";
				5:
					Borrar Pantalla;
					Escribir "Adi�s";
			De Otro Modo:
				Escribir "Opci�n no valida";
		FinSegun
	
	Hasta Que opcion=5
	
	
	
FinAlgoritmo
