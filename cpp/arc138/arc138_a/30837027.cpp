// Contest ID: arc138
// Problem ID: arc138_a ( https://atcoder.jp/contests/arc138/tasks/arc138_a )
// Title: A. Larger Score
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-10 04:47:10 +0000 UTC ( https://atcoder.jp/contests/arc138/submissions/30837027 ) 

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
  cin >> N >> K;

  vector<P> A(N, P(0, 0));

  rep(j, 0, N)
  {
    cin >> tmp;
    A[j] = {tmp, -j};
  }

  sort(A.begin(), A.end());

  num l = -1;
  bool flg = false;
  num c = N * 2;

  for (auto [v, i] : A)
  {
    i = -i;
    if (i < K)
    {
      l = max(l, i);
      continue;
    }
    if (l != -1 && c > i - l)
    {
      flg = true;
      c = i - l;
    }
  }

  cout << (flg ? c : -1) << endl;
}