/**
 * Copyright (c) 2010, Jeash contributors.
 * 
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

package jeash.geom;

import jeash.display.DisplayObject;
import jeash.geom.Matrix;

class Transform
{
   public var colorTransform( GetColorTransform, SetColorTransform ) : ColorTransform;
   public var matrix(jeashGetMatrix,jeashSetMatrix):Matrix;
   public var pixelBounds(GetPixelBounds,null):Rectangle;

   var mObj:DisplayObject;

   public function new(inParent:DisplayObject)
   {
      mObj = inParent;
   }

   public function jeashGetMatrix() : Matrix { return mObj.jeashGetMatrix(); }
   public function jeashSetMatrix(inMatrix:Matrix) : Matrix
       { return mObj.jeashSetMatrix(inMatrix); }

   function GetPixelBounds()
   {
   	return mObj.getBounds(jeash.Lib.jeashGetStage());
   }

   public function GetColorTransform() { 
#if silverlight
     var gfx = mObj.GetGraphics();
     return gfx.mColorTransform;
#else
     return new ColorTransform();
#end
   }

   public function SetColorTransform( inColorTransform : ColorTransform ) : ColorTransform
   {
#if silverlight
     mObj.GetGraphics().mColorTransform = colorTransform;
#end
     return inColorTransform;
   }
}