#include <stdio.h>
#include <stdbool.h>
#include <wchar.h>
#include "pewpewshell_utils.h"
int main(int argc, char **argv){
    //initialize shell
    pewpew_init();

    //handle shell commands
    pewpew_handler();
    
}
