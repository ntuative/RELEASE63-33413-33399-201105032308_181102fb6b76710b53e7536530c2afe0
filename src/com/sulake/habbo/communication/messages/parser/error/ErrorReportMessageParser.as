package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1686:int;
      
      private var var_1968:int;
      
      private var var_1967:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1968 = param1.readInteger();
         this.var_1686 = param1.readInteger();
         this.var_1967 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1686 = 0;
         this.var_1968 = 0;
         this.var_1967 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1686;
      }
      
      public function get messageId() : int
      {
         return this.var_1968;
      }
      
      public function get timestamp() : String
      {
         return this.var_1967;
      }
   }
}
