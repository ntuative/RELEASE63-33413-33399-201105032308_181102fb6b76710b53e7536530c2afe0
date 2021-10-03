package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1889:int;
      
      private var var_2266:String;
      
      private var var_1525:int;
      
      private var var_1191:int;
      
      private var var_1837:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1889 = param1.readInteger();
         this.var_2266 = param1.readString();
         this.var_1525 = param1.readInteger();
         this.var_1191 = param1.readInteger();
         this.var_1837 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1889;
      }
      
      public function get petName() : String
      {
         return this.var_2266;
      }
      
      public function get level() : int
      {
         return this.var_1525;
      }
      
      public function get petType() : int
      {
         return this.var_1191;
      }
      
      public function get breed() : int
      {
         return this.var_1837;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
