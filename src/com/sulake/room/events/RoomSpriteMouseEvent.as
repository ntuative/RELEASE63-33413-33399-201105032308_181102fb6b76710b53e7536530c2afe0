package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1958:String = "";
      
      private var var_1867:String = "";
      
      private var var_2521:String = "";
      
      private var var_2753:Number = 0;
      
      private var var_2754:Number = 0;
      
      private var var_2179:Number = 0;
      
      private var var_2182:Number = 0;
      
      private var var_2205:Boolean = false;
      
      private var var_2208:Boolean = false;
      
      private var var_2207:Boolean = false;
      
      private var var_2206:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1958 = param2;
         this.var_1867 = param3;
         this.var_2521 = param4;
         this.var_2753 = param5;
         this.var_2754 = param6;
         this.var_2179 = param7;
         this.var_2182 = param8;
         this.var_2205 = param9;
         this.var_2208 = param10;
         this.var_2207 = param11;
         this.var_2206 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1958;
      }
      
      public function get canvasId() : String
      {
         return this.var_1867;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2521;
      }
      
      public function get screenX() : Number
      {
         return this.var_2753;
      }
      
      public function get screenY() : Number
      {
         return this.var_2754;
      }
      
      public function get localX() : Number
      {
         return this.var_2179;
      }
      
      public function get localY() : Number
      {
         return this.var_2182;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2205;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2208;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2207;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2206;
      }
   }
}
