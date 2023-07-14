#!/bin/bash

Tiempo_sistema(){

clear
echo -e "\t\t La hora es: $(date +%R)"
echo -e "\t\t El tiempo activo del sistema es: $(uptime -p | cut -c1-3 --complement) \n\n"


read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
clear
submenu4_Sistema




}




Caract_sistema(){

clear
echo -e "\t\t Hosname: $(hostname) "
echo -e "\t\t Sistema Operativo: $(cat /etc/issue | cut -d " " -f1-3 ) "
echo -e "\t\t Version del sistema operativo: $(cat /etc/os-release | grep "VERSION=" | cut -c1-8 --complement )"
echo -e "\t\t Procesador: $(lscpu | grep "Nombre del modelo:" | cut -d ":" -f2| sed 's/^[[:space:]]*//')"
echo -e "\t\t RAM: $(free -h | grep "Memor" | cut -d " " -f8)" 
echo -e "\t\t Tamaño de la raiz: $(df -h| grep '\/$' | cut -d " " -f5) \n\n"  

read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
clear
submenu4_Sistema



}


Accion_usuario(){
anew3=yes
while [ "$anew3" = yes ]; do
clear
anew3=no
read -p "                   Ingresa el nombre del Usuario: " nom_usuario
if  id "$nom_usuario" >/dev/null; then
  echo -e "\t\t        Usuario       What "
  echo -e "\t\t         $(w -sh "$nom_usuario" | cut -d " " -f2-24 --complement)  "
  read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
  clear
submenu4_Sistema
else
    echo -e "\t\t\t\t\t Opcion no valida el nombre es incorrecto o no existe \n\n\n"
    echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
    read
    anew3=yes
fi
done
}




Usuario_conectado(){

clear
echo -e "\t\t   Usuario          	    Fecha       Hora"
echo -e "\t\t $(who)"
read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
clear
submenu4_Sistema

}





submenu4_Sistema(){

anew2=yes
while [ "$anew2" = yes ]; do
clear
anew2=no
echo -e "\t\t\t\t\t\t\t Usuarios \n\n\n"
			echo -e "\t\t 1. Usuarios conectados \n"
			echo -e "\t\t 2. Qué está haciendo el usuario \n"
			echo -e "\t\t 3. Características del sistema  \n"
			echo -e "\t\t 4. Cuánto tiempo lleva el sistema arriba  \n"
			echo -e "\t\t 5. Regresar  \n"
			
			read -p "		Ingresa la opción a ejecutar: " usuario
			case $usuario in
				1) Usuario_conectado
					;;
				2) Accion_usuario
					;;
				3) Caract_sistema
					;;
				4) Tiempo_sistema
					;;
				5) menu_principal
					;;	
				*)  	echo -e "\t\t\t\t\t\t\t Opcion no valida intenta de nuevo \n\n\n"
					echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
					read 
					anew2=yes
					;;
			esac		
			
done			
}






##################################################################################################################
Num_grupos(){

clear
echo -e "\t\t Numero de usuarios en el sistema: $(cat /etc/passwd | grep -i "/bin/bash" | grep -v "root" | wc -l)"
echo -e "\t\t login: $(cat /etc/passwd | grep -i "/bin/bash" | grep -v "root" | cut -d ":" -f1)"
echo -e "\n\n\n"
    read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
    clear
    submenu3_Usuarios



}

Num_usuarios (){
clear
echo -e "\t\t Numero de usuarios en el sistema: $(cat /etc/passwd | grep -i "/bin/bash" | grep -v "root" | wc -l)"
echo -e "\t\t login: \t$(cat /etc/passwd | grep -i "/bin/bash" | grep -v "root" | cut -d ":" -f1)"
echo -e "\n\n\n"
    read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
    clear
    submenu3_Usuarios



}


Info_grupo(){
anew4=yes
while [ "$anew4"=yes ]; do
  clear
  anew4=no
  read -p "                   Ingresa el nombre del grupo a mostrar: " nom_grupo
  if  getent group "$nom_grupo" >/dev/null; then
    
    
    
    echo -e "\t\t GID: $(cat /etc/group | grep ^"$nom_grupo"| cut -d ":" -f1)"
    echo -e "\t\t Grupo: $(cat /etc/group | grep ^"$nom_grupo"| cut -d ":" -f3)"
    echo -e "\t\t Usuarios de grupo secundario: $(cat /etc/group | grep ^"$nom_grupo"| cut -d ":" -f4)"
    
    
    
    echo -e "\n\n\n"
    read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
    clear
    submenu3_Usuarios  
  
  else
    echo -e "\t\t\t\t\t Opcion no valida el nombre es incorrecto o no existe \n\n\n"
    echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
    read
    anew4=yes
    
  fi
done




}



