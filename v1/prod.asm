.text

main:

addi $r10, $r0, 1 # $r10 contains which char 0-indexed (0-3071) mem location
# as well as the pixel location

# r10 contains char 0-indexed mem location (0-3071)


lw $23, 3027($r10) r23 contains desired pixel location
lw $24, 0($r10) # r24 contains char bitmap location (10000-12900)

# r24 should contain bitmapped location

addi $r6, $r0, 10 # number of rows to iterate
addi $r7, $r0, 10 # number of cols to iterate

doCol:
beq $r7, $r0, doRow # while still cols left to do

lw $r4, 0($r24) # $r4 now contains pixel to write
vga $r4, 0($r23) # store pixel to vga

addi $r23, $r23, 1 # add one to address
addi $r24, $r24, 1   # add one to bitmap location

addi $r7, $r7, -1 # subtract one
j doCol

doRow:
addi $r6, $r6, -1 
beq $r6, $r0, finish # while still rows left to do

addi $r23, $r23, 630 # drop down one row to the beginning of char
addi $r7, $r0, 10 # number of cols to iterate
j doCol


finish:
j finish

.data

