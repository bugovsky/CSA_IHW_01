	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text

input:
	push	rbp				# Пролог функции
	mov	rbp, rsp
	sub	rsp, 32
	
	mov	QWORD PTR -24[rbp], rdi		# Кладем в место на стеке по адресу rbp - 24 значение из rdi - указатель на первый элемент int *arr (первый формальный аргумент функции)
	mov	DWORD PTR -28[rbp], esi		# Кладем в место на стеке по адресу rbp - 28 значение из esi - значение int size (второй формальный аргумент функции)
	
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	
	mov	DWORD PTR -12[rbp], 0		# Кладем в место на стеке по адресу rbp - 12 ноль (счетчик int i = 0 в arrays.c)
	jmp	.L2				# Безусловный переход к метке .L2
	
.L3:
	lea	rax, -16[rbp]			# Кладем в регистр rax адрес переменной int number (из программы arrays.c)
	mov	rsi, rax			# Кладем в регистр rsi значение регистра rax (адрес int number) 
	lea	rax, .LC0[rip]			# Кладем в регистр rax информацию, что будет вводиться целое число
	mov	rdi, rax			# Кладем в регистр rdi значение регистра rax (информация, что вводим целое число) 
	mov	eax, 0
	call	__isoc99_scanf@PLT		# Вызываем встроенный в Си scanf - ввод числа
	
	mov	eax, DWORD PTR -12[rbp]		# Кладем в регистр eax наш счетчик
	cdqe					# Convert Doubleword to Quadword
	lea	rdx, 0[0+rax*4]			# Кладем в rdx адрес rax*4
	mov	rax, QWORD PTR -24[rbp]		# Кладем в rax указатель на первый элемент int *arr
	add	rdx, rax			# Добавляем к rdx значение регистра rax - указатель на первый элемент int *arr
	mov	eax, DWORD PTR -16[rbp]		# Кладем в eax значение int number
	mov	DWORD PTR [rdx], eax		# Присваиваем текущему элементу массива введенное значение int number из регистра eax
	add	DWORD PTR -12[rbp], 1		# Увеличиваем значение счетчика на единицу
.L2:
	mov	eax, DWORD PTR -12[rbp]		# Кладем в регистр rax значение на стеке по адресу rbp - 12 (счетчик int i = 0 в arrays.c)
	cmp	eax, DWORD PTR -28[rbp]		# Сравниваем значение в rax с значением переменной size
	jl	.L3				# Если значение в rax меньше значения size, то переходим к метке .L3
	
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	add rsp, 32				# Эпилог функции
	mov rsp, rbp
	pop rbp
	ret

getMax:
	push	rbp				# Пролог функции
	mov	rbp, rsp
	
	mov	QWORD PTR -24[rbp], rdi		# Кладем в место на стеке по адресу rbp - 24 значение из rdi - указатель на первый элемент int *arr (первый формальный аргумент функции)
	mov	DWORD PTR -28[rbp], esi		# Кладем в место на стеке по адресу rbp - 28 значение из esi - значение int size (второй формальный аргумент функции)
	mov	rax, QWORD PTR -24[rbp]		# Кладем в rax указатель на первый элемент int *arr
	mov	eax, DWORD PTR [rax]		# Кладем в eax первый элемент массива
	mov	DWORD PTR -8[rbp], eax		# Кладем в место на стеке по адрему rbp - 8 первый элемент массива
	mov	DWORD PTR -4[rbp], 1		# Счетчик (int i = 1)
	jmp	.L6				# Безусловный переход к метке .L6
.L8:
	mov	eax, DWORD PTR -4[rbp]		# В eax кладем значение счетчика
	cdqe					# Convert Doubleword to Quadword
	lea	rdx, 0[0+rax*4]			# Кладем в rdx адрес rax*4
	mov	rax, QWORD PTR -24[rbp]		# Кладем в rax указатель на первый элемент int *arr
	add	rax, rdx			# Добавляем к rdx значение регистра rax - указатель на первый элемент int *arr
	mov	eax, DWORD PTR [rax]		# Кладем в регистр eax значение по получившемуся адресу rax
	cmp	DWORD PTR -8[rbp], eax		# Сравниваем текущий максимум с текущим элементом массива
	jge	.L7				# Если текущий максимум больше либо равен, чем текущий элемент массива, то переходим к метке .L7
	mov	eax, DWORD PTR -4[rbp]		# Иначе кладем в eax текущее значение счетчика
	cdqe					# Convert Doubleword to Quadword
	lea	rdx, 0[0+rax*4]			# Загружаем в rdx адрес rax*4
	mov	rax, QWORD PTR -24[rbp]		# Кладем в rax указатель на первый элемент int *arr
	add	rax, rdx			# Добавляем к rax значение rdx
	mov	eax, DWORD PTR [rax]		# Кладем в eax значение по адресу rax (новый текущий максимум)
	mov	DWORD PTR -8[rbp], eax		# Теперь по данному адресу установлен новый максимум
