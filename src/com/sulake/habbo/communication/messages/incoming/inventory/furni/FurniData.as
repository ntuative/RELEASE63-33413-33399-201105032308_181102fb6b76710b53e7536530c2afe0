package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2190:int;
      
      private var var_1509:String;
      
      private var _objId:int;
      
      private var var_2083:int;
      
      private var _category:int;
      
      private var var_2136:String;
      
      private var var_2543:Boolean;
      
      private var var_2544:Boolean;
      
      private var var_2545:Boolean;
      
      private var var_2537:Boolean;
      
      private var var_2374:int;
      
      private var var_1478:int;
      
      private var var_1946:String = "";
      
      private var var_1886:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2190 = param1;
         this.var_1509 = param2;
         this._objId = param3;
         this.var_2083 = param4;
         this._category = param5;
         this.var_2136 = param6;
         this.var_2543 = param7;
         this.var_2544 = param8;
         this.var_2545 = param9;
         this.var_2537 = param10;
         this.var_2374 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1946 = param1;
         this.var_1478 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2190;
      }
      
      public function get itemType() : String
      {
         return this.var_1509;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_2083;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2136;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2543;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2544;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2545;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2537;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2374;
      }
      
      public function get slotId() : String
      {
         return this.var_1946;
      }
      
      public function get songId() : int
      {
         return this.var_1886;
      }
      
      public function get extra() : int
      {
         return this.var_1478;
      }
   }
}
