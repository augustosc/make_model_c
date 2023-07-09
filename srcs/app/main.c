#include <stdio.h>

#include "add.h"
#include "sub.h"
#include "mul.h"
#include "div.h"

int main(){

    printf("\nresultado: %d %d %d %.2f\n\n",add(3,4),sub(3,4),mul(3,4),div(3,4));

    return 0;
}