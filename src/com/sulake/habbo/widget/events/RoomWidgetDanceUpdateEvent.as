package com.sulake.habbo.widget.events
{
   public class RoomWidgetDanceUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_889:String = "RWUE_DANCE";
       
      
      private var var_77:int;
      
      public function RoomWidgetDanceUpdateEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_889,param2,param3);
         this.var_77 = param1;
      }
      
      public function get style() : int
      {
         return this.var_77;
      }
   }
}
