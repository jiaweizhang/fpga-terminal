.text

main:
    add $r0, $r0, $r0
    setx 100
    add $r0, $r0, $r0
    add $r0, $r0, $r0
    add $r0, $r0, $r0
    bex 5
    addi $r1, $r0, 1
    addi $r2, $r0, 2
    addi $r3, $r0, 3
    addi $r4, $r0, 4
    addi $r5, $r0, 5
    addi $r6, $r0, 6
    addi $r7, $r0, 7
    addi $r8, $r0, 8
    addi $r9, $r9, 9
    setx 0
    add $r0, $r0, $r0
    add $r0, $r0, $r0
    add $r0, $r0, $r0
    bex 5
    addi $r1, $r0, 1
    addi $r2, $r0, 2
    addi $r3, $r0, 3
    addi $r4, $r0, 4
    addi $r5, $r0, 5
    addi $r6, $r0, 6
    addi $r7, $r0, 7
    addi $r8, $r0, 8
    addi $r9, $r9, 9

.data
