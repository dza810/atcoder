// Contest ID: abc182
// Problem ID: abc182_c ( https://atcoder.jp/contests/abc182/tasks/abc182_c )
// Title: C. To 3
// Language: C++ (GCC 9.2.1)
// Submitted: 2020-11-09 04:49:13 +0000 UTC ( https://atcoder.jp/contests/abc182/submissions/18007791 ) 

#include <bits/stdc++.h>
using namespace std;
using ll = int64_t;

int func(ll N) {
  vector<int> cnt(3, 0);
  int sum = 0;
  int len = 0;
  int ans = -2;
  do {
    len++;
    cnt[(N % 10) % 3]++;
    sum += N % 10;
    N /= 10;
  } while (N > 0);
  sum %= 3;
  if (sum == 0) {
    ans = 0;
  } else if (sum == 1) {
    if (cnt[1] >= 1 && len > 1) {
      ans = 1;
    } else if (cnt[2] >= 2 && len > 2) {
      ans = 2;
    } else {
      ans = -1;
    }
  } else if (sum == 2) {
    if (cnt[2] >= 1 && len > 1) {
      ans = 1;
    } else if (cnt[1] >= 2 && len > 2) {
      ans = 2;
    } else {
      ans = -1;
    }
  }
  // cout << "len=" << len << ", ans=" << ans << ", sum=" << sum << ", cnt[1]=" << cnt[1] << ", cnt[2]=" << cnt[2] << "\n";

  return ans;
}
int main() {
  ll N;
  cin >> N;

  cout << func(N) << endl;

  return 0;
}