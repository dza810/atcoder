# Contest ID: abc086
# Problem ID: abc086_a ( https://atcoder.jp/contests/abc086/tasks/abc086_a )
# Title: A. Product
# Language: Python3 (3.4.3)
# Submitted: 2018-03-23 13:53:30 +0000 UTC ( https://atcoder.jp/contests/abc086/submissions/2248126 ) 

a, b = map(int, input().split())
print('Odd' if a * b % 2 == 1 else 'Even')