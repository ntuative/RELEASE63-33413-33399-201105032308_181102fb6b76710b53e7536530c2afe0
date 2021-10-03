package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_337:int;
      
      private var var_828:Boolean;
      
      private var var_978:String;
      
      private var _ownerName:String;
      
      private var var_2304:int;
      
      private var var_2199:int;
      
      private var var_2600:int;
      
      private var var_1988:String;
      
      private var var_2602:int;
      
      private var var_2603:Boolean;
      
      private var var_744:int;
      
      private var var_1541:int;
      
      private var var_2598:String;
      
      private var var_875:Array;
      
      private var var_2601:RoomThumbnailData;
      
      private var var_2300:Boolean;
      
      private var var_2599:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_875 = new Array();
         super();
         this.var_337 = param1.readInteger();
         this.var_828 = param1.readBoolean();
         this.var_978 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2304 = param1.readInteger();
         this.var_2199 = param1.readInteger();
         this.var_2600 = param1.readInteger();
         this.var_1988 = param1.readString();
         this.var_2602 = param1.readInteger();
         this.var_2603 = param1.readBoolean();
         this.var_744 = param1.readInteger();
         this.var_1541 = param1.readInteger();
         this.var_2598 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_875.push(_loc4_);
            _loc3_++;
         }
         this.var_2601 = new RoomThumbnailData(param1);
         this.var_2300 = param1.readBoolean();
         this.var_2599 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_337;
      }
      
      public function get event() : Boolean
      {
         return this.var_828;
      }
      
      public function get roomName() : String
      {
         return this.var_978;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2304;
      }
      
      public function get userCount() : int
      {
         return this.var_2199;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2600;
      }
      
      public function get description() : String
      {
         return this.var_1988;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2602;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2603;
      }
      
      public function get score() : int
      {
         return this.var_744;
      }
      
      public function get categoryId() : int
      {
         return this.var_1541;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2598;
      }
      
      public function get tags() : Array
      {
         return this.var_875;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2601;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2300;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2599;
      }
   }
}
