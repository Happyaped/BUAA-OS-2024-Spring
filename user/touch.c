#include<lib.h>
int touch(const char *path){
	int r;
	if((r = open(path, O_CREATE | FTYPE_REG) ) < 0){
	printf("touch: cannot touch '%s': No such file or directory\n",path);
		}
	return r;	
	}
int main(int argc, char **argv){
	ARGBEGIN{
	default:
	break;
		}
	ARGEND
	touch(argv[0]);
	return 0;
	}
