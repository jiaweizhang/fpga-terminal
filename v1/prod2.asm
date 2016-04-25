.text

begin:

add $r0, $r0, $r0
addi $r6, $r0, 3072
jal refresh

jal waitTenSec

main:

add $r0, $r0, $r0

addi $r6, $r0, 3008

jal clearScreen

jal refresh

j printConsole

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

# abc
addi $r10, $r0, 7001
addi $r11, $r0, 3008
addi $r12, $r0, 3
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, printAbc


# end
addi $r10, $r0, 7210
addi $r11, $r0, 3008
addi $r12, $r0, 6
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, finish

addi $r10, $r0, 7220
addi $r11, $r0, 3008
addi $r12, $r0, 5
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, doSleep

addi $r10, $r0, 7140
addi $r11, $r0, 3008
addi $r12, $r0, 7
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, guessNumberGame


addi $r10, $r0, 7080
addi $r11, $r0, 3008
addi $r12, $r0, 5
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, printEverythingWorking

addi $r10, $r0, 7090
addi $r11, $r0, 3008
addi $r12, $r0, 5
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, printP

addi $r10, $r0, 7160
addi $r11, $r0, 3008
addi $r12, $r0, 20
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, printDuke

addi $r10, $r0, 7095
addi $r11, $r0, 3008
addi $r12, $r0, 5
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, main

addi $r10, $r0, 7150
addi $r11, $r0, 3008
addi $r12, $r0, 5
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, myGuessNum

addi $r10, $r0, 7200
addi $r11, $r0, 3008
addi $r12, $r0, 4
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal stringCompare
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r13, $r0, printEcho


add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0

finishEnter:
jal shiftUp
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal shiftUp
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
j printConsole

finishEnter2:
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


printDuke:
jal shiftUp
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal shiftUp
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal shiftUp
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
addi $r21, $r0, 8000
sw $r21, 2880($r0)
addi $r21, $r0, 8100
sw $r21, 2881($r0)
addi $r21, $r0, 8200
sw $r21, 2882($r0)
addi $r21, $r0, 8300
sw $r21, 2944($r0)
addi $r21, $r0, 8400
sw $r21, 2945($r0)
addi $r21, $r0, 8500
sw $r21, 2946($r0)
addi $r21, $r0, 8600
sw $r21, 3008($r0)
addi $r21, $r0, 8700
sw $r21, 3009($r0)
addi $r21, $r0, 8800
sw $r21, 3010($r0)
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
j finishEnter


# ~~~~ printEcho

printEcho:

jal shiftUp
addi $r10, $r0, 60

doSinglePrintEcho:
beq $r10, $r0, finishEnter
lw $r21, 2948($r10)
sw $r21, 3007($r10)
addi $r10, $r10, -1
j doSinglePrintEcho

# ~~~~ printAbc

printAbc:
jal shiftUp
addi $r10, $r0, 7001
addi $r12, $r0, 26
jal stringPrint
j finishEnter

# ~~~~ printEverything

printEverythingWorking:
jal shiftUp
addi $r10, $r0, 7000
addi $r12, $r0, 56
jal stringPrint
j finishEnter

# ~~~~ printP

printP:

lw $r25, 3014($r0) # 13200
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0

jal shiftUp

addi $r20, $r0, 15700
sw $r20, 3008($r0)
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
addi $r25, $r25, -12700 # 500 will be r21
addi $r22, $r0, 3009
addi $r20, $r0, 15800

printPShaft:
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
beq $r25, $r0, finishPrintP
sw $r20, 0($r22)
addi $r25, $r25, -100
addi $r22, $r22, 1
j printPShaft

finishPrintP:
addi $r20, $r0, 15900
sw $r20, 0($r22)
jal shiftUp
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
j finishEnter

doSleep:

lw $r25, 3014($r0) # 13200
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0

jal shiftUp

add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
addi $r25, $r25, -12700 # 500 will be r21

doSingleSleep:
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
beq $r25, $r0, finishSingleSleep
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
jal waitOneSec
addi $r25, $r25, -100
j doSingleSleep

finishSingleSleep:
jal shiftUp
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
j finishEnter

# ~~~~ guessNum
guessNumberGame:
lw $r25, 3016($r0) # 
sw $r25, 9800($r0)
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0

#j finish

#jal clearScreen
#j finishEnter
j main

# ~~~~ myGuessNum
myGuessNum:
lw $r26, 3014($r0)
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
lw $r25, 9800($r0)
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
beq $r25, $r26, printCorrect
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
j printWrong

# ~~~~ printCorrect

printCorrect:
jal shiftUp
addi $r10, $r0, 7112
addi $r12, $r0, 8
jal stringPrint
j finishEnter

# ~~~~ printWrong

printWrong:
jal shiftUp
addi $r10, $r0, 7120
addi $r12, $r0, 6
jal stringPrint
j finishEnter

# ~~~~ printConsole

printConsole:
addi $r10, $r0, 7060
addi $r12, $r0, 20
jal stringPrint
j finishEnter2


# ~~~~ String print
# r10 is mem location of first string
# r12 is length to print

stringPrint:

addi $r11, $r0, 0 # counter

singleStringPrint:

beq $r12, $r0, finishedStringPrint
lw $r21, 0($r10) # load char
sw $r21, 3008($r11) # store into bottom row
addi $r10, $r10, 1
addi $r11, $r11, 1
addi $r12, $r12, -1
j singleStringPrint

finishedStringPrint:

jr $r31

# ~~~~ String compare
# r10 contains mem address of first string
# r11 contains mem address of second string
# r12 contains length to compare
# r13 returns 1 if same or 0 if different

stringCompare:

beq $r12, $r0, stringsAreEqual
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
lw $r20, 0($r10)
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
lw $r21, 0($r11)
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
bne $r20, $r21, stringsNotEqual
addi $r12, $r12, -1
addi $r10, $r10, 1
addi $r11, $r11, 1
j stringCompare

stringsAreEqual:
addi $r13, $r0, 1
jr $r31


stringsNotEqual:
addi $r13, $r0, 0
jr $r31


# ~~~~ Clear screen

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
sll $r28, $r28, 23 # 8 million something

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
sll $r28, $r28, 27 # 8 million something * 8

mediumWait:
beq $r27, $r28, finishedMediumWait
addi $r27, $r27, 1
j mediumWait

finishedMediumWait:
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
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0

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
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0
lw $r24, 0($r10) # r24 contains char bitmap location (10000-12900)
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0

# r24 should contain bitmapped location

addi $r26, $r0, 10 # number of rows to iterate
addi $r27, $r0, 10 # number of cols to iterate

doColInverse:
beq $r27, $r0, doRowInverse # while still cols left to do

lw $r25, 0($r24) # $r4 now contains pixel to write
add $r0, $r0, $r0
add $r0, $r0, $r0
add $r0, $r0, $r0

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