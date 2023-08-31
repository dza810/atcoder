# Contest ID: abc306
# Problem ID: abc306_b ( https://atcoder.jp/contests/abc306/tasks/abc306_b )
# Title: B. Base 2
# Language: Python (3.8.2)
# Submitted: 2023-06-17 12:10:29 +0000 UTC ( https://atcoder.jp/contests/abc306/submissions/42332338 ) 

a = list(map(int, input().split()))
out = 0
for aa in a[::-1]:
    out *= 2
    out += aa
print(out)