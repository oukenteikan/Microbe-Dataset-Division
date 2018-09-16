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
#define N 1000000000
#define M 3
#define F 10

//待猜测

using namespace std;
long h[N] = {0}, ancestor[N] = {0};
map<string, long> m[M];
string s[M] = {"../Unionfind/Allgenecompress.data", "../Unionfind/Allgenomecompress.data", "../Unionfind/Allproteincompress.data"};
string filestr[F] = {"1.n3", "2.n3", "3.n3", "4.n3", "5.n3", "6.n3", "7.n3", "8.n3", "9.n3", "10.n3"};
struct A
{
	long s, t;
	A(){}
	A(long s_, long t_):s(s_),t(t_){}
	bool operator<(const A& b)const{return t < b.t;}
	bool operator>(const A& b)const{return t > b.t;}
};
priority_queue<A, vector<A> > p;
priority_queue<A, vector<A>, greater<A> > q;
long Do(string str)
{
	string::size_type v;
	map<string, long>::iterator r;
	v = str.find("gcmAnnotation1/gene/");
	if (v != string::npos)
	{
		r = m[0].find(str.substr(v + 20, str.length() - v - 21));
		return (*r).second;
	}
	v = str.find("gcmAnnotation1/genome/");
	if (v != string::npos)
	{
		r = m[1].find(str.substr(v + 22, str.length() - v - 23));
		return (*r).second;
	}
	v = str.find("gcmAnnotation1/protein/");
	if (v != string::npos)
	{
		r = m[2].find(str. substr(v + 23, str. length() - v - 24));
		return (*r).second;
	}
	return -1;
}
int main()
{
	ifstream fread("../Unionfind/findunion.data");
	if (!fread)
	{
		cout << "fail unionfind.data" << endl;
		exit(0);
	}
	long a, b;
	fread >> a >> b;
	for (long i = 0 ; i < a ; i ++)
	{	
		fread >> ancestor[i];
		h[ancestor[i]] ++;
	}
	fread >> b;
	if (!fread.eof())
	{
		cout << "没读完并查集" << endl;
		exit(0);
	}
	fread.close();
	for (long i = 0 ; i < a ; i ++)
	{
		if (h[i] > 0)
		p.push(A(i, h[i]));
	}
	for (int i = 1 ; i <= F ; i ++)
		q.push(A(i, 0));
	A tmp, temp;
	while (!p.empty())
	{
		tmp = p.top();p.pop();
		temp = q.top();q.pop();
		temp.t += tmp.t;
		h[tmp.s] = temp.s;
		q.push(temp);
		if (p.size() % 10000000 == 0 ) cout << "未被分配的小连通块个数" << p.size() << endl;
	}
	while (!q.empty())
	{
		temp = q.top();
		q.pop();
		cout << "机器" << temp.s << " " << temp.t << endl;
	}
	ifstream fin;
	string c;
	a = 0;
	for (int i = 0 ; i < M ; i ++)
	{
		fin.open(s[i].c_str());
		if (!fin)
		{
			cout << "fail all compress " << i << endl;
			exit(0);
		}
		while (fin >> b >> c)
		{
			m[i].insert(pair<string, long>(c, b));
			a ++;
			if (a % 10000000 == 0) cout << "map已经" << a << endl;
		}
		fin.close();
	}
	ifstream fp("../full.n3");
	if (!fp)
	{
		cout << "fail full dataset" << endl;
		exit(0);
	}
	ofstream fout[F];
	ofstream mainmachine("mainmachine.n3");
	for (int i = 0 ; i < F ; i ++)
	{
		fout[i].open(filestr[i].c_str());
		if (!fout[i])
		{
			cout << "fail submachine " << i << endl;
			exit(0);
		}
	}
	a = 0;
	while (getline(fp, c))
	{
		a ++;
		if (a % 10000000 == 0) cout << "已经分到" << a << endl; 
		int p1 = 0;
		while (c[p1] != 32 && c[p1] != 9)
		{
			p1 ++;
			if (p1 == c.length())
			{
				cout << "exceed" << endl;
				cout << c << endl;
				exit(0);
			}
		}
		b = Do(c.substr(0, p1));
	 	if (b >= 0)
		{
			if (h[ancestor[b]] <= F)
				fout[h[ancestor[b]] - 1] << c << endl;
		}
		else
		{	
			mainmachine << c << endl;
			for(int i = 0 ; i < F ; i ++) fout[i] << c << endl;
		}
	}
	for (int i = 0 ; i < F ; i ++)
		fout[i].close();
	fp.close();
	mainmachine.close();
	return 0;
}
