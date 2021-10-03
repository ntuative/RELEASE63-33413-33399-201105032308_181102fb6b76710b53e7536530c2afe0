package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_2082:Boolean;
      
      private var _roomId:int;
      
      private var var_978:String;
      
      private var var_2275:int;
      
      private var var_2274:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2082 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_978 = param1.readString();
         this.var_2275 = param1.readInteger();
         this.var_2274 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_2082;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_978;
      }
      
      public function get enterHour() : int
      {
         return this.var_2275;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2274;
      }
   }
}
