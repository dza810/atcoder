// Contest ID: typical90
// Problem ID: typical90_b ( https://atcoder.jp/contests/typical90/tasks/typical90_b )
// Title: 002. Encyclopedia of Parentheses（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-10 08:58:54 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30842828 ) 

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

int main()
{
  num N;
  cin >> N;

  for (int i = 0; i < (1 << N); i++)
  {
    string x = "";
    for (int j = N - 1; j >= 0; j--)
    {
      if ((i & (1 << j)) == 0)
      {
        x = x + "(";
      }
      else
      {
        x = x + ")";
      }
    }
    int dep = 0;
    bool flg = true;
    for (int j = 0; j < x.size(); j++)
    {
      if (x[j] == '(')
        dep += 1;
      if (x[j] == ')')
        dep -= 1;
      if (dep < 0)
      {
        flg = false;
        break;
      }
    }
    if (flg && dep == 0)
    {
      cout << x << endl;
    }
  }

  return 0;
}