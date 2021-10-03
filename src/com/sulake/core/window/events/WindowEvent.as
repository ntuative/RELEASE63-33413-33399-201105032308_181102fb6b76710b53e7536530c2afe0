package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1703:String = "WE_DESTROY";
      
      public static const const_307:String = "WE_DESTROYED";
      
      public static const const_1732:String = "WE_OPEN";
      
      public static const const_1798:String = "WE_OPENED";
      
      public static const const_1642:String = "WE_CLOSE";
      
      public static const const_1540:String = "WE_CLOSED";
      
      public static const const_1702:String = "WE_FOCUS";
      
      public static const const_349:String = "WE_FOCUSED";
      
      public static const const_1619:String = "WE_UNFOCUS";
      
      public static const const_1774:String = "WE_UNFOCUSED";
      
      public static const const_1594:String = "WE_ACTIVATE";
      
      public static const const_489:String = "WE_ACTIVATED";
      
      public static const const_1561:String = "WE_DEACTIVATE";
      
      public static const const_570:String = "WE_DEACTIVATED";
      
      public static const const_354:String = "WE_SELECT";
      
      public static const const_59:String = "WE_SELECTED";
      
      public static const const_605:String = "WE_UNSELECT";
      
      public static const const_572:String = "WE_UNSELECTED";
      
      public static const const_1791:String = "WE_LOCK";
      
      public static const const_1833:String = "WE_LOCKED";
      
      public static const const_1583:String = "WE_UNLOCK";
      
      public static const const_1675:String = "WE_UNLOCKED";
      
      public static const const_773:String = "WE_ENABLE";
      
      public static const const_269:String = "WE_ENABLED";
      
      public static const const_771:String = "WE_DISABLE";
      
      public static const const_207:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_296:String = "WE_RELOCATED";
      
      public static const const_1249:String = "WE_RESIZE";
      
      public static const const_41:String = "WE_RESIZED";
      
      public static const const_1674:String = "WE_MINIMIZE";
      
      public static const const_1575:String = "WE_MINIMIZED";
      
      public static const const_1652:String = "WE_MAXIMIZE";
      
      public static const const_1626:String = "WE_MAXIMIZED";
      
      public static const const_1736:String = "WE_RESTORE";
      
      public static const const_1818:String = "WE_RESTORED";
      
      public static const const_581:String = "WE_CHILD_ADDED";
      
      public static const const_398:String = "WE_CHILD_REMOVED";
      
      public static const const_198:String = "WE_CHILD_RELOCATED";
      
      public static const const_164:String = "WE_CHILD_RESIZED";
      
      public static const const_308:String = "WE_CHILD_ACTIVATED";
      
      public static const const_627:String = "WE_PARENT_ADDED";
      
      public static const const_1692:String = "WE_PARENT_REMOVED";
      
      public static const const_1715:String = "WE_PARENT_RELOCATED";
      
      public static const const_820:String = "WE_PARENT_RESIZED";
      
      public static const const_1154:String = "WE_PARENT_ACTIVATED";
      
      public static const const_173:String = "WE_OK";
      
      public static const const_606:String = "WE_CANCEL";
      
      public static const const_107:String = "WE_CHANGE";
      
      public static const const_598:String = "WE_SCROLL";
      
      public static const const_172:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_710:IWindow;
      
      protected var var_1088:Boolean;
      
      protected var var_480:Boolean;
      
      protected var var_477:Boolean;
      
      protected var var_709:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_710 = param3;
         _loc5_.var_480 = param4;
         _loc5_.var_477 = false;
         _loc5_.var_709 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_710;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_480;
      }
      
      public function recycle() : void
      {
         if(this.var_477)
         {
            throw new Error("Event already recycled!");
         }
         this.var_710 = null;
         this._window = null;
         this.var_477 = true;
         this.var_1088 = false;
         this.var_709.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1088;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1088 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1088;
      }
      
      public function stopPropagation() : void
      {
         this.var_1088 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1088 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_480 + " window: " + this._window + " }";
      }
   }
}
