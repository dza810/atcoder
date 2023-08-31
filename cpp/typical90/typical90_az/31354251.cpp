// Contest ID: typical90
// Problem ID: typical90_az ( https://atcoder.jp/contests/typical90/tasks/typical90_az )
// Title: 052. Dice Product（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-30 02:19:06 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31354251 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint1000000007;

using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int main() {
  int N;
  cin >> N;
  vector<mint> sum(N, mint(0));
  rep(i, 0, N) rep(j, 0, 6) {
    int a;
    cin >> a;
    sum[i] += a;
  }

  mint ans = mint(1);

  rep(i, 0, N){
    ans *= sum[i];
  }
  cout << ans.val() << endl;
  return 0;
}
