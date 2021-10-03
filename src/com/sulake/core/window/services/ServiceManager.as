package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2976:uint;
      
      private var var_146:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_267:IWindowContext;
      
      private var var_1269:IMouseDraggingService;
      
      private var var_1271:IMouseScalingService;
      
      private var var_1272:IMouseListenerService;
      
      private var var_1270:IFocusManagerService;
      
      private var var_1273:IToolTipAgentService;
      
      private var var_1274:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2976 = 0;
         this.var_146 = param2;
         this.var_267 = param1;
         this.var_1269 = new WindowMouseDragger(param2);
         this.var_1271 = new WindowMouseScaler(param2);
         this.var_1272 = new WindowMouseListener(param2);
         this.var_1270 = new FocusManager(param2);
         this.var_1273 = new WindowToolTipAgent(param2);
         this.var_1274 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1269 != null)
         {
            this.var_1269.dispose();
            this.var_1269 = null;
         }
         if(this.var_1271 != null)
         {
            this.var_1271.dispose();
            this.var_1271 = null;
         }
         if(this.var_1272 != null)
         {
            this.var_1272.dispose();
            this.var_1272 = null;
         }
         if(this.var_1270 != null)
         {
            this.var_1270.dispose();
            this.var_1270 = null;
         }
         if(this.var_1273 != null)
         {
            this.var_1273.dispose();
            this.var_1273 = null;
         }
         if(this.var_1274 != null)
         {
            this.var_1274.dispose();
            this.var_1274 = null;
         }
         this.var_146 = null;
         this.var_267 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1269;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1271;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1272;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1270;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1273;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1274;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
