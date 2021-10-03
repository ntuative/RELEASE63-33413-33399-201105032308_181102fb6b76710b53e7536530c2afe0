package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1877:int;
      
      private var var_2569:int;
      
      private var var_1564:int;
      
      private var var_2570:int;
      
      private var var_124:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1877 = param1.readInteger();
         this.var_2569 = param1.readInteger();
         this.var_1564 = param1.readInteger();
         this.var_2570 = param1.readInteger();
         this.var_124 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1877);
      }
      
      public function get callId() : int
      {
         return this.var_1877;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2569;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1564;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2570;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_124;
      }
   }
}
