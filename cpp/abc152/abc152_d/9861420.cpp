// Contest ID: abc152
// Problem ID: abc152_d ( https://atcoder.jp/contests/abc152/tasks/abc152_d )
// Title: D. Handstand 2
// Language: C++14 (GCC 5.4.1)
// Submitted: 2020-02-01 15:29:59 +0000 UTC ( https://atcoder.jp/contests/abc152/submissions/9861420 ) 

#include <iostream>
#include <vector>

using namespace std;

int digit(int n) {
    while (n >= 10) {
        n /= 10;
    }
    return n;
}

int main(int argc, char const *argv[]) {
    int n = 0;
    cin >> n;
    vector<vector<long> > out(10, vector<long>(10, 0));
    int ans = 0;
    for (int i = 1; i <= n; i++) {
        out[i % 10][digit(i)] += 1;
    }
    for (int i = 1; i < 10; i++) {
        for (int j = 1; j < 10; j++) {
            ans += out[i][j] * out[j][i];
        }
    }
  cout << ans << "\n";
    return 0;
}