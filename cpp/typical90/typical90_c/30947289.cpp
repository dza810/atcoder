// Contest ID: typical90
// Problem ID: typical90_c ( https://atcoder.jp/contests/typical90/tasks/typical90_c )
// Title: 003. Longest Circular Road（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-13 11:14:33 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30947289 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
#define INF 999999999

int main()
{
  num N;
  cin >> N;

  vvi G(N, vi(0));
  vi cost;
  queue<num> Q;
  int max_i;

  rep(i, 0, N-1)
  {
    num a, b;
    cin >> a >> b;
    a--;
    b--;
    G[a].push_back(b);
    G[b].push_back(a);
  }

  Q = queue<int>();
  cost = vi(N, INF);

  Q.push(0);
  cost[0] = 0;
  while (!Q.empty())
  {
    num v = Q.front();
    Q.pop();
    for (auto i : G[v])
    {
      if (cost[i] == INF)
      {
        cost[i] = cost[v] + 1;
        Q.push(i);
      }
    }
  }

  max_i = 0;
  rep(i, 0, N){
    if(cost[max_i] < cost[i]){
      max_i = i;
    }
  }

  Q = queue<int>();
  cost = vi(N, INF);

  Q.push(max_i);
  cost[max_i] = 0;

  while (!Q.empty())
  {
    num v = Q.front();
    Q.pop();
    for (auto i : G[v])
    {
      if (cost[i] == INF)
      {
        cost[i] =  cost[v] + 1;
        Q.push(i);
      }
    }
  }

  rep(i, 0, N){
    if(cost[max_i] < cost[i]){
      max_i = i;
    }
  }
  cout << cost[max_i] + 1 << endl;

  return 0;
}