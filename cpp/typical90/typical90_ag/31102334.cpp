// Contest ID: typical90
// Problem ID: typical90_ag ( https://atcoder.jp/contests/typical90/tasks/typical90_ag )
// Title: 033. Not Too Bright（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-19 12:33:15 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31102334 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;

int main() {
  int H, W;
  cin >> H >> W;
  if (H == 1 || W == 1)
    cout << H * W << endl;
  else
    cout << ((H + 1) / 2) * ((W + 1) / 2) << endl;
  return 0;
}