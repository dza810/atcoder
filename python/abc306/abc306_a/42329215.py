# Contest ID: abc306
# Problem ID: abc306_a ( https://atcoder.jp/contests/abc306/tasks/abc306_a )
# Title: A. Echo
# Language: Python (3.8.2)
# Submitted: 2023-06-17 12:07:42 +0000 UTC ( https://atcoder.jp/contests/abc306/submissions/42329215 ) 

n = int(input())
s = input().strip()

for ss in s:
    print(ss, ss, end="", sep="")
print()