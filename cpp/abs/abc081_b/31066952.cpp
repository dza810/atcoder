// Contest ID: abs
// Problem ID: abc081_b ( https://atcoder.jp/contests/abs/tasks/abc081_b )
// Title: 
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-17 11:58:28 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/31066952 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

int N;
int a=0;
int main(){
  cin >> N;
  rep(i, 0, N) {
    int x;
    cin >> x;
    a |= x;
  }
  int count = 0;
  while((a & 1) == 0){
    count++;
    a = a >> 1;
  }
  cout << count << endl;

  return 0;
}