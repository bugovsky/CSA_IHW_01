# ИДЗ № 1. Жуковский Дмитрий БПИ219. Вариант 14
## Условие задачи
`Сформировать массив B из элементов массива A заменой всех
отрицательных значений на максимум из массива A.`
## Этапы выполнения работы
1. Изначально была написана [arrays.c](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays.c) - программа на языке C.
2. Далее была произведена трансформация программы на языке C с удалением лишних директив с помощью команды

`gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none arrays.c`. Получили [arrays.s](https://github.com/bugovsky/CSA_IHW_01/blob/main/Programs/arrays.s) - программу на языке ассемблера.
