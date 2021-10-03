package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_732:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_317:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_732);
         this.var_317 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_317;
      }
   }
}
