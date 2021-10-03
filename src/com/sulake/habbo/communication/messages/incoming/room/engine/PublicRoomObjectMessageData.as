package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var _name:String = "";
      
      private var _type:String = "";
      
      private var _x:Number = 0;
      
      private var var_165:Number = 0;
      
      private var var_164:Number = 0;
      
      private var var_417:int = 0;
      
      private var var_484:int = 0;
      
      private var var_591:int = 0;
      
      private var var_178:Boolean = false;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function setReadOnly() : void
      {
         this.var_178 = true;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(!this.var_178)
         {
            this._type = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_178)
         {
            this._name = param1;
         }
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_178)
         {
            this._x = param1;
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
      
      public function get dir() : int
      {
         return this.var_417;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_417 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_484;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_484 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_591;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_591 = param1;
         }
      }
   }
}
