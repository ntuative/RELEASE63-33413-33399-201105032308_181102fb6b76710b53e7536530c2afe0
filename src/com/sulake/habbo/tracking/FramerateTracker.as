package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1813:int;
      
      private var var_2454:int;
      
      private var var_808:int;
      
      private var var_510:Number;
      
      private var var_2455:Boolean;
      
      private var var_2456:int;
      
      private var var_1812:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_510);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2454 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2456 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2455 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_808;
         if(this.var_808 == 1)
         {
            this.var_510 = param1;
            this.var_1813 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_808);
            this.var_510 = this.var_510 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2455 && param3 - this.var_1813 >= this.var_2454)
         {
            this.var_808 = 0;
            if(this.var_1812 < this.var_2456)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1812;
               this.var_1813 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
