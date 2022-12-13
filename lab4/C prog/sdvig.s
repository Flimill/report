	.file	"sdvig.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"array[%d] = "
	.align	2
.LC1:
	.string	"%d"
	.text
	.align	2
	.globl	readArray
	.type	readArray, @function
readArray:
	ble	a0,zero,.L6
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	mv	s2,a0
	mv	s1,a1
	li	s0,0
	lui	s4,%hi(.LC0)
	lui	s3,%hi(.LC1)
.L3:
	mv	a1,s0
	addi	a0,s4,%lo(.LC0)
	call	printf
	mv	a1,s1
	addi	a0,s3,%lo(.LC1)
	call	scanf
	addi	s0,s0,1
	addi	s1,s1,4
	bne	s2,s0,.L3
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	addi	sp,sp,32
	jr	ra
.L6:
	ret
	.size	readArray, .-readArray
	.section	.rodata.str1.4
	.align	2
.LC2:
	.string	"array[%d] = %d\n"
	.text
	.align	2
	.globl	printArray
	.type	printArray, @function
printArray:
	ble	a0,zero,.L14
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	mv	s2,a0
	mv	s1,a1
	li	s0,0
	lui	s3,%hi(.LC2)
.L11:
	lw	a2,0(s1)
	mv	a1,s0
	addi	a0,s3,%lo(.LC2)
	call	printf
	addi	s0,s0,1
	addi	s1,s1,4
	bne	s2,s0,.L11
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L14:
	ret
	.size	printArray, .-printArray
	.align	2
	.globl	shiftArray
	.type	shiftArray, @function
shiftArray:
	ble	a1,zero,.L17
	addi	t1,a0,-1
	slli	t1,t1,2
	add	t1,a2,t1
	slli	a5,a0,2
	addi	a5,a5,-4
	add	t4,a2,a5
	addi	a5,a5,4
	add	a7,a2,a5
	li	a6,0
	li	t3,1
	addi	a2,a2,4
.L21:
	lw	a4,0(t1)
	ble	a0,t3,.L19
	mv	a5,a7
.L20:
	mv	a3,a4
	lw	a4,-8(a5)
	sw	a3,-8(a5)
	addi	a5,a5,-4
	bne	a5,a2,.L20
.L19:
	sw	a4,0(t4)
	addi	a6,a6,1
	bne	a1,a6,.L21
.L17:
	ret
	.size	shiftArray, .-shiftArray
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
