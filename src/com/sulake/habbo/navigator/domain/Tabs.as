package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_379:int = 1;
      
      public static const const_288:int = 2;
      
      public static const const_333:int = 3;
      
      public static const const_413:int = 4;
      
      public static const const_276:int = 5;
      
      public static const const_382:int = 1;
      
      public static const const_927:int = 2;
      
      public static const const_913:int = 3;
      
      public static const const_974:int = 4;
      
      public static const const_281:int = 5;
      
      public static const const_929:int = 6;
      
      public static const const_852:int = 7;
      
      public static const const_265:int = 8;
      
      public static const const_407:int = 9;
      
      public static const const_1904:int = 10;
      
      public static const const_867:int = 11;
      
      public static const const_512:int = 12;
       
      
      private var var_452:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_452 = new Array();
         this.var_452.push(new Tab(this._navigator,const_379,const_512,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_596));
         this.var_452.push(new Tab(this._navigator,const_288,const_382,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_596));
         this.var_452.push(new Tab(this._navigator,const_413,const_867,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1151));
         this.var_452.push(new Tab(this._navigator,const_333,const_281,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_596));
         this.var_452.push(new Tab(this._navigator,const_276,const_265,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_713));
         this.setSelectedTab(const_379);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_413;
      }
      
      public function get tabs() : Array
      {
         return this.var_452;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_452)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_452)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_452)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
