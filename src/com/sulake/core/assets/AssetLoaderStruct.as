package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_958:IAssetLoader;
      
      private var var_1628:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1628 = param1;
         this.var_958 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1628;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_958;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_958 != null)
            {
               if(!this.var_958.disposed)
               {
                  this.var_958.dispose();
                  this.var_958 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
