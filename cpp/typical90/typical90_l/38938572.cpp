// Contest ID: typical90
// Problem ID: typical90_l ( https://atcoder.jp/contests/typical90/tasks/typical90_l )
// Title: 012. Red Painting（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-17 05:36:56 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38938572 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;
#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define endl "\n"
#define INF (1 << 20)
#define INFL (1LL << 60)
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
#define all(x) x.begin(), x.end()
#define rep(i, end) for (int i = 0; i < end; i++)
#define repp(i, start, end) for (int i = start; i <= end; i++)
#define repp_rev(i, start, end) for (int i = start; i >= end; i--)
#define sz(x) (int)x.size()
#define chmax(x, y) x = max((x), (y))
#define chmin(x, y) x = min((x), (y))
typedef long long ll;
typedef vector<ll> vi;
typedef vector<bool> vb;
typedef vector<vector<bool>> vvb;
typedef vector<vector<ll>> vvi;
typedef pair<ll, ll> pi;
template <typename T, typename S>
pair<T, S> operator+(pair<T, S> x, pair<T, S> y)
{
  T t = x.first + y.first;
  S s = x.second + y.second;
  return {t, s};
}
ll h, w, q;
vvb tbl(2100, vb(2100, false));

ll dr[4] = {1, 0, -1, 0};
ll dc[4] = {0, -1, 0, 1};

ll p(ll r, ll c)
{
  return (r * 3000 + c);
}

int main()
{
  fastio;
  atcoder::dsu uf(9000000);
  cin >> h >> w >> q;
  rep(_, q)
  {
    ll t, ra, ca, rb, cb, r, c;
    cin >> t;
    if (t == 1)
    {
      cin >> r >> c;
      tbl[r][c] = true;
      rep(i, 4) if (tbl[r + dr[i]][c + dc[i]])
          uf.merge(p(r, c), p(r + dr[i], c + dc[i]));
    }
    else if (t == 2)
    {
      cin >> ra >> ca >> rb >> cb;
      cout << ((tbl[ra][ca] && tbl[rb][cb] && uf.same(p(ra, ca), p(rb, cb))) ? "Yes" : "No") << endl;
    }
  }

  return 0;
}