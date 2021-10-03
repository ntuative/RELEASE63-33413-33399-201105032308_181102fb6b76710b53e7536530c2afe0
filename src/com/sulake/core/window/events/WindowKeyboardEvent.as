package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class WindowKeyboardEvent extends WindowEvent
   {
      
      public static const const_328:String = "WKE_KEY_UP";
      
      public static const const_187:String = "WKE_KEY_DOWN";
      
      private static const POOL:Array = [];
       
      
      private var var_828:KeyboardEvent;
      
      public function WindowKeyboardEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:Event, param3:IWindow, param4:IWindow, param5:Boolean = false) : WindowKeyboardEvent
      {
         var _loc6_:WindowKeyboardEvent = POOL.length > 0 ? POOL.pop() : new WindowKeyboardEvent();
         _loc6_._type = param1;
         _loc6_.var_828 = param2 as KeyboardEvent;
         _loc6_._window = param3;
         _loc6_.var_710 = param4;
         _loc6_.var_477 = false;
         _loc6_.var_480 = param5;
         _loc6_.var_709 = POOL;
         return _loc6_;
      }
      
      public function get charCode() : uint
      {
         return this.var_828.charCode;
      }
      
      public function get keyCode() : uint
      {
         return this.var_828.keyCode;
      }
      
      public function get keyLocation() : uint
      {
         return this.var_828.keyLocation;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_828.altKey;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_828.shiftKey;
      }
      
      override public function clone() : WindowEvent
      {
         return allocate(_type,this.var_828,window,related,cancelable);
      }
      
      override public function toString() : String
      {
         return "WindowKeyboardEvent { type: " + _type + " cancelable: " + var_480 + " window: " + _window + " charCode: " + this.charCode + " }";
      }
   }
}
