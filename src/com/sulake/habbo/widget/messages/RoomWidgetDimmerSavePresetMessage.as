package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_919:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2333:int;
      
      private var var_2331:int;
      
      private var _color:uint;
      
      private var var_1141:int;
      
      private var var_2894:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_919);
         this.var_2333 = param1;
         this.var_2331 = param2;
         this._color = param3;
         this.var_1141 = param4;
         this.var_2894 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2333;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2331;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1141;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2894;
      }
   }
}
