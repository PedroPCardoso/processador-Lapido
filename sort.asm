move $s0, $zero # i = 0
for1tst:slt $t0, $s0, $a1 # reg $t0 = 0 if $s0 ≥ $a1 (i≥n)
beq $t0, $zero,exit1 # go to exit1 if $s0 ≥ $a1 (i≥n)
. . .
(body of first for loop)
. . .
addi $s0, $s0, 1 # i += 1
j for1tst # jump to test of outer loop
exit1:

#segundo loop



addi $s1, $s0, –1 # j = i – 1
for2tst:slti $t0, $s1, 0 # reg $t0 = 1 if $s1 < 0 (j < 0)
 bne $t0, $zero, exit2 # go to exit2 if $s1 < 0 (j < 0)
 sll $t1, $s1, 2 # reg $t1 = j * 4
 add $t2, $a0, $t1 # reg $t2 = v + (j * 4)
 lw $t3, 0($t2) # reg $t3 = v[j]
 lw $t4, 4($t2) # reg $t4 = v[j + 1]
 slt $t0, $t4, $t3 # reg $t0 = 0 if $t4 ≥ $t3
 beq $t0, $zero, exit2 # go to exit2 if $t4 ≥ $t3
 . . .
 (body of second for loop)
 . . .
 addi $s1, $s1, –1 # j –= 1
 j for2tst # jump to test of inner loop
exit2:
