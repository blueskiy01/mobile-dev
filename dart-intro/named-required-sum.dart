int namedRequiredSum({required int first, required int second, required int third}) {
  return first + second + third;
}

void main() {
  var result = namedRequiredSum(first: 1, second: 2, third: 3);
  print(result); // Output should be 6
}
