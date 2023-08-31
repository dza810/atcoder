// Contest ID: abc299
// Problem ID: abc299_e ( https://atcoder.jp/contests/abc299/tasks/abc299_e )
// Title: E. Nearest Black Vertex
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-24 09:21:26 +0000 UTC ( https://atcoder.jp/contests/abc299/submissions/40919951 ) 

#include <bits/stdc++.h>
#define rep(i, end) for (ll i = 0; i < end; i++)
typedef long long ll;

using namespace std;

int main()
{
  int n, m, k;
  cin >> n >> m;

  vector<vector<int>> adj(n);
  for (int i = 0; i < m; i++)
  {
    int u, v;
    cin >> u >> v;
    u--;
    v--;
    adj[u].push_back(v);
    adj[v].push_back(u);
  }
  cin >> k;

  vector<int> c(n, -1);
  for (int i = 0; i < k; i++)
  {
    int p, d;
    cin >> p >> d;
    p--;
    c[p] = d;
  }

  vector<vector<int>> dist(n, vector<int>(n, -1));
  for (int v = 0; v < n; v++)
  {
    deque<int> q;
    q.push_back(v);
    dist[v][v] = 0;
    while (!q.empty())
    {
      int u = q.front();
      q.pop_front();
      for (int w : adj[u])
      {
        if (dist[v][w] == -1)
        {
          dist[v][w] = dist[v][u] + 1;
          q.push_back(w);
        }
      }
    }
  }

  vector<int> S(n, 0);

  // Make S[v] = 1 when dist[v][w] >= c[w] for all w.
  for (int v = 0; v < n; v++)
  {
    bool is_reachable = true;
    for (int w = 0; w < n; w++)
    {
      if (dist[v][w] < c[w])
      {
        is_reachable = false;
        break;
      }
    }
    if (is_reachable)
    {
      S[v] = 1;
    }
  }

  // Check for all w that c[w] != -1 whether there exists v such that S[v] == 1 and dist[v][w] == c[w].
  for (int w = 0; w < n; w++)
  {
    if (c[w] != -1)
    {
      bool found = false;
      for (int v = 0; v < n; v++)
      {
        if (S[v] == 1 && dist[v][w] == c[w])
        {
          found = true;
          break;
        }
      }
      if (!found)
      {
        cout << "No" << endl;
        return 0;
      }
    }
  }

  cout << "Yes" << endl;
  for (int i = 0; i < n; i++)
    cout << S[i];
  cout << endl;
  return 0;
}