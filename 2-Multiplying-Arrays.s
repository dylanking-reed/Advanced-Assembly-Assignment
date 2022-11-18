.text
.globl main

product:
  mul $a0, $a1
  mfhi $v0
  mflo $v1
  jr $ra

array_product:
  addi $sp, $sp, -32
  sw $ra, 28($sp)
  move $t5, $a0
  move $t6, $a1
  li $t0, 0
  j cond
  loop:
  lw $a0, 0($t5) 
  lw $a1, 0($t6) 
  jal product
  move $t3, $v0
  move $t4, $v1
  sw $t3, 0($a2)
  sw $t4, 4($a2)
  addi $t5, $t5, 4
  addi $t6, $t6, 4
  addi $a2, $a2, 8
  addi $t0, $t0, 1
  cond:
  ble $t0, $a3, loop

  lw $ra, 28($sp)
  addi $sp, $sp, 32
