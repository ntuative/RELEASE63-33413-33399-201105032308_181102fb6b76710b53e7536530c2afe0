package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2248:int;
      
      private var var_2250:int;
      
      private var var_749:Boolean;
      
      private var var_2251:int;
      
      private var var_2249:int;
      
      private var var_2247:int;
      
      private var var_2252:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2248 = param1.readInteger();
         this.var_2250 = param1.readInteger();
         this.var_749 = param1.readBoolean();
         this.var_2251 = param1.readInteger();
         this.var_2249 = param1.readInteger();
         this.var_2247 = param1.readInteger();
         this.var_2252 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2248;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2250;
      }
      
      public function get online() : Boolean
      {
         return this.var_749;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2251;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2249;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2247;
      }
      
      public function get banCount() : int
      {
         return this.var_2252;
      }
   }
}
