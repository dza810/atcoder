// Contest ID: abc246
// Problem ID: abc246_c ( https://atcoder.jp/contests/abc246/tasks/abc246_c )
// Title: C. Coupon
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-04 10:17:04 +0000 UTC ( https://atcoder.jp/contests/abc246/submissions/30719993 ) 

#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>

using namespace std;
using ll = int64_t;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;

int main()
{
  num N, K, X;
  cin >> N >> K >> X;

  vector<num> an(N);
  num q = 0;
  num out = 0;


  rep(i, 0, N){
    cin >> an[i];
    q += an[i] / X;
    out += an[i];
    an[i] = an[i] % X;
  }
  q = min(q, K);
  sort(an.begin(), an.end());
  
  K -= q;
  out -= X * q;

  for(int n = N-1; n >= 0; n--){
    if(K == 0) break;
    out -= an[n];
    K--;
  }
  cout << out << endl;
}