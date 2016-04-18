## Constants

### Memory locations

* BITMAP - 10000
* MAX-ADDRESS-MINUS-ONE - 307199
* MAX-ADDRESS - 307200
* MAX-ADDRESS-ABOVE - 306560
* CHAR-ADDRESS - 30000
* CHAR-ADDRESS-END - 33072
* CHAR-ADDRESS-END-ABOVE - 33008
* SPACE-CHAR - 10000


## Functions

### Write character to vga

#### Prior to write

* $r10 contains char address to write to (0-3071)
* $r12 contains character to write (0-29) - will be expanded

#### Call

```
jal writeCharToVGA
```

#### After write

* $r10, $r12 will be their original values

#### Code

```
writeCharToVGA:

addi $r1, $r0, 100
mul $r22, $r20, $r1 # multiply char address by 100
add $r23, $r22, $r21 # $r23 now contains address

addi $r2, $r0, 100
lw $r3, BITMAP($r2) # load 10000 + start of bitmap location

addi $r6, $r0, 10 # number of rows to iterate
addi $r7, $r0, 10 # number of cols to iterate

doCol:
beq $r7, $r0, doRow # while still cols left to do

lw $r4, 0($r3) # $r4 now contains pixel to write
vga $r4, 0($r23) # store pixel to vga

addi $r23, $r23, 1 # add one to address
addi $r3, $r3, 1   # add one to bitmap location

addi $r7, $r7, -1 # subtract one
j doCol

doRow:
addi $r6, $r6, -1 
beq $r6, $r0, endRows # while still rows left to do

addi $r23, $r23, 630 # drop down one row to the beginning of char
addi $r7, $r0, 10 # number of cols to iterate
j doCol

endRows:

jr $r31

```

### Compare String

Compares 100 characters worth of characters

#### Prior to compare

* $r10 contains memory address of stringA
* $r11 contains memory address of stringB

#### Call

```
jal compareString
```

#### After comparison

* $r12 contains 1 if equal and 0 if not equal
* $r10 and $r11 contain undefined values

#### Code

```
compareString:

addi $r1, $r0, 100 # compare 100 characters

singleStringCompare:
bne $r1, $r0, finishedCompare

lw $r3, 0($r10) # load char of stringA
lw $r4, 0($r11) # load char of stringB
bne $r3, $r4, charNotEqual # if not equal, break early - not for production systems obviously but whatever

addi $r10, $r10, 1 # inc stringA
addi $r11, $r11, 1 # inc stringB

addi $r1, $r1, -1 # do next char
j singleStringCompare

charNotEqual: # strings not equal
addi $r12, $r0, 0
jr $r31

finishedCompare: # strings are equal
addi $r12, $r0, 1
jr $31

```

### Shift All Text up one char worth (10 pixels)

Iterate through every row of chars and move them up. The last row is blanked out

#### Prior to shift

Nothing required

#### Call

```
jal shiftUp
```

#### After shift

Nothing special

#### Code

```
shiftUp:

lw $r1, MAX-ADDRESS-ABOVE($r0) # loads row above max into $r1

addi $r2, $r0, 0 # address iterator
addi $r3, $r0, 6400 # 10 rows below address

shiftPixel:
beq $r2, $r1, doBottom

vgar $r4, 0($r3) # read vga
vga $r4, 0($r2)  # write to vga 10 rows above
addi $r2, $r2, 1
addi $r3, $r3, 1
j shiftPixel

doBottom:

lw $r1, MAX-ADDRESS($r0) # loads max into $r1
addi $r3, $r0, 255 # TODO-value of black

clearBottomPixel:
beq $r2, $r1, finishedBottom

vga $r3, 0($r2)
addi $r2, $r2, 1
j clearBottomPixel

finishedBottom:
jr $r31

```

### Alternate Shift

Shift using character representations

#### Prior to shift

Nothing required

#### Call

```
jal shiftUp
```

#### After shift

Nothing special

#### Code

```
shiftUp:

add $r20, $r31, $r0 # store return address elsewhere because we will jal

lw $r1, CHAR-ADDRESS-END-ABOVE($r0) # loads end of char address plus one row

lw $r2, CHAR-ADDRESS($r0) # char iterator
addi $r3, $r2, 64 # 1 row below char

shiftChar:
beq $r2, $r1, doBottom

lw $r4, 0($r3) # read char
sw $r4, 0($r2)  # write to char 1 row above
addi $r2, $r2, 1
addi $r3, $r3, 1
j shiftChar

doBottom:

lw $r1, CHAR-ADDRESS-END($r0) # loads max into $r1
lw $r3, SPACE-CHAR($r0) # char representation of space

clearBottomChar:
beq $r2, $r1, finishedBottom

sw $r3, 0($r2)
addi $r2, $r2, 1
j clearBottomChar

finishedBottom:

# debate whether to refresh or not

jr $r31

```

### Refresh

Iterates through all 3072 characters and refreshed the VGA display

#### Dependencies

* writeCharToVGA

#### Prior to refresh

No requirements

#### Call

```
jal vgaRefresh
```

#### After refresh

Nothing special

#### Code

```
vgaRefresh:

addi $r20, $r31, 0 # store RA because jal will be used

lw $r1, CHAR-ADDRESS($r0) # load char address into iterator
lw $r2, CHAR-ADDRESS-END($r0) # load end address

lw $r3, CHAR-ADDRESS($r0) # load char address into constant reg

refreshChar:
beq $r1, $r2, finishedRefresh

sub $r10, $r1, $r3 # $r10 contains which char 0-indexed (0-3071)
lw $r12, 0($r1) # $r1 used to store the address of the char
jal writeCharToVGA

addi $r1, $r1, 1 # add to char iterator
j refreshChar


finishedRefresh:

jr $r20

```