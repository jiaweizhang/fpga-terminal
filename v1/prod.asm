.text

main:

add $r0, $r0, $r0

addi $r6, $r0, 3008

jal clearScreen

jal refresh

readyToType:
add $r5, $r1, $r0
bne $r5, $r0, displayChar
j readyToType

displayChar: 

addi $r27, $r0, 102
beq $r5, $r27, backspace
addi $r27, $r0, 107
beq $r5, $r27, moveLeft
addi $r27, $r0, 116
beq $r5, $r27, moveRight
addi $r27, $r0, 117
beq $r5, $r27, moveUp
addi $r27, $r0, 114
beq $r5, $r27, moveDown
addi $r27, $r0, 90
beq $r5, $r27, doEnter

lw $r22, 6144($r5)
sw $r22, 0($r6)
addi $r6, $r6, 1
jal refresh

jal waitKey
j readyToType

backspace:
addi $r6, $r6, -1
addi $r27, $r0, 10000
sw $r27, 0($r6)
jal refresh
jal waitKey
j readyToType

moveLeft:
addi $r6, $r6, -1
jal refresh
jal waitKey
j readyToType

moveRight:
addi $r6, $r6, 1
jal refresh
jal waitKey
j readyToType

moveUp:
addi $r6, $r6, -64
jal refresh
jal waitKey
j readyToType

moveDown:
addi $r6, $r6, 64
jal refresh
jal waitKey
j readyToType

doEnter:
jal shiftUp

addi $r6, $r0, 3008
jal refresh

# moves to beginning of next line
#addi $r21, $r0, 63 # bitmask
#and $r21, $r6, $r21 
#sub $r6, $r6, $r21
jal waitKey
j readyToType




j finish


#~~~~ Clear screen

clearScreen:

sw $r31, 9897($r0)

addi $r10, $r0, 3072 # r10 is iterator
addi $r21, $r0, 10000 # space

clearSingleChar:

beq $r10, $r0, finishedClearScreen
addi $r10, $r10, -1
sw $r21, 0($r10) # store char of char above

j clearSingleChar

finishedClearScreen:

lw $r31, 9897($r0)
jr $r31


# ~~~~~ wait very short second ~~~~ 
# haxx

waitKey:

addi $r27, $r0, 0 # counter iterator
addi $r28, $r0, 1 # put 1 first
sll $r28, $r28, 18 # 8 million something

veryShortWaitKey:
beq $r27, $r28, finishedWaitKey
addi $r27, $r27, 1
j veryShortWaitKey

finishedWaitKey:
jr $r31

# ~~~~~ wait 1 second ~~~~ 
# haxx

waitOneSec:

addi $r27, $r0, 0 # counter iterator
addi $r28, $r0, 1 # put 1 first
sll $r28, $r28, 24 # 8 million something

veryShortWait:
beq $r27, $r28, finishedWait
addi $r27, $r27, 1
j veryShortWait

finishedWait:
jr $r31

# ~~~~~ wait 10 seconds ~~~~ 
# haxx

waitTenSec:

addi $r27, $r0, 0 # counter iterator
addi $r28, $r0, 1 # put 1 first
sll $r28, $r28, 26 # 8 million something * 8

mediumWait:
beq $r27, $r28, finishedMediumWait
addi $r27, $r27, 1
j mediumWait

finishedMediumWait:
jr $r31

# ~~~~ printBuffer -> last row ~~~~

printBuffer:

addi $r10, $r0, 0 # loads bottom left char
addi $r12, $r0, 64 # counter up to 64

printChar:
beq $r10, $r12, finishedPrintBuffer

lw $r21, 9900($r10) # loads char
sw $r21, 3008($r10) # stores char into last row
addi $r10, $r10, 1

j printChar

finishedPrintBuffer:

jr $r31

# ~~~~ shift up ~~~~

shiftUp:

sw $r31, 9898($r0)

addi $r10, $r0, 0 # r10 is iterator
addi $r12, $r0, 3008 # r12 is max value of row above last

shiftSingleChar:

beq $r10, $r12, clearBottom
lw $r21, 64($r10) # get char of char below
sw $r21, 0($r10) # store char of char above

addi $r10, $r10, 1
j shiftSingleChar

clearBottom:

addi $r21, $r0, 10000 # load space
addi $r12, $r0, 3072 # last character

clearSingleCharBottom:
beq $r10, $r12, finishedShift

sw $r21, 0($10)
addi $r10, $r10, 1

j clearSingleCharBottom

finishedShift:

lw $r31, 9898($r0)
jr $r31


# ~~~~~ refresh
refresh:

addi $r10, $r0, 0 # r10 is iterator
addi $r11, $r0, 3072 # r11 is max value of char
#add $r20, $r0, $r31 # move RA into another register
sw $r31, 9899($r0)

charIteration:
beq $r10, $r11, finishedRefresh

beq $r6, $r10, writeInverse

jal writeCharToVGA

j finishedInverse
writeInverse:
jal writeCharToVGAInverse
finishedInverse:

addi $r10, $r10, 1 # increment iterator

j charIteration

finishedRefresh:

lw $r31, 9899($r0)
jr $r31

# ~~~~~ write Char to VGA
writeCharToVGA:

# r10 contains char 0-indexed mem location (0-3071)

lw $r23, 3072($r10) # r23 contains desired pixel location
lw $r24, 0($r10) # r24 contains char bitmap location (10000-12900)

# r24 should contain bitmapped location

addi $r26, $r0, 10 # number of rows to iterate
addi $r27, $r0, 10 # number of cols to iterate

doCol:
beq $r27, $r0, doRow # while still cols left to do

lw $r25, 0($r24) # $r4 now contains pixel to write

#addi $r22, $r6, 1
#bne $r6, $r10, dontInvertColor
#addi $r28, $r0, 255
#sub $r25, $r28, $r25 # subtract from 255 to invert

#dontInvertColor:

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


# ~~~~~ write Char to VGA Inverse
writeCharToVGAInverse:

# r10 contains char 0-indexed mem location (0-3071)

lw $r23, 3072($r10) # r23 contains desired pixel location
lw $r24, 0($r10) # r24 contains char bitmap location (10000-12900)

# r24 should contain bitmapped location

addi $r26, $r0, 10 # number of rows to iterate
addi $r27, $r0, 10 # number of cols to iterate

doColInverse:
beq $r27, $r0, doRowInverse # while still cols left to do

lw $r25, 0($r24) # $r4 now contains pixel to write

addi $r28, $r0, 255
sub $r25, $r28, $r25 # subtract from 255 to invert

vga $r25, 0($r23) # store pixel to vga

addi $r23, $r23, 1 # add one to pixel address
addi $r24, $r24, 1   # add one to bitmap location

addi $r27, $r27, -1 # subtract one
j doColInverse

doRowInverse:
addi $r26, $r26, -1 
beq $r26, $r0, finishedCharInverse # while still rows left to do

addi $r23, $r23, 630 # drop down one row to the beginning of char
addi $r27, $r0, 10 # number of cols to iterate
j doColInverse

finishedCharInverse:

jr $r31

finish:
j finish

.data

