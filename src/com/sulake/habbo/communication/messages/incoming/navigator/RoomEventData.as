package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1212:Boolean;
      
      private var var_2563:int;
      
      private var var_2564:String;
      
      private var var_337:int;
      
      private var var_2568:int;
      
      private var var_2566:String;
      
      private var var_2567:String;
      
      private var var_2565:String;
      
      private var var_875:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_875 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1212 = false;
            return;
         }
         this.var_1212 = true;
         this.var_2563 = int(_loc2_);
         this.var_2564 = param1.readString();
         this.var_337 = int(param1.readString());
         this.var_2568 = param1.readInteger();
         this.var_2566 = param1.readString();
         this.var_2567 = param1.readString();
         this.var_2565 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_875.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_875 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2563;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2564;
      }
      
      public function get flatId() : int
      {
         return this.var_337;
      }
      
      public function get eventType() : int
      {
         return this.var_2568;
      }
      
      public function get eventName() : String
      {
         return this.var_2566;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2567;
      }
      
      public function get creationTime() : String
      {
         return this.var_2565;
      }
      
      public function get tags() : Array
      {
         return this.var_875;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1212;
      }
   }
}
