.data
	x: .long 1
	y: .long 2
.text
.global main

main:
	mov x, %eax
	mov y, %ebx
	mov %eax, y
	mov %ebx, x

etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
