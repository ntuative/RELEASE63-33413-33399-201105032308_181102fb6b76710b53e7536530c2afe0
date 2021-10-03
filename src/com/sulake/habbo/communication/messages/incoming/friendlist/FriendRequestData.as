package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1110:int;
      
      private var var_2370:String;
      
      private var var_2369:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1110 = param1.readInteger();
         this.var_2370 = param1.readString();
         this.var_2369 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1110;
      }
      
      public function get requesterName() : String
      {
         return this.var_2370;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2369;
      }
   }
}
