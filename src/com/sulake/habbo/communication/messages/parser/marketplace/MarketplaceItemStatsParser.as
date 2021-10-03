package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2395:int;
      
      private var var_2392:int;
      
      private var var_2396:int;
      
      private var _dayOffsets:Array;
      
      private var var_1774:Array;
      
      private var var_1775:Array;
      
      private var var_2394:int;
      
      private var var_2393:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2395;
      }
      
      public function get offerCount() : int
      {
         return this.var_2392;
      }
      
      public function get historyLength() : int
      {
         return this.var_2396;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1774;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1775;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2394;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2393;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2395 = param1.readInteger();
         this.var_2392 = param1.readInteger();
         this.var_2396 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1774 = [];
         this.var_1775 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1774.push(param1.readInteger());
            this.var_1775.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2393 = param1.readInteger();
         this.var_2394 = param1.readInteger();
         return true;
      }
   }
}
