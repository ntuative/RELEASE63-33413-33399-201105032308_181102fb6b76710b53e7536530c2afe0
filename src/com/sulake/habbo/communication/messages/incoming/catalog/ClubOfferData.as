package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1740:String;
      
      private var var_1868:int;
      
      private var var_2548:Boolean;
      
      private var var_2551:Boolean;
      
      private var var_2553:int;
      
      private var var_2552:int;
      
      private var var_2547:int;
      
      private var var_2550:int;
      
      private var var_2549:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1740 = param1.readString();
         this.var_1868 = param1.readInteger();
         this.var_2548 = param1.readBoolean();
         this.var_2551 = param1.readBoolean();
         this.var_2553 = param1.readInteger();
         this.var_2552 = param1.readInteger();
         this.var_2547 = param1.readInteger();
         this.var_2550 = param1.readInteger();
         this.var_2549 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1740;
      }
      
      public function get price() : int
      {
         return this.var_1868;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2548;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2551;
      }
      
      public function get periods() : int
      {
         return this.var_2553;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2552;
      }
      
      public function get year() : int
      {
         return this.var_2547;
      }
      
      public function get month() : int
      {
         return this.var_2550;
      }
      
      public function get day() : int
      {
         return this.var_2549;
      }
   }
}
