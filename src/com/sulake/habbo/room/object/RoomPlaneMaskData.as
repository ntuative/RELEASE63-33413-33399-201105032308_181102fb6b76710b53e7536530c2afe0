package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2493:Number = 0.0;
      
      private var var_2492:Number = 0.0;
      
      private var var_2490:Number = 0.0;
      
      private var var_2491:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2493 = param1;
         this.var_2492 = param2;
         this.var_2490 = param3;
         this.var_2491 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2493;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2492;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2490;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2491;
      }
   }
}
