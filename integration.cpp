#include <iostream>
#include <fstream>
#include <cstring>
#include <cmath>
#include <string>
#include <algorithm>
#include <cstdio>
#include <set>
#include <vector>
#include <map>
#include <stack>
#include <queue>
#define N 1000000
#define M 3

//每一类的uniquedata获得了一个唯一的编号，然后输出为All*。

using namespace std;
int main()
{
	FILE *f[M];
	ofstream fout[M];
	string s[M] = {"genecompress.data","genomecompress.data","proteincompress.data"};
	for (int i = 0 ; i < M ; i ++)
	{
		f[i] = fopen((string("../Compress/") + s[i]).c_str(), "r");
		if (f[i] == NULL)
		{
			cout << "Fail to open" << s[i] << endl;
			return 0;
		}
		fout[i].open((string("All")+s[i]).c_str(),ios::out);
		if (!fout[i]) 
		{
			cout << "Fail to open" << endl;
			return 0;
		}
	}
	cout << "Successful open" << endl;
	char str[N];
	map<string, long> m[M];
	long cnt = 0;
	for (int i = 0 ; i < M ; i ++)
	{	
		while (fgets(str, N, f[i])!=NULL)
		{
			m[i].insert(pair<string, long>(str, cnt ++));
			if (cnt % N == 0) cout << cnt << endl;
		}
		for (map<string, long>::iterator p = m[i].begin() ; p != m[i].end() ; p ++)
			fout[i] << (*p).second << " " << (*p).first;
	}
	for (int i = 0 ; i < M ; i ++)
	{	
		fout[i].close();
		fclose(f[i]);
	}
	return 0;
}
