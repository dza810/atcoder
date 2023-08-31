// Contest ID: abc248
// Problem ID: abc248_a ( https://atcoder.jp/contests/abc248/tasks/abc248_a )
// Title: A. Lacked Number
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-24 04:25:35 +0000 UTC ( https://atcoder.jp/contests/abc248/submissions/31223818 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
// using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int MOD = 1'000'000'007;
const int INF = 1 << 30;
int N;
int P;

int main() {
  map<int, int> M;
  int S;
  cin >> S;
  int x;
  rep(i, 0, 9){
    x = S % 10;
    S /= 10;
    M[x]=0;
    M[x]++;
  }
  rep(x, 0, 10){
    if(M[x] == 0) cout << x << endl;
  }
  
  
  return 0;
}
