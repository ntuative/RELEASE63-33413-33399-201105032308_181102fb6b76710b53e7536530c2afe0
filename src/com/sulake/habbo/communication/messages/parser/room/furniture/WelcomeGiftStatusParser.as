package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class WelcomeGiftStatusParser implements IMessageParser
   {
       
      
      private var var_1545:String;
      
      private var var_1265:Boolean;
      
      private var var_2409:Boolean;
      
      private var _furniId:int;
      
      private var var_2410:Boolean;
      
      public function WelcomeGiftStatusParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1545 = param1.readString();
         this.var_1265 = param1.readBoolean();
         this.var_2409 = param1.readBoolean();
         this._furniId = param1.readInteger();
         this.var_2410 = param1.readBoolean();
         return true;
      }
      
      public function get requestedByUser() : Boolean
      {
         return this.var_2410;
      }
      
      public function get email() : String
      {
         return this.var_1545;
      }
      
      public function get isVerified() : Boolean
      {
         return this.var_1265;
      }
      
      public function get allowChange() : Boolean
      {
         return this.var_2409;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
   }
}
