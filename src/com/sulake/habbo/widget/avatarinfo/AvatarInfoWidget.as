package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectNameEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var var_22:Component;
      
      private var var_176:IHabboConfigurationManager;
      
      private var _view:AvatarInfoView;
      
      private var var_196:Boolean = false;
      
      private var var_1841:Boolean = false;
      
      private var var_1219:Timer;
      
      private var var_2961:int = 3000;
      
      private var var_1492:Boolean;
      
      private var var_985:Boolean;
      
      private var _blend:Number;
      
      private var var_1493:int;
      
      private var var_2960:int = 500;
      
      private var var_305:AvatarInfoData;
      
      private var var_2610:Boolean;
      
      private var var_1898:Boolean;
      
      private var var_1899:int = -1;
      
      public function AvatarInfoWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboConfigurationManager, param4:IHabboLocalizationManager, param5:Component)
      {
         super(param1,param2,param4);
         this.var_22 = param5;
         this.var_176 = param3;
         this.var_1492 = false;
         this.var_985 = false;
         this.var_1219 = new Timer(this.var_2961,1);
         this.var_1219.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.var_305 = new AvatarInfoData();
         this.var_2610 = this.var_176.getBoolean("menu.avatar.enabled",false);
         this.var_1898 = this.var_176.getBoolean("hover.name.enabled",false);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_176;
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.var_985 = true;
         this.var_1493 = 0;
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_735,0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this.var_22)
         {
            this.var_22.removeUpdateReceiver(this);
            this.var_22 = null;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this.var_176 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_125,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_133,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_110,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_315,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_122,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_189,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_100,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_409,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectNameEvent.const_597,this.updateEventHandler);
         if(this.var_1898)
         {
            param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_846,this.updateEventHandler);
            param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_427,this.updateEventHandler);
         }
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_125,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_133,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_110,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_315,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_122,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_189,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_100,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_409,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectNameEvent.const_597,this.updateEventHandler);
         if(this.var_1898)
         {
            param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_427,this.updateEventHandler);
            param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_427,this.updateEventHandler);
         }
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_125:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_144,_loc2_.allowNameChange,null);
               this.var_196 = true;
               break;
            case RoomWidgetRoomObjectNameEvent.const_597:
               if(RoomWidgetRoomObjectNameEvent(param1).category == RoomObjectCategoryEnum.const_33)
               {
                  this.updateView(RoomWidgetRoomObjectNameEvent(param1).userId,RoomWidgetRoomObjectNameEvent(param1).userName,RoomWidgetRoomObjectNameEvent(param1).roomIndex,RoomObjectTypeEnum.const_144,false,null);
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_113:
            case RoomWidgetFurniInfoUpdateEvent.const_315:
               this.removeView();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_133:
               this.getOwnCharacterInfo();
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_846:
               if(!(this._view is AvatarMenuView))
               {
                  this.var_1899 = RoomWidgetRoomObjectUpdateEvent(param1).id;
                  messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_967,RoomWidgetRoomObjectUpdateEvent(param1).id,RoomWidgetRoomObjectUpdateEvent(param1).category));
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_427:
               if(!(this._view is AvatarMenuView))
               {
                  if(RoomWidgetRoomObjectUpdateEvent(param1).id == this.var_1899)
                  {
                     this.removeView();
                     this.var_1899 = -1;
                  }
               }
               break;
            case RoomWidgetUserInfoUpdateEvent.const_110:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.var_305.amIAnyRoomController = _loc3_.amIAnyRoomController;
               this.var_305.amIController = _loc3_.amIController;
               this.var_305.amIOwner = _loc3_.amIOwner;
               this.var_305.canBeAskedAsFriend = _loc3_.canBeAskedAsFriend;
               this.var_305.canBeKicked = _loc3_.canBeKicked;
               this.var_305.canTrade = _loc3_.canTrade;
               this.var_305.canTradeReason = _loc3_.canTradeReason;
               this.var_305.hasFlatControl = _loc3_.hasFlatControl;
               this.var_305.isIgnored = _loc3_.isIgnored;
               this.var_305.respectLeft = _loc3_.respectLeft;
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_144,false,!!_loc3_.isSpectatorMode ? null : this.var_305);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_484,false,null);
               break;
            case RoomWidgetPetInfoUpdateEvent.PET_INFO:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_218,false,null);
               break;
            case RoomWidgetUserDataUpdateEvent.const_122:
               if(!this.var_196)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_189:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this._view && this._view.roomIndex == _loc6_.id)
               {
                  this.disposeView();
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_100:
               this.var_1841 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_409:
               this.var_1841 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:AvatarInfoData) : void
      {
         this.var_985 = false;
         if(this.var_1219.running)
         {
            this.var_1219.stop();
         }
         var _loc7_:Boolean = param6 != null && this.var_2610;
         if(_loc7_ && !(this._view is AvatarMenuView))
         {
            this.disposeView();
         }
         if(this._view == null || this._view.userId != param1 || this._view.userName != param2 || this._view.roomIndex != param3 || this._view.userType != param4)
         {
            if(this._view)
            {
               this.disposeView();
            }
            if(!this.var_1841)
            {
               if(_loc7_)
               {
                  this._view = new AvatarMenuView(this,param1,param2,param3,param4,param6);
               }
               else
               {
                  this._view = new AvatarInfoView(this,param1,param2,param3,param4,param5);
               }
            }
         }
      }
      
      public function disposeView() : void
      {
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
            this.var_1492 = true;
            this.var_985 = false;
         }
      }
      
      public function removeView() : void
      {
         if(!this.var_1492)
         {
            this.var_1492 = true;
            this.var_1219.start();
         }
         else if(!this.var_985)
         {
            this.disposeView();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this.var_22)
         {
            return;
         }
         if(this._view)
         {
            this.var_22.registerUpdateReceiver(this,10);
         }
         else
         {
            this.var_22.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(!this._view)
         {
            return;
         }
         _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this._view.userId,this._view.userType)) as RoomWidgetUserLocationUpdateEvent;
         if(!_loc2_)
         {
            return;
         }
         if(this.var_985)
         {
            this.var_1493 += param1;
            this._blend = 1 - this.var_1493 / Number(this.var_2960);
         }
         else
         {
            this._blend = 1;
         }
         if(this._blend <= 0)
         {
            this.disposeView();
            return;
         }
         this._view.update(_loc2_.rectangle,_loc2_.screenLocation,this._blend);
      }
   }
}
