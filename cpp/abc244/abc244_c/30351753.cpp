// Contest ID: abc244
// Problem ID: abc244_c ( https://atcoder.jp/contests/abc244/tasks/abc244_c )
// Title: C. Yamanote Line Game
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-03-22 13:12:39 +0000 UTC ( https://atcoder.jp/contests/abc244/submissions/30351753 ) 

#include <iostream>
#include <vector>
using namespace std;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using ll = int64_t;
using P = pair<int, int>;
using vi = vector<int>;
using vvi = vector<vi>;

int main() {
  int n;
  cin >> n;
  vi l = vi(2 * n, 0); 
  cout << 2 * n + 1 << endl;

  int x;
  rep(i, 1, n+1){
    cin >> x;
    l[x-1] = 1;
    x = 0;
    while(l[x] == 1) x++;
    l[x] = 1;
    cout << (x + 1) << endl;
  }
  cin >> x;
  return 0;
}
