package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2333:int;
      
      private var var_2331:int;
      
      private var var_2334:String;
      
      private var var_2332:int;
      
      private var var_2330:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2333 = param1;
         this.var_2331 = param2;
         this.var_2334 = param3;
         this.var_2332 = param4;
         this.var_2330 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2333,this.var_2331,this.var_2334,this.var_2332,int(this.var_2330)];
      }
      
      public function dispose() : void
      {
      }
   }
}
