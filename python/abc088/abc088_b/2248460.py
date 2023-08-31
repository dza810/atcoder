# Contest ID: abc088
# Problem ID: abc088_b ( https://atcoder.jp/contests/abc088/tasks/abc088_b )
# Title: B. Card Game for Two
# Language: Python3 (3.4.3)
# Submitted: 2018-03-23 15:18:14 +0000 UTC ( https://atcoder.jp/contests/abc088/submissions/2248460 ) 

n = int(input())
a_list = list(map(int, input().split()))

a_list.sort(reverse=True)

alice = 0
for a in a_list[::2]:
    alice += a

bob = 0
for b in a_list[1::2]:
    bob += b

print(alice - bob)