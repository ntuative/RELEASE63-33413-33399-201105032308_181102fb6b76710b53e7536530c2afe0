package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_2096:String = "i";
      
      public static const const_1905:String = "s";
      
      public static const const_2038:String = "e";
       
      
      private var _type:String;
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_2704:int;
      
      private var _revision:int;
      
      private var var_2701:int;
      
      private var var_2702:int;
      
      private var var_2703:int;
      
      private var var_952:Array;
      
      private var _title:String;
      
      private var var_1988:String;
      
      private var var_2705:String;
      
      private var var_2413:int;
      
      private var _offerId:int;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String, param13:int, param14:int)
      {
         super();
         this._type = param1;
         this._id = param2;
         this._name = param3;
         this.var_2704 = param4;
         this._revision = param5;
         this.var_2701 = param6;
         this.var_2702 = param7;
         this.var_2703 = param8;
         this.var_952 = param9;
         this._title = param10;
         this.var_1988 = param11;
         this.var_2705 = param12;
         this.var_2413 = param13;
         this._offerId = param14;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get colourIndex() : int
      {
         return this.var_2704;
      }
      
      public function get revision() : int
      {
         return this._revision;
      }
      
      public function get tileSizeX() : int
      {
         return this.var_2701;
      }
      
      public function get tileSizeY() : int
      {
         return this.var_2702;
      }
      
      public function get tileSizeZ() : int
      {
         return this.var_2703;
      }
      
      public function get colours() : Array
      {
         return this.var_952;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get description() : String
      {
         return this.var_1988;
      }
      
      public function get adUrl() : String
      {
         return this.var_2705;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2413;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
   }
}
