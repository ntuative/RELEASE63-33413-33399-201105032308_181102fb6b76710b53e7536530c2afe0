package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_622:String = "RWUAM_WHISPER_USER";
      
      public static const const_567:String = "RWUAM_IGNORE_USER";
      
      public static const const_645:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_441:String = "RWUAM_KICK_USER";
      
      public static const const_551:String = "RWUAM_BAN_USER";
      
      public static const const_635:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_600:String = "RWUAM_RESPECT_USER";
      
      public static const const_642:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_646:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_614:String = "RWUAM_START_TRADING";
      
      public static const const_953:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_527:String = "RWUAM_KICK_BOT";
      
      public static const const_477:String = "RWUAM_REPORT";
      
      public static const const_495:String = "RWUAM_PICKUP_PET";
      
      public static const const_1693:String = "RWUAM_TRAIN_PET";
      
      public static const const_583:String = " RWUAM_RESPECT_PET";
      
      public static const const_421:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_944:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
