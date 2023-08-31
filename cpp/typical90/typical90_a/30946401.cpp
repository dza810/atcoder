// Contest ID: typical90
// Problem ID: typical90_a ( https://atcoder.jp/contests/typical90/tasks/typical90_a )
// Title: 001. Yokan Party（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-13 10:05:48 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30946401 ) 

#include "bits/stdc++.h"
// #include <iostream>
// #include <vector>
// #include <cmath>
// #include <algorithm>

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
#define INF 999999999
num N, L, K;
vi A(1 << 18, 0);

num calc(num len)
{
  num last_cut = 0;
  num count = 0;
  rep(i, 0, N)
  {
    if (A[i] - last_cut >= len && L - A[i] >= len)
    {
      last_cut = A[i];
      count++;
    }
  }
  return count;
}

int main()
{
  cin >> N >> L >> K;
  rep(i, 0, N)
  {
    cin >> A[i];
  }

  num left = -1;
  num right = L + 1;
  while (right - left > 1)
  {
    num mid = left + (right - left) / 2;
    if (calc(mid) < K)
    {
      right = mid;
    }
    else
    {
      left = mid;
    }
  }
  cout << left << endl;

  return 0;
}