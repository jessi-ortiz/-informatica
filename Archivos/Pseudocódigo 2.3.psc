
subproceso ingresarVehiculo(ingresado Por Referencia,CANTIDADPUESTOS,puesto,propietario Por Referencia,placa Por Referencia,horaIngreso Por Referencia,ocupados Por Referencia)
	si ingresado>CANTIDADPUESTOS-1 entonces
		Escribir  "NO hay puestos disponibles";
	SiNo
		definir indice como entero;
		Escribir  "¿Donde desea realizar el ingreso?";
		Para i=0 hasta CANTIDADPUESTOS-1 con paso 1 hacer
			si ocupados[i]=-1 Entonces
				Escribir ConvertirATexto(i+1)+" :: "+ puesto[i];
			FinSi
		FinPara
		Leer  indice;
		indice = indice-1;
		
		Escribir  Sin Saltar "Propietario";
		Leer propietario[indice];
		
		Escribir  Sin Saltar "Placa del vehiculo";
		Leer placa[indice];
		
		Escribir  Sin Saltar "Hora de ingreso ";
		Leer horaIngreso[indice];
		
		//Almacenar el ingreso realizado
		ocupados[indice]=indice;
		Escribir "Registro con éxito";
		Escribir  puesto[indice]+" "+placa[indice]+" "+horaIngreso[indice]+" "+propietario[indice];
		ingresado = ingresado+1;
	FinSi
FinSubProceso

SubProceso puestosAsignados(ingresado,ocupados,CANTIDADPUESTOS,propietario,placa,puesto,horaIngreso)
	si ingresado=0 entonces
		escribir "Sin ingreso...";
	sino
		Para i=0 Hasta CANTIDADPUESTOS-1 Con Paso 1 Hacer
			si ocupados[i]!=-1 Entonces
				escribir propietario[i]+"  "+placa[i]+"  "+puesto[i]+"  "+horaIngreso[i];
			FinSi
		FinPara
	FinSi
FinSubProceso


SubProceso puestosDisponibles(ingresado,ocupados,CANTIDADPUESTOS,propietario,placa,puesto,horaIngreso)
	si ingresado=CANTIDADPUESTOS entonces
		escribir "||No hay puestos disponibles||";
	sino
		Para i=0 Hasta CANTIDADPUESTOS-1 Con Paso 1 Hacer
			si ocupados[i]=-1 Entonces
				escribir puesto[i]+"  ||DISPONIBLE||";
			FinSi
		FinPara
	FinSi
FinSubProceso

//Busca la placa ingresado y devuelve el indice
SubProceso  indice = buscarPlaca(placa,ingresado,CANTIDADPUESTOS)
	indice = -1; // Sin resultados encontrados
	si ingresado=0 entonces
		indice = -2; // No hay registros ingresados
	SiNo
		Definir placaBuscar como texto;
		Escribir  Sin Saltar "Placa: ";
		Leer  placaBuscar;
		
		Para i=0 hasta CANTIDADPUESTOS-1 con paso 1 hacer
			si placa[i]=placaBuscar Entonces
				indice=i;
				i=CANTIDADPUESTOS+1;
			FinSi
		FinPara
	FinSi
FinSubProceso

SubProceso  darSalida(indice,valorMinuto,ingresado Por Referencia, placa,horaIngreso, horaSalida,ocupados Por Referencia,puesto,propietario,placaInforme Por Referencia,propietarioInforme Por Referencia,horaIngresoInforme Por Referencia,horaSalidaInforme Por Referencia,totalPagarInforme por referencia,informeIngresados Por Referencia,CANTIDADINFORME)
	definir cantidadCaracteres, minutos como entero;
	definir minutosI, horasI, minutosS, horasS como texto;
	definir valorPagar Como Real;
	definir punto como logico;
	
	//Inicializar variables
	punto=falso;
	horasI="";
	minutosI="";
	horasS="";
	minutosS="";
	minutos=0;
	
	Escribir sin saltar "Hora salida : ";
	Leer horaSalida[indice];
	Borrar Pantalla;
	
	//Hora ingreso
	cantidadCaracteres = longitud(horaIngreso[indice]);
	para i=0 hasta cantidadCaracteres-1 con paso 1 hacer
		si subcadena(horaIngreso[indice],i,i)="." entonces
			punto=verdadero;
			i=i+1;
		FinSi
		si punto Entonces //Guardar minustos
			minutosI = minutosI+subcadena(horaIngreso[indice],i,i);
		SiNo // Guardar horas
			horasI = horasI+Subcadena(horaIngreso[indice],i,i);
		FinSi
	FinPara

	//Hora de salida
	punto=falso;
	cantidadCaracteres = longitud(horaSalida[indice]);
	para i=0 hasta cantidadCaracteres-1 con paso 1 hacer
		si subcadena(horaSalida[indice],i,i)="." entonces
			punto=verdadero;
			i=i+1;
		FinSi
		si punto Entonces //Guardar minustos
			minutosS = minutosS+subcadena(horaSalida[indice],i,i);
		SiNo // Guardar horas
			horasS = horasS+Subcadena(horaSalida[indice],i,i);
		FinSi
	FinPara
	
	minutos = (60-convertirANumero(minutosI))+ConvertirANumero((minutosS));
	minutos = minutos + (convertirANumero(horasS)-convertirANumero(horasI))*60;
	valorPagar = minutos * valorMinuto;
	
	//Mostrar detalle del cobro
	Escribir "Propietario : ",propietario[indice];
	Escribir "Placa : ",placa[indice];
	Escribir "Puesto : ",puesto[indice];
	Escribir "Hora ingreso : ",horaIngreso[indice];
	Escribir "Hora salida : ",horaSalida[indice];
	Escribir "Total a pagar : ",valorPagar;
	
	//agregar al informe
	si informeIngresados<CANTIDADINFORME entonces
		placaInforme[informeIngresados]=placa[indice];
		propietarioInforme[informeIngresados]=propietario[indice];
		horaIngresoInforme[informeIngresados]=horaIngreso[indice];
		horaSalidaInforme[informeIngresados]=horaSalida[indice];
		totalPagarInforme[informeIngresados]=valorPagar;
		informeIngresados = informeIngresados+1;
	FinSi

	//Dar salida al vehiculo reseteando variables
	ingresado = ingresado-1;
	ocupados[indice]=-1;
