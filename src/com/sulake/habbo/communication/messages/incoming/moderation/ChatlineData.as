package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2262:int;
      
      private var var_2263:int;
      
      private var var_2264:int;
      
      private var var_2261:String;
      
      private var var_1863:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2262 = param1.readInteger();
         this.var_2263 = param1.readInteger();
         this.var_2264 = param1.readInteger();
         this.var_2261 = param1.readString();
         this.var_1863 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2262;
      }
      
      public function get minute() : int
      {
         return this.var_2263;
      }
      
      public function get chatterId() : int
      {
         return this.var_2264;
      }
      
      public function get chatterName() : String
      {
         return this.var_2261;
      }
      
      public function get msg() : String
      {
         return this.var_1863;
      }
   }
}
