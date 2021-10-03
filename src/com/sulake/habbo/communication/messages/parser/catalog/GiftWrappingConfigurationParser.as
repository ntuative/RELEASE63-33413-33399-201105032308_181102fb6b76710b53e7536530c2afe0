package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2637:Boolean;
      
      private var var_2636:int;
      
      private var var_1818:Array;
      
      private var var_765:Array;
      
      private var var_764:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2637;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2636;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1818;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_765;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_764;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1818 = [];
         this.var_765 = [];
         this.var_764 = [];
         this.var_2637 = param1.readBoolean();
         this.var_2636 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1818.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_765.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_764.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
