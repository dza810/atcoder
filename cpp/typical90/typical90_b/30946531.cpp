// Contest ID: typical90
// Problem ID: typical90_b ( https://atcoder.jp/contests/typical90/tasks/typical90_b )
// Title: 002. Encyclopedia of Parentheses（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-13 10:16:48 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30946531 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
#define INF 999999999
num N = 0;

void print(num i){
  for(int j=N-1; j>=0; j--){
    if((i&(1<<j)) > 0) cout << ")";
    else cout << "(";
  }
  cout << endl;
}

bool check(num i){
  num depth = 0;
  for(int j=N-1; j>=0; j--){
    if((i&(1<<j)) > 0) depth--;
    else depth++;
    if(depth<0) return false;
  }
  
  return (depth == 0);
}


int main()
{
  cin >> N;
  rep(i, 0, 1<<N){
    if(check(i)) print(i);   
  }
  return 0;
}