// Contest ID: abc182
// Problem ID: abc182_b ( https://atcoder.jp/contests/abc182/tasks/abc182_b )
// Title: B. Almost GCD
// Language: C++ (GCC 9.2.1)
// Submitted: 2020-11-09 01:28:21 +0000 UTC ( https://atcoder.jp/contests/abc182/submissions/18005336 ) 

#include <bits/stdc++.h>
using namespace std;

int main() {
  int N;
  cin >> N;
  vector<int> As(N, 0);
  int max_a = -1;
  for (int i = 0; i < N; i++) {
    cin >> As[i];
    if (As[i] > max_a) {
      max_a = As[i];
    }
  }
  vector<int> Gcd(max_a + 1, 0);
  for (int i = 2; i <= max_a; i++) {
    for (int A : As) {
      if (A % i == 0) {
        Gcd[i] += 1;
      }
    }
  }
  int max_g = -1;
  int max_indx = -1;
  for (int i = 2; i <= max_a; i++) {
    if (Gcd[i] >= max_g) {
      max_g = Gcd[i];
      max_indx = i;
    }
  }
  cout << max_indx << endl;
  return 0;
}