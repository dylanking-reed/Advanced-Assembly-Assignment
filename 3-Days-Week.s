.text

strcpy:
  j cond
  loop:
  sb $t0, ($a0) 
  addi $a0, $a0, 1 
  addi $a1, $a1, 1 
  cond:
  lb $t0, ($a1)
  bne $t0, $zero, loop 

day_as_str:
  addi $sp, $sp, -32
  sw $ra, ($sp)

  li $t0, 4
  mul $t1, $a1, $t0
  addi $t1, $t1, table
  jr $t1

  monday:
  la $a1, monday_s
  jal strcpy
  j break 
  tuesday:
  la $a1, tuesday_s
  jal strcpy
  j break 
  wednesday:
  la $a1, wednesday_s
  jal strcpy
  j break 
  thursday:
  la $a1, thursday_s
  jal strcpy
  j break 
  friday:
  la $a1, friday_s
  jal strcpy
  j break 
  saturday:
  la $a1, saturday_s
  jal strcpy
  j break 
  sunday:
  la $a1, sunday_s
  jal strcpy

  break:
  lw $ra, ($sp)
  addi $sp, $sp, 32
  jr $ra

.data

table: monday tuesday wednesday thursday friday saturday sunday

monday_s: .asciiz "Monday"
tuesday_s: .asciiz "Tuesday"
wednesday_s: .asciiz "Wednesday"
thursday_s: .asciiz "Thursday"
friday_s: .asciiz "Friday"
saturday_s: .asciiz "Saturday"
sunday_s: .asciiz "Sunday"


