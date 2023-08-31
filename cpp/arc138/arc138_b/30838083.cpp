// Contest ID: arc138
// Problem ID: arc138_b ( https://atcoder.jp/contests/arc138/tasks/arc138_b )
// Title: B. 01 Generation
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-10 05:34:25 +0000 UTC ( https://atcoder.jp/contests/arc138/submissions/30838083 ) 

#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>

using namespace std;
using ll = int64_t;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;

int main()
{
  num N, K, tmp;
  cin >> N;

  vector<num> A(N, 0);

  rep(i, 0, N)
  {
    cin >> A[i];
  }

  int zero = 0;
  int one = 1;

  int f = 0;
  int l = N - 1;
  while (f < l)
  {
    if (A[l] == zero)
    {
      l--;
      continue;
    }
    if (A[f] == zero)
    {
      swap(zero, one);
      f++;
      continue;
    }
    cout << "No" << endl;
    return 0;
  }
  cout << (A[f] == zero ? "Yes" : "No") << endl;
  return 0;
}