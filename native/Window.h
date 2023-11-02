
#ifndef _EOKAS_NATIVE_WINDOW_H_
#define _EOKAS_NATIVE_WINDOW_H_

#include "./header.h"

namespace eokas
{
    class Window
    {
    public:
        Window(const String& title);

        void create();

    private:
        WindowHandle mHandle;
    };
}

#endif //_EOKAS_NATIVE_WINDOW_H_
