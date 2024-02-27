//Compare three integers and return the maximum value among them.
int maxNum(int a, int b, int c) {
    var res = a; 

    if (b > a) {
        res = b;
    }
    if (c > res){
        res = c; 
    }
    return res;
  //return (a > b) ? (a > c ? a : c) : (b > c ? b : c);
}
// The ternary operator (? :) is used to check the conditions and determine the maximum value. 
void main() {
  print(maxNum(1, 2, 3));
  print(maxNum(0, 0, 0));
  print(maxNum(-1, -5, 0));
}