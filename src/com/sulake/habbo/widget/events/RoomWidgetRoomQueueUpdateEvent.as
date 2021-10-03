package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_433:String = "RWRQUE_VISITOR_QUEUE_STATUS";
      
      public static const const_619:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
       
      
      private var var_1137:int;
      
      private var var_2541:Boolean;
      
      private var var_365:Boolean;
      
      private var var_1647:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1137 = param2;
         this.var_2541 = param3;
         this.var_365 = param4;
         this.var_1647 = param5;
      }
      
      public function get position() : int
      {
         return this.var_1137;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return this.var_2541;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_365;
      }
      
      public function get isClubQueue() : Boolean
      {
         return this.var_1647;
      }
   }
}
