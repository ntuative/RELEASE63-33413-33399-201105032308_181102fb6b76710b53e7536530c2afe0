package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_64:String = "i";
      
      public static const const_82:String = "s";
      
      public static const const_224:String = "e";
       
      
      private var var_1399:String;
      
      private var var_2859:int;
      
      private var var_1144:String;
      
      private var _productCount:int;
      
      private var var_1744:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1399 = param1.readString();
         this.var_2859 = param1.readInteger();
         this.var_1144 = param1.readString();
         this._productCount = param1.readInteger();
         this.var_1744 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1399;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2859;
      }
      
      public function get extraParam() : String
      {
         return this.var_1144;
      }
      
      public function get productCount() : int
      {
         return this._productCount;
      }
      
      public function get expiration() : int
      {
         return this.var_1744;
      }
   }
}
