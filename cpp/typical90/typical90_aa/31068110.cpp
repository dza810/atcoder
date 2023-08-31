// Contest ID: typical90
// Problem ID: typical90_aa ( https://atcoder.jp/contests/typical90/tasks/typical90_aa )
// Title: 027. Sign Up Requests （★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-17 12:48:58 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31068110 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

int main() {
  int N;
  cin >> N;
  set<string> reg;
  rep(i, 0, N) {
    string b;
    cin >> b;
    if (reg.count(b) == 0) {
      reg.insert(b);
      cout << (i+1) << endl;
    }
  }

  return 0;
}