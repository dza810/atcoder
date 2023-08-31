# Contest ID: abc085
# Problem ID: abc085_c ( https://atcoder.jp/contests/abc085/tasks/abc085_c )
# Title: C. Otoshidama
# Language: Python3 (3.4.3)
# Submitted: 2018-03-23 15:49:39 +0000 UTC ( https://atcoder.jp/contests/abc085/submissions/2248570 ) 

n, y = map(int, input().split())

flg = True
for a in range(0, n + 1):
  for b in range(0, n + 1 - a):
    c = n - a - b
    if a * 10000 + b * 5000 + c * 1000 == y:
      print(a, b, c, sep=' ')
      flg = False
      break
  if not flg:
      break
if flg:
  print(-1, -1, -1, sep=' ')
