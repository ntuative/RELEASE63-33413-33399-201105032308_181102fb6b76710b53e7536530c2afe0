package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_789:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1084)
         {
            _structure = null;
            _assets = null;
            var_256 = null;
            var_287 = null;
            var_652 = null;
            var_574 = null;
            var_332 = null;
            if(!var_1341 && var_46)
            {
               var_46.dispose();
            }
            var_46 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_839 = null;
            var_1084 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_789[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_789[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_414:
               switch(_loc3_)
               {
                  case AvatarAction.const_842:
                  case AvatarAction.const_520:
                  case AvatarAction.const_374:
                  case AvatarAction.const_788:
                  case AvatarAction.const_440:
                  case AvatarAction.const_968:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_355:
            case AvatarAction.const_755:
            case AvatarAction.const_277:
            case AvatarAction.const_794:
            case AvatarAction.const_737:
            case AvatarAction.const_946:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
