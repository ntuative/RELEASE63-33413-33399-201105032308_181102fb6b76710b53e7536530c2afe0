package com.sulake.habbo.room.events
{
   public class RoomEngineObjectPlacedEvent extends RoomEngineObjectEvent
   {
       
      
      private var var_2034:String = "";
      
      private var _x:Number = 0;
      
      private var var_165:Number = 0;
      
      private var var_164:Number = 0;
      
      private var _direction:int = 0;
      
      private var var_2806:Boolean = false;
      
      private var var_2805:Boolean = false;
      
      private var var_2807:Boolean = false;
      
      public function RoomEngineObjectPlacedEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:String, param7:Number, param8:Number, param9:Number, param10:int, param11:Boolean, param12:Boolean, param13:Boolean, param14:Boolean = false, param15:Boolean = false)
      {
         super(param1,param2,param3,param4,param5,param14,param15);
         this.var_2034 = param6;
         this._x = param7;
         this.var_165 = param8;
         this.var_164 = param9;
         this._direction = param10;
         this.var_2806 = param11;
         this.var_2805 = param12;
         this.var_2807 = param13;
      }
      
      public function get wallLocation() : String
      {
         return this.var_2034;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_165;
      }
      
      public function get z() : Number
      {
         return this.var_164;
      }
      
      public function get direction() : int
      {
         return this._direction;
      }
      
      public function get placedInRoom() : Boolean
      {
         return this.var_2806;
      }
      
      public function get placedOnFloor() : Boolean
      {
         return this.var_2805;
      }
      
      public function get placedOnWall() : Boolean
      {
         return this.var_2807;
      }
   }
}
