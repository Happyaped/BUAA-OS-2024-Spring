#include <lib.h>

void strace_barrier(u_int env_id) {
	int straced_bak = straced;
	straced = 0;
	while (envs[ENVX(env_id)].env_status == ENV_RUNNABLE) {
		syscall_yield();
	}
	straced = straced_bak;
}

void strace_send(int sysno) {
	if (!((SYS_putchar <= sysno && sysno <= SYS_set_tlb_mod_entry) ||
	      (SYS_exofork <= sysno && sysno <= SYS_panic)) ||
	    sysno == SYS_set_trapframe) {
		return;
	}

	// Your code here. (1/2)
	if(straced == 0){
	return;
		}
	int temMark = straced;
	straced = 0;
	u_int nowId = syscall_getenvid();
	int parentid = envs[ENVX(nowId)].env_parent_id;
	ipc_send(parentid,sysno,0,0);
	straced = 0;
	syscall_set_env_status(nowId,ENV_NOT_RUNNABLE);
	straced = temMark;	
}

void strace_recv() {
	// Your code here. (2/2)
	while(1){
	u_int child_env_id;
	u_int temValue = ipc_recv(&child_env_id,0,0);
		
	strace_barrier(child_env_id);
	recv_sysno(child_env_id, temValue);
	syscall_set_env_status(child_env_id,ENV_RUNNABLE);
	
	if(temValue == SYS_env_destroy){
	break;
		}
	}
}
