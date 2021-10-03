package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomThumbnailUpdateResultMessageParser implements IMessageParser
   {
       
      
      private var var_337:int;
      
      private var var_1918:int;
      
      public function RoomThumbnailUpdateResultMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_337 = param1.readInteger();
         this.var_1918 = param1.readInteger();
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_337;
      }
      
      public function get resultCode() : int
      {
         return this.var_1918;
      }
   }
}
