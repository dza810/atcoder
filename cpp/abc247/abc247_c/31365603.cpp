// Contest ID: abc247
// Problem ID: abc247_c ( https://atcoder.jp/contests/abc247/tasks/abc247_c )
// Title: C. 1 2 1 3 1 2 1
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-30 13:01:01 +0000 UTC ( https://atcoder.jp/contests/abc247/submissions/31365603 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint1000000007;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

void ans(bool flg, int n) {
  if (n == 1) {
    if (flg)
      cout << 1;
    else
      cout << " " << 1;
    return;
  }
  ans(flg, n - 1);
  cout << " " << n;
  ans(false, n - 1);
}

int main() {
  int N;
  cin >> N;
  ans(true, N);
  cout << endl;
  return 0;
}
