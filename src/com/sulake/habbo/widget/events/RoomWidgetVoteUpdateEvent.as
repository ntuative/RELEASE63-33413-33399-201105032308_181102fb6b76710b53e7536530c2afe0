package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_149:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_143:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1221:String;
      
      private var var_1380:Array;
      
      private var var_1238:Array;
      
      private var var_1695:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1221 = param2;
         this.var_1380 = param3;
         this.var_1238 = param4;
         if(this.var_1238 == null)
         {
            this.var_1238 = [];
         }
         this.var_1695 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1221;
      }
      
      public function get choices() : Array
      {
         return this.var_1380.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1238.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1695;
      }
   }
}
