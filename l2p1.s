.data
	x: .long 93
	y: .long 28
	xr: .space 4
	yr: .space 4
	s1: .space 4
	s2: .space 4
	pass: .asciz "PASS\n"
	fail: .asciz "FAIL\n"
.text
.global main

main:

etmet1:

	mov x, %eax
	mov $16, %ebx
	mov $0, %edx
	idiv %ebx

	mov %eax, xr

	mov y, %eax
	mov $16, %ebx
	mov $0, %edx
	imul %ebx

	mov %eax, yr

	mov xr, %eax
	add yr, %eax
	mov %eax, s1

etmet2:

	mov x, %eax
	sar $4, %eax

	mov %eax, xr

	mov y, %eax
	sal $4, %eax

	mov %eax, yr

	mov xr, %eax
	add yr, %eax
	mov %eax, s2

	mov s1, %eax
	mov s2, %ebx

	cmp %eax, %ebx
	je etpass

etfail:

	mov $4, %eax
	mov $1, %ebx
	mov $fail, %ecx
	mov $6, %edx
	int $0x80

	jmp etexit

etpass:

	mov $4, %eax
	mov $1, %ebx
	mov $pass, %ecx
	mov $6, %edx
	int $0x80

	jmp etexit

etexit:

	mov $1, %eax
	mov $0, %ebx
	int $0x80
