package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2666:String;
      
      private var var_1932:String;
      
      private var var_2665:String;
      
      private var var_1931:Boolean;
      
      private var var_1930:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2666 = String(param1["set-type"]);
         this.var_1932 = String(param1["flipped-set-type"]);
         this.var_2665 = String(param1["remove-set-type"]);
         this.var_1931 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1930 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1930;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1930 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2666;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1932;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2665;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1931;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1931 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1932 = param1;
      }
   }
}