Mostrar_usuario(){
anew3=yes
while [ "$anew3"=yes ]; do
  clear
  anew3=no
  read -p "                   Ingresa el nombre del Usuario a mostrar: " nom_usuario
  if  id "$nom_usuario" >/dev/null; then
    
    
    echo -e "\t\t Login: $(cat /etc/passwd | grep ^"$nom_usuario" | cut -d ":" -f1)"
    echo -e "\t\t UID: $(cat /etc/passwd | grep ^"$nom_usuario"| cut -d ":" -f3)"
    echo -e "\t\t GID: $(cat /etc/passwd | grep ^"$nom_usuario" | cut -d ":" -f4)"
    
    echo -e "\t\t Grupo: $(id -gn "$nom_usuario")"
    echo -e "\t\t Comentario: $(cat /etc/passwd | grep ^"$nom_usuario"| cut -d ":" -f5)"
    echo -e "\t\t Home: $(cat /etc/passwd | grep ^"$nom_usuario"| cut -d ":" -f6)"
    echo -e "\t\t Shell: $(cat /etc/passwd | grep ^"$nom_usuario"| cut -d ":" -f7)"
    
    
    echo -e "\n\n\n"
    read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
    clear
    submenu3_Usuarios  
  
  else
    echo -e "\t\t\t\t\t Opcion no valida el nombre es incorrecto o no existe \n\n\n"
    echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
    read
    anew3=yes
    
  fi
done



}


submenu3_Usuarios(){
anew2=yes
while [ "$anew2" = yes ]; do
clear
anew2=no
echo -e "\t\t\t\t\t\t\t Usuarios \n\n\n"
			echo -e "\t\t 1. Mostrar información de un usuario \n"
			echo -e "\t\t 2. Mostrar información de grupo  \n"
			echo -e "\t\t 3. Número total de usuarios en el sistema y login  \n"
			echo -e "\t\t 4. Número total de grupos en el sistema y nombre  \n"
			echo -e "\t\t 5. Regresar  \n"
			
			read -p "		Ingresa la opción a ejecutar: " usuario
			case $usuario in
				1) Mostrar_usuario
					;;
				2) Info_grupo
					;;
				3) Num_usuarios
					;;
				4) Num_grupos
					;;
				5) menu_principal
					;;	
				*)  	echo -e "\t\t\t\t\t\t\t Opcion no valida intenta de nuevo \n\n\n"
					echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
					read 
					anew2=yes
					;;
			esac		
			
done			
}






#############################################################################################################
#Segundo submenu
Buscar_proceso(){
anew5=yes
while [ "$anew5"=yes ]; do
  clear
  anew5=no
  read -p "                   Ingresa el nombre del proceso a buscar: " nom_proceso
  if  ps -C "$nom_proceso" >/dev/null; then
    
    
    ps -C "$nom_proceso" -o user,pid,ppid,c,stime,tty,time,cmd,%mem,%cpu | more -d
    
    echo -e "\n\n\n"
    read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
    clear
    submenu2_Procesos  
  
  else
    echo -e "\t\t\t\t\t Opcion no valida el nombre es incorrecto o no existe \n\n\n"
    echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
    read
    anew5=yes
    
  fi
done


}

Procesos_Usuario(){
anew4=yes
while [ "$anew4"=yes ]; do
  clear
  anew4=no
  read -p "                   Ingresa el nombre del Usuario del cual quieres buscar el proceso: " nom_usuario
  if  id "$nom_usuario" >/dev/null 2>&1 ; then
    
    
    ps -u "$nom_usuario" -o user,pid,ppid,c,stime,tty,time,cmd,%mem,%cpu | more -d
    
    echo -e "\n\n\n"
    read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
    clear
    submenu2_Procesos  
  
  else
    echo -e "\t\t\t\t\t Opcion no valida el nombre es incorrecto o no existe \n\n\n"
    echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
    read
    anew4=yes
    
  fi
done
}




Mostrar_procesos(){
anew3=yes
while [ "$anew3" = yes ]; do
	anew3=no
	clear
	ps -ef| more -d
	echo -e "\n\n\n"
    	read -n 1 -s -r -p "             Presiona cualquier tecla para continuar:"
    	clear
    	submenu2_Procesos


done



}




submenu2_Procesos(){
anew2=yes
while [ "$anew2" = yes ]; do
clear
anew2=no
echo -e "\t\t\t\t\t\t\t Archivos \n\n\n"
			echo -e "\t\t 1. Listar todos los procesos \n"
			echo -e "\t\t 2. Procesos de un usuario  \n"
			echo -e "\t\t 3. Buscar procesos  \n"
			echo -e "\t\t 4. Regresar  \n"
			
			read -p "		Ingresa la opción a ejecutar: " archivos
			case $archivos in
				1) Mostrar_procesos
					;;
				2) Procesos_Usuario
					;;
				3) Buscar_proceso
					;;
				4) menu_principal
					;;
				*)  	echo -e "\t\t\t\t\t\t\t Opcion no valida intenta de nuevo \n\n\n"
					echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
					read 
					anew2=yes
					;;
			esac		
			
done			
}


##################################################################################
#Primer submenu

