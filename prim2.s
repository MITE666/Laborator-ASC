.data
	x: .long 3
	fin: .space 4

	prim: .asciz "prim\n"
	nprim: .asciz "nu e prim\n"
.text
.global main

main:
	mov x, %eax
	mov $2, %ebx
	mov $2, %ecx
	mov $0, %edx

	idiv %ebx

	add $1, %eax

	mov %eax, fin

	mov x, %eax

	cmp $1, %eax
	je etnprim

etloop:
	cmp fin, %ecx
	je etprim

	mov x, %eax
	mov $0, %edx

	idiv %ecx

	cmp $0, %edx
	je etnprim

	add $1, %ecx

	jmp etloop

etprim:
	mov $4, %eax
	mov $1, %ebx
	mov $prim, %ecx
	mov $6, %edx

	int $0x80

	jmp etexit

etnprim:
	mov $4, %eax
	mov $1, %ebx
	mov $nprim, %ecx
	mov $11, %edx

	int $0x80

etexit:
	mov $1, %eax
	mov $0, %ebx

	int $0x80
