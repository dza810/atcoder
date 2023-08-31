// Contest ID: abc152
// Problem ID: abc152_b ( https://atcoder.jp/contests/abc152/tasks/abc152_b )
// Title: B. Comparing Strings
// Language: C++14 (GCC 5.4.1)
// Submitted: 2020-02-01 10:52:10 +0000 UTC ( https://atcoder.jp/contests/abc152/submissions/9856351 ) 

#include <iostream>
#include <string>
#include <algorithm>
#include <utility>

using namespace std;

int main() {
    int a = 0;
    int b = 0;

    cin >> a >> b;

    if (a > b) {
        swap(a, b);
    }
    string out = "";

    for (int i = 0; i < b; i++) {
        out += to_string(a);
    }
    cout << out << "\n";
	return 0;  
}