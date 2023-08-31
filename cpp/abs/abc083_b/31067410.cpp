// Contest ID: abs
// Problem ID: abc083_b ( https://atcoder.jp/contests/abs/tasks/abc083_b )
// Title: 
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-17 12:18:47 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/31067410 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

int N, A, B;
int main() {
  cin >> N >> A >> B;
  int ans = 0;
  rep(n, 1, N + 1) {
    int sum = 0;
    int x = n;
    while (x > 0) {
      sum += x % 10;
      x /= 10;
    }
    if (A <= sum && sum <= B)
      ans+=n;
  }
  cout << ans << endl;
  return 0;
}