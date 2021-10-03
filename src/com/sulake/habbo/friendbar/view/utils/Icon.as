package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Icon implements IDisposable
   {
      
      protected static const const_2116:int = 0;
      
      protected static const const_650:int = 1;
      
      protected static const const_1844:int = 2;
      
      protected static const const_1843:int = 3;
      
      protected static const const_123:int = 4;
      
      protected static const const_649:int = 8;
      
      protected static const const_241:int = 18;
      
      protected static const const_1845:int = 18;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1890:Boolean = false;
      
      protected var var_46:BitmapDataAsset;
      
      protected var var_83:IBitmapWrapperWindow;
      
      private var var_1251:uint;
      
      protected var var_209:Timer;
      
      protected var _frame:int = 0;
      
      private var var_667:Point;
      
      protected var var_872:Boolean = false;
      
      protected var _hover:Boolean = false;
      
      public function Icon()
      {
         this.var_1251 = const_650 | const_649;
         this.var_667 = new Point();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1890;
      }
      
      protected function set image(param1:BitmapDataAsset) : void
      {
         this.var_46 = param1;
         this.redraw();
      }
      
      protected function get image() : BitmapDataAsset
      {
         return this.var_46;
      }
      
      protected function set canvas(param1:IBitmapWrapperWindow) : void
      {
         this.var_83 = param1;
         this.redraw();
      }
      
      protected function get canvas() : IBitmapWrapperWindow
      {
         return this.var_83;
      }
      
      protected function set alignment(param1:uint) : void
      {
         this.var_1251 = param1;
         this.redraw();
      }
      
      protected function get alignment() : uint
      {
         return this.var_1251;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.toggleTimer(false,0);
            this.image = null;
            this.canvas = null;
            this._disposed = true;
         }
      }
      
      public function notify(param1:Boolean) : void
      {
         this.var_872 = param1;
         if(this.var_872 && this.var_1890)
         {
            this.enable(true);
         }
      }
      
      public function hover(param1:Boolean) : void
      {
         this._hover = param1;
      }
      
      public function enable(param1:Boolean) : void
      {
         this.var_1890 = !param1;
      }
      
      protected function redraw() : void
      {
         var _loc1_:* = null;
         if(this.var_83 && !this.var_83.disposed)
         {
            if(!this.var_83.bitmap)
            {
               this.var_83.bitmap = new BitmapData(this.var_83.width,this.var_83.height,true,0);
            }
            else
            {
               this.var_83.bitmap.fillRect(this.var_83.bitmap.rect,0);
            }
            if(this.var_46 && !this.var_46.disposed)
            {
               this.var_667.x = this.var_667.y = 0;
               _loc1_ = this.var_46.content as BitmapData;
               switch(this.var_1251 & const_1843)
               {
                  case const_650:
                     this.var_667.x = this.var_83.bitmap.width / 2 - _loc1_.width / 2;
                     break;
                  case const_1844:
                     this.var_667.x = this.var_83.bitmap.width - _loc1_.width;
               }
               switch(this.var_1251 & const_1845)
               {
                  case const_649:
                     this.var_667.y = this.var_83.bitmap.height / 2 - _loc1_.height / 2;
                     break;
                  case const_241:
                     this.var_667.y = this.var_83.bitmap.height - _loc1_.height;
               }
               this.var_83.bitmap.copyPixels(_loc1_,_loc1_.rect,this.var_667);
               this.var_83.invalidate();
            }
         }
      }
      
      protected function toggleTimer(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(!this.var_209)
            {
               this.var_209 = new Timer(param2,0);
               this.var_209.addEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_209.start();
               this.onTimerEvent(null);
            }
            this.var_209.delay = param2;
         }
         else
         {
            this._frame = 0;
            if(this.var_209)
            {
               this.var_209.reset();
               this.var_209.removeEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_209 = null;
            }
         }
      }
      
      protected function onTimerEvent(param1:TimerEvent) : void
      {
      }
   }
}
