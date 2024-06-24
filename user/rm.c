#include<lib.h>
int mark;//0 for no parameter 1 for r 2 for rf
int rm(const char *path){
	int r;
	int tem;
	tem = 0;
	if(mark == 0 || mark == 1){
	tem = 1;
		}
	r = open(path,O_RDONLY);
	if(r < 0 && tem == 1){
	printf("rm: cannot remove '%s': No such file or directory\n", path);
	return r;
		}
	else if(r < 0 && tem == 0){
	return r;
		}
	struct Filefd *ffd;
	uint32_t type;
	ffd = num2fd(r);
	type = ffd->f_file.f_type;
	if(mark != 0){
	remove(path);
	}else{
	if(type==FTYPE_REG){
	remove(path);
	}else{
	printf("rm: cannot remove '%s': Is a directory\n", path);
	} }
	return r;	
	}
int main(int argc, char **argv){
	ARGBEGIN{
	case 'r':
	mark = 1;
	break;
	case 'rf':
	mark = 2;
	break;
	default:
	mark = 0;
	break;
		}
	ARGEND
	rm(argv[0]);
	return 0;
}
