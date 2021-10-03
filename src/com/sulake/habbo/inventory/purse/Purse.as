package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1730:int = 0;
      
      private var var_1729:int = 0;
      
      private var var_2788:int = 0;
      
      private var var_2789:Boolean = false;
      
      private var var_2294:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1730 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1729 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2788 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2789 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2294 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1730;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1729;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2788;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2789;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2294;
      }
   }
}
