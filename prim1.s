.data
	x: .long 17
	prim: .asciz "prim\n"
	nprim: .asciz "nu e prim\n"
.text
.global main

main:
	mov x, %eax
	mov $0, %edx
	mov $2, %ebx
	idiv %ebx
	mov %eax, %ecx

	mov $1, %ebx
	mov x, %eax

	cmp %ebx, %eax
	je etnprim

etloop:
	mov x, %eax
	mov $0, %edx
	mov $0, %ebx
	idiv %ecx

	cmp %edx, %ebx
	je etnprim

	mov $2, %ebx

	cmp %ecx, %ebx
	je etprim

	loop etloop

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
