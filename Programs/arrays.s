	.file	"arrays.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	input
	.type	input, @function
input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L2
.L3:
	lea	rax, -16[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -16[rbp]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -12[rbp], 1
.L2:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L3
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	ret
	.size	input, .-input
	.globl	getMax
	.type	getMax, @function
getMax:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -8[rbp], eax
	mov	DWORD PTR -4[rbp], 1
	jmp	.L6
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR -8[rbp], eax
	jge	.L7
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -8[rbp], eax
.L7:
	add	DWORD PTR -4[rbp], 1
.L6:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L8
	mov	eax, DWORD PTR -8[rbp]
	pop	rbp
	ret
	.size	getMax, .-getMax
	.globl	changeArray
	.type	changeArray, @function
changeArray:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -36[rbp], edx
	mov	DWORD PTR -40[rbp], ecx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L11
.L14:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jns	.L12
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -36[rbp]
	mov	DWORD PTR [rdx], eax
	jmp	.L13
.L12:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
.L13:
	add	DWORD PTR -4[rbp], 1
.L11:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -40[rbp]
	jl	.L14
	nop
	nop
	pop	rbp
	ret
	.size	changeArray, .-changeArray
	.section	.rodata
.LC1:
	.string	"%d "
	.text
	.globl	output
	.type	output, @function
output:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L16
.L17:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L16:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L17
	mov	edi, 10
	call	putchar@PLT
	nop
	leave
	ret
	.size	output, .-output
	.section	.rodata
.LC2:
	.string	"Incorrect length"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -32[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -32[rbp]
	test	eax, eax
	js	.L19
	mov	eax, DWORD PTR -32[rbp]
	cmp	eax, 100000
	jle	.L20
.L19:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L21
.L20:
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	edx, DWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	input
	mov	edx, DWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	getMax
	mov	DWORD PTR -28[rbp], eax
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	ecx, DWORD PTR -32[rbp]
	mov	edx, DWORD PTR -28[rbp]
	mov	rsi, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	changeArray
	mov	edx, DWORD PTR -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	output
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
.L21:
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
