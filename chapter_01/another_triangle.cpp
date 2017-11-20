#include <iostream>
using std::cin;
using std::cout;

int main()
/* 

Print output that looks like this
#
##
###
####
###
##
#

*/

{
  for (int row = 1; row <= 7; row ++) {
    for (int lineSize = 1; lineSize <= 4 - abs(4-row); lineSize++) {
      cout << "#";
    }

    cout << "\n";
  }
}
