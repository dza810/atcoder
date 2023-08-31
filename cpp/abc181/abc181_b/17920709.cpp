// Contest ID: abc181
// Problem ID: abc181_b ( https://atcoder.jp/contests/abc181/tasks/abc181_b )
// Title: B. Trapezoid Sum
// Language: C++ (GCC 9.2.1)
// Submitted: 2020-11-07 07:44:10 +0000 UTC ( https://atcoder.jp/contests/abc181/submissions/17920709 ) 

#include <bits/stdc++.h>
using namespace std;
using ll = int64_t;

int main() {
  int N;
  ll ans = 0;
  ll a, b;
  cin >> N;

  for (int i = 0; i < N; i++) {
    cin >> a >> b;
    ans += (b + a) * (b - a + 1) / 2;
  }

  cout << ans << endl;
}