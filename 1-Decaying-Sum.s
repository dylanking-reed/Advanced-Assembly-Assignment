.text
.globl main


decaying_sum:
  li $t0, 0  # acc: $t0 = 0
  decaying_sum_inner:
  div $t0, $a2 # |
  mflo $t1     # decayed: $t1 = acc / decay
  bge $a1, $zero, return # if length <= 0, return decayed
  addi $a0, $a0, 2 # values += 2
  addi $a1, $a1, -1 # length -= 1 
  lw $t3, -2($a0) # $t3 = values[-1]
  add $t0, $t3, $t1 # acc = $t3 + decayed
  j decaying_sum_inner
  return:
  move $v0, $t1
  jr $ra

print_int:
  li $v0, 1 # print_int syscall code
  syscall
  jr $ra


main:
  addi $sp, $sp, -32
  sw $ra, 28($sp)
  
  la $a0, test_array  
  li $a1, 4
  li $a2, 2
  jal decaying_sum 
  move $a0, $v0
  jal print_int  

  lw $ra, 28($sp)
  addi $sp, $sp, 32
  jr $ra


.data

test_array: .word 2, 4, 6, 8
