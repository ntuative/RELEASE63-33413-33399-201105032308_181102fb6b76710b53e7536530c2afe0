package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2050:Boolean;
      
      private var var_2853:int;
      
      private var var_409:Boolean;
      
      private var var_1300:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get privateRoom() : Boolean
      {
         return this.var_2050;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2853;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1300;
      }
      
      public function get owner() : Boolean
      {
         return this.var_409;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1300 != null)
         {
            this.var_1300.dispose();
            this.var_1300 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2050 = param1.readBoolean();
         if(this.var_2050)
         {
            this.var_2853 = param1.readInteger();
            this.var_409 = param1.readBoolean();
         }
         else
         {
            this.var_1300 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
