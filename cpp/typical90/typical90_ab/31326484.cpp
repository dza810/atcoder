// Contest ID: typical90
// Problem ID: typical90_ab ( https://atcoder.jp/contests/typical90/tasks/typical90_ab )
// Title: 028. Cluttered Paper（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-28 13:53:07 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31326484 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;
int N;
vvi A(1100, vi(1100, 0));
vi ans(100100, 0);

int main() {
  cin >> N;
  rep(i, 0, N){
    int lx, ly, rx, ry;
    cin >> lx >> ly >> rx >> ry; 
    A[lx][ly]++;
    A[lx][ry]--;
    A[rx][ly]--;
    A[rx][ry]++;
  }
  rep(x, 1, 1001) rep(y, 0, 1001) A[x][y] += A[x-1][y];
  rep(x, 0, 1001) rep(y, 1, 1001) A[x][y] += A[x][y-1];

  rep(x, 0, 1001) rep(y, 0, 1001) ans[A[x][y]]++;

  rep(i, 1, N+1) cout << ans[i] << endl;

  return 0;
}
