package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1525:int;
      
      private var var_1802:int;
      
      private var var_2735:int;
      
      private var var_1973:int;
      
      private var var_1526:int;
      
      private var var_2476:String = "";
      
      private var var_2907:String = "";
      
      private var var_2908:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1525 = param1.readInteger();
         this.var_2476 = param1.readString();
         this.var_1802 = param1.readInteger();
         this.var_2735 = param1.readInteger();
         this.var_1973 = param1.readInteger();
         this.var_1526 = param1.readInteger();
         this.var_2908 = param1.readInteger();
         this.var_2907 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1525;
      }
      
      public function get points() : int
      {
         return this.var_1802;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2735;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1973;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1526;
      }
      
      public function get badgeID() : String
      {
         return this.var_2476;
      }
      
      public function get achievementID() : int
      {
         return this.var_2908;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2907;
      }
   }
}
