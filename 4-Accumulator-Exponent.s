.text

accumulator_exponent:
  mtc1 $a0, $f0
  mtc1 $a1, $f1
  li $t0, 0
  j cond
  loop:
  l.d $f2, ($a2)
  add.d $f0, $f0, $f2
  addi $a2, $a2, 8
  addi $t0, $t0, 1
  cond:
  blt $t0, $a3, loop

  mfc1 $a0, $f0 
  mfc1 $a1, $f1 

  andi $t1, $a0, 0b01111111111100000000000000000000
  srl $v0, $t1, 20 

  jr $ra

