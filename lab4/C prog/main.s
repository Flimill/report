	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"n: "
	.align	2
.LC1:
	.string	"%d"
	.align	2
.LC2:
	.string	"size: "
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	addi	s0,sp,32
	sw	s0,-20(s0)
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	call	printf
	addi	a1,s0,-28
	lui	s1,%hi(.LC1)
	addi	a0,s1,%lo(.LC1)
	call	scanf
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	printf
	addi	a1,s0,-24
	addi	a0,s1,%lo(.LC1)
	call	scanf
	lw	a0,-24(s0)
	slli	a5,a0,2
	addi	a5,a5,15
	andi	a5,a5,-16
	sub	sp,sp,a5
	mv	s1,sp
	mv	a1,s1
	call	readArray
	mv	a2,s1
	lw	a1,-28(s0)
	lw	a0,-24(s0)
	call	shiftArray
	li	a0,10
	call	putchar
	mv	a1,s1
	lw	a0,-24(s0)
	call	printArray
	li	a0,0
	addi	sp,s0,-32
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
