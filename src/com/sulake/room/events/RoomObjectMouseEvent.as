package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_158:String = "ROE_MOUSE_CLICK";
      
      public static const const_174:String = "ROE_MOUSE_ENTER";
      
      public static const const_471:String = "ROE_MOUSE_MOVE";
      
      public static const const_178:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1918:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_498:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1958:String = "";
      
      private var var_2208:Boolean;
      
      private var var_2205:Boolean;
      
      private var var_2207:Boolean;
      
      private var var_2206:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1958 = param2;
         this.var_2208 = param5;
         this.var_2205 = param6;
         this.var_2207 = param7;
         this.var_2206 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1958;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2208;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2205;
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