.L7:
	add	DWORD PTR -4[rbp], 1		# Добавляем к счетчику 1
.L6:
	mov	eax, DWORD PTR -4[rbp]		# Кладем в eax текущее значение счетчика цикла
	cmp	eax, DWORD PTR -28[rbp]		# Сравниваем текущее значение счетчика с размером массива
	jl	.L8				# Если текущее значение счетчика меньше размера массива, то переходим к метке .L8
	mov	eax, DWORD PTR -8[rbp]		# В eax кладем найденный максимум, который храним по адресу rbp - 8
	
	pop	rbp				# Эпилог функции
	ret

changeArray:
	push	rbp				# Пролог функции
	mov	rbp, rsp
	
	mov	QWORD PTR -24[rbp], rdi		# На стек по адресу rbp - 24 кладем указатель на первый элемент массива int *arr - первый формальный аргумент функции
	mov	QWORD PTR -32[rbp], rsi		# На стек по адресу rbp - 32 кладем указатель на первый элемент массива int *changed_arr - второй формальный аргумент функции
	mov	DWORD PTR -36[rbp], edx		# На стек по адресу rbp - 36 кладем максимум массива int *arr - третий формальный аргумент функции
	mov	DWORD PTR -40[rbp], ecx		# На стек по адресу rbp - 40 кладем размер массива - четвертый формальный аргумент функции
	mov	DWORD PTR -4[rbp], 0		# Определяем счетчик цикла, присваиваем ему ноль
	jmp	.L11				# Безусловный переход к метке .L11
.L14:
	mov	eax, DWORD PTR -4[rbp]		# Кладем в регистр eax текущее значение счетчика
	cdqe					# Convert Doubleword to Quadword
	lea	rdx, 0[0+rax*4]			# Кладем в rdx адрес rax*4
	mov	rax, QWORD PTR -24[rbp]		# Кладем в регистр rax указатель на первый элемент массива int *arr
	add	rax, rdx			# Добавляем к rax значение rdx
	mov	eax, DWORD PTR [rax]		# Кладем в eax текущий элемент массива int *arr
	test	eax, eax			# Сравниваем текущий элемент массива int *arr с нулем
	jns	.L12				# Если текущий элемент массива больше либо равен нулю, то переходим к метке .L12
	mov	eax, DWORD PTR -4[rbp]		# Иначе (число отрицательное) кладем в регистр eax текущее значение счетчика
	cdqe					# Convert Doubleword to Quadword
	lea	rdx, 0[0+rax*4]			# Кладем в rdx адрес rax*4
	mov	rax, QWORD PTR -32[rbp]		# Кладем в регистр rax указатель на первый элемент массива int *сhanged_arr
	add	rdx, rax			# Добавляем к rax значение rdx
	mov	eax, DWORD PTR -36[rbp]		# Кладем в eax максимум массива int *arr
	mov	DWORD PTR [rdx], eax		# Текущему элементу массива int *сhanged_arr присваиваем максимум массива int *arr
	jmp	.L13				# Безусловный переход к метке .L13
.L12:
	mov	eax, DWORD PTR -4[rbp]		# Кладем в регистр eax текущее значение счетчика
	cdqe					# Convert Doubleword to Quadword
	lea	rdx, 0[0+rax*4]			# Кладем в rdx адрес rax*4
	mov	rax, QWORD PTR -24[rbp]		# Кладем в регистр rax указатель на первый элемент массива int *arr
	add	rax, rdx			# Добавляем к rax значение rdx
	mov	edx, DWORD PTR -4[rbp]		# Кладем в регистр edx текущее значение счетчика
	movsx	rdx, edx			# Кладем в регистр rdx значение edx (текущее значение счетчика)
	lea	rcx, 0[0+rdx*4]			# Кладем в rcx адрес rdx*4
	mov	rdx, QWORD PTR -32[rbp]		# Кладем в регистр rdx указатель на первый элемент массива int *сhanged_arr
	add	rdx, rcx			# Добавляем к rdx значение rcx
	mov	eax, DWORD PTR [rax]		# В регистр eax кладем текущий элемент массива int *arr
	mov	DWORD PTR [rdx], eax		# В текущий элемент массива int *changed_arr кладем текущий элемент массива int *arr
.L13:
	add	DWORD PTR -4[rbp], 1		# Добавляем к счетчику 1
.L11:
	mov	eax, DWORD PTR -4[rbp]		# Кладем в регистр eax текущее значение счетчика
	cmp	eax, DWORD PTR -40[rbp]		# Сравниваем значением счетчика с размером массива
	jl	.L14				# Если значение счетчика меньше, чем размер массива, то переходим в метке .L14
	nop
	nop
	
	pop	rbp				# Эпилог функции
	ret

	.section	.rodata
