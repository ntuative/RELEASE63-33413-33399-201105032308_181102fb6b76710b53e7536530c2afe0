package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2040:int = 1;
      
      public static const const_1815:int = 2;
       
      
      private var var_1059:String;
      
      private var var_2622:int;
      
      private var var_2616:int;
      
      private var var_2618:int;
      
      private var var_2623:int;
      
      private var var_2617:Boolean;
      
      private var var_2294:Boolean;
      
      private var var_2296:int;
      
      private var var_2295:int;
      
      private var var_2621:Boolean;
      
      private var var_2619:int;
      
      private var var_2620:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1059 = param1.readString();
         this.var_2622 = param1.readInteger();
         this.var_2616 = param1.readInteger();
         this.var_2618 = param1.readInteger();
         this.var_2623 = param1.readInteger();
         this.var_2617 = param1.readBoolean();
         this.var_2294 = param1.readBoolean();
         this.var_2296 = param1.readInteger();
         this.var_2295 = param1.readInteger();
         this.var_2621 = param1.readBoolean();
         this.var_2619 = param1.readInteger();
         this.var_2620 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1059;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2622;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2616;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2618;
      }
      
      public function get responseType() : int
      {
         return this.var_2623;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2617;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2294;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2296;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2295;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2621;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2619;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2620;
      }
   }
}
