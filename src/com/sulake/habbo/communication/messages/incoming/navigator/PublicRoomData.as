package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2614:String;
      
      private var var_2307:int;
      
      private var var_2273:int;
      
      private var var_2308:String;
      
      private var var_2615:int;
      
      private var var_1644:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2614 = param1.readString();
         this.var_2307 = param1.readInteger();
         this.var_2273 = param1.readInteger();
         this.var_2308 = param1.readString();
         this.var_2615 = param1.readInteger();
         this.var_1644 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2614;
      }
      
      public function get unitPort() : int
      {
         return this.var_2307;
      }
      
      public function get worldId() : int
      {
         return this.var_2273;
      }
      
      public function get castLibs() : String
      {
         return this.var_2308;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2615;
      }
      
      public function get nodeId() : int
      {
         return this.var_1644;
      }
   }
}
