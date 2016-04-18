# Memory Layout

### Notes

* All strings use 100 words 
* Resolution 640 x 480

### Layout 

* 0 - "password: "
* 100 - "terminal: "
* 200 - "gthc"
* 300 - "wordlen"
* 400 - "password correct"

* 10000 - ' ' (space, blank) bitmap (10x10) - might do 8x8
* 10100 - a bitmap (10x10)
* 10200 - b bitmap (10x10)
* ...
* 12600 - z bitmap (10x10)
* 12700 - : 
* 12800 - _
* 12900 - 

* 20000 - start of use input buffer

* 30000 - top left char
* ...
* 30063 - top right char
* 30064 - second row top left
* ...
* ... - bottom left char
* ...
* ... - bottom right char

