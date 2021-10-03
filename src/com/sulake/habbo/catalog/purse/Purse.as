package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_195:int = 0;
       
      
      private var var_1947:int = 0;
      
      private var var_1392:Dictionary;
      
      private var var_1730:int = 0;
      
      private var var_1729:int = 0;
      
      private var var_2294:Boolean = false;
      
      private var var_2296:int = 0;
      
      private var var_2295:int = 0;
      
      public function Purse()
      {
         this.var_1392 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1947;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1947 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1730;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1730 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1729;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1729 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1730 > 0 || this.var_1729 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2294;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2294 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2296;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2296 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2295;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2295 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1392;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1392 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1392[param1];
      }
   }
}
