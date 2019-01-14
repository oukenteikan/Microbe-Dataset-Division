# Microbe-Dataset-Division

Distributed Knowledge Graph System Construction and Its Application on Microbe RDF Dataset.

分布式知识图谱系统的构建及其在微生物RDF数据集上的应用

本项目是基于[gStore系统](http://www.icst.pku.edu.cn/intro/leizou/projects/gStore.htm)进行的分布式应用。

本项目仅上传相对于原代码改动过的文件。

本项目文件中原gStore代码取自某一版gStore系统，今后不再更新。

main文件夹中的函数修改自gStore/Query/，用它们替换掉主机gStore中的相应代码。
GeneralEvalution主要改动的部分在rewritingBasedQueryEvaluation函数。
微生物RDF数据集中的查询都是良定义的查询，因此只需要在该函数中进行本地和远程的判断。
修改逻辑详见论文。
QueryTree主要改动的部分在reconstruction函数。
主要目的是为了重构FilterTree。
修改逻辑详见print函数。

sub文件夹中的函数修改自gStore/Main和gStore/Socket，用它们替换掉分机gStore中的相应代码。
Server主要改动的部分在listen_to_main函数。
该函数完成了从查询接收到结果返回的整个过程。
修改逻辑详见论文。
gsub主要改动的部分在main函数。
主要目的是为了调用Server中的listen_to_main函数。
修改逻辑详见论文。

queryset文件夹中是16个样例查询，部分查询需要分发，部分查询不需要分发。
详见论文。

query.sql是查询模板，在微生物RDF数据集上只可能有这样的查询。

Division是一个用于微生物RDF数据集进行划分的程序，按照前缀中的关键字匹配进行结点分类。
用法详见源码。

Compress是一个用于微生物RDF数据集进行压缩的程序，去除公共前缀，只留下序列号部分。
用法详见源码。

Integration是一个用于微生物RDF数据集进行整合的程序，整合protein，gene，genome三类结点，并分配唯一id。用法详见源码。

Unionfind是一个用于微生物RDF数据集进行并查集的程序，按照原数据集中的三元组关系获得连通块。
用法详见源码。

Final是一个用于微生物RDF数据集进行分配的程序，按照连通块的大小近似平衡地分配成多个部分。
用法详见源码。

result.pptx是一个展示项目结果的PPT文件。

中文版项目论文已经完成，作为本科生科研报告论文上交。
英文版项目论文已经完成，但不准备提交给导师过目，也不打算尝试发表了。
论文暂不提供。

是谁先抛弃谁的，大家心里都有数。


