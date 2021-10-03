package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_1015:String = "avatar";
      
      private static const const_659:Number = -0.01;
      
      private static const const_658:Number = -0.409;
      
      private static const const_1013:int = 2;
      
      private static const const_1364:Array = [0,0,0];
      
      private static const const_1365:int = 3;
       
      
      private var var_619:AvatarVisualizationData = null;
      
      private var var_552:Map;
      
      private var var_500:Map;
      
      private var var_1302:int = 0;
      
      private var var_936:Boolean;
      
      private var var_652:String;
      
      private var var_1003:String;
      
      private var var_1303:int = 0;
      
      private var var_617:BitmapDataAsset;
      
      private var var_931:BitmapDataAsset;
      
      private var var_1771:int = -1;
      
      private var var_1767:int = -1;
      
      private var var_1765:int = -1;
      
      private const const_1014:int = 0;
      
      private const const_1897:int = 1;
      
      private const const_1866:int = 2;
      
      private const const_1865:int = 3;
      
      private const const_1363:int = 4;
      
      private var var_1806:int = -1;
      
      private var var_252:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1770:Boolean = false;
      
      private var var_1768:Boolean = false;
      
      private var var_1766:Boolean = false;
      
      private var var_1412:Boolean = false;
      
      private var var_600:Boolean = false;
      
      private var var_1411:int = 0;
      
      private var var_1414:int = 0;
      
      private var var_2390:int = 0;
      
      private var var_745:int = 0;
      
      private var var_747:int = 0;
      
      private var var_618:int = 0;
      
      private var var_1413:int = 0;
      
      private var var_1159:Boolean = false;
      
      private var var_1769:Boolean = false;
      
      private var var_1160:int = 0;
      
      private var var_746:int = 0;
      
      private var var_1764:Boolean = false;
      
      private var var_1158:int = 0;
      
      private var var_60:IAvatarImage = null;
      
      private var var_1084:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_552 = new Map();
         this.var_500 = new Map();
         this.var_936 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_552 != null)
         {
            this.resetImages();
            this.var_552.dispose();
            this.var_500.dispose();
            this.var_552 = null;
         }
         this.var_619 = null;
         this.var_617 = null;
         this.var_931 = null;
         super.dispose();
         this.var_1084 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1084;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_619 = param1 as AvatarVisualizationData;
         createSprites(this.const_1363);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_174)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_243) > 0 && param3);
            if(_loc5_ != this.var_1770)
            {
               this.var_1770 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_390) > 0;
            if(_loc5_ != this.var_1768)
            {
               this.var_1768 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_376) > 0;
            if(_loc5_ != this.var_1766)
            {
               this.var_1766 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_709) > 0 && param3);
            if(_loc5_ != this.var_1412)
            {
               this.var_1412 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1257) > 0;
            if(_loc5_ != this.var_600)
            {
               this.var_600 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_157);
            if(_loc6_ != this.var_1411)
            {
               this.var_1411 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_264);
            if(_loc7_ != this.var_252)
            {
               this.var_252 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_881);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1127);
            if(_loc6_ != this.var_1414)
            {
               this.var_1414 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_490);
            if(_loc6_ != this.var_745)
            {
               this.var_745 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_595);
            if(_loc6_ != this.var_747)
            {
               this.var_747 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_384);
            if(_loc6_ != this.var_618)
            {
               this.var_618 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_196);
            if(_loc6_ != this.var_1771)
            {
               this.var_1771 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_747 > 0 && param1.getNumber(RoomObjectVariableEnum.const_384) > 0)
            {
               if(this.var_618 != this.var_747)
               {
                  this.var_618 = this.var_747;
                  _loc4_ = true;
               }
            }
            else if(this.var_618 != 0)
            {
               this.var_618 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_811);
            if(_loc6_ != this.var_1160)
            {
               this.var_1160 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.AVATAR_GENDER);
            if(_loc7_ != this.var_1003)
            {
               this.var_1003 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_227);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_174 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_652 != param1)
         {
            this.var_652 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_552)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_500)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_552.reset();
         this.var_500.reset();
         this.var_60 = null;
         _loc2_ = getSprite(this.const_1014);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1412 = false;
         }
         if(this.var_252 == "sit" || this.var_252 == "lay")
         {
            this.var_1413 = param1 / 2;
         }
         else
         {
            this.var_1413 = 0;
         }
         this.var_1769 = false;
         this.var_1159 = false;
         if(this.var_252 == "lay")
         {
            this.var_1159 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1769 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_552.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_500.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_619.getAvatar(this.var_652,param1,this.var_1003,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_552.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_500.length >= const_1365)
                  {
                     this.var_500.remove(this.var_500.getKeys().shift());
                  }
                  this.var_500.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_475 != param1.getUpdateID() || this.var_1806 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1771;
            if(this.var_252 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1767 || param4)
            {
               _loc5_ = true;
               this.var_1767 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_60.setDirectionAngle(AvatarSetType.const_35,_loc6_);
            }
            if(_loc7_ != this.var_1765 || param4)
            {
               _loc5_ = true;
               this.var_1765 = _loc7_;
               if(this.var_1765 != this.var_1767)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_60.setDirectionAngle(AvatarSetType.const_51,_loc7_);
               }
            }
            var_475 = param1.getUpdateID();
            this.var_1806 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1897);
         this.var_617 = null;
         if(this.var_252 == "mv" || this.var_252 == "std")
         {
            _loc2_.visible = true;
            if(this.var_617 == null || param1 != var_87)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_617 = this.var_60.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_617 = this.var_60.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_617 != null)
               {
                  _loc2_.asset = this.var_617.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_617 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_931 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1866);
         if(this.var_600)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_931 = this.var_619.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_931 = this.var_619.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_252 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_252 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_931 != null)
            {
               _loc2_.asset = this.var_931.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1865);
         if(this.var_1160 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_619.getAvatarRendererAsset("number_" + this.var_1160 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_619.getAvatarRendererAsset("number_" + this.var_1160 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_252 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_252 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_746 = 1;
               this.var_1764 = true;
               this.var_1158 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_746 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1865);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1764)
         {
            ++this.var_1158;
            if(this.var_1158 < 10)
            {
               return false;
            }
            if(this.var_746 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1158 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_746 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_746 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_746 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_746 = 0;
               this.var_1764 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_619 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_745;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_87 || this.var_60 == null)
         {
            if(_loc7_ != var_87)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_745)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_60 == null || _loc12_)
            {
               this.var_60 = this.getAvatarImage(_loc7_,this.var_745);
               if(this.var_60 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_1014);
               if(_loc16_ && this.var_60 && this.var_60.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_60 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_60);
            var_87 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_936 || this.var_1303 > 0) && param3;
         if(_loc14_)
         {
            this.var_1303 = const_1013;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1303;
            --this.var_1302;
            if(!(this.var_1302 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_60.updateAnimationByFrames(1);
            this.var_1302 = const_1013;
            _loc18_ = this.var_60.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1364;
            }
            _loc17_ = getSprite(this.const_1014);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_60.getImage(AvatarSetType.const_35,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1413;
               }
               if(this.var_1159)
               {
                  if(this.var_1769)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_658 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_659 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_1866);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1159)
               {
                  _loc17_.relativeDepth = const_659 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_658 - 0.01 + _loc18_[2];
               }
            }
            this.var_936 = this.var_60.isAnimating();
            _loc19_ = this.const_1363;
            for each(_loc20_ in this.var_60.getSprites())
            {
               if(_loc20_.id == const_1015)
               {
                  _loc17_ = getSprite(this.const_1014);
                  _loc22_ = this.var_60.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_60.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_60.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_60.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_60.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_60.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_60.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_60.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_60.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_60.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1413;
                     if(this.var_1159)
                     {
                        _loc17_.relativeDepth = const_658 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_659 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_414,this.var_252,this._postureParameter);
         if(this.var_1411 > 0)
         {
            param1.appendAction(AvatarAction.const_323,AvatarAction.const_1593[this.var_1411]);
         }
         if(this.var_1414 > 0)
         {
            param1.appendAction(AvatarAction.const_755,this.var_1414);
         }
         if(this.var_2390 > 0)
         {
            param1.appendAction(AvatarAction.const_794,this.var_2390);
         }
         if(this.var_747 > 0)
         {
            param1.appendAction(AvatarAction.const_737,this.var_747);
         }
         if(this.var_618 > 0)
         {
            param1.appendAction(AvatarAction.const_946,this.var_618);
         }
         if(this.var_1770)
         {
            param1.appendAction(AvatarAction.const_337);
         }
         if(this.var_1766 || this.var_1412)
         {
            param1.appendAction(AvatarAction.const_588);
         }
         if(this.var_1768)
         {
            param1.appendAction(AvatarAction.const_277);
         }
         if(this.var_745 > 0)
         {
            param1.appendAction(AvatarAction.const_355,this.var_745);
         }
         param1.endActionAppends();
         this.var_936 = param1.isAnimating();
         var _loc2_:int = this.const_1363;
         for each(_loc3_ in this.var_60.getSprites())
         {
            if(_loc3_.id != const_1015)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
