package com.sulake.habbo.sound.trax
{
   import flash.utils.ByteArray;
   
   public class TraxSample
   {
      
      public static const const_1600:String = "sample_44khz";
      
      public static const const_1532:String = "sample_22khz";
      
      public static const const_1582:String = "sample_11khz";
      
      public static const const_1613:String = "sample_16bit";
      
      public static const const_1589:String = "sample_8bit";
      
      public static const SAMPLE_VALUE_MULTIPLIER:Number = 0.000030517578125;
      
      private static const const_1012:int = 32;
      
      private static const const_76:int = 255;
      
      private static const const_192:int = 65535;
      
      private static const const_75:int = 127;
      
      private static const const_193:int = 32767;
       
      
      private var var_134:Vector.<int> = null;
      
      private var _id:int;
      
      private var var_155:int = 2;
      
      private var var_73:int = 1;
      
      public function TraxSample(param1:ByteArray, param2:int, param3:String = "sample_44khz", param4:String = "sample_16bit")
      {
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         super();
         this._id = param2;
         var _loc5_:int = 65536;
         switch(param3)
         {
            case const_1532:
               this.var_73 = 2;
               break;
            case const_1582:
               this.var_73 = 4;
               break;
            default:
               this.var_73 = 1;
         }
         switch(param4)
         {
            case const_1589:
               this.var_155 = 4;
               _loc5_ = 256;
               break;
            default:
               this.var_155 = 2;
               _loc5_ = 65536;
         }
         var _loc6_:int = this.var_155 * this.var_73;
         var _loc7_:int = param1.length / 8;
         _loc7_ = int(_loc7_ / _loc6_) * _loc6_;
         this.var_134 = new Vector.<int>(_loc7_ / _loc6_,true);
         var _loc8_:Number = 1 / (Number(_loc5_) / 2);
         param1.position = 0;
         var _loc9_:int = 0;
         var _loc10_:int = _loc7_ / this.var_73;
         var _loc11_:int = 0;
         while(_loc11_ < _loc10_)
         {
            _loc12_ = param1.readFloat();
            param1.readFloat();
            _loc13_ = 2;
            while(_loc13_ <= this.var_73)
            {
               _loc15_ = param1.readFloat();
               param1.readFloat();
               _loc16_ = Number(_loc13_);
               _loc12_ = _loc12_ * (_loc16_ - 1) / _loc16_ + Number(_loc15_) / _loc16_;
               _loc13_++;
            }
            if(_loc11_ >= _loc10_ - 1 - const_1012)
            {
               _loc12_ *= (_loc10_ - _loc11_ - 1) / Number(const_1012);
            }
            _loc14_ = (_loc12_ + 1) / _loc8_;
            if(_loc14_ < 0)
            {
               _loc14_ = 0;
            }
            else if(_loc14_ >= _loc5_)
            {
               _loc14_ = _loc5_ - 1;
            }
            _loc9_ *= _loc5_;
            _loc9_ += _loc14_;
            if(_loc11_ % this.var_155 == this.var_155 - 1)
            {
               this.var_134[int(_loc11_ / this.var_155)] = _loc9_;
               _loc9_ = 0;
            }
            _loc11_++;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get length() : uint
      {
         return this.var_134.length * this.var_155 * this.var_73;
      }
      
      public function setSample(param1:Vector.<int>, param2:int, param3:int, param4:int) : int
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         if(param1 == null || this.var_134 == null)
         {
            return param4;
         }
         var _loc5_:int = this.var_155 * this.var_73;
         param4 /= _loc5_;
         if(param2 < 0)
         {
            param3 += param2;
            param2 = 0;
         }
         if(param3 > param1.length - param2)
         {
            param3 = param1.length - param2;
         }
         var _loc6_:int = param3 / _loc5_;
         var _loc7_:int = 0;
         if(_loc6_ > this.var_134.length - param4)
         {
            _loc7_ = (_loc6_ - (this.var_134.length - param4)) * _loc5_;
            _loc6_ = this.var_134.length - param4;
            if(_loc7_ > param1.length - param2)
            {
               _loc7_ = param1.length - param2;
            }
         }
         if(this.var_73 == 1)
         {
            if(this.var_155 == 2)
            {
               while(_loc6_-- > 0)
               {
                  _loc8_ = this.var_134[param4++];
                  var _loc11_:*;
                  param1[_loc11_ = param2++] = (_loc8_ >> 16 & const_192) - const_193;
                  var _loc12_:*;
                  param1[_loc12_ = param2++] = (_loc8_ & const_192) - const_193;
               }
            }
            else if(this.var_155 == 4)
            {
               while(_loc6_-- > 0)
               {
                  _loc8_ = this.var_134[param4++];
                  param1[_loc11_ = param2++] = (_loc8_ >> 24 & const_76) - const_75 << 8;
                  param1[_loc12_ = param2++] = (_loc8_ >> 16 & const_76) - const_75 << 8;
                  var _loc13_:*;
                  param1[_loc13_ = param2++] = (_loc8_ >> 8 & const_76) - const_75 << 8;
                  var _loc14_:*;
                  param1[_loc14_ = param2++] = (_loc8_ & const_76) - const_75 << 8;
               }
            }
         }
         else if(this.var_73 >= 2)
         {
            _loc9_ = 0;
            _loc10_ = 0;
            if(this.var_155 == 2)
            {
               while(_loc6_-- > 0)
               {
                  _loc8_ = this.var_134[param4++];
                  _loc10_ = int((_loc8_ >> 16 & const_192) - const_193);
                  _loc9_ = this.var_73;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
                  _loc10_ = int((_loc8_ & const_192) - const_193);
                  _loc9_ = this.var_73;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
               }
            }
            else if(this.var_155 == 4)
            {
               while(_loc6_-- > 0)
               {
                  _loc8_ = this.var_134[param4++];
                  _loc10_ = (_loc8_ >> 24 & const_76) - const_75 << 8;
                  _loc9_ = this.var_73;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
                  _loc10_ = (_loc8_ >> 16 & const_76) - const_75 << 8;
                  _loc9_ = this.var_73;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
                  _loc10_ = (_loc8_ >> 8 & const_76) - const_75 << 8;
                  _loc9_ = this.var_73;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
                  _loc10_ = (_loc8_ & const_76) - const_75 << 8;
                  _loc9_ = this.var_73;
                  while(_loc9_ > 0)
                  {
                     param1[_loc11_ = param2++] = _loc10_;
                     _loc9_--;
                  }
               }
            }
         }
         while(_loc7_-- > 0)
         {
            param1[_loc11_ = param2++] = 0;
         }
         return param4 * _loc5_;
      }
      
      public function addSample(param1:Vector.<int>, param2:int, param3:int, param4:int) : int
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         if(param1 == null || this.var_134 == null)
         {
            return param4;
         }
         var _loc5_:int = this.var_155 * this.var_73;
         param4 /= _loc5_;
         if(param2 < 0)
         {
            param3 += param2;
            param2 = 0;
         }
         if(param3 > param1.length - param2)
         {
            param3 = param1.length - param2;
         }
         var _loc6_:int = param3 / _loc5_;
         if(_loc6_ > this.var_134.length - param4)
         {
            _loc6_ = this.var_134.length - param4;
         }
         if(this.var_73 == 1)
         {
            if(this.var_155 == 2)
            {
               while(_loc6_-- > 0)
               {
                  _loc7_ = this.var_134[param4++];
                  var _loc10_:*;
                  param1[_loc10_ = param2++] = param1[_loc10_] + ((_loc7_ >> 16 & const_192) - const_193);
                  var _loc11_:*;
                  param1[_loc11_ = param2++] = param1[_loc11_] + ((_loc7_ & const_192) - const_193);
               }
            }
            else if(this.var_155 == 4)
            {
               while(_loc6_-- > 0)
               {
                  _loc7_ = this.var_134[param4++];
                  param1[_loc10_ = param2++] = param1[_loc10_] + ((_loc7_ >> 24 & const_76) - const_75 << 8);
                  param1[_loc11_ = param2++] = param1[_loc11_] + ((_loc7_ >> 16 & const_76) - const_75 << 8);
                  var _loc12_:*;
                  param1[_loc12_ = param2++] = param1[_loc12_] + ((_loc7_ >> 8 & const_76) - const_75 << 8);
                  var _loc13_:*;
                  param1[_loc13_ = param2++] = param1[_loc13_] + ((_loc7_ & const_76) - const_75 << 8);
               }
            }
         }
         else if(this.var_73 >= 2)
         {
            _loc8_ = 0;
            _loc9_ = 0;
            if(this.var_155 == 2)
            {
               while(_loc6_-- > 0)
               {
                  _loc7_ = this.var_134[param4++];
                  _loc9_ = int((_loc7_ >> 16 & const_192) - const_193);
                  _loc8_ = this.var_73;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
                  _loc9_ = int((_loc7_ & const_192) - const_193);
                  _loc8_ = this.var_73;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
               }
            }
            else if(this.var_155 == 4)
            {
               while(_loc6_-- > 0)
               {
                  _loc7_ = this.var_134[param4++];
                  _loc9_ = (_loc7_ >> 24 & const_76) - const_75 << 8;
                  _loc8_ = this.var_73;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
                  _loc9_ = (_loc7_ >> 16 & const_76) - const_75 << 8;
                  _loc8_ = this.var_73;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
                  _loc9_ = (_loc7_ >> 8 & const_76) - const_75 << 8;
                  _loc8_ = this.var_73;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
                  _loc9_ = (_loc7_ & const_76) - const_75 << 8;
                  _loc8_ = this.var_73;
                  while(_loc8_ > 0)
                  {
                     param1[_loc10_ = param2++] = param1[_loc10_] + _loc9_;
                     _loc8_--;
                  }
               }
            }
         }
         return param4 * _loc5_;
      }
   }
}
