package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_248:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2629:int = 0;
      
      private var var_2627:int = 0;
      
      private var var_2628:int = 0;
      
      private var var_2630:Boolean = false;
      
      private var var_2173:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_248,param6,param7);
         this.var_2629 = param1;
         this.var_2627 = param2;
         this.var_2628 = param3;
         this.var_2630 = param4;
         this.var_2173 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2629;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2627;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2628;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2630;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2173;
      }
   }
}
