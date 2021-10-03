package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2320:int;
      
      private var var_1777:String;
      
      private var var_2324:String;
      
      private var var_2319:Boolean;
      
      private var var_2318:Boolean;
      
      private var var_2322:int;
      
      private var var_2321:String;
      
      private var var_2323:String;
      
      private var var_1656:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2320 = param1.readInteger();
         this.var_1777 = param1.readString();
         this.var_2324 = param1.readString();
         this.var_2319 = param1.readBoolean();
         this.var_2318 = param1.readBoolean();
         param1.readString();
         this.var_2322 = param1.readInteger();
         this.var_2321 = param1.readString();
         this.var_2323 = param1.readString();
         this.var_1656 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2320;
      }
      
      public function get avatarName() : String
      {
         return this.var_1777;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2324;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2319;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2318;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2322;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2321;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2323;
      }
      
      public function get realName() : String
      {
         return this.var_1656;
      }
   }
}
