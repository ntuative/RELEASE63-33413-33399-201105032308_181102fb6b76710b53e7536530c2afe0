package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1525:int;
      
      private var var_317:String;
      
      private var var_2734:int;
      
      private var var_2735:int;
      
      private var var_1973:int;
      
      private var var_2733:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1525 = param1.readInteger();
         this.var_317 = param1.readString();
         this.var_2734 = param1.readInteger();
         this.var_2735 = param1.readInteger();
         this.var_1973 = param1.readInteger();
         this.var_2733 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_317;
      }
      
      public function get level() : int
      {
         return this.var_1525;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2734;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2735;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1973;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2733;
      }
   }
}
