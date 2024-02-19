int namedOptionalSum({int? first, int? second, int? third}){
  // Use the null-aware operator `??` to handle null values
  return (first ?? 0) + (second ?? 0) + (third ?? 0);
}

void main() {
  var result = namedOptionalSum(first:1, second: 2, third: 3);
  print(result);
}