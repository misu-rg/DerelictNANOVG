/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/

/*
 Original Source(NanoVG):
 Copyright (c) 2013 Mikko Mononen memon@inside.org
*/

module derelict.nanovg.nanovg;

public
{
    import derelict.nanovg.types;
    import derelict.nanovg.funcs;    
}

private 
{
    import derelict.util.loader;
    import derelict.util.system;
    import derelict.util.exception;

    static if(Derelict_OS_Windows)
        enum libNames = "nanovg.dll";
    else
        static assert(0, "Need to implement NanoVG libNames for this operating system.");
}

class DerelictNANOVGLoader : SharedLibLoader 
{
    public this() 
    {
        super(libNames);
    }

    protected override void loadSymbols()
    {
        version(NanovgGL2)
        {
            bindFunc(cast(void**)&nvgCreateGL2, "nvgCreateGL2");
            bindFunc(cast(void**)&nvgDeleteGL2, "nvgDeleteGL2");
            bindFunc(cast(void**)&nvglImageHandleGL2, "nvglImageHandleGL2");
        }
        else version(NanovgGL3)
        {
            bindFunc(cast(void**)&nvgCreateGL3, "nvgCreateGL3");
            bindFunc(cast(void**)&nvgDeleteGL3, "nvgDeleteGL3");
            bindFunc(cast(void**)&nvglCreateImageFromHandleGL3, "nvglCreateImageFromHandleGL3");
            bindFunc(cast(void**)&nvglImageHandleGL3, "nvglImageHandleGL3");
        }
        else version(NanovgGLES2)
        {
            bindFunc(cast(void**)&nvgCreateGLES2, "nvgCreateGLES2");
            bindFunc(cast(void**)&nvgDeleteGLES2, "nvgDeleteGLES2");
            bindFunc(cast(void**)&nvglCreateImageFromHandleGLES2, "nvglCreateImageFromHandleGLES2");
        }
        
        bindFunc(cast(void**)&nvgBeginFrame, "nvgBeginFrame");
        bindFunc(cast(void**)&nvgCancelFrame, "nvgCancelFrame");
        bindFunc(cast(void**)&nvgEndFrame, "nvgEndFrame");
        bindFunc(cast(void**)&nvgGlobalCompositeOperation, "nvgGlobalCompositeOperation");
        bindFunc(cast(void**)&nvgGlobalCompositeBlendFunc, "nvgGlobalCompositeBlendFunc");
        bindFunc(cast(void**)&nvgGlobalCompositeBlendFuncSeparate, "nvgGlobalCompositeBlendFuncSeparate");
        bindFunc(cast(void**)&nvgRGB, "nvgRGB");
        bindFunc(cast(void**)&nvgRGBf, "nvgRGBf");
        bindFunc(cast(void**)&nvgRGBA, "nvgRGBA");
        bindFunc(cast(void**)&nvgRGBAf, "nvgRGBAf");
        bindFunc(cast(void**)&nvgLerpRGBA, "nvgLerpRGBA");
        bindFunc(cast(void**)&nvgTransRGBA, "nvgTransRGBA");
        bindFunc(cast(void**)&nvgTransRGBAf, "nvgTransRGBAf");
        bindFunc(cast(void**)&nvgHSL, "nvgHSL");
        bindFunc(cast(void**)&nvgHSLA, "nvgHSLA");
        bindFunc(cast(void**)&nvgSave, "nvgSave");
        bindFunc(cast(void**)&nvgRestore, "nvgRestore");
        bindFunc(cast(void**)&nvgReset, "nvgReset");
        bindFunc(cast(void**)&nvgStrokeColor, "nvgStrokeColor");
        bindFunc(cast(void**)&nvgStrokePaint, "nvgStrokePaint");
        bindFunc(cast(void**)&nvgFillColor, "nvgFillColor");
        bindFunc(cast(void**)&nvgFillPaint, "nvgFillPaint");
        bindFunc(cast(void**)&nvgMiterLimit, "nvgMiterLimit");
        bindFunc(cast(void**)&nvgStrokeWidth, "nvgStrokeWidth");
        bindFunc(cast(void**)&nvgLineCap, "nvgLineCap");
        bindFunc(cast(void**)&nvgLineJoin, "nvgLineJoin");
        bindFunc(cast(void**)&nvgGlobalAlpha, "nvgGlobalAlpha");
        bindFunc(cast(void**)&nvgResetTransform, "nvgResetTransform");
        bindFunc(cast(void**)&nvgTransform, "nvgTransform");
        bindFunc(cast(void**)&nvgTranslate, "nvgTranslate");
        bindFunc(cast(void**)&nvgRotate, "nvgRotate");
        bindFunc(cast(void**)&nvgSkewX, "nvgSkewX");
        bindFunc(cast(void**)&nvgSkewY, "nvgSkewY");
        bindFunc(cast(void**)&nvgScale, "nvgScale");
        bindFunc(cast(void**)&nvgCurrentTransform, "nvgCurrentTransform");
        bindFunc(cast(void**)&nvgTransformIdentity, "nvgTransformIdentity");
        bindFunc(cast(void**)&nvgTransformTranslate, "nvgTransformTranslate");
        bindFunc(cast(void**)&nvgTransformScale, "nvgTransformScale");
        bindFunc(cast(void**)&nvgTransformRotate, "nvgTransformRotate");
        bindFunc(cast(void**)&nvgTransformSkewX, "nvgTransformSkewX");
        bindFunc(cast(void**)&nvgTransformSkewY, "nvgTransformSkewY");
        bindFunc(cast(void**)&nvgTransformMultiply, "nvgTransformMultiply");
        bindFunc(cast(void**)&nvgTransformPremultiply, "nvgTransformPremultiply");
        bindFunc(cast(void**)&nvgTransformInverse, "nvgTransformInverse");
        bindFunc(cast(void**)&nvgTransformPoint, "nvgTransformPoint");
        bindFunc(cast(void**)&nvgDegToRad, "nvgDegToRad");
        bindFunc(cast(void**)&nvgRadToDeg, "nvgRadToDeg");
        bindFunc(cast(void**)&nvgCreateImage, "nvgCreateImage");
        bindFunc(cast(void**)&nvgCreateImageMem, "nvgCreateImageMem");
        bindFunc(cast(void**)&nvgCreateImageRGBA, "nvgCreateImageRGBA");
        bindFunc(cast(void**)&nvgUpdateImage, "nvgUpdateImage");
        bindFunc(cast(void**)&nvgImageSize, "nvgImageSize");
        bindFunc(cast(void**)&nvgDeleteImage, "nvgDeleteImage");
        bindFunc(cast(void**)&nvgLinearGradient, "nvgLinearGradient");
        bindFunc(cast(void**)&nvgBoxGradient, "nvgBoxGradient");
        bindFunc(cast(void**)&nvgRadialGradient, "nvgRadialGradient");
        bindFunc(cast(void**)&nvgImagePattern, "nvgImagePattern");
        bindFunc(cast(void**)&nvgScissor, "nvgScissor");
        bindFunc(cast(void**)&nvgIntersectScissor, "nvgIntersectScissor");
        bindFunc(cast(void**)&nvgResetScissor, "nvgResetScissor");
        bindFunc(cast(void**)&nvgBeginPath, "nvgBeginPath");
        bindFunc(cast(void**)&nvgMoveTo, "nvgMoveTo");
        bindFunc(cast(void**)&nvgLineTo, "nvgLineTo");
        bindFunc(cast(void**)&nvgBezierTo, "nvgBezierTo");
        bindFunc(cast(void**)&nvgQuadTo, "nvgQuadTo");
        bindFunc(cast(void**)&nvgArcTo, "nvgArcTo");
        bindFunc(cast(void**)&nvgClosePath, "nvgClosePath");
        bindFunc(cast(void**)&nvgPathWinding, "nvgPathWinding");
        bindFunc(cast(void**)&nvgArc, "nvgArc");
        bindFunc(cast(void**)&nvgRect, "nvgRect");
        bindFunc(cast(void**)&nvgRoundedRect, "nvgRoundedRect");
        bindFunc(cast(void**)&nvgRoundedRectVarying, "nvgRoundedRectVarying");
        bindFunc(cast(void**)&nvgEllipse, "nvgEllipse");
        bindFunc(cast(void**)&nvgCircle, "nvgCircle");
        bindFunc(cast(void**)&nvgFill, "nvgFill");
        bindFunc(cast(void**)&nvgStroke, "nvgStroke");
        bindFunc(cast(void**)&nvgCreateFont, "nvgCreateFont");
        bindFunc(cast(void**)&nvgCreateFontMem, "nvgCreateFontMem");
        bindFunc(cast(void**)&nvgFindFont, "nvgFindFont");
        bindFunc(cast(void**)&nvgAddFallbackFontId, "nvgAddFallbackFontId");
        bindFunc(cast(void**)&nvgAddFallbackFont, "nvgAddFallbackFont");
        bindFunc(cast(void**)&nvgFontSize, "nvgFontSize");
        bindFunc(cast(void**)&nvgFontBlur, "nvgFontBlur");
        bindFunc(cast(void**)&nvgTextLetterSpacing, "nvgTextLetterSpacing");
        bindFunc(cast(void**)&nvgTextLineHeight, "nvgTextLineHeight");
        bindFunc(cast(void**)&nvgTextAlign, "nvgTextAlign");
        bindFunc(cast(void**)&nvgFontFaceId, "nvgFontFaceId");
        bindFunc(cast(void**)&nvgFontFace, "nvgFontFace");
        bindFunc(cast(void**)&nvgText, "nvgText");
        bindFunc(cast(void**)&nvgTextBox, "nvgTextBox");
        bindFunc(cast(void**)&nvgTextBounds, "nvgTextBounds");
        bindFunc(cast(void**)&nvgTextBoxBounds, "nvgTextBoxBounds");
        bindFunc(cast(void**)&nvgTextGlyphPositions, "nvgTextGlyphPositions");
        bindFunc(cast(void**)&nvgTextMetrics, "nvgTextMetrics");
        bindFunc(cast(void**)&nvgTextBreakLines, "nvgTextBreakLines");
        bindFunc(cast(void**)&nvgCreateInternal, "nvgCreateInternal");
        bindFunc(cast(void**)&nvgDeleteInternal, "nvgDeleteInternal");
        bindFunc(cast(void**)&nvgInternalParams, "nvgInternalParams");
        bindFunc(cast(void**)&nvgDebugDumpPathCache, "nvgDebugDumpPathCache");     
    }
}

__gshared DerelictNANOVGLoader DerelictNANOVG;

shared static this() 
{
    DerelictNANOVG = new DerelictNANOVGLoader();
}