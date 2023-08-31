// Contest ID: abc244
// Problem ID: abc244_d ( https://atcoder.jp/contests/abc244/tasks/abc244_d )
// Title: D. Swap Hats
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-03-22 14:46:48 +0000 UTC ( https://atcoder.jp/contests/abc244/submissions/30353842 ) 

#include <iostream>
#include <vector>
using namespace std;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using ll = int64_t;
using P = pair<int, int>;
using vi = vector<int>;
using vvi = vector<vi>;

int count(string &l)
{
  if (l == "R G B" || 
      l == "G B R" ||
      l == "B R G"
  )
  {
    return 0;
  }
  if (
      l == "R B G" ||
      l == "G R B" ||
      l == "B G R")
  {
    return 1;
  }
}

int main()
{
  string s;
  string t;
  getline(cin, s);
  getline(cin, t);

  int c = (count(s) + count(t)) % 2;

  if (c == 1)
  {
    cout << "No\n";
  }
  else if (c == 0)
  {
    cout << "Yes\n";
  }

  return 0;
}
