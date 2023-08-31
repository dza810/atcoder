# Contest ID: abc285
# Problem ID: abc285_d ( https://atcoder.jp/contests/abc285/tasks/abc285_d )
# Title: D. Change Usernames
# Language: Python (3.8.2)
# Submitted: 2023-01-21 16:35:34 +0000 UTC ( https://atcoder.jp/contests/abc285/submissions/38234391 ) 

def changeUsername(n, s, t):
    names = {}
    rev_names = {}
    for ss,tt in zip(s,t):
        names[ss] = tt
        rev_names[tt] = ss

    used_names = set(s)
    new_names = set(t)

    queue = [ss for ss in s if names[ss] not in used_names]
    while queue:
        user = queue.pop(0)
        if names[user] in used_names:
            queue.append(user)
            continue
        used_names.remove(user)
        new_names.remove(names[user])
        used_names.add(names[user])
        if user in rev_names:
            queue.append(rev_names[user])

    if new_names:
        return "No"
    return "Yes"



n = int(input())
s = []
t = []
for _ in range(n):
    x = list(input().split())
    s.append(x[0])
    t.append(x[1])

print(changeUsername(n, s, t))
