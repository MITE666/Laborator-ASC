.data
	x: .long 3
	y: .long 2
	z: .long 1
	min: .space 4
.text
.global main

main:

	mov x, %eax
	mov y, %ebx
	mov z, %ecx

etcxy:
	cmp %ebx, %eax
	jl etcyz1

	jmp etcxz2

etcyz1:
	cmp %ecx, %ebx
	jl etx

	jmp etcxz1

etcxz1:
	cmp %ecx, %eax
	jl etx

	jmp etz

etcxz2:
	cmp %ecx, %eax
	jl ety

	jmp etcyz2

etcyz2:
	cmp %ecx, %ebx
	jl ety

	jmp etz

etx:
	mov %eax, min
	jmp etexit

ety:
	mov %ebx, min
	jmp etexit

etz:
	mov %ecx, min
	jmp etexit

etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
