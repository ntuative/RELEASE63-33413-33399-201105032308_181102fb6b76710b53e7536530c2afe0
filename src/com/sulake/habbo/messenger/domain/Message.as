package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_949:int = 1;
      
      public static const const_948:int = 2;
      
      public static const const_920:int = 3;
      
      public static const const_1185:int = 4;
      
      public static const const_738:int = 5;
      
      public static const const_1306:int = 6;
       
      
      private var _type:int;
      
      private var var_1286:int;
      
      private var var_2236:String;
      
      private var var_2505:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1286 = param2;
         this.var_2236 = param3;
         this.var_2505 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2236;
      }
      
      public function get time() : String
      {
         return this.var_2505;
      }
      
      public function get senderId() : int
      {
         return this.var_1286;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
