// Contest ID: typical90
// Problem ID: typical90_ah ( https://atcoder.jp/contests/typical90/tasks/typical90_ah )
// Title: 034. There are few types of elements（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-20 11:26:18 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31117494 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;

int main() {
  int N, K;
  cin >> N >> K;
  vi a(N, 0);
  rep(i, 0, N) cin >> a[i];

  map<int, int> M;
  int ans=0;
  int r=0;
  int cnt = 0;

  rep(i, 0, N){
    while(r < N){
      if(M[a[r]] == 0 && cnt == K) break;
      if(M[a[r]] == 0) cnt++;
      M[a[r]]++;
      r++;
    }
    ans = max(ans, r-i);
    M[a[i]]--;
    if(M[a[i]] == 0) cnt--;
  }
  cout << ans << endl;

  return 0;
}
