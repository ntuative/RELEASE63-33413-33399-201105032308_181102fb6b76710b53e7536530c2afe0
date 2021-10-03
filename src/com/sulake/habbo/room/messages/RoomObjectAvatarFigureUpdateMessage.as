package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_652:String;
      
      private var var_2504:String;
      
      private var var_1003:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_652 = param1;
         this.var_1003 = param2;
         this.var_2504 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_652;
      }
      
      public function get race() : String
      {
         return this.var_2504;
      }
      
      public function get gender() : String
      {
         return this.var_1003;
      }
   }
}
