size = 4
			.data
vector1:	.word	2,3,5,6,8,1,3,2,5,9
s:			.word	0

			.text
main:
			la		$a0, vector1
			li		$a1, 10
			jal		suma
			sw		$v0, s
			
			
			li		$v0, 10
			syscall
			
			
#FIN DEL PROGRAMA PRINCIPAL

suma:		li		$t0, 0
			ble		$a1, $t0, mencero
			addi	$sp, $sp, -8
			sw		$ra, 4($sp)
			sw		$a0, 0($sp)
			addu	$a0, $a0, size
			
			sub		$a1, $a1, 1
			jal suma
			
			lw		$a0, 0($sp)
			lw		$ra, 4($sp)
			addi	$sp, $sp, 8
			
			lw		$t2, 0($a0)
			add		$v0, $v0, $t2
			jr		$ra

mencero:	li $v0, 0
			jr $ra


