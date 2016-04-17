# Memory Layout

### Notes

* All strings use 100 words 
* Resolution 640 x 480

### Layout 

* 0 - "password: "
* 100 - "terminal: "
* 200 - "gthc"
* 300 - "wordlen"

* 10000 - ' ' (space) bitmap (10x10) - might do 8x8
* 10100 - a bitmap (10x10)
* 10200 - b bitmap (10x10)
* ...
* 12600 - z bitmap (10x10)
* 12700 - : 
* 12800 - _
* 12900 - 

* 20000 - start of use input buffer

* 1000000 - top left char
* ...
* 1006300 - top right char
* 1006400 - second row top left
* ...
* 3300800 - bottom left char
* ...
* 3307100 - bottom right char

