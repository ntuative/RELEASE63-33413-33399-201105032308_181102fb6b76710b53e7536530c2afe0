package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_751:String = "";
      
      public static const const_402:int = 0;
      
      public static const const_632:int = 255;
      
      public static const const_793:Boolean = false;
      
      public static const const_516:int = 0;
      
      public static const const_470:int = 0;
      
      public static const const_436:int = 0;
      
      public static const const_1100:int = 1;
      
      public static const const_1230:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2312:String = "";
      
      private var var_2080:int = 0;
      
      private var var_2310:int = 255;
      
      private var var_2311:Boolean = false;
      
      private var var_2309:int = 0;
      
      private var var_2313:int = 0;
      
      private var var_2314:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2312 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2312;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2080 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2080;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2310 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2310;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2311 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2311;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2309 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2309;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2313 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2313;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2314 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2314;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
