# Contest ID: abc306
# Problem ID: abc306_c ( https://atcoder.jp/contests/abc306/tasks/abc306_c )
# Title: C. Centers
# Language: Python (3.8.2)
# Submitted: 2023-06-17 12:13:56 +0000 UTC ( https://atcoder.jp/contests/abc306/submissions/42335500 ) 

n = int(input())
a = map(int, input().split())
cnt = {}
for aa in a:
    cnt[aa] = cnt.get(aa, 0) + 1
    if cnt[aa] == 2:
        print(aa, end=' ')
print()
