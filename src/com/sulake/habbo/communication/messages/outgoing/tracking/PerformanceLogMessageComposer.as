package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2246:int = 0;
      
      private var var_1455:String = "";
      
      private var var_1831:String = "";
      
      private var var_2336:String = "";
      
      private var var_2335:String = "";
      
      private var var_1741:int = 0;
      
      private var var_2339:int = 0;
      
      private var var_2338:int = 0;
      
      private var var_1456:int = 0;
      
      private var var_2337:int = 0;
      
      private var var_1454:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2246 = param1;
         this.var_1455 = param2;
         this.var_1831 = param3;
         this.var_2336 = param4;
         this.var_2335 = param5;
         if(param6)
         {
            this.var_1741 = 1;
         }
         else
         {
            this.var_1741 = 0;
         }
         this.var_2339 = param7;
         this.var_2338 = param8;
         this.var_1456 = param9;
         this.var_2337 = param10;
         this.var_1454 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2246,this.var_1455,this.var_1831,this.var_2336,this.var_2335,this.var_1741,this.var_2339,this.var_2338,this.var_1456,this.var_2337,this.var_1454];
      }
   }
}
