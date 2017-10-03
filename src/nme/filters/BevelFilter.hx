package nme.filters;
#if (!flash)

@:nativeProperty
class BevelFilter extends BitmapFilter
{
   public var angle:Float;
   public var blurX:Float;
   public var blurY:Float;
   public var distance:Float;
   public var highlightAlpha:Float;
   public var highlightColor:Int;
   public var knockout:Bool;
   public var quality:Int;
   public var shadowAlpha:Float;
   public var shadowColor:Int;
   public var strength:Float;
   public var bevelType:String;
   public function new(in_distance:Float = 4.0, in_angle:Float = 45.0, in_highlightColor:Int = 0xffffff, in_highlightAlpha:Float = 1.0, in_shadowColor:Int = 0x000000, in_shadowAlpha:Float = 1.0, in_blurX:Float = 4.0, in_blurY:Float = 4.0, in_strength:Float = 1.0, in_quality:Int = 1, in_type:String = "inner", in_knockout:Bool = false)
   {
      super("BevelFilter");

      distance = in_distance;
      angle = in_angle;
      highlightColor = in_highlightColor;
      highlightAlpha = in_highlightAlpha;
      shadowColor = in_shadowColor;
      shadowAlpha = in_shadowAlpha;
      blurX = in_blurX;
      blurY = in_blurY;
      strength = in_strength;
      quality = in_quality;
      bevelType = in_type;
      knockout = in_knockout;
   }

   override public function clone():BitmapFilter 
   {
      return new BevelFilter(distance, angle, highlightColor, highlightAlpha, shadowColor, shadowAlpha, blurX, blurY, strength, quality, bevelType, knockout);
   }
}

#else
typedef BevelFilter = flash.filters.BevelFilter;
#end
