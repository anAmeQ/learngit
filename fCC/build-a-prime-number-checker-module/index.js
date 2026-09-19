function isPrime(n) {
  if (!Number.isInteger(n) || n <= 1) return false;
  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}

module.exports = {
  isPrime: isPrime
};
