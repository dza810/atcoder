// Contest ID: abc182
// Problem ID: abc182_d ( https://atcoder.jp/contests/abc182/tasks/abc182_d )
// Title: D. Wandering
// Language: C++ (GCC 9.2.1)
// Submitted: 2020-11-09 06:58:08 +0000 UTC ( https://atcoder.jp/contests/abc182/submissions/18009692 ) 

#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (n); i++)
using ll = int64_t;

ll func(vector<ll> A) {
  vector<ll> p(A.size(), 0);
  vector<ll> q(A.size(), 0);
  p[0] = A[0];
  q[0] = max((ll)0, p[0]);
  for (int i = 1; i < A.size(); i++) {
    p[i] = A[i] + p[i - 1];
    q[i] = max(q[i - 1], p[i]);
  }
  ll r = 0;
  ll x = 0;
  for (int i = 0; i < A.size(); i++) {
    r = max(r, x + q[i]);
    x = x + p[i];
  }
  return r;
}

int main() {
  ll N;
  cin >> N;
  vector<ll> A(N, 0);

  for (ll& a : A) {
    cin >> a;
  }

  cout << func(A) << endl;
}