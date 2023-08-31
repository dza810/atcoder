// Contest ID: typical90
// Problem ID: typical90_x ( https://atcoder.jp/contests/typical90/tasks/typical90_x )
// Title: 024. Select +／- One（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-15 11:58:41 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30983594 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 60;

ll N, K;
vi A(2000,0);
vi B(2000,0);

int main() {
  cin >> N >> K;
  rep(i, 0, N) cin >> A[i];
  rep(i, 0, N) cin >> B[i];

  ll c = 0;
  rep(i, 0, N) c += abs(A[i] - B[i]);
  if((K >= c) && ((K - c) % 2 == 0)){
    cout << "Yes" << endl;
  }
  else{
    cout << "No" << endl;
  }

  
  return 0;
}