.LC1:
	.string	"%d "
	.text

output:
	push	rbp				# Пролог функции
	mov	rbp, rsp
	sub	rsp, 32
	
	mov	QWORD PTR -24[rbp], rdi		# На стек по адресу rbp - 24 кладем указатель на первый элемент массива int *arr - первый формальный аргумент функции
	mov	DWORD PTR -28[rbp], esi		# На стек по адресу rbp - 28 кладем размер массива - второй формальный аргумент функции
	mov	DWORD PTR -4[rbp], 0		# Определяем счетчик, изначально равен нулю
	jmp	.L16				# Безусловный переход к метке .L16
.L17:
	mov	eax, DWORD PTR -4[rbp]		# Кладем в регистр eax текущее значение счетчика
	cdqe					# Convert Doubleword to Quadword
	lea	rdx, 0[0+rax*4]			# Кладем в rdx адрес rax*4
	mov	rax, QWORD PTR -24[rbp]		# Кладем в регистр rax указатель на первый элемент массива int *arr
	add	rax, rdx			# Добавляем к rax значение rdx
	mov	eax, DWORD PTR [rax]		# Кладем в eax текущий элемент массива int *arr
	mov	esi, eax			# Кладем в регистр esi значение регистра eax - текущий элемент массива int *arr - второй фактический аргумент функции
	lea	rax, .LC1[rip]			# Кладем в rax информацию о том, что будет выводиться целое число
	mov	rdi, rax			# Кладем в rdi информацию о том, что будет выводиться целое число - первый фактический аргумент функции
	mov	eax, 0
	call	printf@PLT			# Вызов функции printf определенной в языке Си - печать числа
	add	DWORD PTR -4[rbp], 1		# Добавляем к счетчику 1
.L16:
	mov	eax, DWORD PTR -4[rbp]		# Кладем в регистр eax текущее значение счетчика
	cmp	eax, DWORD PTR -28[rbp]		# Сравниваем значением счетчика с размером массива
	jl	.L17				# Если значение счетчика меньше, чем размер массива, то переходим в метке .L17
	
	mov	edi, 10				# Кладем в edi значение '\n' - переход на новую строку
	call	putchar@PLT			# Вызываем printf cо значением, находящемся в edi - '\n'
	nop
	
	add rsp, 32				# Эпилог функции
	mov rsp, rbp
	pop rbp
	ret


	.section	.rodata
.LC2:
	.string	"Incorrect length"
	.text
	.globl	main
main:
	push	rbp				# Пролог функции
	mov	rbp, rsp
	sub	rsp, 32
	
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	
	lea	rax, -32[rbp]			# Кладем в регистр rax адрес, по которому будет находиться переменная size (из программы arrays.c)
	mov	rsi, rax			# Кладем в регистр rsi значение rax (адрес переменной size)
	lea	rax, .LC0[rip]			# Кладем в регистр rax информацию о том, что будет подано на вход целое число
	mov	rdi, rax			# Кладем в регистр rdi значение rax (информация, что будет подано целое число)
	mov	eax, 0
	call	__isoc99_scanf@PLT		# Вызов функции scanf из языка Си. - ввод размера массива
	
	mov	eax, DWORD PTR -32[rbp]		# Кладем в регистр eax значение size (из программы arrays.c)
	test	eax, eax			# Проверяем, равно ли значение в eax нулю
	js	.L19				# Если значение меньше нуля, то переходим к метке .L19
	
	mov	eax, DWORD PTR -32[rbp]		# Кладем в регистр eax значение size (из программы arrays.c)
	cmp	eax, 100000			# Сравниваем значение с значением 100000
	jle	.L20				# Если оно меньше или равно 100000, то переходим к метке .L20
	
.L19:
	lea	rax, .LC2[rip]			# Кладем в регистр rax адрес строки, содержащую информацию о некорректном вводе.
	mov	rdi, rax			# Кладем в регистр rdi значение регистр rax
	mov	eax, 0
	call	printf@PLT			# Вызов функции printf из языка Си - печатаем сообщение о некорректном вводе
	jmp	.L21				# Безусловный переход в метке .L21