#/home/diegotorres/ns-allinone-3.35/ns-3.35/src/wifi/model
#Funcion mostrar directorio
Listar_directorio(){
anew5=yes
while [ "$anew5"=yes ]; do
  clear
  anew5=no
  read -p "                   Ingresa el nombre del directorio a listar: " nom_directorio
  if [ -d "$nom_directorio" ]; then
    ls -l "$nom_directorio" | more -d
    
    echo -e "\n\n\n"
    read -n 1 -s -r -p  "		Presiona cualquier tecla para continuar: " 
    submenu1_archivos
  
  else
    echo -e "\t\t\t\t\t Opcion no valida el nombre es incorrecto o no es directorio \n\n\n"
    echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
    read
    anew5=yes
    
  fi
done
}


#Funcion mostrar atributos
Atributos_archivos(){
anew4=yes
while [ "$anew4" = yes ]; do
  clear
  anew4=no
   
  read -p "                   Ingresa el nombre del archivo a buscar: " nom_archivo
  if [ -e "$nom_archivo" ]; then
    echo -e "\t\t Nombre: "$nom_archivo""
    echo -e "\t\t Inodo:  $(stat "$nom_archivo" | grep Nodo-i | cut -d ":" -f3 | cut -d " " -f2)" 
    echo -e "\t\t Dueño: $(stat "$nom_archivo" | grep Uid: | cut -d "U" -f2 | cut -d "/" -f2 | cut -d ")" -f1 | tr -d '[[:space:]]')"
    echo -e "\t\t Tamaño: $(stat "$nom_archivo" | grep Tamaño: | cut -d ":" -f2 | cut -d " " -f2)"
    echo -e "\t\t Tipo de archivo: $(stat "$nom_archivo" | grep Bloque | cut -d "/" -f2 | cut -d " " -f5,6)"
    echo -e "\t\t Fecha de modificación: $(stat "$nom_archivo" | grep Modificación: | cut -d " " -f2,3)"
    echo -e "\t\t Permiso para el dueño: $(stat "$nom_archivo" | grep Uid |cut -c 16-18)"
    echo -e "\t\t Permiso para el grupo: $(stat "$nom_archivo" | grep Uid |cut -c 19-21)"
    echo -e "\t\t Permiso para otros: $(stat "$nom_archivo" | grep Uid |cut -c 22-24)"
    
    
    echo -e "\n\n\n"
    read -n 1 -s -r -p  "		Presiona cualquier tecla para continuar: " 
    submenu1_archivos
  else  
  clear
	  echo -e "\t\t\t\t\t\t\t Opcion no valida intenta de nuevo \n\n\n"
	  echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
	  read
	  anew4=yes
  fi
done


}
#Funcion Mostrar archivos
Mostrar_archivos(){
anew3=yes
while [ "$anew3" = yes ]; do
	anew3=no
	clear
	read -p "		Ingresa el nombre del archivo a mostrar: " nom_archivo
	
	if [ -e "$nom_archivo" ]; then
	  more -d "$nom_archivo"
	echo -e "\n\n\n"  
	read -n 1 -s -r -p  "		Presiona cualquier tecla para continuar: " 
	submenu1_archivos
	
	break
	 
	else 
	  clear
	  echo -e "\t\t\t\t\t\t\t Opcion no valida intenta de nuevo \n\n\n"
	  echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
	  read
	  anew3=yes

	fi 
done
	


}

submenu1_archivos(){
anew2=yes
while [ "$anew2" = yes ]; do
clear
anew2=no
echo -e "\t\t\t\t\t\t\t Archivos \n\n\n"
			echo -e "\t\t 1. Mostrar archivos \n"
			echo -e "\t\t 2. Atributos de archivos  \n"
			echo -e "\t\t 3. Listar directorios  \n"
			echo -e "\t\t 4. Regresar  \n"
			
			read -p "		Ingresa la opción a ejecutar: " archivos
			case "$archivos" in
				1) Mostrar_archivos
					;;
				2) Atributos_archivos
					;;
				3) Listar_directorio
					;;
				4) menu_principal
					;;
				*)  	echo -e "\t\t\t\t\t\t\t Opcion no valida intenta de nuevo \n\n\n"
					echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
					read 
					anew2=yes
					;;
			esac		
			
done			
}

menu_principal(){
anew=yes
while [ "$anew" = yes ]; do
	clear
	echo -e "\t\t\t\t\t\033[36m    Proyecto Programación Avanzada en shell\n\n\n\n"
	echo -e "\t\t\t\t\t\t\t Menu Principal\n\n\n"
	echo -e "\t\t a)Archivos \n"
	echo -e "\t\t b)Procesos \n"
	echo -e "\t\t c)Usuarios y grupos \n"
	echo -e "\t\t d)Sistema \n"
	echo -e "\t\t e)Salir \n"
	


	read -p "		Ingresa la opción deseada: " opcion1





	anew=no  
	case $opcion1 in

		a) submenu1_archivos
			;;
		b) submenu2_Procesos	
			;;
		c) submenu3_Usuarios
			;;
		d) submenu4_Sistema
			;;
		e)	exit
			;;
		*)	echo -e "\t\t\t\t\t\t\t Opcion no valida intenta de nuevo \n\n\n"
			echo -e "\t\t\t\t\t\t\t Presiona enter para continuar \n\n\n"
			read 
			anew=yes
		;;
	esac
 done 

}

menu_principal
