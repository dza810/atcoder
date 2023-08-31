# Contest ID: abc085
# Problem ID: abc085_b ( https://atcoder.jp/contests/abc085/tasks/abc085_b )
# Title: B. Kagami Mochi
# Language: Python3 (3.4.3)
# Submitted: 2018-03-23 15:26:45 +0000 UTC ( https://atcoder.jp/contests/abc085/submissions/2248490 ) 

n = int(input())
a = []
for _ in range(n):
  a.append(int(input()))
           
print(len(set(a)))