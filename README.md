# ИДЗ № 1. Жуковский Дмитрий БПИ219. Вариант 14
## Условие задачи
`Сформировать массив B из элементов массива A заменой всех
отрицательных значений на максимум из массива A.`
## Этапы выполнения работы
Начать стоит с того, что было решено ограничить максимальный размер массива числом 100000. При вводе большего или отрицательного числа пользователь получит сообщение "Incorrect length" и работа программы завершится.  

Теперь перейдем к этапам выполнения ИДЗ:
1. Изначально была написана [arrays.c](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays.c) - программа на языке C.
2. Далее была произведена трансформация программы на языке C с удалением лишних директив с помощью команды `gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none arrays.c`. Получили [arrays.s](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays.s) - программу на языке ассемблера.
3. Удалим все лишнее из ассемблерной программы (все, что **не влияет** на работу программы):
    - `.file	"arrays.c"` - информацию о названии файла, из которого программа была получена.
    - Информацию об экспорте символов методов:
    
       ```
       .type	input, @function  
       .type	getMax, @function  
       .type	changeArray, @function  
       .type	output, @function  
       .type	main, @function
       ```
     - Информацию о трансформации кода в язык ассемблера:
     
       ```
      	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
        .section	.note.GNU-stack,"",@progbits
       ```
     - Информацию о размере функций:
       ```
        .size	input, .-input
        .size	getMax, .-getMax
        .size	changeArray, .-changeArray
        .size	output, .-output
        .size	main, .-main
       ```
