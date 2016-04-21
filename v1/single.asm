.text

add $r0, $r0, $r0
addi $r10, $r0, 2

jal writeCharToVGA

addi $r10, $r1, 0

jal writeCharToVGA

addi $r10, $r0, 4

jal writeCharToVGA

j finish

writeCharToVGA:

# r10 contains char 0-indexed mem location (0-3071)

lw $23, 3072($r10) # r23 contains desired pixel location
lw $24, 0($r10) # r24 contains char bitmap location (10000-12900)

# r24 should contain bitmapped location

addi $r26, $r0, 10 # number of rows to iterate
addi $r27, $r0, 10 # number of cols to iterate

doCol:
beq $r27, $r0, doRow # while still cols left to do

lw $r25, 0($r24) # $r4 now contains pixel to write
vga $r25, 0($r23) # store pixel to vga

addi $r23, $r23, 1 # add one to pixel address
addi $r24, $r24, 1   # add one to bitmap location

addi $r27, $r27, -1 # subtract one
j doCol

doRow:
addi $r26, $r26, -1 
beq $r26, $r0, finishedChar # while still rows left to do

addi $r23, $r23, 630 # drop down one row to the beginning of char
addi $r27, $r0, 10 # number of cols to iterate
j doCol

finishedChar:

jr $r31

finish:
j finish

.data