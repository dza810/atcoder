# Contest ID: abc081
# Problem ID: abc081_b ( https://atcoder.jp/contests/abc081/tasks/abc081_b )
# Title: B. Shift only
# Language: Python3 (3.4.3)
# Submitted: 2018-03-23 14:27:48 +0000 UTC ( https://atcoder.jp/contests/abc081/submissions/2248248 ) 

kazu = int(input())
nums = list(map(int, input().split()))
count = 0
flg = True
while flg:
  for i in range(kazu):
    if nums[i] % 2 == 1:
      flg = False
      break
    else:
      nums[i] /= 2
  count += 1
count -= 1
print(count)
      