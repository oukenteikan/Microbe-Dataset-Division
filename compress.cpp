#include <iostream>
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
#define N 10000000

//这份代码是在将每一类三元组的主语提取出来，并且只留下id字段，作为主语的压缩表示。

using namespace std;
set<string> sss;
void deal(char *m, string n)
{
	int q;
	string t1(m), t2;
	int p = 0;
	while (t1[p] != 32 && t1[p] != 9 && p < t1.length()) p++;
	t1 = t1.substr(0, p);
	q = t1.find("gcmAnnotation1") + 16 + n.size();
	t2 = t1.substr(q, t1.length() - q - 1);
	t2.append(1, '\n');
	sss.insert(t2);
}
char mystr[N];
int main()
{
	string name, suffix = ".n3", postfix = "compress.data", input, output;
	char flag = 'n';
	while (flag != 'y')
	{
		cout << "请输入想要处理的数据" << endl;
		cin >> name;
		cout << "是否确认?y or n" << endl;
		cin >> flag;
	}
	cout << "将要处理" << name << endl;
	input = string("../Original/") + name + suffix;
	output = name + postfix;
	cout << input << endl << output << endl;

	FILE *fread, *fappend;
	fread = fopen(input.c_str(),"r");
	fappend = fopen(output.c_str(),"w");
	if (fread == NULL || fappend == NULL)
	{
		cout << "Fail to open" << endl;
		return 0;
	}
	else cout << "Successful Open" << endl;
	
	long cnt = 0;
	while (fgets(mystr, N, fread) != NULL)
	{	
		cnt ++;
		if (cnt % N == 0) cout << "已处理" << cnt << "行" << endl;
		deal(mystr, name);
	}
	cout << cnt << endl;
	for (set<string>::iterator p = sss.begin(); p != sss.end() ; p ++)
	{
		fputs((*p).c_str(), fappend);
	}
	cout << sss.size() << endl;
	fcloseall();
	return 0;
}
