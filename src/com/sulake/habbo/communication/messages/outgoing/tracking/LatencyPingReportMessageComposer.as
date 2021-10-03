package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2360:int;
      
      private var var_2358:int;
      
      private var var_2359:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2360 = param1;
         this.var_2358 = param2;
         this.var_2359 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2360,this.var_2358,this.var_2359];
      }
      
      public function dispose() : void
      {
      }
   }
}
