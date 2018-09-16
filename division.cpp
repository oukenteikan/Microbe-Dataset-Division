#include <stdio.h>
#include <iostream>
#include <cstring>
#include <string>
#include <fstream>
#define N 10000000
#define part 9
using namespace std;

const string prefix = "/gcmAnnotation1/";
const string label[part]={"other","definition","protein", "gene", "genome", "enzyme", "pathway", "taxonomy", "obo"};
char str[N];

int main()
{

	FILE *fin, *fout;
	FILE *fp[part];
	fin = fopen("../full.n3", "r");
	fout = fopen("log", "w");
	if (fin == NULL){cout << "Fail to open the dataset!" << endl;return 0;}
	for (int i = 0 ; i < part ; i ++)
	{
		fp[i] = fopen((label[i]+".n3").c_str(), "w");
		if (fp[i] == NULL){cout << "Fail to open the part " << label[i] << "!" << endl;return 0;}
	}
	long cnt = 0;
	
	while(fgets(str,N,fin) != NULL)
	{	
		
		if (strlen(str) <= 5)
		{
			cout << "Problem line: too short line." << endl;
			cout << "length:" << strlen(str) << endl;
			cout << str;
			break;
		}

		if (str[strlen(str) - 1] != '\n')
		{
			cout << "Problem line: line doesn't end with '\\n'." << endl;
			cout << "char:" << (int)str[strlen(str) - 1] << endl;
			cout << str;
			break;
		}
		
		cnt ++;
		if (cnt % N == 0) cout << "Now is the " << cnt << " line." << endl;
		
		short temp = 0;
		for (int i = 0 ; i < strlen(str) ; i ++)
		{
			if (str[i] == '"') {i = strlen(str) - 1; while (str[i] != '"') i --;}
			if (str[i] == 32) str[i] = 9;
			if (str[i] == 9 && str[i-1] != 9) temp ++;
		}
		if (temp != 3)
		{
			cout << "Problem line: wrong premise." << endl;
			cout << "split:" << temp << endl;
			cout << str;
		}

		int p = 0;
		while (str[p] != 9 && str[p] != 32 && p < strlen(str)) p ++;

		if (str[p-1] != '>' && str[0] != '_')
		{
			cout << "Problem line: subject doesn't end with '>' or start with '_:'." << endl;
			cout << str;
			break;
		}
	
		string line(str);
		string subject = line.substr(0, p);
		
		int m = 0;
		if (subject.find("/gcmAnnotation/v1/") != string::npos || subject.find("_:") != string::npos)
			m = 1;
		else
			for (int i = 2 ; i < part ; i ++)
			{
				string hit = prefix + label[i] + "/";
				if (i == 8) hit = "/obo/";
				if (subject.find(hit) != string::npos) {m = i;break;}
			}
		
		fputs(str, fp[m]);
				
	}
	cout << "There are " << cnt << " lines." << endl;
	fcloseall();

	return 0;
}
