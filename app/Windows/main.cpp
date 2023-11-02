
#include "main.h"

#include <stdio.h>


int main(int argc, char **argv)
{
    printf("hello world.");

    eokas::App app(argc, argv);

    eokas::Window window("NativeApp");
    window.create();

    return app.exec();
}
