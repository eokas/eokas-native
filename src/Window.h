
#ifndef _EOKAS_NATIVE_WINDOW_H_
#define _EOKAS_NATIVE_WINDOW_H_

#include "./header.h"

namespace eokas
{
#if (_EOKAS_OS == _EOKAS_OS_WIN32 || _EOKAS_OS == _EOKAS_OS_WIN64)
    #include <Windows.h>
    using WindowHandle = HWND;
#elif (_EOKAS_OS == _EOKAS_OS_LINUX)
    using WindowHandle = void*
#elif (_EOKAS_OS == _EOKAS_OS_MACOS)
    using WindowHandle = void*
#elif (_EOKAS_OS == _EOKAS_OS_IOS)
    using WindowHandle = void*
#elif (_EOKAS_OS == _EOKAS_OS_ANDROID)
    using WindowHandle = void*
#endif

    class Window
    {
    public:
        Window(const String& title);

    private:
        WindowHandle mHandle;
    };
}

#endif //_EOKAS_NATIVE_WINDOW_H_
