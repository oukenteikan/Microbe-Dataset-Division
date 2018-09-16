#include "../Database/Database.h"
#include "../Util/Util.h"
#include "../Server/Server.h"

using namespace std;

int
main(int argc, char * argv[])
{

//#ifdef DEBUG
	Util util;
//#endif

	if (argc < 3)
	{
		cout << "unreasonable command" << endl;
		return 0;
	}

	cout << "argc: " << argc << "\t";
	cout << "DB_store:" << argv[1] << "\t";
	cout << "port:" << argv[2] << endl;

	string db_folder = string(argv[1]);
	int len = db_folder.length();
	if(db_folder.substr(len-3, 3) == ".db")
	{
		cout<<"your database can not end with .db"<<endl;
		return -1;
	}

	unsigned short port = Socket::DEFAULT_CONNECT_PORT;
	stringstream ss(argv[2]);
	ss >> port;
	Server server(port);
	string ret_msg;
	
	server.createConnection();
	server.loadDatabase(db_folder, "", ret_msg);
	printf("%s\n", ret_msg.c_str());

	server.listen_to_main();

	server.unloadDatabase(db_folder, "", ret_msg);
	printf("%s\n", ret_msg.c_str());
	server.deleteConnection();
	server.stopServer(ret_msg);	
	printf("%s\n", ret_msg.c_str());

	return 0;
}
