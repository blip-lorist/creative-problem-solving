#include <iostream>
using std::cin;
using std::cout;

int main()
/* 

Print output that looks like this
#####
####
###
##
#

*/

{
  for (int row = 1; row <= 5; row ++) {
    for (int lineSize = 1; lineSize <= (6-row); lineSize++) {
      cout << "#";
    }

    cout << "\n";
  }
}
