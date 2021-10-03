package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1645:int = 0;
      
      private var var_1646:int = 0;
      
      private var var_2079:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1645;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1646;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2079;
      }
      
      public function flush() : Boolean
      {
         this.var_1645 = 0;
         this.var_1646 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1645 = param1.readInteger();
         this.var_1646 = param1.readInteger();
         this.var_2079 = param1.readInteger();
         return true;
      }
   }
}
