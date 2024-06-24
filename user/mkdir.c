#include<lib.h>
int mark;//0 for no p 1 for p
int mkdir(const char *path){
	int r;
	r = open(path,O_CREATE | FTYPE_DIR);
	if(mark == 0 && r < 0){
	printf("mkdir: cannot create directory '<dir>': No such file or directory\n",path);
		}
	else if(r > 0 && mark == 0){
	printf("mkdir: cannot create directory '%s': File exists\n",path);
		}else if(r < 0 && mark == 1){
	char *temPath;
	char b[5000]; 
	int i;
	char temMark[5000];
	i = 0;
	temPath = path;
	while(*temPath!=0){
	if(*temPath =='/'){
	b[i] = '\0';
	strcpy(temMark,b);
	open(temMark,O_CREATE | FTYPE_DIR);
	}
	b[i]=*temPath;
	i++;
	temPath++;}
	b[i] = '\0';
	strcpy(temMark,b);
	open(temMark,O_CREATE | FTYPE_DIR);
			}	
	}
int main(int argc, char **argv){
	ARGBEGIN{
	case 'p':
	mark = 1;
	break;
	default:
	mark = 0;
	break;
		}
	ARGEND
	mkdir(argv[0]);	
	return 0;
	}
