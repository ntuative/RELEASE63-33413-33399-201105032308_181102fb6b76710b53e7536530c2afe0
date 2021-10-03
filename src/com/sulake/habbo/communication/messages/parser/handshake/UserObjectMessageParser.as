package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_652:String;
      
      private var var_1029:String;
      
      private var var_2163:String;
      
      private var var_1656:String;
      
      private var var_2164:int;
      
      private var var_2167:String;
      
      private var var_2165:int;
      
      private var var_2169:int;
      
      private var var_2166:int;
      
      private var _respectLeft:int;
      
      private var var_848:int;
      
      private var var_2168:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_652 = param1.readString();
         this.var_1029 = param1.readString();
         this.var_2163 = param1.readString();
         this.var_1656 = param1.readString();
         this.var_2164 = param1.readInteger();
         this.var_2167 = param1.readString();
         this.var_2165 = param1.readInteger();
         this.var_2169 = param1.readInteger();
         this.var_2166 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_848 = param1.readInteger();
         this.var_2168 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_652;
      }
      
      public function get sex() : String
      {
         return this.var_1029;
      }
      
      public function get customData() : String
      {
         return this.var_2163;
      }
      
      public function get realName() : String
      {
         return this.var_1656;
      }
      
      public function get tickets() : int
      {
         return this.var_2164;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2167;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2165;
      }
      
      public function get directMail() : int
      {
         return this.var_2169;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2166;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_848;
      }
      
      public function get identityId() : int
      {
         return this.var_2168;
      }
   }
}
