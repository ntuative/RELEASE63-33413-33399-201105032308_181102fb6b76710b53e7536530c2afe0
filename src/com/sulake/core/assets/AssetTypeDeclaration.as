package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2827:String;
      
      private var var_2826:Class;
      
      private var var_2825:Class;
      
      private var var_2023:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2827 = param1;
         this.var_2826 = param2;
         this.var_2825 = param3;
         if(rest == null)
         {
            this.var_2023 = new Array();
         }
         else
         {
            this.var_2023 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2827;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2826;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2825;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_2023;
      }
   }
}
