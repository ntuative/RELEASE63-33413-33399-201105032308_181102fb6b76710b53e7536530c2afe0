package com.sulake.habbo.communication.messages.parser.facebook
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaceBookAppRequestMessageParser implements IMessageParser
   {
       
      
      private var var_1654:String;
      
      private var _data:String;
      
      private var var_1655:String;
      
      private var var_2218:int;
      
      public function FaceBookAppRequestMessageParser()
      {
         super();
      }
      
      public function get authToken() : String
      {
         return this.var_1654;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get userFilter() : String
      {
         return this.var_1655;
      }
      
      public function get senderReference() : int
      {
         return this.var_2218;
      }
      
      public function flush() : Boolean
      {
         var _loc1_:* = null;
         this.var_1655 = null;
         this.var_1654 = this._data = _loc1_;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1654 = param1.readString();
         this._data = param1.readString();
         this.var_1655 = param1.readString();
         this.var_2218 = param1.readInteger();
         return true;
      }
   }
}
