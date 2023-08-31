// Contest ID: abc152
// Problem ID: abc152_c ( https://atcoder.jp/contests/abc152/tasks/abc152_c )
// Title: C. Low Elements
// Language: C++14 (GCC 5.4.1)
// Submitted: 2020-02-01 13:53:30 +0000 UTC ( https://atcoder.jp/contests/abc152/submissions/9859692 ) 

#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

int main(int argc, char const *argv[]) {
    int n = 0;
    int p = 0;
    cin >> n;
    vector<int> pmin(n, 0);
    cin >> pmin[0];
    int count = 1;
    for (int i = 1; i < n; i++) {
        cin >> p;
        if (pmin[i - 1] >= p) { count++; }
        pmin[i] = min(p, pmin[i-1]);
    }

    cout << count << "\n";
    return 0;
}