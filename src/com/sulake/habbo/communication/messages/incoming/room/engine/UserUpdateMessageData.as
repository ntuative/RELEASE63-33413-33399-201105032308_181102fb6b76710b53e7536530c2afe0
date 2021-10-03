package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_165:Number = 0;
      
      private var var_164:Number = 0;
      
      private var var_2343:Number = 0;
      
      private var var_2342:Number = 0;
      
      private var var_2346:Number = 0;
      
      private var var_2345:Number = 0;
      
      private var var_417:int = 0;
      
      private var var_2235:int = 0;
      
      private var var_332:Array;
      
      private var var_2344:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_332 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_165 = param3;
         this.var_164 = param4;
         this.var_2343 = param5;
         this.var_417 = param6;
         this.var_2235 = param7;
         this.var_2342 = param8;
         this.var_2346 = param9;
         this.var_2345 = param10;
         this.var_2344 = param11;
         this.var_332 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
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
      
      public function get localZ() : Number
      {
         return this.var_2343;
      }
      
      public function get targetX() : Number
      {
         return this.var_2342;
      }
      
      public function get targetY() : Number
      {
         return this.var_2346;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2345;
      }
      
      public function get dir() : int
      {
         return this.var_417;
      }
      
      public function get dirHead() : int
      {
         return this.var_2235;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2344;
      }
      
      public function get actions() : Array
      {
         return this.var_332.slice();
      }
   }
}
