.text

main:

addi $r10, $r0, 1 # $r10 contains which char 0-indexed (0-3071) mem location

jal writeCharToVGA

addi $r10, $r0, 66 # $r10 contains which char 0-indexed (0-3071) mem location

jal writeCharToVGA

addi $r10, $r0, 67 # $r10 contains which char 0-indexed (0-3071) mem location

jal writeCharToVGA

addi $r10, $r0, 63 # $r10 contains which char 0-indexed (0-3071) mem location

jal writeCharToVGA

addi $r10, $r0, 64 # $r10 contains which char 0-indexed (0-3071) mem location

jal writeCharToVGA

addi $r10, $r0, 3071 # $r10 contains which char 0-indexed (0-3071) mem location

jal writeCharToVGA

addi $r10, $r0, 3070 # $r10 contains which char 0-indexed (0-3071) mem location

jal writeCharToVGA

j finish

writeCharToVGA:

# r10 contains char 0-indexed mem location (0-3071)

lw $23, 3072($r10) # r23 contains desired pixel location
lw $24, 0($r10) # r24 contains char bitmap location (10000-12900)

# r24 should contain bitmapped location

addi $r6, $r0, 10 # number of rows to iterate
addi $r7, $r0, 10 # number of cols to iterate

doCol:
beq $r7, $r0, doRow # while still cols left to do

lw $r4, 0($r24) # $r4 now contains pixel to write
vga $r4, 0($r23) # store pixel to vga

addi $r23, $r23, 1 # add one to pixel address
addi $r24, $r24, 1   # add one to bitmap location

addi $r7, $r7, -1 # subtract one
j doCol

doRow:
addi $r6, $r6, -1 
beq $r6, $r0, finishedChar # while still rows left to do

addi $r23, $r23, 630 # drop down one row to the beginning of char
addi $r7, $r0, 10 # number of cols to iterate
j doCol

finishedChar:

jr $r31

finish:
j finish

.data

