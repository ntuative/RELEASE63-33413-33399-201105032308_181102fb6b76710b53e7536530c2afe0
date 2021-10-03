package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_195:int;
      
      private var var_2266:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_195 = param1;
         this.var_2266 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_195,this.var_2266];
      }
      
      public function dispose() : void
      {
      }
   }
}
