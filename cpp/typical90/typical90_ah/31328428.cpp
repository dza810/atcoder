// Contest ID: typical90
// Problem ID: typical90_ah ( https://atcoder.jp/contests/typical90/tasks/typical90_ah )
// Title: 034. There are few types of elements（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-28 15:41:39 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31328428 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = int;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int main() {
  int N, K;
  cin >> N >> K;
  vi a(N, 0);
  rep(i, 0, N) cin >> a[i];
  int l, r;
  map<int, int> m;
  l = 0;
  r = 0;
  int cnt = 0;
  int ans = 0;
  while (l < N) {
    while (r < N) {
      if (m[a[r]] == 0 && cnt == K){
        break;
      }
      if (m[a[r]] == 0)
        cnt++;
      m[a[r]]++;
      r++;
    }
    ans = max(r - l, ans);
    m[a[l]]--;
    if (m[a[l]] == 0)
      cnt--;
    l++;
  }
  cout << ans << endl;
}
