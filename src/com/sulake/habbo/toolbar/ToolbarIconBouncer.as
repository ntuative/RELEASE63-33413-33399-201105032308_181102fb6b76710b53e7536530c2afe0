package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2325:Number;
      
      private var var_2088:Number;
      
      private var var_921:Number;
      
      private var var_416:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2325 = param1;
         this.var_2088 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_921 = param1;
         this.var_416 = 0;
      }
      
      public function update() : void
      {
         this.var_921 += this.var_2088;
         this.var_416 += this.var_921;
         if(this.var_416 > 0)
         {
            this.var_416 = 0;
            this.var_921 = this.var_2325 * -1 * this.var_921;
         }
      }
      
      public function get location() : Number
      {
         return this.var_416;
      }
   }
}
