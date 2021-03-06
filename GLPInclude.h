#pragma once

#include <TargetConditionals.h>


#if defined(TARGET_OS_IPHONE) && (TARGET_OS_IPHONE > 0)

#include <OpenGLES/ES3/gl.h>
#include <OpenGLES/ES3/glext.h>

//#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>

#elif defined(TARGET_OS_MAC) && (TARGET_OS_MAC > 0)

#include <OpenGL/OpenGL.h>
#include <OpenGL/gl3.h>
#include <OpenGL/gl3ext.h>

#endif


#ifdef __OBJC__
#import <Foundation/Foundation.h>
#endif
