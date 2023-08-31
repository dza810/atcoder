// Contest ID: typical90
// Problem ID: typical90_j ( https://atcoder.jp/contests/typical90/tasks/typical90_j )
// Title: 010. Score Sum Queries（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-13 13:31:10 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30949868 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const num INF = 2000000000;
const num mod = 1000000007;
num N, Q;

int main() {
  cin >> N;
  vi one(N+1,0);
  vi two(N+1,0);

  rep(n, 1, N+1){
    num c, p;
    cin >> c >> p;
    one[n] = ((c == 1) ? p : 0) + one[n-1];
    two[n] = ((c == 2) ? p : 0) + two[n-1];
  }

  cin >> Q;

  rep(q, 0, Q){
    int l,r;
    cin >> l >> r;
    cout << (one[r] - one[l-1]) << " " << (two[r] - two[l-1]) << endl;
  }

  return 0;
}