package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1372:IID;
      
      private var var_1667:String;
      
      private var var_107:IUnknown;
      
      private var var_718:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1372 = param1;
         this.var_1667 = getQualifiedClassName(this.var_1372);
         this.var_107 = param2;
         this.var_718 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1372;
      }
      
      public function get iis() : String
      {
         return this.var_1667;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_107;
      }
      
      public function get references() : uint
      {
         return this.var_718;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_107 == null;
      }
      
      public function dispose() : void
      {
         this.var_1372 = null;
         this.var_1667 = null;
         this.var_107 = null;
         this.var_718 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_718;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_718) : uint(0);
      }
   }
}