FinSubProceso

Proceso Parqueadero
	
	//Definición de variables
	Definir  CANTIDADPUESTOS, CANTIDADINFORME, opcion, ingresado, indiceEncontrado, informeIngresados como entero; 
	Definir  valorMinuto, totalDelDia Como Real;
	definir mensajeTelcha como texto;
	CANTIDADPUESTOS=10;
	CANTIDADINFORME=1000;
	
	//Definición de vectores
	dimension placa[CANTIDADPUESTOS];
	dimension puesto[CANTIDADPUESTOS];
	dimension horaIngreso[CANTIDADPUESTOS];
	dimension horaSalida[CANTIDADPUESTOS];
	dimension propietario[CANTIDADPUESTOS];
	dimension ocupados[CANTIDADPUESTOS];
	
	
	//Dimensiones del informe del dia
	dimension placaInforme[CANTIDADINFORME];
	dimension propietarioInforme[CANTIDADINFORME];
	dimension horaIngresoInforme[CANTIDADINFORME];
	dimension horaSalidaInforme[CANTIDADINFORME];
	dimension totalPagarInforme[CANTIDADINFORME];
	
	
	//Inicializar variables
	opcion=0;
	valorMinuto=300;
	ingresado=0;
	mensajeTelcha="Precione una tecla para continuar...";
	indiceEncontrado=-1;
	totalDelDia=0;
	informeIngresados=0;
	
	Para i=0 Hasta CANTIDADPUESTOS-1 Con Paso 1 Hacer
		puesto[i]="A"+ConvertirATexto(i);
		ocupados[i]=-1;
		placa[i]="";
	FinPara
	
	//Inicializar dimensiones del informe del dia
	Para i=0 Hasta CANTIDADINFORME-1 Con Paso 1 Hacer
		placaInforme[i]="";
	FinPara
	
	Escribir "                ###############################";
	Escribir "                # Paqueadero MaxTechnology 24/7 #";
	Escribir "                ###############################";
	Escribir "";
	
	
	Repetir
		Escribir "-------------------------------";
		Escribir "| 1. Ingresar vehiculo        |";
		Escribir "| 2. Dar salida a un vehiculo |";
		Escribir "| 3. Consultar disponibilidad |";
		Escribir "| 4. Puestos asignados        |";
		Escribir "| 5. Salir                    |";
		Escribir "-------------------------------";
		Escribir "";
		leer opcion;
		
		Segun opcion Hacer
			1:
				Borrar Pantalla;
				ingresarVehiculo(ingresado,CANTIDADPUESTOS,puesto,propietario,placa,horaIngreso,ocupados);
				Escribir mensajeTelcha;
				Esperar Tecla;
				Borrar Pantalla;
			2:
				Borrar Pantalla;
				indiceEncontrado =  buscarPlaca(placa,ingresado,CANTIDADPUESTOS);
				si indiceEncontrado = -2 Entonces
					Escribir "Sin registros para buscar";
				SiNo
					si indiceEncontrado = -1 Entonces
						Escribir "No se encontraron registros";
					SiNo
						darSalida(indiceEncontrado,valorMinuto,ingresado, placa,horaIngreso, horaSalida,ocupados,puesto,propietario,placaInforme,propietarioInforme,horaIngresoInforme,horaSalidaInforme,totalPagarInforme,informeIngresados,CANTIDADINFORME);
					FinSi
				FinSi
			3:
				Borrar Pantalla;
				puestosDisponibles(ingresado,ocupados,CANTIDADPUESTOS,propietario,placa,puesto,horaIngreso);
				Escribir mensajeTelcha;
				Esperar Tecla;
				Borrar Pantalla;
			4:
				Borrar Pantalla;
				puestosAsignados(ingresado,ocupados,CANTIDADPUESTOS,propietario,placa,puesto,horaIngreso);
				Escribir mensajeTelcha;
				Esperar Tecla;
				Borrar Pantalla;
			5:
				Borrar Pantalla;
				Escribir "                ###############################";
				Escribir "                #     Informe del dia         #";
				Escribir "                ###############################";
				Escribir "";
				Escribir "|PLACA| |PROPIETARIO| |Ingreso| |Salida| |Total|";
				para i=0 hasta CANTIDADINFORME-1 con paso 1 Hacer
					si placaInforme[i]!="" Entonces
						Escribir "|",placaInforme[i],"| ","|",propietarioInforme[i],"| ","|",horaIngresoInforme[i],"| ","|",horaSalidaInforme[i],"| ","|",totalPagarInforme[i];
						totalDelDia=totalDelDia+totalPagarInforme[i];
					FinSi
				FinPara
				//Mostrar venta del dia
				Escribir "";
				Escribir "Total :: ",totalDelDia;
			De Otro Modo:
				Escribir  "Opción no valida";
		FinSegun
		
	Hasta Que opcion=5
	
FinProceso


