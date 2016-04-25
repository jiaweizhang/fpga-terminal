.text

main:
    add $r0, $r0, $r0
    addi $r2, $r0, 15
    addi $r3, $r0, 35
    mul $r4, $r2, $r3
    add $r0, $r0, $r0
    addi $r2, $r0, 125
    addi $r3, $r0, 5
    div $r4, $r2, $r3
    addi $r2, $r0, 1000
    addi $r3, $r0, 17
    div $r4, $r2, $r3
    addi $r2, $r0, 1000
    addi $r3, $r0, -17
    div $r4, $r2, $r3
    addi $r2, $r0, 0
    addi $r3, $r0, 0
    div $r4, $r2, $r3
    addi $r2, $r0, 125
    addi $r3, $r0, 5
    mul $r4, $r2, $r3

.data
