package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2660:int;
      
      private var var_2871:int;
      
      private var var_1311:int;
      
      private var var_1313:int;
      
      private var var_2079:int;
      
      private var var_2872:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2660 = param1.readInteger();
         this.var_2871 = param1.readInteger();
         this.var_1311 = param1.readInteger();
         this.var_1313 = param1.readInteger();
         this.var_2079 = param1.readInteger();
         this.var_2872 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2660;
      }
      
      public function get charges() : int
      {
         return this.var_2871;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1311;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1313;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2872;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2079;
      }
   }
}
