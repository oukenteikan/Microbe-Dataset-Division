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

//从All*的数据做并查集，将每个三大类节点的祖先输出到unionfind里面。

using namespace std;
long ancestor[N];
map<string, long> m[M];
set<long> Set;
string s[M]={"Allgenecompress.data","Allgenomecompress.data","Allproteincompress.data"};
long represent(long x)
{
	if (ancestor[x] == x) return x;
	long y = ancestor[x];
	ancestor[x] = represent(y);
	return ancestor[x];
}
void Deal(long x, long y)
{
	if (represent(x) == represent(y)) return;
	ancestor[ancestor[x]] = ancestor[y];
	return;
}
void Genome_Gene(string a, string c)
{
	int p1 = a.find("genome/") + 7, p2 = c.find("gene/")+ 5;
	long former, later;
	map<string, long>::iterator p;
	p = m[1].find(a.substr(p1, a.length() - p1 - 1));
	if (p != m[1].end()) former = (*p).second;
	else cout << "???" << endl;
	p = m[0].find(c.substr(p2, c.length() - p2 - 1));
	if (p != m[0].end()) later = (*p).second;
	else cout << "???" << endl;
	Deal(former, later);
	return;
}
void Gene_Genome(string a, string c)
{
	int p1 = a.find("gene/") + 5, p2 = c.find("genome/")+ 7;
	long former, later;
	map<string, long>::iterator p;
	p = m[0].find(a.substr(p1, a.length() - p1 - 1));
	if (p != m[0].end()) former = (*p).second;
	else cout << "???" << endl;;
	p = m[1].find(c.substr(p2, c.length() - p2 - 1));
	if (p != m[1].end()) later = (*p).second;
	else cout << "???" << endl;
	Deal(former, later);
	return;
}
void Gene_Protein(string a, string c)
{
	int p1 = a.find("gene/") + 5, p2 = c.find("protein/")+ 8;
	long former, later;
	map<string, long>::iterator p;
	p = m[0].find(a.substr(p1, a.length() - p1 - 1));
	if (p != m[0].end()) former = (*p).second;
	else cout << "???" << endl;
	p = m[2].find(c.substr(p2, c.length() - p2 - 1));
	if (p != m[2].end()) later = (*p).second;
	else cout << "???" << endl;
	Deal(former, later);
	return;
}
void dosomething(string str)
{
	string a, b, c;
	int p1 = 0 ,p2, p3, p4, p5;
	while (str[p1] != '>') p1 ++;
	p2 = p1;
	while (str[p2] != '<') p2 ++;
	p3 = p2;
	while (str[p3] != '>') p3 ++;
	p4 = p3;
	while (str[p4] != '<') p4 ++;
	p5 = p4;
	while (str[p5] != '>') p5 ++;
	if (p1+1 > str.length() || p2+1 > str.length() ||p3+1 > str.length() ||p4+1 > str.length() ||p5+1 > str.length())
	{
		cout << str << endl;
		cout << p1 << " " << p2 << " " << p3 << " " << p4 << " " << p5 << endl;
		exit(1);
	}
	a.assign(str, 0, p1 + 1);
	b.assign(str, p2, p3 - p2 + 1);
	c.assign(str, p4, p5 - p4 + 1);
	if (b.find("x-gene") != string::npos) Genome_Gene(a, c);
	if (b.find("x-genome") != string::npos) Gene_Genome(a, c);
	if (b.find("x-protein") != string::npos) Gene_Protein(a, c);
	return;
}
bool check(string str)
{
	short cnt = 0;
	for (int i = 0 ; i < str.length() ; i ++)
	{	
		if (str[i] == '<' || str[i] == '>') cnt ++;
		if (str[i] == '"') return false;
	}
	if (cnt == 6)
		return true;
	return false;
}
void Union(string str)
{
	static long cnt = 0;
	cnt ++;
	if (cnt % 10000000 == 0)
		cout << cnt << endl;
	if (check(str))
		dosomething(str);
	return;
}
int main()
{
	for (long i = 0 ; i < N ; i ++)
		ancestor[i] = i;
	ifstream fin[M];
	string a;
	long b, c = 0;
	for (int i = 0 ; i < M ; i ++)
	{
		fin[i].open(s[i].c_str(),ios::in);
		if (!fin[i])
		{
			cout << "Fail to open " << s[i] << endl;
			return 0;
		}
		while(fin[i] >> b >> a)
		{
			m[i].insert(pair<string, long>(a, b));
			c ++;
			if (c % 10000000 == 0) cout << c << endl;
		}
	}
	ifstream fread("../full.n3");
	ofstream fwrite("findunion.data");
	string str;
	while (getline(fread, str))
		Union(str);
	for (long i = 0 ; i < c ; i ++)
		Set.insert(represent(i));
	fwrite << c << endl << Set.size() << endl;
	for (long i = 0 ; i < c ; i ++)
		fwrite << ancestor[i] << endl;
	for (int i = 0 ; i < M ; i ++)
		fin[i].close();
	fread.close();
	fwrite.close();
	return 0;
}
