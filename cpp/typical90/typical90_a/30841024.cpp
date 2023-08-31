// Contest ID: typical90
// Problem ID: typical90_a ( https://atcoder.jp/contests/typical90/tasks/typical90_a )
// Title: 001. Yokan Party（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-10 07:45:11 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30841024 ) 

#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
#define INF 999999999

num N, L, K;
vi A(1000000);

num calc(num len)
{
  num i = 0;
  num j = 0;
  num lc = 0;
  while(i < N && L - A[i] >= len){
    if(A[i] - lc >= len){
      j++;
      lc = A[i];
    }
    i++;
  }
  return j;
}

int main()
{
  cin >> N >> L >> K;
  rep(i, 0, N) cin >> A[i];

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