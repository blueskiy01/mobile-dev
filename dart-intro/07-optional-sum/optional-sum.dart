int optionalSum(int a , int b,{int? c}){
  return(a + b + (c ?? 0));
}

void main() {
  var result = optionalSum(1,2);
  print(result);
  result = optionalSum(1,2,c:3);
  print(result);
}