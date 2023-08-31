// Contest ID: typical90
// Problem ID: typical90_a ( https://atcoder.jp/contests/typical90/tasks/typical90_a )
// Title: 001. Yokan Party（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-21 11:26:39 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31134237 ) 

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

int N, L, K;
vi A(100001, 0);

int calc(int len){
  int cnt = 0;
  int last_cut = 0;
  rep(i, 0, N){
    if(A[i] - last_cut >= len && L - A[i] >= len){
      last_cut = A[i];
      cnt++;
    }
  }
  return cnt;
}

int main() {
  cin >> N >> L >> K;
  rep(i, 0, N) cin >> A[i];
  int left = 0 ;
  int right = L;
  while(right - left > 1){
    int mid = left + (right - left)  / 2;
    if(calc(mid) >= K) left = mid;
    else right = mid;
  }
  cout << left << endl;
  
  return 0;
}
