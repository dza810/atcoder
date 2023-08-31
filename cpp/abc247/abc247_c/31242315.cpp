// Contest ID: abc247
// Problem ID: abc247_c ( https://atcoder.jp/contests/abc247/tasks/abc247_c )
// Title: C. 1 2 1 3 1 2 1
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-24 13:07:43 +0000 UTC ( https://atcoder.jp/contests/abc247/submissions/31242315 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;

void printx(bool first, int i) {
  if (first && i == 1) {
    cout << 1;
    return;
  }
  if (!first && i == 1) {
    cout << " " << 1;
    return;
  }

  printx(first, i - 1);
  cout << " " << i;
  printx(false, i - 1);
}

int main() {
  int N;
  cin >> N;

  printx(true, N);
  cout << endl;
  return 0;
}
