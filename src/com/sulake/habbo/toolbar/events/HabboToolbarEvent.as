package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_70:String = "HTE_INITIALIZED";
      
      public static const const_37:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_534:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_869:String = "HTE_TOOLBAR_RESIZED";
      
      public static const const_357:String = "HTE_TOOLBAR_STATE_HOTEL_VIEW";
      
      public static const const_314:String = "HTE_TOOLBAR_STATE_ROOM_VIEW";
       
      
      private var var_783:String;
      
      private var var_539:String;
      
      private var var_1211:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_783 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_783;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_539 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_539;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1211 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1211;
      }
   }
}
