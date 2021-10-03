package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_945:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1227:String = "inventory_effects";
      
      public static const const_1197:String = "inventory_badges";
      
      public static const const_1799:String = "inventory_clothes";
      
      public static const const_1655:String = "inventory_furniture";
       
      
      private var var_2769:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_945);
         this.var_2769 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2769;
      }
   }
}
