// Contest ID: typical90
// Problem ID: typical90_aa ( https://atcoder.jp/contests/typical90/tasks/typical90_aa )
// Title: 027. Sign Up Requests （★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-28 13:40:16 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31326251 ) 

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


int main() {
  map<string, int> m;
  cin >> N;
  rep(i, 0, N){
    string S;
    cin >> S;
    if(m[S] == 0) cout << i+1 << endl; 
    m[S]++;
  }
  
  return 0;
}
