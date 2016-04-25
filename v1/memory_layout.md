# Memory Layout

### Notes

* All strings use 100 words 
* Resolution 640 x 480

### Layout 

* 0 - top left char - maps to bitmap address
* 63 - top right char
* 64 - second row top left
* 3071 - bottom right char

* 3072 - top left char - maps to pixel address
* ...
* 6143 - bottom right char 

* 7000 - "abc"

* 9800 - guess
* 9896 - RA for stringCompare
* 9897 - RA for clearScreen
* 9898 - RA for shiftUp
* 9899 - RA for refresh
* 9900 - start of 100 char buffer

* 10000 - ' ' (space, blank) bitmap (10x10) - might do 8x8
* 10100 - a bitmap (10x10)
* 10200 - b bitmap (10x10)
* ...5
* 12600 - z bitmap (10x10)
* 12700 - : 
* 12800 - _
* 12900 - 
