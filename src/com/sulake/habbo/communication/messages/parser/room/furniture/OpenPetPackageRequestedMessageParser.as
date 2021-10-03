package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageRequestedMessageParser implements IMessageParser
   {
       
      
      private var var_195:int = -1;
      
      private var var_1191:int = -1;
      
      private var var_1837:int = -1;
      
      private var _color:String = "";
      
      public function OpenPetPackageRequestedMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_195;
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
      
      public function flush() : Boolean
      {
         this.var_195 = -1;
         this.var_1191 = -1;
         this.var_1837 = -1;
         this._color = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_195 = param1.readInteger();
         this.var_1191 = param1.readInteger();
         this.var_1837 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
   }
}
