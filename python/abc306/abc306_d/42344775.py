# Contest ID: abc306
# Problem ID: abc306_d ( https://atcoder.jp/contests/abc306/tasks/abc306_d )
# Title: D. Poisonous Full-Course
# Language: Python (3.8.2)
# Submitted: 2023-06-17 12:29:21 +0000 UTC ( https://atcoder.jp/contests/abc306/submissions/42344775 ) 

n = int(input())

xy = [list(map(int, input().split())) for _ in range(n)]

dp = [[0 for _ in range(2)] for _ in range(n + 1)]



for i in range(1, n+1):
    x = xy[i - 1][0]
    y = xy[i - 1][1]
    # not eat
    dp[i][0] = dp[i - 1][0]
    dp[i][1] = dp[i - 1][1]
    # eat
    # 0 : good
    # 1 : bad
    if x == 0:
        # good -> good
        dp[i][0] = max(dp[i][0], dp[i - 1][0] + y)
        # bad -> good
        dp[i][0] = max(dp[i][0], dp[i - 1][1] + y)
    elif x == 1:
        # good -> bad
        dp[i][1] = max(dp[i][1], dp[i - 1][0] + y)
        # bad -> die
        pass

print(max(*dp[n]))
