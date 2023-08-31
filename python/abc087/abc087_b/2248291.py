# Contest ID: abc087
# Problem ID: abc087_b ( https://atcoder.jp/contests/abc087/tasks/abc087_b )
# Title: B. Coins
# Language: Python3 (3.4.3)
# Submitted: 2018-03-23 14:40:19 +0000 UTC ( https://atcoder.jp/contests/abc087/submissions/2248291 ) 

a = int(input())
b = int(input())
c = int(input())
x = int(input())
count = 0
for a_n in range(a+1):
    for b_n in range(b+1):
        for c_n in range(c+1):
            if a_n * 500 + b_n * 100 + c_n * 50 == x:
                count += 1

print(count)