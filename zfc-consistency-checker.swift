// If ZFC is consistent, this Swift program should never halt.
//Written by duck_master from 21 July 2020.
//Adapted from Laconic code by Adam Yedidia and Scott Aaronson(2016), and inspired by the same paper.
//Open source; released under the MIT license.

import Foundation

/* Two pairs of nodes (a,b) and (c,d) are order equivalent if a and c are the same size and b
and d are the same size and if for all 1 <= i <= a and 1 <= j <= |b|, the i-th element of a
is less than the j-th element of b if and only if the i-th element of c is less than the
j-th element of d.

a, b, c, d are as described above. i and j are holder variables. output is where the 
resulting boolean is held. 

a: inp list
b: inp list
c: inp list
d: inp list
i: hold int
j: hold int
h1: hold int
h2: hold int
h3: hold int
h4: hold int
h5: hold int
h6: hold int
output: out int
*/

func isOrderEquivalent(a: [Int], b: [Int], c: [Int], d: [Int], i: inout Int, j: inout Int, h1: inout Int, h2: inout Int, h3: inout Int, h4: inout Int, h5: inout Int, h6: inout Int) -> Int{    
    h1 = (a.count != c.count)
    h2 = (b.count != d.count)
    
    if (h1 > 0) || (h2 > 0) {
        return 0
    }
    
    i = 0
    h1 = (i < a.count)
    
    /* while i < len(a) */
    while h1{
        j = 0
        h1 = (j < b.count)
        
        /* while j < len(b) */
        while (h1) {
            h1 = a[i]
            h2 = b[j]
            h3 = c[i]
	    h4 = d[j]
            
            h5 = (h1 < h2) && (h3 >= h4)
            h6 = (h3 < h4) && (h1 >= h2)
        
            if (h5 | h6) {
                return;
            }
            j += 1
            h1 = (j < b.count)
        }
        i += 1
        h1 = (i < a.count)
    }
    
    return 1
}
