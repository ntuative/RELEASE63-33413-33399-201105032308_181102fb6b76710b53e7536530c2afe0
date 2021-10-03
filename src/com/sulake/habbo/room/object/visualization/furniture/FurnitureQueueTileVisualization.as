package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1348:int = 3;
      
      private static const const_1342:int = 2;
      
      private static const const_1344:int = 1;
      
      private static const const_1343:int = 15;
       
      
      private var var_300:Array;
      
      private var var_1117:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_300 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1342)
         {
            this.var_300 = new Array();
            this.var_300.push(const_1344);
            this.var_1117 = const_1343;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1117 > 0)
         {
            --this.var_1117;
         }
         if(this.var_1117 == 0)
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
