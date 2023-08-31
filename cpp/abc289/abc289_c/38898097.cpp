// Contest ID: abc289
// Problem ID: abc289_c ( https://atcoder.jp/contests/abc289/tasks/abc289_c )
// Title: C. Coverage
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 03:12:49 +0000 UTC ( https://atcoder.jp/contests/abc289/submissions/38898097 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;

#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define endl "\n"
#define INF 1 << 30
#define INFL 1 << 60
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
#define all(x) x.begin(), x.end()
#define rep(i, end) for (int i = 0; i < end; i++)
typedef long long ll;
typedef vector<int> vi;
typedef vector<vector<int>> vvi;
typedef pair<int, int> pi;

int n, m;
int c[100];
int a[100][100];
int main()
{
  fastio;
  cin >> n >> m;
  rep(mm, m)
  {
    cin >> c[mm];
    rep(cc, c[mm])
    {
      cin >> a[mm][cc];
    }
  }
  int ans = 0;

  for (int comb = 1; comb < (1 << m); comb++)
  {
    vector<bool> ok(n, false);
    rep(mm, m)
    {
      if ((comb & (1 << mm)) > 0)
      {
        rep(ia, c[mm])
        {
          assert(a[mm][ia] - 1 >= 0);
          ok[a[mm][ia] - 1] = true;
        }
      }
    }
    bool flg = true;
    rep(i, n)
    {
      flg = flg && ok[i];
      if (!flg)
        break;
    }
    if (flg)
    {
      ans++;
    }
  }

  cout << ans << endl;

  return 0;
}
