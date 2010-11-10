#include <unistd.h>
#include <stdio.h>

int main() {

	fprintf(stderr, "westbaer's setuid loader\n");
	execl("/Applications/Loader.app/Loader", "/Applications/Loader.app/Loader", NULL);

	return 0;
}
