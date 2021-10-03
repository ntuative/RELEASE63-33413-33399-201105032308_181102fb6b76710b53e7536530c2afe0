package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowLinkEvent extends WindowEvent
   {
      
      public static const const_1534:String = "WE_LINK";
      
      private static const POOL:Array = [];
       
      
      private var var_2051:String;
      
      public function WindowLinkEvent()
      {
         super();
         _type = const_1534;
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow) : WindowEvent
      {
         var _loc4_:WindowLinkEvent = POOL.length > 0 ? POOL.pop() : new WindowLinkEvent();
         _loc4_.var_2051 = param1;
         _loc4_._window = param2;
         _loc4_.var_710 = param3;
         _loc4_.var_477 = false;
         _loc4_.var_709 = POOL;
         return _loc4_;
      }
      
      public function get link() : String
      {
         return this.var_2051;
      }
      
      override public function clone() : WindowEvent
      {
         return allocate(this.var_2051,window,related);
      }
      
      override public function toString() : String
      {
         return "WindowLinkEvent { type: " + _type + " link: " + this.link + " cancelable: " + var_480 + " window: " + _window + " }";
      }
   }
}
