package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1740:String;
      
      private var var_1868:int;
      
      private var var_2548:Boolean;
      
      private var var_2551:Boolean;
      
      private var var_2553:int;
      
      private var var_2552:int;
      
      private var var_351:ICatalogPage;
      
      private var var_2547:int;
      
      private var var_2550:int;
      
      private var var_2549:int;
      
      private var var_1443:String;
      
      private var var_2546:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1740 = param2;
         this.var_1868 = param3;
         this.var_2548 = param4;
         this.var_2551 = param5;
         this.var_2553 = param6;
         this.var_2552 = param7;
         this.var_2547 = param8;
         this.var_2550 = param9;
         this.var_2549 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get extraParameter() : String
      {
         return this.var_1443;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1443 = param1;
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_195;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1868;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_351;
      }
      
      public function get priceType() : String
      {
         return Offer.const_703;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1740;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_351 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2546;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2546 = param1;
      }
   }
}
