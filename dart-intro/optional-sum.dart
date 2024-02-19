int optionalSum(int first, int second, [int? third]) {
  int sum = first + second;
  if (third != null) {
    sum += third;
  }
  return sum;
}