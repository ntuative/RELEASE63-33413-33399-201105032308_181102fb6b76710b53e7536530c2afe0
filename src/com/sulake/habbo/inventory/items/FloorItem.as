package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2136:String;
      
      protected var var_1478:Number;
      
      protected var var_2917:Boolean;
      
      protected var var_2918:Boolean;
      
      protected var var_2379:Boolean;
      
      protected var var_2608:Boolean;
      
      protected var var_2919:int;
      
      protected var var_2378:int;
      
      protected var var_2381:int;
      
      protected var var_2382:int;
      
      protected var var_1946:String;
      
      protected var var_1886:int;
      
      protected var var_997:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2379 = param5;
         this.var_2918 = param6;
         this.var_2917 = param7;
         this.var_2608 = param8;
         this.var_2136 = param9;
         this.var_1478 = param10;
         this.var_2919 = param11;
         this.var_2378 = param12;
         this.var_2381 = param13;
         this.var_2382 = param14;
         this.var_1946 = param15;
         this.var_1886 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2136;
      }
      
      public function get extra() : Number
      {
         return this.var_1478;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2917;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2918;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2379;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2608;
      }
      
      public function get expires() : int
      {
         return this.var_2919;
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
      
      public function get slotId() : String
      {
         return this.var_1946;
      }
      
      public function get songId() : int
      {
         return this.var_1886;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_997 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_997;
      }
   }
}
