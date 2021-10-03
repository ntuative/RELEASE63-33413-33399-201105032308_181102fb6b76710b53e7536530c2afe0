package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_999:int = 20;
      
      private static const const_655:int = 10;
      
      private static const const_1349:int = 31;
      
      private static const const_1348:int = 32;
      
      private static const const_656:int = 30;
       
      
      private var var_300:Array;
      
      private var var_717:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_300 = new Array();
         super();
         super.setAnimation(const_656);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_717)
            {
               this.var_717 = true;
               this.var_300 = new Array();
               this.var_300.push(const_1349);
               this.var_300.push(const_1348);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_655)
         {
            if(this.var_717)
            {
               this.var_717 = false;
               this.var_300 = new Array();
               if(direction == 2)
               {
                  this.var_300.push(const_999 + 5 - param1);
                  this.var_300.push(const_655 + 5 - param1);
               }
               else
               {
                  this.var_300.push(const_999 + param1);
                  this.var_300.push(const_655 + param1);
               }
               this.var_300.push(const_656);
               return;
            }
            super.setAnimation(const_656);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
         {
            if(this.var_300.length > 0)
            {
               super.setAnimation(this.var_300.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