.L20:
	mov	eax, DWORD PTR -32[rbp]		# Кладем в регистр eax значение переменной size (из программы arrays.c)
	cdqe					# Convert Doubleword to Quadword
	sal	rax, 2				# Побитовый сдвиг значения, лежащего в rax, влево на два (т.к. в int 4 байта)
	mov	rdi, rax			# Кладет в регистр rdi значение, находящееся в регистре rax (переменная size)
	call	malloc@PLT			# Вызов malloc из языка Си (динамическое выделение памяти для первого массива)
	mov	QWORD PTR -24[rbp], rax		# Кладет в место на стеке по адресу rbp - 24 значение из rax. (переменная int *start_array из arrays.c)
	
	mov	edx, DWORD PTR -32[rbp]		# Кладет в регистр edx значение переменной size (из программы на Си)
	mov	rax, QWORD PTR -24[rbp]		# Кладет в регистр rax указатель на начало массива *start_array из arrays.c
	mov	esi, edx			# Кладет в регистр esi значение из регистра edx (значение переменной size) - второй фактический аргумент функции
	mov	rdi, rax			# Кладет в регистр rdi значение регистр rax (указатель на начало массива *start_array из arrays.c) - первый фактический аргумент функции
	call	input				# Вызов функции input, которая была написана при разработке программы arrays.c (пользователь заполняет массив числами)
	
	mov	edx, DWORD PTR -32[rbp]		# Кладет в регистр edx значение переменной size (из программы на Си)
	mov	rax, QWORD PTR -24[rbp]		# Кладет в регистр rax указатель на начало массива *start_array из arrays.c
	mov	esi, edx			# Кладет в регистр esi значение регистра edx (переменная size) - второй фактический аргумент функции
	mov	rdi, rax			# Кладет в регистр rdi значение регистр rax (указатель на начало массива *start_array из arrays.c) - первый фактический аргумент функции
	call	getMax				# Вызов функции getMax, которая была написана при разработке программы arrays.c (поиск максимума в начальном массиве)
	
	mov	DWORD PTR -28[rbp], eax		# На стек по адресу rbp - 28 кладем полученный максимум из регистра eax
	mov	eax, DWORD PTR -32[rbp]		# В регистр eax кладем значение переменной size
	cdqe					# Convert Doubleword to Quadword
	sal	rax, 2				# Побитовый сдвиг значения, лежащего в rax, влево на два (т.к. в int 4 байта)
	mov	rdi, rax			# Кладем в rdi значение пермеменной size из регистра rax - первый аргумент
	call	malloc@PLT			# Вызываем  malloc - встроенную в Си функцию (динамически выделяем память для второго массива)
	mov	QWORD PTR -16[rbp], rax		# На стек по адресу rbp - 16 кладем указатель на первый элемент массива int *final_array (переменная из программы на языке Си) из регистра eax 
	
	mov	ecx, DWORD PTR -32[rbp]		# Кладем в регистр ecx значение переменной size (из программы на языке Си) - четвертый фактический аргумент вызываемой функции
	mov	edx, DWORD PTR -28[rbp]		# В регистр edx кладем найденный максимум - третий фактический аргумент вызываемой функции
	mov	rsi, QWORD PTR -16[rbp]		# В регистр rsi кладем указатель на первый элемент массива int *final_array - второй фактический аргумент вызываемой функции
	mov	rax, QWORD PTR -24[rbp]		# В регистр rax кладем указатель на первый элемент массива int *start_array
	mov	rdi, rax			# В регистр rdi кладем значение регистра rax (указатель на первый элемент массива int *start_array) - первый фактический аргумент вызываемой функции
	call	changeArray			# Вызываем функцию changeArray, написанную в программе arrays.c (получение нового массива, согласно условию задачи)
	
	mov	edx, DWORD PTR -32[rbp]		# Кладет в регистр edx значение переменной size (из программы на Си)
	mov	rax, QWORD PTR -16[rbp]		# В регистр rax кладем указатель на первый элемент массива int *final_array
	mov	esi, edx			# В регистр esi кладем значение регистра rax (размер массива) -  второй фактический аргумент вызываемой функции
	mov	rdi, rax			# В регистр rdi кладем указатель на первый элемент массива int *final_array -  первый фактический аргумент вызываемой функции
	call	output				# Вызов функции output, которая была написана при разработке программы arrays.c (вывод полученного массива)
	
	mov	rax, QWORD PTR -24[rbp]		# В регистр rax кладем указатель на первый элемент массива int *start_array
	mov	rdi, rax			# В регистр rdi кладем указатель на первый элемент массива int *start_array (значение регистра rax)
	call	free@PLT			# Очищаем память, выделенную под первый массив
	
	mov	rax, QWORD PTR -16[rbp]		# В регистр rax кладем указатель на первый элемент массива int *final_array
	mov	rdi, rax			# В регистр rdi кладем указатель на первый элемент массива int *final_array (значение регистра rax)
	call	free@PLT			# Очищаем память, выделенную под второй массив
.L21:
	mov	eax, 0				# Кладем 0 в eax (программа завершена успешно)
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	add rsp, 32				# Эпилог функции, заверешние программы с кодом 0
	mov rsp, rbp
	pop rbp
	ret
