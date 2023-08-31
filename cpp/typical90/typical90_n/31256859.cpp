// Contest ID: typical90
// Problem ID: typical90_n ( https://atcoder.jp/contests/typical90/tasks/typical90_n )
// Title: 014. We Used to Sing a Song Together（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-25 03:37:08 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31256859 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;

int main(){
  int N;
  cin >> N;
  vi A(N,0);
  vi B(N,0);
  rep(i,0,N) cin >> A[i];
  rep(i,0,N) cin >> B[i];

  sort(A.begin(), A.end());
  sort(B.begin(), B.end());

  ll ans = 0;
  rep(i, 0, N){
    ans += abs(A[i] - B[i]);
  }
  cout << ans << endl;
  
  return 0;
}
