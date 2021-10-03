package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1886:int;
      
      private var var_1924:Number;
      
      private var var_2654:Number;
      
      private var var_2653:int;
      
      private var var_2656:Number;
      
      private var var_2655:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1886 = param1;
         this.var_1924 = param2;
         this.var_2654 = param3;
         this.var_2656 = param4;
         this.var_2655 = param5;
         this.var_2653 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1886;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1924 < 0)
         {
            return 0;
         }
         return this.var_1924 + (getTimer() - this.var_2653) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2654;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2656;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2655;
      }
   }
}
