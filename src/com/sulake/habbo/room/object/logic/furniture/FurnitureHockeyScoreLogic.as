package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   
   public class FurnitureHockeyScoreLogic extends FurnitureLogic
   {
       
      
      public function FurnitureHockeyScoreLogic()
      {
         super();
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:Array = [RoomObjectStateChangeEvent.const_86];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:int = object.getId();
         var _loc4_:String = object.getType();
         switch(param1.type)
         {
            case MouseEvent.DOUBLE_CLICK:
               switch(param1.spriteTag)
               {
                  case "off":
                     _loc6_ = new RoomObjectStateChangeEvent(RoomObjectStateChangeEvent.const_86,_loc3_,_loc4_,3);
               }
               break;
            case MouseEvent.CLICK:
               switch(param1.spriteTag)
               {
                  case "inc":
                     _loc6_ = new RoomObjectStateChangeEvent(RoomObjectStateChangeEvent.const_86,_loc3_,_loc4_,2);
                     break;
                  case "dec":
                     _loc6_ = new RoomObjectStateChangeEvent(RoomObjectStateChangeEvent.const_86,_loc3_,_loc4_,1);
               }
         }
         if(eventDispatcher != null && _loc6_ != null)
         {
            eventDispatcher.dispatchEvent(_loc6_);
         }
         else
         {
            super.mouseEvent(param1,param2);
         }
      }
   }
}
