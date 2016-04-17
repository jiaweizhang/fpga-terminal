# ~~~ boot sequence

add $r0, $r0, $r0

# load password request screen - hardcoded for test

lw $r1, 0($0) # p
li $r2, 3300800 # don't have li but figure something out
sw $r1, 0($r2) # store p into the location

lw $r1, 100($0) # a
addi $r2, $r2, 100
sw $r1, 0($r2)

lw $r1, 200($0) # s
addi $r2, $r2, 100
sw $r1, 0($r2)

lw $r1, 300($0) # s
addi $r2, $r2, 100
sw $r1, 0($r2)

lw $r1, 400($0) # w
addi $r2, $r2, 100
sw $r1, 0($r2)

lw $r1, 500($0) # o
addi $r2, $r2, 100
sw $r1, 0($r2)

lw $r1, 600($0) # r
addi $r2, $r2, 100
sw $r1, 0($r2)

lw $r1, 700($0) # d
addi $r2, $r2, 100
sw $r1, 0($r2)

lw $r1, 800($0) # :
addi $r2, $r2, 100
sw $r1, 0($r2)

lw $r1, 900($0) # space
addi $r2, $r2, 100
sw $r1, 0($r2)

# read keyboard buffer

li $r1, 20000 # place to store it
beginkeyboard:

beq $r0, $r29, beginkeyboard

# something came through 
li $r2, VALUE_OF_ENTER
beq $r29, $r2, compareToPassword
sw $r29, 0($r1)
addi $r1, $r1, 100 # calculate next place
add $r29, $r0, $r0 # reset keyboard buffer
j beginkeyboard


# assume 4 letter password - will fix eventually
compareToPassword:

la $r1, VALUE_OF_ENTER # begin of buffer
la $r2, PASSWORD # password location
lw $r3, 0($r1)
lw $r4, 0($r2)
bne $r3, $r4, passwordNotEqual

addi $r1, $r1, 100
addi $r2, $r2, 100

lw $r3, 0($r1)
lw $r4, 0($r2)
bne $r3, $r4, passwordNotEqual

addi $r1, $r1, 100
addi $r2, $r2, 100

lw $r3, 0($r1)
lw $r4, 0($r2)
bne $r3, $r4, passwordNotEqual

addi $r1, $r1, 100
addi $r2, $r2, 100

lw $r3, 0($r1)
lw $r4, 0($r2)
bne $r3, $r4, passwordNotEqual

passwordEqual:
jal shiftUp

# fill bottom line with "password correct"

# wait for enter - make this a jal

# when enter found, j to terminal

passwordNotEqual:


# terminal
terminal:

jal shiftUp

# fill bottom line with "terminal: "

# wait for enter

# when enter found, map the resulting string

# jal the function label


# at end of terminal, jump back to beginning

j terminal


# shift up - move every line up one

shiftUp:
 
# start iterating top row downwards, copying bitmaps upwards

# bottom row should be clear

jr $r31