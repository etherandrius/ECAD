	.file	"div.c"
	.option nopic
	.text
	.align	2
	.globl	div
	.type	div, @function
div:
	li	a5,1
	bge	a1,a0,.L3
.L2:
	sll	a1,a1,1
	sll	a5,a5,1
	bgt	a0,a1,.L2
	li	a4,1
	ble	a5,a4,.L4
	sra	a1,a1,1
	sra	a5,a5,1
.L4:
	bgtz	a5,.L3
.L1:
	ret
.L7:
	sra	a1,a1,1
	sra	a5,a5,1
	blez	a5,.L1
.L3:
	blt	a0,a1,.L7
	sub	a0,a0,a1
	j	.L7
	.size	div, .-div
	.align	2
	.globl	main
	.type	main, @function
main:
	li	a0,0
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 7.1.0"
