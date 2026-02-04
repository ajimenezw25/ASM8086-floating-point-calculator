.286                            
model tiny
stack 256
org 100h
; Definicion de datos
.data    
  suma_menu db 13, '1. Suma','$'
  resta_menu db 10,13, '2. Resta','$'
  multiplicacion_menu db 10,13, '3. Multiplicacion','$'
  division_menu db 10,13, '4. Division','$'
  menu db 10,10,13, ' Por favor presione: ','$'
  operando1 db 10,10,13, 'Ingrese el primer numero: ','$'
  operando2 db 10,10,13, 'Ingrese el segundo numero: ','$'
  bienvenida db 10,10,10,10,10,13, 'Bienvenido a CalcuTec','$'
  numerror db 10,13, 'Numero incorrecto','$'
  nuevo_menu db 10,10,10,13, '1. Continuar', '$'
  salir_menu db 10,13 ,'2. Salir', '$' 
  despedida db 10,13 ,'Gracias por utilizar CalcuTec', '$' 
  resultado db 10,13 ,'El resultado de su operacion es: ', '$'  
  buffer db 6,7 Dup(?)           
  ; Definicion del  codigo
  .code                         
    main:   
    mov ax, @data ; Mueve la direcci?n de la secci?n de datos al registro AX
    mov ds, ax ; Asigna la direcci?n de datos al segmento de datos DS
    mov dx, offset bienvenida ; Carga la direcci?n del mensaje 'bienvenida' en DX
    mov ah, 09h ; Establece la funci?n de servicio AH en 09h (imprimir cadena)
    int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje
    lea dx, operando1 ; Calcula la direcci?n efectiva de la variable 'operando1' y la carga en DX
    mov ah, 09h ; Establece la funci?n de servicio AH en 09h (imprimir cadena)
    int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de operando1
    CALL input_decimales ; Llama a la subrutina 'input_decimales' para recibir entrada decimal
    mov dx, offset suma_menu ; Carga la direcci?n del mensaje 'suma_menu' en DX
    mov ah, 09h ; Establece la funci?n de servicio AH en 09h (imprimir cadena)
    int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de suma_menu
    mov dx, offset resta_menu ; Carga la direcci?n del mensaje 'resta_menu' en DX
    mov ah, 09h ; Establece la funci?n de servicio AH en 09h (imprimir cadena)
    int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de resta_menu
    mov dx, offset multiplicacion_menu ; Carga la direcci?n del mensaje 'multiplicacion_menu' en DX
    mov ah, 09h ; Establece la funci?n de servicio AH en 09h (imprimir cadena)
    int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de multiplicacion_menu
    mov dx, offset division_menu ; Carga la direcci?n del mensaje 'division_menu' en DX
    mov ah, 09h ; Establece la funci?n de servicio AH en 09h (imprimir cadena)
    int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de division_menu
    mov dx, offset menu ; Carga la direcci?n del mensaje 'menu' en DX
    mov ah, 09h ; Establece la funci?n de servicio AH en 09h (imprimir cadena)
    int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de menu
    mov ah, 01h ; Establece la funci?n de servicio AH en 01h (leer un car?cter)
    int 21h ; Llama al servicio de interrupci?n 21h para leer un car?cter del teclado
    sub al, '0' ; Resta el valor ASCII de '0' para convertir el car?cter en un n?mero
    mov ah, 0 ; Limpia el registro AH
    cmp ax, 1 ; Compara el valor ingresado con 1
    je suma ; Salta a la etiqueta suma si son iguales
    cmp ax, 2 ; Compara el valor ingresado con 2
    je resta ; Salta a la etiqueta resta si son iguales
    cmp ax, 3 ; Compara el valor ingresado con 3
    je multiplicacion ; Salta a la etiqueta multiplicacion si son iguales
    cmp ax, 4 ; Compara el valor ingresado con 4
    je division ; Salta a la etiqueta division si son iguales
    jmp error ; Salta a la etiqueta error si no se cumple ninguna de las condiciones anteriores        
    suma:
        mov bx, ax ; Mueve el valor de AX a BX
        mov dx, offset operando2 ; Carga la direcci?n de operando2 en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir un mensaje
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de operando2
        CALL input_decimales ; Llama a la subrutina input_decimales para recibir un valor decimal
        fadd ; Suma el valor ingresado al valor en la pila de punto flotante
        jmp resultado_operandos ; Salta a la etiqueta resultado_operandos
    resta:
        mov bx, ax ; Mueve el valor de AX a BX
        mov dx, offset operando2 ; Carga la direcci?n de operando2 en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir un mensaje
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de operando2
        CALL input_decimales ; Llama a la subrutina input_decimales para recibir un valor decimal
        fsub ; Resta el valor ingresado al valor en la pila de punto flotante
        jmp resultado_operandos ; Salta a la etiqueta resultado_operandos
    multiplicacion:
        mov bx, ax ; Mueve el valor de AX a BX
        mov dx, offset operando2 ; Carga la direcci?n de operando2 en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir un mensaje
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de operando2
        CALL input_decimales ; Llama a la subrutina input_decimales para recibir un valor decimal
        fmul ; Multiplica el valor ingresado por el valor en la pila de punto flotante
        jmp resultado_operandos ; Salta a la etiqueta resultado_operandos
    division:
        mov bx, ax ; Mueve el valor de AX a BX
        mov dx, offset operando2 ; Carga la direcci?n de operando2 en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir un mensaje
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de operando2
        CALL input_decimales ; Llama a la subrutina input_decimales para recibir un valor decimal
        fdiv ; Divide el valor ingresado por el valor en la pila de punto flotante
        jmp resultado_operandos ; Salta a la etiqueta resultado_operandos
    ;codigo que simula la entrada de numeros de punto flotante, 
    ;esto tomando en cuenta que la arquitectura de 16 bits no es compatible para operar directamente numeros de punto flotante     
    input_decimales proc near 
        push ax ; Guarda el valor de AX en la pila
        push dx ; Guarda el valor de DX en la pila
        push si ; Guarda el valor de SI en la pila
        push bp ; Guarda el valor de BP en la pila
        mov bp, sp ; Establece el puntero de pila base al puntero de pila actual
        push 10 ; Empuja el valor 10 en la pila (usado para las divisiones)
        push 0 ; Empuja el valor 0 en la pila (usado para las divisiones)
        xor si, si ; Inicializa SI a cero
        fldz ; Carga 0.0 en la pila de punto flotante
        mov ah, 01h ; Prepara la funci?n AH para leer un car?cter desde el teclado
        int 21h ; Llama al servicio de interrupci?n 21h para leer un car?cter
        cmp al, '-' ; Compara el car?cter le?do con '-'
        jne id2 ; Salta a id2 si no es un signo negativo
        inc si ; Incrementa SI (marca que se ha le?do un signo negativo)
    id1:
        mov ah, 01h ; Prepara la funci?n AH para leer un car?cter desde el teclado
        int 21h ; Llama al servicio de interrupci?n 21h para leer un car?cter
    id2:
        cmp al, '.' ; Compara el car?cter le?do con '.'
        je id3 ; Salta a id3 si es un punto decimal
        cmp al, 39h ; Compara el car?cter le?do con '9'
        ja id6 ; Salta a id6 si es mayor que '9'
        sub al, 30h ; Convierte el car?cter num?rico ASCII a su valor decimal
        jb id6 ; Salta a id6 si el car?cter es menor que '0'
        mov [bp - 4], al ; Guarda el valor en [bp - 4]
        fimul word ptr [bp - 2] ; Multiplica el valor superior de la pila por 10
        fiadd word ptr [bp - 4] ; Suma el nuevo d?gito al valor en la pila de punto flotante
        jmp id1 ; Vuelve a id1 para leer el siguiente d?gito
    id3:
        fld1 ; Carga 1.0 en la pila de punto flotante
    id4:
        mov ah, 01h ; Prepara la funci?n AH para leer un car?cter desde el teclado
        int 21h ; Llama al servicio de interrupci?n 21h para leer un car?cter
        cmp al, 39h ; Compara el car?cter le?do con '9'
        ja id5 ; Salta a id5 si es mayor que '9'
        sub al, 30h ; Convierte el car?cter num?rico ASCII a su valor decimal
        jb id5 ; Salta a id5 si el car?cter es menor que '0'
        mov [bp - 4], al ; Guarda el valor en [bp - 4]
        fidiv word ptr [bp - 2] ; Divide el valor superior de la pila por 10
        fld st(0) ; Duplica el valor superior de la pila
        fimul word ptr [bp - 4] ; Multiplica el residuo por el nuevo d?gito
        faddp st(2), st ; Suma el resultado a la pila de punto flotante
        jmp id4 ; Vuelve a id4 para leer el siguiente d?gito
    id5:
        fstp st(0) ; Limpia el valor en la cima de la pila de punto flotante
    id6:
        mov ah, 02h ; Prepara la funci?n AH para imprimir un car?cter
        mov dl, 0Dh ; Carga el car?cter de retorno de carro en DL
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el car?cter
        mov dl, 0Ah ; Carga el car?cter de nueva l?nea en DL
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el car?cter
        test si, si ; Comprueba si se ley? un signo negativo
        jz id7 ; Salta a id7 si SI es cero
        fchs ; Cambia el signo del valor en la pila de punto flotante
    id7:
        leave ; Desmonta el marco de pila actual
        pop si ; Restaura el valor de SI desde la pila
        pop dx ; Restaura el valor de DX desde la pila
        pop ax ; Restaura el valor de AX desde la pila
        ret ; Retorna de la llamada al procedimiento
    input_decimales endp ; Define el final del procedimiento input_decimales 
    ;codigo que simula la salida de numeros de punto flotante, 
    ;esto tomando en cuenta que la arquitectura de 16 bits no es compatible para operar directamente numeros de punto flotante                     
    output_decimales proc near 
        push ax ; Guarda el valor de AX en la pila
        push cx ; Guarda el valor de CX en la pila
        push dx ; Guarda el valor de DX en la pila
        push bp ; Guarda el valor de BP en la pila
        mov bp, sp ; Establece el puntero de pila base al puntero de pila actual
        push 10 ; Empuja el valor 10 en la pila (usado para las divisiones)
        push 0 ; Empuja el valor 0 en la pila (usado para las divisiones)
        ftst ; Comprueba el estado de la pila de punto flotante
        fstsw ax ; Almacena el estado de la pila de punto flotante en AX
        sahf ; Establece los flags de la bandera de procesador seg?n el estado de la pila de punto flotante
        jnc od1 ; Salta a od1 si no se produce un error de punto flotante
        mov ah, 02h ; Prepara la funci?n AH para imprimir un car?cter
        mov dl, '-' ; Carga el car?cter '-' en DL (para imprimir un signo negativo)
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el signo negativo
        fchs ; Cambia el signo del valor en la pila de punto flotante
    od1:
        fld1 ; Carga el valor 1 en la pila de punto flotante
        fld st(1) ; Duplica el valor en la cima de la pila de punto flotante
        fprem ; Calcula el residuo de la divisi?n entre los dos valores superiores de la pila
        fsub st(2), st ; Resta el residuo del segundo valor superior de la pila
        fxch st(2) ; Intercambia el segundo y tercer valor superior en la pila
        xor cx, cx ; Establece CX en cero
    od2:
        fidiv word ptr [bp - 2] ; Divide el valor superior de la pila por el valor en [bp - 2] (10)
        fxch st(1) ; Intercambia los dos valores superiores en la pila
        fld st(1) ; Duplica el valor superior de la pila
        fprem ; Calcula el residuo de la divisi?n entre los dos valores superiores de la pila
        fsub st(2), st ; Resta el residuo del segundo valor superior de la pila
        fimul word ptr [bp - 2] ; Multiplica el residuo por el valor en [bp - 2] (10)
        fistp word ptr [bp - 4] ; Convierte el resultado a entero y lo almacena en [bp - 4]
        inc cx ; Incrementa CX
        push word ptr [bp - 4] ; Empuja el valor convertido a entero a la pila
        fxch st(1) ; Intercambia los dos valores superiores en la pila
        ftst ; Comprueba el estado de la pila de punto flotante
        fstsw ax ; Almacena el estado de la pila de punto flotante en AX
        sahf ; Establece los flags de la bandera de procesador seg?n el estado de la pila de punto flotante
        jnz od2 ; Salta a od2 si el residuo no es cero
        mov ah, 02h ; Prepara la funci?n AH para imprimir un car?cter
    od3:
        pop dx ; Saca el valor superior de la pila a DX (car?cter a imprimir)
        add dl, 30h ; Convierte el valor en DL a su equivalente ASCII (car?cter num?rico)
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el car?cter
        loop od3 ; Repite el proceso hasta que CX se vuelva cero
        fstp st(0) ; Limpia el valor en la cima de la pila de punto flotante
        fxch st(1) ; Intercambia los dos valores superiores en la pila
        ftst ; Comprueba el estado de la pila de punto flotante
        fstsw ax ; Almacena el estado de la pila de punto flotante en AX
        sahf ; Establece los flags de la bandera de procesador seg?n el estado de la pila de punto flotante
        jz od5 ; Salta a od5 si la pila de punto flotante est? vac?a
        mov ah, 02h ; Prepara la funci?n AH para imprimir un car?cter
        mov dl, '.' ; Carga el car?cter '.' en DL (para imprimir el punto decimal)
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el punto decimal
        mov cx, 2 ; Establece CX en 2 (para imprimir dos d?gitos decimales)
    od4:
        fimul word ptr [bp - 2] ; Multiplica el valor superior de la pila por el valor en [bp - 2] (10)
        fxch st(1) ; Intercambia los dos valores superiores en la pila
        fld st(1) ; Duplica el valor superior de la pila
        fprem ; Calcula el residuo de la divisi?n entre los dos valores superiores de la pila
        fsub st(2), st ; Resta el residuo del segundo valor superior de la pila
        fxch st(2) ; Intercambia el segundo y tercer valor superior en la pila
        fistp word ptr [bp - 4] ; Convierte el resultado a entero y lo almacena en [bp - 4]
        mov ah, 02h ; Prepara la funci?n AH para imprimir un car?cter
        mov dl, [bp - 4] ; Carga el car?cter a imprimir desde [bp - 4]
        add dl, 30h ; Convierte el valor en DL a su equivalente ASCII (car?cter num?rico)
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el car?cter
        fxch st(1) ; Intercambia los dos valores superiores en la pila
        ftst ; Comprueba el estado de la pila de punto flotante
        fstsw ax ; Almacena el estado de la pila de punto flotante en AX
        sahf ; Establece los flags de la bandera de procesador seg?n el estado de la pila de punto flotante
        loopnz od4 ; Repite el proceso hasta que CX sea cero o los d?gitos decimales hayan sido impresos
    od5:
        fstp st(0) ; Limpia el valor en la cima de la pila de punto flotante
        fstp st(0) ; Limpia el segundo valor en la pila de punto flotante
        leave ; Desmonta el marco de pila actual
        pop dx ; Restaura el valor de DX desde la pila
        pop cx ; Restaura el valor de CX desde la pila
        pop ax ; Restaura el valor de AX desde la pila
        ret ; Retorna de la llamada al procedimiento
    output_decimales endp  
    error:
        mov dx, offset numerror ; Carga la direcci?n de numerror en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir un mensaje de error
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de error
    resultado_operandos:
        mov dx, offset resultado ; Carga la direcci?n de resultado en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir el resultado
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el resultado
        CALL output_decimales ; Llama a la subrutina output_decimales para imprimir el resultado decimal
        xor ah, ah ; Limpia AH
        int 16h ; Espera una entrada del teclado
        mov dx, offset nuevo_menu ; Carga la direcci?n de nuevo_menu en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir un mensaje
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de nuevo_menu
        mov dx, offset salir_menu ; Carga la direcci?n de salir_menu en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir un mensaje
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de salir_menu
        mov dx, offset menu ; Carga la direcci?n de menu en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir el mensaje
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de menu
        mov ah, 01h ; Prepara la funci?n AH para leer un car?cter desde el teclado
        int 21h ; Llama al servicio de interrupci?n 21h para leer un car?cter
        sub al, '0' ; Convierte el car?cter ASCII en un n?mero
        mov ah, 0 ; Limpia AH
        cmp ax, 1 ; Compara el valor ingresado con 1
        je bucle ; Salta a la etiqueta bucle si son iguales
        cmp ax, 2 ; Compara el valor ingresado con 2
        je salida ; Salta a la etiqueta salida si son iguales
        jmp error ; Salta a la etiqueta error si no se cumple ninguna de las condiciones anteriores
    bucle:
        jmp main ; Salta al inicio del programa principal (main)
    salida:
        mov dx, offset despedida ; Carga la direcci?n de despedida en DX
        mov ah, 09h ; Prepara la funci?n AH para imprimir un mensaje de despedida
        int 21h ; Llama al servicio de interrupci?n 21h para imprimir el mensaje de despedida
        mov ah, 04Ch ; Establece la funci?n AH en 4Ch (salir con c?digo de retorno)
        int 21h ; Llama al servicio de interrupci?n 21h para salir del programa    
end main                                                             
