# ИДЗ № 1. Жуковский Дмитрий Романович БПИ219. Вариант 14
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
     - Следующие объявления:
       ```
       .globl	input
       .globl	getMax
       .globl	changeArray
       .globl	output
       ```
       `.globl	main` нужно оставить, иначе программу невозможно скомпилировать
     - Не забываем про макрос **leave**, его нужно заменить во всей программе [arrays.s](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays.s) на
        ```
        mov rsp, rbp
        pop rpb
        ```
        Но если в прологе функции есть строка формата `sub rsp, x`, где `x` - количество байт, то тогда заменяем **leave** на следующие строки:
        ```
        add rsp, x
        mov rsp, rbp
        pop rpb
        ```
4. [arrays_final_version.s](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays_final_version.s) - теперь поработаем с этой программой, она очищена от лишних директив и макросов, в ней присутствуют комментарии, описывающие связь переменных на языке Си и регистров, передачу фактических параметров и перенос возвращаемого результата. Для формальных параметров, описывающие связь между параметрами языка Си и регистрами, комментарии также добавлены.
5. Тестовые прогоны проводим для [arrays.c](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays.c) и [arrays_final_version.s](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays_final_version.s)
    - Программа на языке Си:
    ![](https://github.com/bugovsky/CSA_IHW_01/blob/main/Pictures/c_program_tests.png)
    - Программа на языке ассемблера:
    ![](https://github.com/bugovsky/CSA_IHW_01/blob/main/Pictures/asm_cleaned_program_tests.png)
    Как видим, результаты тестовых прогонов одинаковы, а также их вывод не отличается от правильного ответа на каждом тесте, заключаем, что программа работает корректно, а модификация ассемблерной программмы произведена верно.
6. В [arrays.c](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays.c) и [arrays_final_version.s](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays_final_version.s) используются функции с передачей данных
через параметры, также обе программы содержат локальные переменные.
7. [arrays_final_version_registers.s](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays_final_version_registers.s) - программа, получившаяся после рефакторинга.  
  В регистрах процессора хранится информация о всех переменных, которые используются в программе на языке C:
    - Размер массива
    - Массивы с целыми числами
    - Максимальное число массива
    - Счетчики циклов
    
    Комментарии в приложенной программе поясняют, какую переменную заменяет тот или иной регистр.
8. Тестовые прогоны для [arrays_final_version_registers.s](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays_final_version_registers.s):
  ![](https://github.com/bugovsky/CSA_IHW_01/blob/main/Pictures/asm_cleaned_registers_tests.png)
  Как видим, вывод программы на каждом тесте совпадает и с правильным ответом, и с выводом программ, выполненных ранее, что говорит о корректной работе полученной после рефакторинга программы.
  
  Таким образом, критерии, включенные в разделы оценок 4-6 (включительно) были выполнены.
