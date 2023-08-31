// Contest ID: typical90
// Problem ID: typical90_c ( https://atcoder.jp/contests/typical90/tasks/typical90_c )
// Title: 003. Longest Circular Road（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-13 11:20:59 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30947358 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
#define INF 999999999

vvi G(1<<20, vi(0));
num N;


vi calc_dist(int start){
  queue<num> Q;
  vi cost(N, INF);
  
  Q.push(start);
  cost[start] = 0;
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
  return cost;
}

int main()
{
  cin >> N;

  vi cost;
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


  cost = calc_dist(0);

  max_i = 0;
  rep(i, 0, N){
    if(cost[max_i] < cost[i]){
      max_i = i;
    }
  }

  cost = calc_dist(max_i);

  rep(i, 0, N){
    if(cost[max_i] < cost[i]){
      max_i = i;
    }
  }
  cout << cost[max_i] + 1 << endl;

  return 0;
}