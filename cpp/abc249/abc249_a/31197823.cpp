// Contest ID: abc249
// Problem ID: abc249_a ( https://atcoder.jp/contests/abc249/tasks/abc249_a )
// Title: A. Jogging
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-23 12:50:20 +0000 UTC ( https://atcoder.jp/contests/abc249/submissions/31197823 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int MOD = 1'000'000'007;
const int INF = 1 << 30;

int A, B, C, D, E, F, X;

int main() {
  cin >> A >> B >> C >> D >> E >> F >> X;

  int a = (X/(A+C)) * A * B;
  a += min(X%(A+C), A) * B;
  int b = (X/(D+F)) * D * E;
  b += min(X%(D+F), D) * E;
  if(a > b){
    cout << "Takahashi" << endl;
  }
  if(a < b){
    cout << "Aoki" << endl;
  }
  if(a == b){
    cout << "Draw" << endl;
  }
  return 0;
}
