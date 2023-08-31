# Contest ID: abc285
# Problem ID: abc285_c ( https://atcoder.jp/contests/abc285/tasks/abc285_c )
# Title: C. abc285_brutmhyhiizp
# Language: Python (3.8.2)
# Submitted: 2023-01-21 14:51:27 +0000 UTC ( https://atcoder.jp/contests/abc285/submissions/38232305 ) 

def findPosition(s): 
    n = len(s) 
    ans = 0
  
    for i in range(1, n + 1): 
        ans += (ord(s[i-1]) - ord('A') + 1) * 26 ** (n - i)
    return ans

s = input()
print(findPosition(s)) 
