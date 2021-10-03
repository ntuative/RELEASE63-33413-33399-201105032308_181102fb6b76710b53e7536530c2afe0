package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2383:int;
      
      private var var_1509:String;
      
      private var var_2380:int;
      
      private var var_2376:int;
      
      private var _category:int;
      
      private var var_2136:String;
      
      private var var_1478:int;
      
      private var var_2377:int;
      
      private var var_2378:int;
      
      private var var_2381:int;
      
      private var var_2382:int;
      
      private var var_2379:Boolean;
      
      private var var_2997:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2383 = param1;
         this.var_1509 = param2;
         this.var_2380 = param3;
         this.var_2376 = param4;
         this._category = param5;
         this.var_2136 = param6;
         this.var_1478 = param7;
         this.var_2377 = param8;
         this.var_2378 = param9;
         this.var_2381 = param10;
         this.var_2382 = param11;
         this.var_2379 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2383;
      }
      
      public function get itemType() : String
      {
         return this.var_1509;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2380;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2376;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2136;
      }
      
      public function get extra() : int
      {
         return this.var_1478;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2377;
      }
      
      public function get creationDay() : int
      {
         return this.var_2378;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2381;
      }
      
      public function get creationYear() : int
      {
         return this.var_2382;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2379;
      }
      
      public function get songID() : int
      {
         return this.var_1478;
      }
   }
}
