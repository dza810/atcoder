// Contest ID: abc300
// Problem ID: abc300_d ( https://atcoder.jp/contests/abc300/tasks/abc300_d )
// Title: D. AABCC
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-29 12:59:56 +0000 UTC ( https://atcoder.jp/contests/abc300/submissions/41042662 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;
#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define endl "\n"
#define INF (1LL << 60)
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
#define all(x) x.begin(), x.end()
#define rep(i, end) for (ll i = 0; i < end; i++)
#define repp(i, start, end) for (ll i = start; i <= end; i++)
#define repp_rev(i, start, end) for (ll i = start; i >= end; i--)
#define sz(x) (int)x.size()
#define chmax(x, y) (x < (y)) ? (x = (y), true) : false
#define chmin(x, y) (x > (y)) ? (x = (y), true) : false
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
ll op(ll x, ll y) { return max(x, y); }
ll e() { return 0LL; }

ll N;

vector<bool> make_is_prime(int N)
{
  vector<bool> isprime(N + 1, true);

  isprime[0] = isprime[1] = false;

  for (int p = 2; p <= N; ++p)
  {
    if (!isprime[p])
      continue;
    for (int q = p * 2; q <= N; q += p)
    {
      isprime[q] = false;
    }
  }

  return isprime;
}

int main()
{
  fastio;
  cin >> N;
  vb is_prime = make_is_prime((ll)pow(N, (double)1 / (double)2));
  ll ans = 0;
  ll a_max = (ll)pow(N, (double)1 / (double)5);
  repp(a, 2, a_max)
  {
    if (!is_prime[a])
      continue;
    ll b_max = (ll)pow((double)(N + 1) / (double)(a * a), (double)1 / (double)3);
    repp(b, a + 1, b_max)
    {
      if (!is_prime[b])
        continue;
      ll c_max = (ll)pow((double)(N + 1) / (double)(a * a * b), (double)1 / (double)2);
      repp(c, b + 1, c_max) if (b < c && N >= a * a * b * c * c && is_prime[c])
      {
        ans++;
      }
    }
  }
  cout << ans << endl;

  return 0;
}