// Contest ID: abc249
// Problem ID: abc249_b ( https://atcoder.jp/contests/abc249/tasks/abc249_b )
// Title: B. Perfect String
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-23 12:56:52 +0000 UTC ( https://atcoder.jp/contests/abc249/submissions/31199502 ) 

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

string S;

int main() {
  cin >> S;
  int big = 0;
  int small = 0;
  set<char> M;
  for (char i : S) {
    if ('a' <= i && i <= 'z') {
      small++;
    }
    if ('A' <= i && i <= 'Z') {
      big++;
    }
    if (M.count(i) > 0) {
      cout << "No" << endl;
      return 0;
    };
    M.insert(i);
  }
  if (small > 0 && big > 0) {
    cout << "Yes" << endl;
  } else {
    cout << "No" << endl;
  }

  return 0;
}
