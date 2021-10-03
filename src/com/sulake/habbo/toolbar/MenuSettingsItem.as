package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2170:String;
      
      private var var_2462:Array;
      
      private var var_2461:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2170 = param1;
         this.var_2462 = param2;
         this.var_2461 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2170;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2462;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2461;
      }
   }
}
