# Contest ID: abc083
# Problem ID: abc083_b ( https://atcoder.jp/contests/abc083/tasks/abc083_b )
# Title: B. Some Sums
# Language: Python3 (3.4.3)
# Submitted: 2018-03-23 15:06:39 +0000 UTC ( https://atcoder.jp/contests/abc083/submissions/2248411 ) 

N, a, b = map(int, input().split())

result = 0
for n in range(1, N + 1):
   sum_n = 0
   for i in str(n):
       sum_n += int(i)
   if a <= sum_n <= b:
       result += n
print(result)
