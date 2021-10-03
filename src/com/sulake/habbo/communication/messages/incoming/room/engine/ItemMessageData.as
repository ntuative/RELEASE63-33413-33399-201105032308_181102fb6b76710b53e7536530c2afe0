package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2181:Boolean = false;
      
      private var var_2180:int = 0;
      
      private var var_2183:int = 0;
      
      private var var_2179:int = 0;
      
      private var var_2182:int = 0;
      
      private var var_165:Number = 0;
      
      private var var_164:Number = 0;
      
      private var var_417:String = "";
      
      private var _type:int = 0;
      
      private var var_2984:String = "";
      
      private var var_1478:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_178:Boolean = false;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2181 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_178 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2181;
      }
      
      public function get wallX() : Number
      {
         return this.var_2180;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_178)
         {
            this.var_2180 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2183;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_178)
         {
            this.var_2183 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2179;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_178)
         {
            this.var_2179 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2182;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_178)
         {
            this.var_2182 = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_165;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_178)
         {
            this.var_165 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_164;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_178)
         {
            this.var_164 = param1;
         }
      }
      
      public function get dir() : String
      {
         return this.var_417;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_178)
         {
            this.var_417 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_178)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_178)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_178)
         {
            this._data = param1;
         }
      }
   }
}
