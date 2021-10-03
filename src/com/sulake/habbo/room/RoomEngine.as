package com.sulake.habbo.room
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectUpdateStateMessage;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomPlaneData;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.habbo.room.utils.FurnitureData;
   import com.sulake.habbo.room.utils.LegacyWallGeometry;
   import com.sulake.habbo.room.utils.RoomCamera;
   import com.sulake.habbo.room.utils.RoomData;
   import com.sulake.habbo.room.utils.RoomInstanceData;
   import com.sulake.habbo.room.utils.SelectedRoomObjectData;
   import com.sulake.habbo.room.utils.TileHeightMap;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDRoomManager;
   import com.sulake.iid.IIDRoomObjectFactory;
   import com.sulake.iid.IIDRoomObjectVisualizationFactory;
   import com.sulake.iid.IIDRoomRendererFactory;
   import com.sulake.iid.IIDSessionDataManager;
   import com.sulake.room.IRoomInstance;
   import com.sulake.room.IRoomManager;
   import com.sulake.room.IRoomManagerListener;
   import com.sulake.room.IRoomObjectFactory;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.renderer.IRoomRenderer;
   import com.sulake.room.renderer.IRoomRendererFactory;
   import com.sulake.room.renderer.IRoomRenderingCanvas;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.NumberBank;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.getTimer;
   
   public class RoomEngine extends Component implements IRoomEngine, IRoomManagerListener, IRoomCreator, IRoomEngineServices, IUpdateReceiver
   {
      
      private static const const_683:String = "temporary_room";
      
      private static const const_370:int = -1;
      
      private static const const_682:String = "room";
      
      private static const const_1080:int = -2;
      
      private static const const_1530:String = "tile_cursor";
      
      private static const const_1081:int = -3;
      
      private static const const_1529:String = "selection_arrow";
      
      private static const OVERLAY_SPRITE:String = "overlay";
      
      private static const const_371:String = "object_icon_sprite";
      
      private static const const_467:int = 15;
      
      private static const const_1079:int = 40;
       
      
      private var _communication:IHabboCommunicationManager = null;
      
      private var _connection:IConnection = null;
      
      private var _roomManager:IRoomManager = null;
      
      private var var_1066:IRoomRendererFactory = null;
      
      private var var_859:IRoomObjectFactory = null;
      
      private var var_485:IRoomObjectVisualizationFactory = null;
      
      private var var_327:IAdManager = null;
      
      private var var_367:ISessionDataManager = null;
      
      private var var_132:IHabboConfigurationManager;
      
      private var var_66:RoomObjectEventHandler = null;
      
      private var var_1065:RoomMessageHandler = null;
      
      private var var_13:RoomContentLoader = null;
      
      private var var_2903:Boolean = false;
      
      private var var_858:NumberBank;
      
      private var var_1324:Map;
      
      private var var_563:Boolean = false;
      
      private var var_94:int = 0;
      
      private var var_93:int = 0;
      
      private var var_1603:int = -1;
      
      private var var_1604:int = 0;
      
      private var var_1605:int = 0;
      
      private var var_1323:Boolean = false;
      
      private var var_857:Boolean = false;
      
      private var var_2901:int = 0;
      
      private var var_2904:int = 0;
      
      private var var_2902:Boolean = false;
      
      private var var_397:Map = null;
      
      private var var_329:Map = null;
      
      private var var_1064:Boolean = false;
      
      private var var_562:Array;
      
      private var var_1322:Boolean;
      
      public function RoomEngine(param1:IContext, param2:uint = 0)
      {
         this.var_562 = new Array();
         super(param1,param2);
         this.var_329 = new Map();
         this.var_858 = new NumberBank(1000);
         this.var_1324 = new Map();
         this.var_397 = new Map();
         this.var_66 = new RoomObjectEventHandler(this);
         this.var_1065 = new RoomMessageHandler(this);
         this.var_13 = new RoomContentLoader();
         queueInterface(new IIDRoomObjectFactory(),this.onObjectFactoryReady);
         queueInterface(new IIDRoomObjectVisualizationFactory(),this.onVisualizationFactoryReady);
         queueInterface(new IIDRoomManager(),this.onRoomManagerReady);
         queueInterface(new IIDRoomRendererFactory(),this.onRendererFactoryReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationReady);
         queueInterface(new IIDHabboAdManager(),this.onAdManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
         this.initialize();
         registerUpdateReceiver(this,1);
      }
      
      public function get isInitialized() : Boolean
      {
         return this.var_563;
      }
      
      public function get roomManager() : IRoomManager
      {
         return this._roomManager;
      }
      
      public function get connection() : IConnection
      {
         return this._connection;
      }
      
      public function get activeRoomId() : int
      {
         return this.var_94;
      }
      
      public function get activeRoomCategory() : int
      {
         return this.var_93;
      }
      
      private function get useOffsetScrolling() : Boolean
      {
         return true;
      }
      
      public function isPublicRoomWorldType(param1:String) : Boolean
      {
         if(this.var_13 != null)
         {
            return this.var_13.isPublicRoomWorldType(param1);
         }
         return false;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         removeUpdateReceiver(this);
         if(this.var_859 != null)
         {
            this.var_859.release(new IIDRoomObjectFactory());
            this.var_859 = null;
         }
         if(this.var_485 != null)
         {
            this.var_485.release(new IIDRoomObjectVisualizationFactory());
            this.var_485 = null;
         }
         if(this._roomManager != null)
         {
            this._roomManager.release(new IIDRoomManager());
            this._roomManager = null;
         }
         if(this.var_1066 != null)
         {
            this.var_1066.release(new IIDRoomRendererFactory());
            this.var_1066 = null;
         }
         if(this._communication != null)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_132 != null)
         {
            this.var_132.release(new IIDHabboConfigurationManager());
            this.var_132 = null;
         }
         if(this.var_327)
         {
            this.var_327.release(new IIDHabboAdManager());
            this.var_327 = null;
         }
         this._connection = null;
         if(this.var_858 != null)
         {
            this.var_858.dispose();
            this.var_858 = null;
         }
         if(this.var_1324 != null)
         {
            this.var_1324.dispose();
         }
         if(this.var_66 != null)
         {
            this.var_66.dispose();
            this.var_66 = null;
         }
         if(this.var_1065 != null)
         {
            this.var_1065.dispose();
            this.var_1065 = null;
         }
         if(this.var_13 != null)
         {
            this.var_13.dispose();
            this.var_13 = null;
         }
         if(this.var_397 != null)
         {
            this.var_397.dispose();
            this.var_397 = null;
         }
         if(this.var_329 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_329.length)
            {
               _loc2_ = this.var_329.getWithIndex(_loc1_) as RoomInstanceData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_329.dispose();
            this.var_329 = null;
         }
         super.dispose();
      }
      
      private function initialize() : void
      {
      }
      
      private function getRoomInstanceData(param1:int, param2:int) : RoomInstanceData
      {
         var _loc3_:String = this.getRoomIdentifier(param1,param2);
         var _loc4_:RoomInstanceData = this.var_329.getValue(_loc3_) as RoomInstanceData;
         if(_loc4_ == null)
         {
            _loc4_ = new RoomInstanceData(param1,param2);
            this.var_329.add(_loc3_,_loc4_);
         }
         return _loc4_;
      }
      
      public function setTileHeightMap(param1:int, param2:int, param3:TileHeightMap) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.tileHeightMap = param3;
         }
      }
      
      public function getTileHeightMap(param1:int, param2:int) : TileHeightMap
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.tileHeightMap;
         }
         return null;
      }
      
      public function setWorldType(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.worldType = param3;
         }
      }
      
      public function getWorldType(param1:int, param2:int) : String
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.worldType;
         }
         return null;
      }
      
      public function getLegacyGeometry(param1:int, param2:int) : LegacyWallGeometry
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.legacyGeometry;
         }
         return null;
      }
      
      private function getRoomCamera(param1:int, param2:int) : RoomCamera
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.roomCamera;
         }
         return null;
      }
      
      public function setSelectedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.selectedObject = param3;
            if(param3 != null)
            {
               _loc4_.placedObject = null;
            }
         }
      }
      
      public function getSelectedObjectData(param1:int, param2:int) : ISelectedRoomObjectData
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.selectedObject;
         }
         return null;
      }
      
      public function setPlacedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.placedObject = param3;
         }
      }
      
      public function getPlacedObjectData(param1:int, param2:int) : ISelectedRoomObjectData
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.placedObject;
         }
         return null;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(this._roomManager != null)
         {
            this.createRoomFurniture();
            this._roomManager.update(param1);
            _loc2_ = this._roomManager.getRoom(this.getRoomIdentifier(this.var_94,this.var_93));
            if(_loc2_ != null && _loc2_.getRenderer() != null)
            {
               _loc2_.getRenderer().update(param1);
            }
            this.updateRoomCameras(param1);
            if(this.var_1322)
            {
               this.updateMouseCursor();
            }
         }
      }
      
      private function updateMouseCursor() : void
      {
         this.var_1322 = false;
         if(this.var_562 && this.var_562.length > 0)
         {
            Mouse.cursor = MouseCursor.BUTTON;
         }
         else
         {
            Mouse.cursor = MouseCursor.ARROW;
         }
         this.var_1322 = false;
      }
      
      public function requestMouseCursor(param1:String, param2:int, param3:String) : void
      {
         var _loc4_:int = this.getRoomObjectCategory(param3);
         switch(param1)
         {
            case RoomObjectFurnitureActionEvent.const_394:
               this.addBtnMouseCursorOwner(_loc4_,param2);
               break;
            default:
               this.removeBtnMouseCursorOwner(_loc4_,param2);
         }
      }
      
      private function addBtnMouseCursorOwner(param1:int, param2:int) : void
      {
         if(!this.var_562)
         {
            return;
         }
         if(param1 == RoomObjectCategoryEnum.const_27)
         {
            param2 *= -1;
         }
         var _loc3_:int = this.var_562.indexOf(param2);
         if(_loc3_ == -1)
         {
            this.var_562.push(param2);
            this.var_1322 = true;
         }
      }
      
      private function removeBtnMouseCursorOwner(param1:int, param2:int) : void
      {
         if(!this.var_562)
         {
            return;
         }
         if(param1 == RoomObjectCategoryEnum.const_27)
         {
            param2 *= -1;
         }
         var _loc3_:int = this.var_562.indexOf(param2);
         if(_loc3_ > -1)
         {
            this.var_562.splice(_loc3_,1);
            this.var_1322 = true;
         }
      }
      
      private function createRoomFurniture() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(this.var_1064)
         {
            this.var_1064 = false;
            return;
         }
         var _loc1_:int = getTimer();
         var _loc7_:int = 0;
         var _loc8_:* = this.var_329;
         do
         {
            for each(_loc4_ in _loc8_)
            {
               _loc5_ = 0;
               _loc6_ = null;
               while((_loc6_ = _loc4_.getFurnitureData()) != null)
               {
                  this.addObjectFurnitureFromData(_loc4_.roomId,_loc4_.roomCategory,_loc6_.id,_loc6_);
                  if(++_loc5_ % 5 == 0)
                  {
                     _loc3_ = getTimer();
                     if(_loc3_ - _loc1_ >= const_1079)
                     {
                        this.var_1064 = true;
                        break;
                     }
                  }
               }
               while(!this.var_1064 && (_loc6_ = _loc4_.getWallItemData()) != null)
               {
                  this.addObjectWallItemFromData(_loc4_.roomId,_loc4_.roomCategory,_loc6_.id,_loc6_);
                  if(++_loc5_ % 5 == 0)
                  {
                     _loc3_ = getTimer();
                     if(_loc3_ - _loc1_ >= const_1079)
                     {
                        this.var_1064 = true;
                        break;
                     }
                  }
               }
            }
            return;
         }
         while(!this.var_1064);
         
      }
      
      private function updateRoomCameras(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_329.length)
         {
            _loc3_ = this.var_329.getWithIndex(_loc2_) as RoomInstanceData;
            _loc4_ = null;
            _loc5_ = 0;
            _loc6_ = 0;
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.roomCamera;
               _loc5_ = _loc3_.roomId;
               _loc6_ = _loc3_.roomCategory;
            }
            if(_loc4_ != null)
            {
               _loc7_ = 1;
               _loc8_ = _loc4_.targetId;
               _loc9_ = _loc4_.targetCategory;
               _loc10_ = this.getRoomObject(_loc5_,_loc6_,_loc8_,_loc9_);
               if(_loc10_ != null)
               {
                  if(_loc5_ != this.var_94 || _loc6_ != this.var_93 || !this.var_1323)
                  {
                     this.updateRoomCamera(_loc5_,_loc6_,_loc7_,_loc10_.getLocation(),param1);
                  }
               }
            }
            _loc2_++;
         }
      }
      
      private function updateRoomCamera(param1:int, param2:int, param3:int, param4:IVector3d, param5:uint) : void
      {
         var _loc11_:* = NaN;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:* = NaN;
         var _loc23_:* = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:* = null;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:* = NaN;
         var _loc30_:* = NaN;
         var _loc31_:* = NaN;
         var _loc32_:* = NaN;
         var _loc33_:* = null;
         var _loc34_:* = null;
         var _loc35_:Boolean = false;
         var _loc36_:Boolean = false;
         var _loc37_:Boolean = false;
         var _loc38_:Boolean = false;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:* = NaN;
         var _loc42_:* = NaN;
         var _loc43_:* = NaN;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:* = null;
         var _loc47_:* = null;
         var _loc6_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         var _loc7_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc6_ == null || _loc7_ == null)
         {
            return;
         }
         var _loc8_:RoomGeometry = _loc6_.geometry as RoomGeometry;
         var _loc9_:RoomCamera = _loc7_.roomCamera;
         var _loc10_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc8_ != null && _loc9_ != null && _loc10_ != null)
         {
            _loc11_ = Number(Math.floor(param4.z) + 1);
            _loc12_ = this.getRoomCanvasRectangle(param1,param2,param3);
            if(_loc12_ != null)
            {
               _loc13_ = Math.round(_loc12_.width);
               _loc14_ = Math.round(_loc12_.height);
               if(_loc9_.screenWd != _loc13_ || _loc9_.screenHt != _loc14_ || _loc9_.scale != _loc8_.scale || _loc9_.geometryUpdateId != _loc8_.updateId || !Vector3d.isEqual(param4,_loc9_.targetObjectLoc) || _loc9_.isMoving)
               {
                  _loc9_.targetObjectLoc = param4;
                  _loc15_ = new Vector3d();
                  _loc15_.assign(param4);
                  _loc15_.x = Math.round(_loc15_.x);
                  _loc15_.y = Math.round(_loc15_.y);
                  _loc16_ = _loc10_.getNumber(RoomVariableEnum.const_742) - 0.5;
                  _loc17_ = _loc10_.getNumber(RoomVariableEnum.const_769) - 0.5;
                  _loc18_ = _loc10_.getNumber(RoomVariableEnum.const_748) + 0.5;
                  _loc19_ = _loc10_.getNumber(RoomVariableEnum.const_899) + 0.5;
                  _loc20_ = Math.round((_loc16_ + _loc18_) / 2);
                  _loc21_ = Math.round((_loc17_ + _loc19_) / 2);
                  _loc22_ = 2;
                  _loc23_ = new Point(_loc15_.x - _loc20_,_loc15_.y - _loc21_);
                  _loc24_ = _loc8_.scale / Math.sqrt(2);
                  _loc25_ = _loc24_ / 2;
                  _loc26_ = new Matrix();
                  _loc26_.rotate(-(_loc8_.direction.x + 90) / 180 * 0);
                  _loc23_ = _loc26_.transformPoint(_loc23_);
                  _loc23_.y *= _loc25_ / _loc24_;
                  _loc27_ = _loc12_.width / 2 / _loc24_ - 1;
                  _loc28_ = _loc12_.height / 2 / _loc25_ - 1;
                  _loc29_ = 0;
                  _loc30_ = 0;
                  _loc31_ = 0;
                  _loc32_ = 0;
                  _loc33_ = _loc8_.getScreenPoint(new Vector3d(_loc20_,_loc21_,_loc22_));
                  _loc33_.x += Math.round(_loc12_.width / 2);
                  _loc33_.y += Math.round(_loc12_.height / 2);
                  _loc34_ = this.getActiveRoomBoundingRectangle(param3);
                  if(_loc34_ == null)
                  {
                     _loc8_.adjustLocation(new Vector3d(0,0),25);
                     return;
                  }
                  _loc34_.offset(-_loc6_.screenOffsetX,-_loc6_.screenOffsetY);
                  if(!(_loc34_.width > 1 && _loc34_.height > 1))
                  {
                     _loc8_.adjustLocation(new Vector3d(-30,-30),25);
                     return;
                  }
                  _loc29_ = Number((_loc34_.left - _loc33_.x - _loc8_.scale * 0.25) / _loc24_);
                  _loc31_ = Number((_loc34_.right - _loc33_.x + _loc8_.scale * 0.25) / _loc24_);
                  _loc30_ = Number((_loc34_.top - _loc33_.y - _loc8_.scale * 0.5) / _loc25_);
                  _loc32_ = Number((_loc34_.bottom - _loc33_.y + _loc8_.scale * 0.5) / _loc25_);
                  _loc35_ = false;
                  _loc36_ = false;
                  _loc37_ = false;
                  _loc38_ = false;
                  _loc39_ = Math.round((_loc31_ - _loc29_) * _loc24_);
                  if(_loc39_ < _loc12_.width)
                  {
                     _loc11_ = 2;
                     _loc23_.x = (_loc31_ + _loc29_) / 2;
                     _loc37_ = true;
                  }
                  else
                  {
                     if(_loc23_.x > _loc31_ - _loc27_)
                     {
                        _loc23_.x = _loc31_ - _loc27_;
                        _loc35_ = true;
                     }
                     if(_loc23_.x < _loc29_ + _loc27_)
                     {
                        _loc23_.x = _loc29_ + _loc27_;
                        _loc35_ = true;
                     }
                  }
                  _loc40_ = Math.round((_loc32_ - _loc30_) * _loc25_);
                  if(_loc40_ < _loc12_.height)
                  {
                     _loc11_ = 2;
                     _loc23_.y = (_loc32_ + _loc30_) / 2;
                     _loc38_ = true;
                  }
                  else
                  {
                     if(_loc23_.y > _loc32_ - _loc28_)
                     {
                        _loc23_.y = _loc32_ - _loc28_;
                        _loc36_ = true;
                     }
                     if(_loc23_.y < _loc30_ + _loc28_)
                     {
                        _loc23_.y = _loc30_ + _loc28_;
                        _loc36_ = true;
                     }
                     _loc23_.y /= _loc25_ / _loc24_;
                  }
                  _loc26_.invert();
                  _loc23_ = _loc26_.transformPoint(_loc23_);
                  _loc23_.x += _loc20_;
                  _loc23_.y += _loc21_;
                  _loc41_ = 0.35;
                  _loc42_ = 0.1;
                  _loc43_ = 0.2;
                  _loc44_ = 10;
                  _loc45_ = 10;
                  if(_loc9_.limitedLocationX && _loc9_.screenWd == _loc13_ && _loc9_.screenHt == _loc14_)
                  {
                     _loc43_ = 0;
                  }
                  if(_loc9_.limitedLocationY && _loc9_.screenWd == _loc13_ && _loc9_.screenHt == _loc14_)
                  {
                     _loc41_ = 0;
                     _loc42_ = 0;
                  }
                  _loc12_.right *= 1 - _loc43_ * 2;
                  _loc12_.bottom *= 1 - (_loc41_ + _loc42_);
                  if(_loc12_.right < _loc44_)
                  {
                     _loc12_.right = _loc44_;
                  }
                  if(_loc12_.bottom < _loc45_)
                  {
                     _loc12_.bottom = _loc45_;
                  }
                  if(_loc41_ + _loc42_ > 0)
                  {
                     _loc12_.offset(-_loc12_.width / 2,-_loc12_.height * (_loc42_ / (_loc41_ + _loc42_)));
                  }
                  else
                  {
                     _loc12_.offset(-_loc12_.width / 2,-_loc12_.height / 2);
                  }
                  _loc33_ = _loc8_.getScreenPoint(_loc15_);
                  if(_loc33_ != null)
                  {
                     _loc33_.x += _loc6_.screenOffsetX;
                     _loc33_.y += _loc6_.screenOffsetY;
                     _loc15_.z = _loc11_;
                     _loc15_.x = Math.round(_loc23_.x * 2) / 2;
                     _loc15_.y = Math.round(_loc23_.y * 2) / 2;
                     if(_loc9_.location == null)
                     {
                        _loc8_.location = _loc15_;
                        if(this.useOffsetScrolling)
                        {
                           _loc9_.initializeLocation(new Vector3d(0,0,0));
                        }
                        else
                        {
                           _loc9_.initializeLocation(_loc15_);
                        }
                     }
                     _loc46_ = _loc8_.getScreenPoint(_loc15_);
                     _loc47_ = new Vector3d(0,0,0);
                     if(_loc46_ != null)
                     {
                        _loc47_.x = _loc46_.x;
                        _loc47_.y = _loc46_.y;
                     }
                     if((_loc33_.x < _loc12_.left || _loc33_.x > _loc12_.right) && !_loc37_ || (_loc33_.y < _loc12_.top || _loc33_.y > _loc12_.bottom) && !_loc38_ || _loc37_ && !_loc9_.centeredLocX || _loc38_ && !_loc9_.centeredLocY || (_loc9_.roomWd != _loc34_.width || _loc9_.roomHt != _loc34_.height))
                     {
                        _loc9_.limitedLocationX = _loc35_;
                        _loc9_.limitedLocationY = _loc36_;
                        if(this.useOffsetScrolling)
                        {
                           _loc9_.target = _loc47_;
                        }
                        else
                        {
                           _loc9_.target = _loc15_;
                        }
                     }
                     else
                     {
                        if(!_loc35_)
                        {
                           _loc9_.limitedLocationX = false;
                        }
                        if(!_loc36_)
                        {
                           _loc9_.limitedLocationY = false;
                        }
                     }
                  }
                  _loc9_.centeredLocX = _loc37_;
                  _loc9_.centeredLocY = _loc38_;
                  _loc9_.screenWd = _loc13_;
                  _loc9_.screenHt = _loc14_;
                  _loc9_.scale = _loc8_.scale;
                  _loc9_.geometryUpdateId = _loc8_.updateId;
                  _loc9_.roomWd = _loc34_.width;
                  _loc9_.roomHt = _loc34_.height;
                  if(this.useOffsetScrolling)
                  {
                     _loc9_.update(param5,8);
                  }
                  else
                  {
                     _loc9_.update(param5,0.5);
                  }
                  if(this.useOffsetScrolling)
                  {
                     _loc6_.screenOffsetX = -_loc9_.location.x;
                     _loc6_.screenOffsetY = -_loc9_.location.y;
                  }
                  else
                  {
                     _loc8_.adjustLocation(_loc9_.location,25);
                  }
               }
            }
         }
      }
      
      private function onObjectFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_859 = param2 as IRoomObjectFactory;
         this.initializeObjectEvents();
         this.initializeRoomManager();
      }
      
      private function onVisualizationFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_485 = param2 as IRoomObjectVisualizationFactory;
         if(this.var_13 != null)
         {
            this.var_13.visualizationFactory = this.var_485;
         }
         this.initializeRoomManager();
      }
      
      private function onRoomManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._roomManager = param2 as IRoomManager;
         if(this._roomManager != null)
         {
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.const_27);
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.const_26);
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.const_33);
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.const_306);
            this._roomManager.addObjectUpdateCategory(RoomObjectCategoryEnum.const_81);
            this._roomManager.setContentLoader(this.var_13);
         }
         this.initializeRoomManager();
      }
      
      private function onRendererFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1066 = param2 as IRoomRendererFactory;
         this.initializeRoomManager();
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._communication = param2 as IHabboCommunicationManager;
         if(this._communication != null)
         {
            this._connection = this._communication.getHabboMainConnection(this.onConnectionReady);
            if(this._connection != null)
            {
               this.onConnectionReady(this._connection);
            }
         }
         this.initializeRoomManager();
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
            if(this.var_1065 != null)
            {
               this.var_1065.connection = param1;
            }
         }
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_132 = param2 as IHabboConfigurationManager;
         if(this.var_13 != null)
         {
            events.addEventListener(RoomContentLoader.const_870,this.onContentLoaderReady);
            this.var_13.initialize(events,this.var_132);
         }
         this.var_2902 = this.var_132.getKey("room.dragging.always_center","0") == "1";
         this.initializeRoomManager();
      }
      
      private function onContentLoaderReady(param1:Event) : void
      {
         if(param1 != null && param1.type == RoomContentLoader.const_870)
         {
            this.var_2903 = true;
            this.initializeRoomManager();
         }
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_327 = param2 as IAdManager;
         this.var_327.events.addEventListener(AdEvent.const_580,this.showRoomAd);
         this.var_327.events.addEventListener(AdEvent.const_745,this.onRoomAdImageLoaded);
         this.var_327.events.addEventListener(AdEvent.const_932,this.onRoomAdImageLoaded);
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_367 = param2 as ISessionDataManager;
         this.var_13.sessionDataManager = this.var_367;
      }
      
      private function initializeObjectEvents() : void
      {
         if(this.var_859 != null)
         {
            this.var_859.addObjectEventListener(this.roomObjectEventHandler);
         }
      }
      
      private function initializeRoomManager() : void
      {
         if(this.var_859 == null || this.var_485 == null || this._roomManager == null || this.var_1066 == null || this._communication == null || this.var_132 == null || !this.var_2903)
         {
            return;
         }
         this._roomManager.initialize(<nothing/>,this);
      }
      
      public function roomManagerInitialized(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1)
         {
            this.var_563 = true;
            events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_828,0,0));
            _loc2_ = 0;
            while(_loc2_ < this.var_397.length)
            {
               _loc3_ = this.var_397.getWithIndex(_loc2_) as RoomData;
               if(_loc3_ != null)
               {
                  this.initializeRoom(_loc3_.roomId,_loc3_.roomCategory,_loc3_.data);
               }
               _loc2_++;
            }
         }
      }
      
      public function setActiveRoom(param1:int, param2:int) : void
      {
         this.var_94 = param1;
         this.var_93 = param2;
      }
      
      public function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
      
      private function getRoomId(param1:String) : int
      {
         return 1;
      }
      
      private function getRoomCategory(param1:String) : int
      {
         return 1;
      }
      
      public function isPublicRoom(param1:int, param2:int) : Boolean
      {
         return this.isPublicRoomWorldType(this.getWorldType(param1,param2));
      }
      
      public function getRoomNumberValue(param1:int, param2:int, param3:String) : Number
      {
         var _loc4_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc4_ != null)
         {
            return _loc4_.getNumber(param3);
         }
         return NaN;
      }
      
      public function getRoomStringValue(param1:int, param2:int, param3:String) : String
      {
         var _loc4_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc4_ != null)
         {
            return _loc4_.getString(param3);
         }
         return null;
      }
      
      public function setIsPlayingGame(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc4_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc4_ != null)
         {
            _loc5_ = !!param3 ? 1 : 0;
            _loc4_.setNumber(RoomVariableEnum.const_1098,_loc5_);
            if(_loc5_ == 0)
            {
               events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_582,param1,param2));
            }
            else
            {
               events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_623,param1,param2));
            }
         }
      }
      
      public function getIsPlayingGame(param1:int, param2:int) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc3_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.getNumber(RoomVariableEnum.const_1098);
            if(_loc4_ > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getRoom(param1:int, param2:int) : IRoomInstance
      {
         if(!this.var_563)
         {
            return null;
         }
         var _loc3_:String = this.getRoomIdentifier(param1,param2);
         return this._roomManager.getRoom(_loc3_);
      }
      
      public function initializeRoom(param1:int, param2:int, param3:XML) : void
      {
         var _loc4_:String = this.getRoomIdentifier(param1,param2);
         var _loc5_:* = null;
         var _loc6_:String = "111";
         var _loc7_:String = "201";
         var _loc8_:String = "1";
         if(!this.var_563)
         {
            _loc5_ = this.var_397.remove(_loc4_);
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.floorType;
               _loc7_ = _loc5_.wallType;
               _loc8_ = _loc5_.landscapeType;
            }
            _loc5_ = new RoomData(param1,param2,param3);
            _loc5_.floorType = _loc6_;
            _loc5_.wallType = _loc7_;
            _loc5_.landscapeType = _loc8_;
            this.var_397.add(_loc4_,_loc5_);
            Logger.log("Room Engine not initilized yet, can not create room. Room data stored for later initialization.");
            return;
         }
         if(param3 == null)
         {
            Logger.log("Room property messages received before floor height map, will initialize when floor height map received.");
            return;
         }
         _loc5_ = this.var_397.remove(_loc4_);
         if(_loc5_ != null)
         {
            if(_loc5_.floorType != null && _loc5_.floorType.length > 0)
            {
               _loc6_ = _loc5_.floorType;
            }
            if(_loc5_.wallType != null && _loc5_.wallType.length > 0)
            {
               _loc7_ = _loc5_.wallType;
            }
            if(_loc5_.landscapeType != null && _loc5_.landscapeType.length > 0)
            {
               _loc8_ = _loc5_.landscapeType;
            }
         }
         var _loc9_:IRoomInstance = this.createRoom(_loc4_,param3,_loc6_,_loc7_,_loc8_,this.getWorldType(param1,param2));
         if(_loc9_ == null)
         {
            return;
         }
         events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_343,param1,param2));
      }
      
      private function createRoom(param1:String, param2:XML, param3:String, param4:String, param5:String, param6:String) : IRoomInstance
      {
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         if(!this.var_563)
         {
            return null;
         }
         var _loc7_:IRoomInstance = this._roomManager.createRoom(param1,param2);
         if(_loc7_ == null)
         {
            return null;
         }
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = 1;
         if(this.isPublicRoomWorldType(param6))
         {
            _loc11_ = this.var_13.getPublicRoomContentType(param6);
            _loc9_ = _loc7_.createRoomObject(const_370,_loc11_,_loc8_) as IRoomObjectController;
            _loc9_.getModelController().setString(RoomObjectVariableEnum.const_1165,param6,true);
            _loc7_.setNumber(RoomVariableEnum.const_873,1,true);
            _loc12_ = parseInt(this.var_132.getKey("ads.billboard.displayDelayMillis","1000"));
            _loc9_.getModelController().setNumber(RoomVariableEnum.const_1192,_loc12_,true);
            if(this.var_13 != null)
            {
               _loc10_ = Number(this.var_13.getPublicRoomWorldHeightScale(param6));
            }
         }
         else
         {
            _loc9_ = _loc7_.createRoomObject(const_370,const_682,_loc8_) as IRoomObjectController;
            _loc7_.setNumber(RoomVariableEnum.const_873,0,true);
         }
         _loc7_.setNumber(RoomVariableEnum.const_977,_loc10_,true);
         if(param2 != null)
         {
            _loc13_ = 0;
            if(param2.dimensions.length() == 1)
            {
               _loc14_ = param2.dimensions[0];
               _loc15_ = Number(_loc14_.@minX);
               _loc16_ = Number(_loc14_.@maxX);
               _loc17_ = Number(_loc14_.@minY);
               _loc18_ = Number(_loc14_.@maxY);
               _loc7_.setNumber(RoomVariableEnum.const_742,_loc15_);
               _loc7_.setNumber(RoomVariableEnum.const_748,_loc16_);
               _loc7_.setNumber(RoomVariableEnum.const_769,_loc17_);
               _loc7_.setNumber(RoomVariableEnum.const_899,_loc18_);
               _loc13_ += _loc15_ * 423 + _loc16_ * 671 + _loc17_ * 913 + _loc18_ * 7509;
               if(_loc9_ != null && _loc9_.getModelController() != null)
               {
                  _loc9_.getModelController().setNumber(RoomObjectVariableEnum.const_1128,_loc13_,true);
               }
            }
         }
         if(_loc9_ != null && _loc9_.getEventHandler() != null)
         {
            _loc9_.getEventHandler().initialize(param2);
            _loc19_ = null;
            if(param3 != null)
            {
               _loc19_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_893,param3);
               _loc9_.getEventHandler().processUpdateMessage(_loc19_);
               _loc7_.setString(RoomObjectVariableEnum.const_200,param3);
            }
            if(param4 != null)
            {
               _loc19_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_841,param4);
               _loc9_.getEventHandler().processUpdateMessage(_loc19_);
               _loc7_.setString(RoomObjectVariableEnum.const_221,param4);
            }
            if(param5 != null)
            {
               _loc19_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_687,param5);
               _loc9_.getEventHandler().processUpdateMessage(_loc19_);
               _loc7_.setString(RoomObjectVariableEnum.const_203,param5);
            }
            if(param2 != null)
            {
               if(param2.doors.door.length() > 0)
               {
                  _loc20_ = param2.doors.door;
                  _loc21_ = ["x","y","z","dir"];
                  _loc22_ = null;
                  _loc23_ = 0;
                  while(_loc23_ < _loc20_.length())
                  {
                     _loc24_ = _loc20_[_loc23_];
                     if(XMLValidator.checkRequiredAttributes(_loc24_,_loc21_))
                     {
                        _loc25_ = Number(_loc24_.@x);
                        _loc26_ = Number(_loc24_.@y);
                        _loc27_ = Number(_loc24_.@z);
                        _loc28_ = Number(_loc24_.@dir);
                        _loc29_ = "null";
                        _loc30_ = "door_" + _loc23_;
                        _loc31_ = new Vector3d(_loc25_,_loc26_,_loc27_);
                        _loc22_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_584,_loc30_,_loc29_,_loc31_,RoomObjectRoomMaskUpdateMessage.const_284);
                        _loc9_.getEventHandler().processUpdateMessage(_loc22_);
                        if(_loc28_ == 90 || _loc28_ == 180)
                        {
                           if(_loc28_ == 90)
                           {
                              _loc7_.setNumber(RoomObjectVariableEnum.const_780,_loc25_ - 0.5,true);
                              _loc7_.setNumber(RoomObjectVariableEnum.const_764,_loc26_,true);
                           }
                           if(_loc28_ == 180)
                           {
                              _loc7_.setNumber(RoomObjectVariableEnum.const_780,_loc25_,true);
                              _loc7_.setNumber(RoomObjectVariableEnum.const_764,_loc26_ - 0.5,true);
                           }
                           _loc7_.setNumber(RoomObjectVariableEnum.const_1157,_loc27_,true);
                           _loc7_.setNumber(RoomObjectVariableEnum.const_1254,_loc28_,true);
                        }
                     }
                     _loc23_++;
                  }
               }
            }
         }
         _loc7_.createRoomObject(const_1080,const_1530,RoomObjectCategoryEnum.const_306);
         if(this.var_132.getKey("avatar.widget.enabled","0") == "0")
         {
            _loc7_.createRoomObject(const_1081,const_1529,RoomObjectCategoryEnum.const_306);
         }
         return _loc7_;
      }
      
      public function getObjectRoom(param1:int, param2:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),const_370,RoomObjectCategoryEnum.const_81);
      }
      
      public function updateObjectRoom(param1:int, param2:int, param3:String = null, param4:String = null, param5:String = null, param6:Boolean = false) : Boolean
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc7_:IRoomObjectController = this.getObjectRoom(param1,param2);
         var _loc8_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc7_ == null)
         {
            _loc10_ = this.getRoomIdentifier(param1,param2);
            _loc11_ = this.var_397.getValue(_loc10_);
            if(_loc11_ == null)
            {
               _loc11_ = new RoomData(param1,param2,null);
               this.var_397.add(_loc10_,_loc11_);
            }
            if(param3 != null)
            {
               _loc11_.floorType = param3;
            }
            if(param4 != null)
            {
               _loc11_.wallType = param4;
            }
            if(param5 != null)
            {
               _loc11_.landscapeType = param5;
            }
            return true;
         }
         if(_loc7_.getEventHandler() == null)
         {
            return false;
         }
         var _loc9_:* = null;
         if(param3 != null)
         {
            if(_loc8_ != null && !param6)
            {
               _loc8_.setString(RoomObjectVariableEnum.const_200,param3);
            }
            _loc9_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_893,param3);
            _loc7_.getEventHandler().processUpdateMessage(_loc9_);
         }
         if(param4 != null)
         {
            if(_loc8_ != null && !param6)
            {
               _loc8_.setString(RoomObjectVariableEnum.const_221,param4);
            }
            _loc9_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_841,param4);
            _loc7_.getEventHandler().processUpdateMessage(_loc9_);
         }
         if(param5 != null)
         {
            if(_loc8_ != null && !param6)
            {
               _loc8_.setString(RoomObjectVariableEnum.const_203,param5);
            }
            _loc9_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_687,param5);
            _loc7_.getEventHandler().processUpdateMessage(_loc9_);
         }
         return true;
      }
      
      public function updateObjectRoomColor(param1:int, param2:int, param3:uint, param4:int, param5:Boolean) : Boolean
      {
         var _loc6_:IRoomObjectController = this.getObjectRoom(param1,param2);
         if(_loc6_ == null || _loc6_.getEventHandler() == null)
         {
            return false;
         }
         var _loc7_:* = null;
         _loc7_ = new RoomObjectRoomColorUpdateMessage(RoomObjectRoomColorUpdateMessage.const_1590,param3,param4,param5);
         _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         events.dispatchEvent(new RoomEngineRoomColorEvent(param1,param2,param3,param4,param5));
         return true;
      }
      
      public function updateObjectRoomVisibilities(param1:int, param2:int, param3:Boolean, param4:Boolean = true) : Boolean
      {
         var _loc5_:IRoomObjectController = this.getObjectRoom(param1,param2);
         if(_loc5_ == null || _loc5_.getEventHandler() == null)
         {
            return false;
         }
         var _loc6_:* = null;
         _loc6_ = new RoomObjectRoomPlaneVisibilityUpdateMessage(RoomObjectRoomPlaneVisibilityUpdateMessage.const_1159,param3);
         _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         _loc6_ = new RoomObjectRoomPlaneVisibilityUpdateMessage(RoomObjectRoomPlaneVisibilityUpdateMessage.const_1280,param4);
         _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         return true;
      }
      
      public function disposeRoom(param1:int, param2:int) : void
      {
         var _loc3_:String = this.getRoomIdentifier(param1,param2);
         this._roomManager.disposeRoom(_loc3_);
         var _loc4_:RoomInstanceData = this.var_329.remove(_loc3_);
         if(_loc4_ != null)
         {
            _loc4_.dispose();
         }
         events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_345,param1,param2));
      }
      
      public function setOwnUserId(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:RoomCamera = this.getRoomCamera(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.targetId = param3;
            _loc4_.targetCategory = RoomObjectCategoryEnum.const_33;
         }
      }
      
      public function createRoomCanvas(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : DisplayObject
      {
         var _loc12_:* = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc7_:String = this.getRoomIdentifier(param1,param2);
         var _loc8_:IRoomInstance = this._roomManager.getRoom(_loc7_);
         if(_loc8_ == null)
         {
            return null;
         }
         var _loc9_:IRoomRenderer = _loc8_.getRenderer() as IRoomRenderer;
         if(_loc9_ == null)
         {
            _loc9_ = this.var_1066.createRenderer();
         }
         if(_loc9_ == null)
         {
            return null;
         }
         _loc9_.roomObjectVariableAccurateZ = RoomObjectVariableEnum.const_1279;
         _loc8_.setRenderer(_loc9_);
         var _loc10_:IRoomRenderingCanvas = _loc9_.createCanvas(param3,param4,param5,param6);
         if(_loc10_ == null)
         {
            return null;
         }
         _loc10_.mouseListener = this.var_66;
         if(_loc10_.geometry != null)
         {
            _loc12_ = this.getWorldType(param1,param2);
            if(this.isPublicRoomWorldType(_loc12_))
            {
               if(this.var_13 != null)
               {
                  if(this.var_13.getPublicRoomWorldSize(_loc12_) != 64)
                  {
                     _loc10_.geometry.performZoomOut();
                  }
               }
            }
            _loc10_.geometry.z_scale = _loc8_.getNumber(RoomVariableEnum.const_977);
         }
         if(_loc10_.geometry != null)
         {
            _loc13_ = _loc8_.getNumber(RoomObjectVariableEnum.const_780);
            _loc14_ = _loc8_.getNumber(RoomObjectVariableEnum.const_764);
            _loc15_ = _loc8_.getNumber(RoomObjectVariableEnum.const_1157);
            _loc16_ = _loc8_.getNumber(RoomObjectVariableEnum.const_1254);
            _loc17_ = new Vector3d(_loc13_,_loc14_,_loc15_);
            _loc18_ = null;
            if(_loc16_ == 90)
            {
               _loc18_ = new Vector3d(-1000,0,0);
            }
            if(_loc16_ == 180)
            {
               _loc18_ = new Vector3d(0,-1000,0);
            }
            _loc10_.geometry.setDisplacement(_loc17_,_loc18_);
         }
         var _loc11_:Sprite = _loc10_.displayObject as Sprite;
         if(_loc11_ != null)
         {
            _loc19_ = new Sprite();
            _loc19_.name = OVERLAY_SPRITE;
            _loc19_.mouseEnabled = false;
            _loc11_.addChild(_loc19_);
         }
         return _loc11_;
      }
      
      private function getRoomCanvas(param1:int, param2:int, param3:int) : IRoomRenderingCanvas
      {
         var _loc4_:String = this.getRoomIdentifier(param1,param2);
         var _loc5_:IRoomInstance = this._roomManager.getRoom(_loc4_);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:IRoomRenderer = _loc5_.getRenderer() as IRoomRenderer;
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getCanvas(param3);
      }
      
      public function modifyRoomCanvas(param1:int, param2:int, param3:int, param4:int, param5:int) : Boolean
      {
         var _loc6_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc6_ == null)
         {
            return false;
         }
         _loc6_.initialize(param4,param5);
         return true;
      }
      
      public function setRoomCanvasMask(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         var _loc5_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.useMask = param4;
      }
      
      private function getRoomCanvasRectangle(param1:int, param2:int, param3:int) : Rectangle
      {
         var _loc4_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return new Rectangle(0,0,_loc4_.width,_loc4_.height);
      }
      
      public function getRoomCanvasGeometry(param1:int, param2:int, param3:int) : IRoomGeometry
      {
         var _loc4_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return _loc4_.geometry;
      }
      
      public function getRoomCanvasScreenOffset(param1:int, param2:int, param3:int) : Point
      {
         var _loc4_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return new Point(_loc4_.screenOffsetX,_loc4_.screenOffsetY);
      }
      
      private function handleRoomDragging(param1:IRoomRenderingCanvas, param2:int, param3:int, param4:String, param5:Boolean, param6:Boolean, param7:Boolean) : Boolean
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc8_:int = param2 - this.var_1604;
         var _loc9_:int = param3 - this.var_1605;
         if(param4 == MouseEvent.MOUSE_DOWN)
         {
            if(!param5 && !param6 && !param7)
            {
               this.var_1323 = true;
               this.var_857 = false;
               this.var_2901 = this.var_1604;
               this.var_2904 = this.var_1605;
            }
         }
         else if(param4 == MouseEvent.MOUSE_UP)
         {
            if(this.var_1323)
            {
               this.var_1323 = false;
               if(this.var_857)
               {
                  _loc10_ = this.getRoomInstanceData(this.var_94,this.var_93);
                  if(_loc10_ != null)
                  {
                     _loc11_ = _loc10_.roomCamera;
                     if(_loc11_ != null)
                     {
                        if(this.useOffsetScrolling)
                        {
                           if(!_loc11_.isMoving)
                           {
                              _loc11_.centeredLocX = false;
                              _loc11_.centeredLocY = false;
                           }
                           _loc11_.resetLocation(new Vector3d(-param1.screenOffsetX,-param1.screenOffsetY));
                        }
                        if(this.var_2902)
                        {
                           _loc11_.scale = 0;
                        }
                     }
                  }
               }
            }
         }
         else if(param4 == MouseEvent.MOUSE_MOVE)
         {
            if(this.var_1323)
            {
               if(!this.var_857)
               {
                  _loc8_ = param2 - this.var_2901;
                  _loc9_ = param3 - this.var_2904;
                  if(_loc8_ <= -const_467 || _loc8_ >= const_467 || _loc9_ <= -const_467 || _loc9_ >= const_467)
                  {
                     this.var_857 = true;
                  }
                  _loc8_ = 0;
                  _loc9_ = 0;
               }
               if(_loc8_ != 0 || _loc9_ != 0)
               {
                  param1.screenOffsetX += _loc8_;
                  param1.screenOffsetY += _loc9_;
                  this.var_857 = true;
               }
            }
         }
         else if(param4 == MouseEvent.CLICK)
         {
            if(this.var_857)
            {
               this.var_857 = false;
               return true;
            }
         }
         return false;
      }
      
      public function handleRoomCanvasMouseEvent(param1:int, param2:int, param3:int, param4:String, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean) : void
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc9_:IRoomRenderingCanvas = this.getRoomCanvas(this.var_94,this.var_93,param1);
         if(_loc9_ != null)
         {
            _loc10_ = this.getOverlaySprite(_loc9_);
            _loc11_ = this.getOverlayIconSprite(_loc10_,const_371);
            if(_loc11_ != null)
            {
               _loc12_ = _loc11_.getRect(_loc11_);
               _loc11_.x = param2 - _loc12_.width / 2;
               _loc11_.y = param3 - _loc12_.height / 2;
            }
            if(!this.handleRoomDragging(_loc9_,param2,param3,param4,param5,param6,param7))
            {
               if(!_loc9_.handleMouseEvent(param2,param3,param4,param5,param6,param7,param8))
               {
                  _loc13_ = "";
                  if(param4 == MouseEvent.CLICK)
                  {
                     if(events != null)
                     {
                        events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_511,this.var_94,this.var_93,-1,RoomObjectCategoryEnum.const_186));
                     }
                     _loc13_ = "null";
                  }
                  else if(param4 == MouseEvent.MOUSE_MOVE)
                  {
                     _loc13_ = "null";
                  }
                  else if(param4 == MouseEvent.MOUSE_DOWN)
                  {
                     _loc13_ = "null";
                  }
                  if(this.var_66 != null)
                  {
                     _loc14_ = new RoomObjectMouseEvent(_loc13_,null,const_370,const_682);
                     this.var_66.handleRoomObjectEvent(_loc14_,this.var_94,this.var_93);
                  }
               }
            }
            this.var_1603 = param1;
            this.var_1604 = param2;
            this.var_1605 = param3;
         }
      }
      
      private function getOverlaySprite(param1:IRoomRenderingCanvas) : Sprite
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Sprite = param1.displayObject as Sprite;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getChildByName(OVERLAY_SPRITE) as Sprite;
      }
      
      private function addOverlayIconSprite(param1:Sprite, param2:String, param3:BitmapData) : Sprite
      {
         if(param1 == null || param3 == null)
         {
            return null;
         }
         var _loc4_:Sprite = this.getOverlayIconSprite(param1,param2);
         if(_loc4_ != null)
         {
            return null;
         }
         _loc4_ = new Sprite();
         _loc4_.name = param2;
         _loc4_.mouseEnabled = false;
         var _loc5_:Bitmap = new Bitmap(param3);
         _loc4_.addChild(_loc5_);
         param1.addChild(_loc4_);
         return _loc4_;
      }
      
      private function removeOverlayIconSprite(param1:Sprite, param2:String) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc3_) as Sprite;
            if(_loc4_ != null)
            {
               if(_loc4_.name == param2)
               {
                  param1.removeChildAt(_loc3_);
                  _loc5_ = _loc4_.getChildAt(0) as Bitmap;
                  if(_loc5_ != null && _loc5_.bitmapData != null)
                  {
                     _loc5_.bitmapData.dispose();
                     _loc5_.bitmapData = null;
                  }
                  return true;
               }
            }
            _loc3_--;
         }
         return false;
      }
      
      private function getOverlayIconSprite(param1:Sprite, param2:String) : Sprite
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc3_) as Sprite;
            if(_loc4_ != null)
            {
               if(_loc4_.name == param2)
               {
                  return _loc4_;
               }
            }
            _loc3_--;
         }
         return null;
      }
      
      public function setObjectMoverIconSprite(param1:int, param2:int, param3:Boolean, param4:String = null) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc5_:* = null;
         if(param3)
         {
            _loc5_ = this.getRoomObjectImage(this.var_94,this.var_93,param1,param2,new Vector3d(),1,null);
         }
         else if(this.var_13 != null)
         {
            _loc7_ = null;
            _loc8_ = 0;
            if(param2 == RoomObjectCategoryEnum.const_27)
            {
               _loc7_ = this.var_13.getActiveObjectType(param1);
               _loc8_ = this.var_13.getActiveObjectColorIndex(param1);
            }
            else if(param2 == RoomObjectCategoryEnum.const_26)
            {
               _loc7_ = this.var_13.getWallItemType(param1,param4);
               _loc8_ = this.var_13.getWallItemColorIndex(param1);
            }
            if(param2 == RoomObjectCategoryEnum.const_33)
            {
               _loc7_ = this.getUserType(param1);
               if(_loc7_ == "pet")
               {
                  _loc7_ = this.getPetType(param4);
               }
               _loc5_ = this.getGenericRoomObjectImage(_loc7_,param4,new Vector3d(180),1,null);
            }
            else
            {
               _loc5_ = this.getGenericRoomObjectImage(_loc7_,String(_loc8_),new Vector3d(),1,null,0,param4);
            }
         }
         if(_loc5_ == null || _loc5_.data == null)
         {
            return;
         }
         var _loc6_:IRoomRenderingCanvas = this.getRoomCanvas(this.var_94,this.var_93,this.var_1603);
         if(_loc6_ != null)
         {
            _loc9_ = this.getOverlaySprite(_loc6_);
            this.removeOverlayIconSprite(_loc9_,const_371);
            _loc10_ = this.addOverlayIconSprite(_loc9_,const_371,_loc5_.data);
            if(_loc10_ != null)
            {
               _loc10_.x = this.var_1604 - _loc5_.data.width / 2;
               _loc10_.y = this.var_1605 - _loc5_.data.height / 2;
            }
         }
      }
      
      public function setObjectMoverIconSpriteVisible(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:IRoomRenderingCanvas = this.getRoomCanvas(this.var_94,this.var_93,this.var_1603);
         if(_loc2_ != null)
         {
            _loc3_ = this.getOverlaySprite(_loc2_);
            _loc4_ = this.getOverlayIconSprite(_loc3_,const_371);
            if(_loc4_ != null)
            {
               _loc4_.visible = param1;
            }
         }
      }
      
      public function removeObjectMoverIconSprite() : void
      {
         var _loc2_:* = null;
         var _loc1_:IRoomRenderingCanvas = this.getRoomCanvas(this.var_94,this.var_93,this.var_1603);
         if(_loc1_ != null)
         {
            _loc2_ = this.getOverlaySprite(_loc1_);
            this.removeOverlayIconSprite(_loc2_,const_371);
         }
      }
      
      public function getRoomObjectCount(param1:int, param2:int, param3:int) : int
      {
         if(!this.var_563)
         {
            return 0;
         }
         var _loc4_:String = this.getRoomIdentifier(param1,param2);
         var _loc5_:IRoomInstance = this._roomManager.getRoom(_loc4_);
         if(_loc5_ == null)
         {
            return 0;
         }
         return _loc5_.getObjectCount(param3);
      }
      
      public function getRoomObject(param1:int, param2:int, param3:int, param4:int) : IRoomObject
      {
         if(!this.var_563)
         {
            return null;
         }
         var _loc5_:String = this.getRoomIdentifier(param1,param2);
         return this.getObject(_loc5_,param3,param4);
      }
      
      public function getRoomObjectWithIndex(param1:int, param2:int, param3:int, param4:int) : IRoomObject
      {
         if(!this.var_563)
         {
            return null;
         }
         var _loc5_:String = this.getRoomIdentifier(param1,param2);
         var _loc6_:IRoomInstance = this._roomManager.getRoom(_loc5_);
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getObjectWithIndex(param3,param4);
      }
      
      public function modifyRoomObject(param1:int, param2:int, param3:String) : Boolean
      {
         if(this.var_66 != null)
         {
            return this.var_66.modifyRoomObject(this.var_94,this.var_93,param1,param2,param3);
         }
         return false;
      }
      
      public function modifyRoomObjectDataWithMap(param1:int, param2:int, param3:String, param4:Map) : Boolean
      {
         if(this.var_66 != null)
         {
            if(param2 == RoomObjectCategoryEnum.const_27)
            {
               return this.var_66.modifyRoomObjectData(this.var_94,this.var_93,param1,param2,param3,param4);
            }
         }
         return false;
      }
      
      public function modifyRoomObjectData(param1:int, param2:int, param3:String) : Boolean
      {
         if(this.var_66 != null)
         {
            if(param2 == RoomObjectCategoryEnum.const_26)
            {
               return this.var_66.modifyWallItemData(this.var_94,this.var_93,param1,param3);
            }
         }
         return false;
      }
      
      public function deleteRoomObject(param1:int, param2:int) : Boolean
      {
         if(this.var_66 != null)
         {
            if(param2 == RoomObjectCategoryEnum.const_26)
            {
               return this.var_66.deleteWallItem(this.var_94,this.var_93,param1);
            }
         }
         return false;
      }
      
      public function initializeRoomObjectInsert(param1:int, param2:int, param3:int, param4:String = null) : Boolean
      {
         var _loc5_:IRoomInstance = this.getRoom(this.var_94,this.var_93);
         if(_loc5_ == null || _loc5_.getNumber(RoomVariableEnum.const_873) != 0)
         {
            return false;
         }
         if(this.var_66 != null)
         {
            return this.var_66.initializeRoomObjectInsert(this.var_94,this.var_93,param1,param2,param3,param4);
         }
         return false;
      }
      
      public function cancelRoomObjectInsert() : void
      {
         if(this.var_66 != null)
         {
            this.var_66.cancelRoomObjectInsert(this.var_94,this.var_93);
         }
      }
      
      private function getRoomObjectAdURL(param1:String) : String
      {
         if(this.var_13 != null)
         {
            return this.var_13.getRoomObjectAdURL(param1);
         }
         return "";
      }
      
      public function setRoomObjectAlias(param1:String, param2:String) : void
      {
         if(this.var_13 != null)
         {
            this.var_13.setRoomObjectAlias(param1,param2);
         }
      }
      
      public function getRoomObjectCategory(param1:String) : int
      {
         if(this.var_13 != null)
         {
            return this.var_13.getObjectCategory(param1);
         }
         return RoomObjectCategoryEnum.const_186;
      }
      
      public function getFurnitureType(param1:int) : String
      {
         if(this.var_13 != null)
         {
            return this.var_13.getActiveObjectType(param1);
         }
         return "";
      }
      
      public function getWallItemType(param1:int, param2:String = null) : String
      {
         if(this.var_13 != null)
         {
            return this.var_13.getWallItemType(param1,param2);
         }
         return "";
      }
      
      private function getUserType(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return "user";
            case 2:
               return "pet";
            case 3:
               return "bot";
            default:
               return null;
         }
      }
      
      private function getPetType(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(param1 != null)
         {
            _loc2_ = param1.split(" ");
            if(_loc2_.length > 1)
            {
               _loc3_ = parseInt(_loc2_[0]);
               if(_loc3_ >= 8)
               {
                  if(this.var_13 != null)
                  {
                     return this.var_13.getPetType(_loc3_);
                  }
               }
               return "pet";
            }
         }
         return null;
      }
      
      public function getPetColor(param1:int, param2:int) : PetColorResult
      {
         if(this.var_13 != null)
         {
            return this.var_13.getPetColor(param1,param2);
         }
         return null;
      }
      
      private function getFurnitureColorIndex(param1:int) : int
      {
         if(this.var_13 != null)
         {
            return this.var_13.getActiveObjectColorIndex(param1);
         }
         return 0;
      }
      
      private function getWallItemColorIndex(param1:int) : int
      {
         if(this.var_13 != null)
         {
            return this.var_13.getWallItemColorIndex(param1);
         }
         return 0;
      }
      
      public function getSelectionArrow(param1:int, param2:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),const_1081,RoomObjectCategoryEnum.const_306);
      }
      
      public function getTileCursor(param1:int, param2:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),const_1080,RoomObjectCategoryEnum.const_306);
      }
      
      public function addObjectFurniture(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN, param10:int = -1) : Boolean
      {
         var _loc12_:* = null;
         var _loc11_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc11_ != null)
         {
            _loc12_ = new FurnitureData(param3,param4,null,param5,param6,param7,param8,param9,param10);
            _loc11_.addFurnitureData(_loc12_);
         }
         return true;
      }
      
      public function addObjectFurnitureByName(param1:int, param2:int, param3:int, param4:String, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN) : Boolean
      {
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc10_:String = this.getWorldType(param1,param2);
         if(this.isPublicRoomWorldType(_loc10_) && this.var_13 != null)
         {
            _loc12_ = this.var_13.getPublicRoomContentType(_loc10_) + "_";
            param4 = _loc12_ + param4;
         }
         var _loc11_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc11_ != null)
         {
            _loc13_ = new FurnitureData(param3,0,param4,param5,param6,param7,param8,param9,0);
            _loc11_.addFurnitureData(_loc13_);
         }
         return true;
      }
      
      private function addObjectFurnitureFromData(param1:int, param2:int, param3:int, param4:FurnitureData) : Boolean
      {
         var _loc11_:* = null;
         if(param4 == null)
         {
            _loc11_ = this.getRoomInstanceData(param1,param2);
            if(_loc11_ != null)
            {
               param4 = _loc11_.getFurnitureDataWithId(param3);
            }
         }
         if(param4 == null)
         {
            return false;
         }
         var _loc5_:Boolean = false;
         var _loc6_:String = param4.type;
         if(_loc6_ == null)
         {
            _loc6_ = this.getFurnitureType(param4.typeId);
            _loc5_ = true;
         }
         var _loc7_:int = this.getFurnitureColorIndex(param4.typeId);
         var _loc8_:String = this.getRoomObjectAdURL(_loc6_);
         if(_loc6_ == null)
         {
            _loc6_ = "";
         }
         var _loc9_:IRoomObjectController = this.createObjectFurniture(param1,param2,param3,_loc6_);
         if(_loc9_ == null)
         {
            return false;
         }
         if(_loc9_ != null && _loc9_.getModelController() != null && _loc5_)
         {
            _loc9_.getModelController().setNumber(RoomObjectVariableEnum.const_271,_loc7_,true);
            _loc9_.getModelController().setNumber(RoomObjectVariableEnum.const_253,param4.typeId,true);
            _loc9_.getModelController().setString(RoomObjectVariableEnum.const_428,_loc8_,true);
            _loc9_.getModelController().setNumber(RoomObjectVariableEnum.const_825,1,true);
            _loc9_.getModelController().setNumber(RoomObjectVariableEnum.const_1198,param4.expiryTime);
            _loc9_.getModelController().setNumber(RoomObjectVariableEnum.const_1194,getTimer());
         }
         if(!this.updateObjectFurniture(param1,param2,param3,param4.loc,param4.dir,param4.state,param4.data,param4.extra))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_426,param1,param2,param3,RoomObjectCategoryEnum.const_27));
         }
         var _loc10_:ISelectedRoomObjectData = this.getPlacedObjectData(param1,param2);
         if(_loc10_ && Math.abs(_loc10_.id) == param3 && _loc10_.category == RoomObjectCategoryEnum.const_27)
         {
            this.selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.const_27);
         }
         return true;
      }
      
      public function updateObjectFurniture(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String, param8:Number = NaN) : Boolean
      {
         var _loc9_:IRoomObjectController = this.getObjectFurniture(param1,param2,param3);
         if(_loc9_ == null)
         {
            return false;
         }
         var _loc10_:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(param4,param5);
         var _loc11_:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(param6,param7,param8);
         if(_loc9_ != null && _loc9_.getEventHandler() != null)
         {
            _loc9_.getEventHandler().processUpdateMessage(_loc10_);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         return true;
      }
      
      public function updateObjectFurnitureLocation(param1:int, param2:int, param3:int, param4:RoomObjectUpdateMessage) : Boolean
      {
         var _loc5_:IRoomObjectController = this.getObjectFurniture(param1,param2,param3);
         if(_loc5_ == null)
         {
            return false;
         }
         if(_loc5_ != null && _loc5_.getEventHandler() != null)
         {
            _loc5_.getEventHandler().processUpdateMessage(param4);
         }
         return true;
      }
      
      private function createObjectFurniture(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return this.createObject(this.getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      private function getObjectFurniture(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_27);
      }
      
      public function disposeObjectFurniture(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.getFurnitureDataWithId(param3);
         }
         this.disposeObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_27);
         this.removeBtnMouseCursorOwner(RoomObjectCategoryEnum.const_27,param3);
      }
      
      public function addObjectWallItem(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String) : Boolean
      {
         var _loc10_:* = null;
         var _loc9_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc9_ != null)
         {
            _loc10_ = new FurnitureData(param3,param4,null,param5,param6,param7,param8);
            _loc9_.addWallItemData(_loc10_);
         }
         return true;
      }
      
      private function addObjectWallItemFromData(param1:int, param2:int, param3:int, param4:FurnitureData) : Boolean
      {
         var _loc10_:* = null;
         if(param4 == null)
         {
            _loc10_ = this.getRoomInstanceData(param1,param2);
            if(_loc10_ != null)
            {
               param4 = _loc10_.getWallItemDataWithId(param3);
            }
         }
         if(param4 == null)
         {
            return false;
         }
         var _loc5_:String = this.getWallItemType(param4.typeId,param4.data);
         var _loc6_:int = this.getWallItemColorIndex(param4.typeId);
         var _loc7_:String = this.getRoomObjectAdURL(_loc5_);
         if(_loc5_ == null)
         {
            _loc5_ = "";
         }
         var _loc8_:IRoomObjectController = this.createObjectWallItem(param1,param2,param3,_loc5_);
         if(_loc8_ == null)
         {
            return false;
         }
         if(_loc8_ != null && _loc8_.getModelController() != null)
         {
            _loc8_.getModelController().setNumber(RoomObjectVariableEnum.const_271,_loc6_,false);
            _loc8_.getModelController().setNumber(RoomObjectVariableEnum.const_253,param4.typeId,true);
            _loc8_.getModelController().setString(RoomObjectVariableEnum.const_428,_loc7_,true);
            _loc8_.getModelController().setNumber(RoomObjectVariableEnum.const_1279,1,true);
         }
         if(!this.updateObjectWallItem(param1,param2,param3,param4.loc,param4.dir,param4.state,param4.data))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_426,param1,param2,param3,RoomObjectCategoryEnum.const_26));
         }
         var _loc9_:ISelectedRoomObjectData = this.getPlacedObjectData(param1,param2);
         if(_loc9_ && _loc9_.id == param3 && _loc9_.category == RoomObjectCategoryEnum.const_26)
         {
            this.selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.const_26);
         }
         return true;
      }
      
      public function updateObjectWallItem(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String) : Boolean
      {
         var _loc8_:IRoomObjectController = this.getObjectWallItem(param1,param2,param3);
         if(_loc8_ == null)
         {
            return false;
         }
         var _loc9_:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(param4,param5);
         var _loc10_:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(param6,param7);
         if(_loc8_ != null && _loc8_.getEventHandler() != null)
         {
            _loc8_.getEventHandler().processUpdateMessage(_loc9_);
            _loc8_.getEventHandler().processUpdateMessage(_loc10_);
         }
         this.updateObjectRoomWindow(param1,param2,param3);
         return true;
      }
      
      public function updateObjectRoomWindow(param1:int, param2:int, param3:int, param4:Boolean = true) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc5_:String = "undefined_" + param3;
         var _loc6_:* = null;
         var _loc7_:IRoomObjectController = this.getObjectWallItem(param1,param2,param3);
         if(_loc7_ != null)
         {
            if(_loc7_.getModel() != null)
            {
               if(_loc7_.getModel().getNumber(RoomObjectVariableEnum.const_1107) > 0)
               {
                  _loc9_ = _loc7_.getModel().getString(RoomObjectVariableEnum.const_1168);
                  _loc10_ = _loc7_.getLocation();
                  if(param4)
                  {
                     _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_584,_loc5_,_loc9_,_loc10_);
                  }
                  else
                  {
                     _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_716,_loc5_);
                  }
               }
            }
         }
         else
         {
            _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_716,_loc5_);
         }
         var _loc8_:IRoomObjectController = this.getObjectRoom(param1,param2);
         if(_loc8_ != null && _loc8_.getEventHandler() != null && _loc6_ != null)
         {
            _loc8_.getEventHandler().processUpdateMessage(_loc6_);
         }
      }
      
      public function updateObjectWallItemData(param1:int, param2:int, param3:int, param4:String) : Boolean
      {
         var _loc5_:IRoomObjectController = this.getObjectWallItem(param1,param2,param3);
         if(_loc5_ == null)
         {
            return false;
         }
         var _loc6_:RoomObjectItemDataUpdateMessage = new RoomObjectItemDataUpdateMessage(param4);
         if(_loc5_ != null && _loc5_.getEventHandler() != null)
         {
            _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         }
         return true;
      }
      
      private function createObjectWallItem(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return this.createObject(this.getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      private function getObjectWallItem(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_26);
      }
      
      public function disposeObjectWallItem(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.getWallItemDataWithId(param3);
         }
         this.disposeObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_26);
         this.updateObjectRoomWindow(param1,param2,param3,false);
         this.removeBtnMouseCursorOwner(RoomObjectCategoryEnum.const_26,param3);
      }
      
      public function addObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:Number, param7:int, param8:String = null) : Boolean
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(this.getObjectUser(param1,param2,param3) != null)
         {
            return false;
         }
         var _loc9_:String = this.getUserType(param7);
         if(_loc9_ == "pet")
         {
            _loc9_ = this.getPetType(param8);
         }
         var _loc10_:IRoomObjectController = this.createObjectUser(param1,param2,param3,_loc9_);
         if(_loc10_ == null)
         {
            return false;
         }
         if(_loc10_ != null && _loc10_.getEventHandler() != null)
         {
            _loc11_ = new RoomObjectUpdateMessage(param4,param5);
            _loc10_.getEventHandler().processUpdateMessage(_loc11_);
            if(param8 != null)
            {
               _loc12_ = new RoomObjectAvatarFigureUpdateMessage(param8);
               _loc10_.getEventHandler().processUpdateMessage(_loc12_);
            }
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_426,param1,param2,param3,RoomObjectCategoryEnum.const_33));
         }
         return true;
      }
      
      public function updateObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:IVector3d = null, param7:Number = NaN) : Boolean
      {
         var _loc8_:IRoomObjectController = this.getObjectUser(param1,param2,param3);
         if(_loc8_ == null || _loc8_.getEventHandler() == null || _loc8_.getModel() == null)
         {
            return false;
         }
         if(param4 == null)
         {
            param4 = _loc8_.getLocation();
         }
         if(param6 == null)
         {
            param6 = _loc8_.getDirection();
         }
         if(isNaN(param7))
         {
            param7 = _loc8_.getModel().getNumber(RoomObjectVariableEnum.const_196);
         }
         var _loc9_:RoomObjectUpdateMessage = new RoomObjectAvatarUpdateMessage(param4,param5,param6,param7);
         _loc8_.getEventHandler().processUpdateMessage(_loc9_);
         return true;
      }
      
      public function updateObjectUserState(param1:int, param2:int, param3:int, param4:RoomObjectUpdateStateMessage) : Boolean
      {
         var _loc5_:IRoomObjectController = this.getObjectUser(param1,param2,param3);
         if(_loc5_ == null || _loc5_.getEventHandler() == null)
         {
            return false;
         }
         _loc5_.getEventHandler().processUpdateMessage(param4);
         return true;
      }
      
      private function createObjectUser(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return this.createObject(this.getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      private function getObjectUser(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_33);
      }
      
      public function disposeObjectUser(param1:int, param2:int, param3:int) : void
      {
         this.disposeObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_33);
      }
      
      private function createObject(param1:String, param2:int, param3:String, param4:int) : IRoomObjectController
      {
         var _loc5_:IRoomInstance = this._roomManager.getRoom(param1);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:* = null;
         return _loc5_.createRoomObject(param2,param3,param4) as IRoomObjectController;
      }
      
      private function getObject(param1:String, param2:int, param3:int) : IRoomObjectController
      {
         var _loc4_:IRoomInstance = this._roomManager.getRoom(param1);
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:* = null;
         _loc5_ = _loc4_.getObject(param2,param3) as IRoomObjectController;
         if(_loc5_ == null)
         {
            if(param3 == RoomObjectCategoryEnum.const_27)
            {
               this.addObjectFurnitureFromData(this.getRoomId(param1),this.getRoomCategory(param1),param2,null);
               _loc5_ = _loc4_.getObject(param2,param3) as IRoomObjectController;
            }
            else if(param3 == RoomObjectCategoryEnum.const_26)
            {
               this.addObjectWallItemFromData(this.getRoomId(param1),this.getRoomCategory(param1),param2,null);
               _loc5_ = _loc4_.getObject(param2,param3) as IRoomObjectController;
            }
         }
         return _loc5_;
      }
      
      private function disposeObject(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:IRoomInstance = this._roomManager.getRoom(param1);
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc4_.disposeObject(param2,param3))
         {
            if(events != null)
            {
               events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.ROOM_OBJECT_REMOVED,this.var_94,this.var_93,param2,param3));
            }
         }
      }
      
      private function roomObjectEventHandler(param1:RoomObjectEvent) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.handleRoomObjectEvent(param1,this.var_94,this.var_93);
         }
      }
      
      public function getFurnitureIcon(param1:int, param2:IGetImageListener, param3:String = null) : ImageResult
      {
         return this.getFurnitureImage(param1,new Vector3d(),1,param2,0,param3);
      }
      
      public function getWallItemIcon(param1:int, param2:IGetImageListener, param3:String = null) : ImageResult
      {
         return this.getWallItemImage(param1,new Vector3d(),1,param2,0,param3);
      }
      
      public function getFurnitureImage(param1:int, param2:IVector3d, param3:int, param4:IGetImageListener, param5:uint = 0, param6:String = null, param7:int = -1, param8:int = -1) : ImageResult
      {
         var _loc9_:* = null;
         var _loc10_:String = "";
         if(this.var_13 != null)
         {
            _loc9_ = this.var_13.getActiveObjectType(param1);
            _loc10_ = String(this.var_13.getActiveObjectColorIndex(param1));
         }
         return this.getGenericRoomObjectImage(_loc9_,_loc10_,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function getPetImage(param1:int, param2:int, param3:IVector3d, param4:int, param5:IGetImageListener, param6:uint = 0) : ImageResult
      {
         var _loc7_:* = null;
         var _loc8_:* = param2 + "";
         if(this.var_13 != null)
         {
            _loc7_ = this.var_13.getPetType(param1);
         }
         return this.getGenericRoomObjectImage(_loc7_,_loc8_,param3,param4,param5,param6);
      }
      
      public function getWallItemImage(param1:int, param2:IVector3d, param3:int, param4:IGetImageListener, param5:uint = 0, param6:String = null, param7:int = -1, param8:int = -1) : ImageResult
      {
         var _loc9_:* = null;
         var _loc10_:String = "";
         if(this.var_13 != null)
         {
            _loc9_ = this.var_13.getWallItemType(param1,param6);
            _loc10_ = String(this.var_13.getWallItemColorIndex(param1));
         }
         return this.getGenericRoomObjectImage(_loc9_,_loc10_,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function getRoomImage(param1:String, param2:String, param3:String, param4:int, param5:IGetImageListener, param6:String = null) : ImageResult
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         var _loc7_:String = const_682;
         var _loc8_:* = param1 + "\n" + param2 + "\n" + param3 + "\n";
         if(param6 != null)
         {
            _loc8_ += param6;
         }
         return this.getGenericRoomObjectImage(_loc7_,_loc8_,new Vector3d(),param4,param5);
      }
      
      public function getRoomObjectImage(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:int, param7:IGetImageListener, param8:uint = 0) : ImageResult
      {
         var _loc11_:* = null;
         var _loc14_:* = null;
         var _loc9_:* = null;
         var _loc10_:String = "";
         var _loc12_:String = this.getRoomIdentifier(param1,param2);
         var _loc13_:IRoomInstance = this._roomManager.getRoom(_loc12_);
         if(_loc13_ != null)
         {
            _loc14_ = _loc13_.getObject(param3,param4);
            if(_loc14_ != null && _loc14_.getModel() != null)
            {
               _loc9_ = _loc14_.getType();
               switch(param4)
               {
                  case RoomObjectCategoryEnum.const_27:
                  case RoomObjectCategoryEnum.const_26:
                     _loc10_ = String(_loc14_.getModel().getNumber(RoomObjectVariableEnum.const_271));
                     _loc11_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_336);
                     break;
                  case RoomObjectCategoryEnum.const_33:
                     _loc10_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_227);
               }
            }
         }
         return this.getGenericRoomObjectImage(_loc9_,_loc10_,param5,param6,param7,param8,_loc11_);
      }
      
      private function initializeRoomForGettingImage(param1:IRoomObjectController, param2:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         if(param2 != null)
         {
            _loc3_ = param2.split("\n");
            if(_loc3_.length >= 3)
            {
               _loc4_ = _loc3_[0];
               _loc5_ = _loc3_[1];
               _loc6_ = _loc3_[2];
               _loc7_ = _loc3_[3];
               _loc8_ = new RoomPlaneParser();
               _loc8_.addPlane(RoomPlaneData.const_199,new Vector3d(0,0,0),new Vector3d(10,0,0),new Vector3d(0,10,0));
               _loc8_.addPlane(RoomPlaneData.const_180,new Vector3d(0,0,0),new Vector3d(0,10,0),new Vector3d(0,0,10));
               _loc8_.addPlane(RoomPlaneData.const_180,new Vector3d(10,0,0),new Vector3d(-10,0,0),new Vector3d(0,0,10));
               _loc8_.addPlane(RoomPlaneData.const_358,new Vector3d(10,0,0),new Vector3d(-10,0,0),new Vector3d(0,0,10));
               _loc9_ = _loc8_.getXML();
               param1.getEventHandler().initialize(_loc9_);
               param1.getModelController().setString(RoomObjectVariableEnum.const_200,_loc4_);
               param1.getModelController().setString(RoomObjectVariableEnum.const_221,_loc5_);
               param1.getModelController().setString(RoomObjectVariableEnum.const_203,_loc6_);
               if(_loc7_ != null)
               {
                  _loc10_ = null;
                  _loc11_ = "undefined_1";
                  _loc10_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_584,_loc11_,_loc7_,new Vector3d(2,0,1.75));
                  param1.getEventHandler().processUpdateMessage(_loc10_);
               }
            }
         }
      }
      
      public function getGenericRoomObjectImage(param1:String, param2:String, param3:IVector3d, param4:int, param5:IGetImageListener, param6:uint = 0, param7:String = null, param8:int = -1, param9:int = -1) : ImageResult
      {
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc10_:ImageResult = new ImageResult();
         _loc10_.id = -1;
         if(!this.var_563 || param1 == null)
         {
            return _loc10_;
         }
         var _loc11_:IRoomInstance = this._roomManager.getRoom(const_683);
         if(_loc11_ == null)
         {
            _loc11_ = this._roomManager.createRoom(const_683,null);
            if(_loc11_ == null)
            {
               return _loc10_;
            }
         }
         var _loc12_:int = this.var_858.reserveNumber();
         var _loc13_:int = this.getRoomObjectCategory(param1);
         if(_loc12_ < 0)
         {
            return _loc10_;
         }
         _loc12_ += 1;
         var _loc14_:IRoomObjectController = _loc11_.createRoomObject(_loc12_,param1,_loc13_) as IRoomObjectController;
         if(_loc14_ == null || _loc14_.getModelController() == null || _loc14_.getEventHandler() == null)
         {
            return _loc10_;
         }
         switch(_loc13_)
         {
            case RoomObjectCategoryEnum.const_27:
            case RoomObjectCategoryEnum.const_26:
               _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_271,int(param2));
               _loc14_.getModelController().setString(RoomObjectVariableEnum.const_336,param7);
               break;
            case RoomObjectCategoryEnum.const_33:
               if(param1 == "user" || param1 == "bot" || param1 == "pet")
               {
                  _loc14_.getModelController().setString(RoomObjectVariableEnum.const_227,param2);
               }
               else
               {
                  _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_935,int(param2));
               }
               break;
            case RoomObjectCategoryEnum.const_81:
               this.initializeRoomForGettingImage(_loc14_,param2);
         }
         _loc14_.setDirection(param3);
         var _loc15_:* = null;
         _loc15_ = _loc14_.getVisualization() as IRoomObjectSpriteVisualization;
         if(_loc15_ == null)
         {
            _loc11_.disposeObject(_loc12_,_loc13_);
            return _loc10_;
         }
         if(param8 > -1)
         {
            _loc18_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_91);
            _loc19_ = new RoomObjectDataUpdateMessage(param8,_loc18_);
            if(_loc14_.getEventHandler() != null)
            {
               _loc14_.getEventHandler().processUpdateMessage(_loc19_);
            }
         }
         var _loc16_:RoomGeometry = new RoomGeometry(param4,new Vector3d(-135,30,0),new Vector3d(11,11,5));
         _loc15_.update(_loc16_,0,true,false);
         if(param9 > 0)
         {
            _loc20_ = 0;
            while(_loc20_ < param9)
            {
               _loc15_.update(_loc16_,0,true,false);
               _loc20_++;
            }
         }
         var _loc17_:BitmapData = _loc15_.getImage(param6);
         _loc10_.data = _loc17_;
         _loc10_.id = _loc12_;
         if(!this.isRoomObjectContentAvailable(param1) && param5 != null)
         {
            this.var_1324.add(String(_loc12_),param5);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_1109,param4,true);
         }
         else
         {
            _loc11_.disposeObject(_loc12_,_loc13_);
            this.var_858.freeNumber(_loc12_ - 1);
            _loc10_.id = 0;
         }
         _loc16_.dispose();
         return _loc10_;
      }
      
      public function getRoomObjectBoundingRectangle(param1:int, param2:int, param3:int, param4:int, param5:int) : Rectangle
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc6_:IRoomGeometry = this.getRoomCanvasGeometry(param1,param2,param5);
         if(_loc6_ != null)
         {
            _loc7_ = this.getRoomObject(param1,param2,param3,param4);
            if(_loc7_ != null)
            {
               _loc8_ = _loc7_.getVisualization();
               if(_loc8_ != null)
               {
                  _loc9_ = _loc8_.boundingRectangle;
                  _loc10_ = _loc6_.getScreenPoint(_loc7_.getLocation());
                  if(_loc10_ != null)
                  {
                     _loc9_.offset(_loc10_.x,_loc10_.y);
                     _loc11_ = this.getRoomCanvas(param1,param2,param5);
                     if(_loc11_ != null)
                     {
                        _loc9_.offset(_loc11_.width / 2 + _loc11_.screenOffsetX,_loc11_.height / 2 + _loc11_.screenOffsetY);
                        return _loc9_;
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function getRoomObjectScreenLocation(param1:int, param2:int, param3:int, param4:int, param5:int) : Point
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc6_:IRoomGeometry = this.getRoomCanvasGeometry(param1,param2,param5);
         if(_loc6_ != null)
         {
            _loc7_ = this.getRoomObject(param1,param2,param3,param4);
            if(_loc7_ != null)
            {
               _loc8_ = _loc6_.getScreenPoint(_loc7_.getLocation());
               if(_loc8_ != null)
               {
                  _loc9_ = this.getRoomCanvas(param1,param2,param5);
                  if(_loc9_ != null)
                  {
                     _loc8_.offset(_loc9_.width / 2 + _loc9_.screenOffsetX,_loc9_.height / 2 + _loc9_.screenOffsetY);
                  }
                  return _loc8_;
               }
            }
         }
         return null;
      }
      
      public function getActiveRoomBoundingRectangle(param1:int) : Rectangle
      {
         return this.getRoomObjectBoundingRectangle(this.var_94,this.var_93,const_370,RoomObjectCategoryEnum.const_81,param1);
      }
      
      public function isRoomObjectContentAvailable(param1:String) : Boolean
      {
         return this._roomManager.isContentAvailable(param1);
      }
      
      public function contentLoaded(param1:String, param2:Boolean = false) : void
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:Number = NaN;
         var _loc3_:IRoomInstance = this._roomManager.getRoom(const_683);
         if(_loc3_ == null)
         {
            return;
         }
         if(this.var_13 == null)
         {
            return;
         }
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:int = this.var_13.getObjectCategory(param1);
         var _loc7_:int = _loc3_.getObjectCount(_loc6_);
         var _loc8_:int = _loc7_ - 1;
         while(_loc8_ >= 0)
         {
            _loc9_ = _loc3_.getObjectWithIndex(_loc8_,_loc6_);
            if(_loc9_ != null && _loc9_.getModel() != null && _loc9_.getType() == param1)
            {
               _loc10_ = _loc9_.getId();
               _loc11_ = null;
               _loc12_ = null;
               _loc12_ = _loc9_.getVisualization() as IRoomObjectSpriteVisualization;
               if(_loc12_ != null)
               {
                  _loc14_ = _loc9_.getModel().getNumber(RoomObjectVariableEnum.const_1109);
                  if(_loc4_ != null && _loc5_ != _loc14_)
                  {
                     _loc4_.dispose();
                     _loc4_ = null;
                  }
                  if(_loc4_ == null)
                  {
                     _loc5_ = Number(_loc14_);
                     _loc4_ = new RoomGeometry(_loc14_,new Vector3d(-135,30,0),new Vector3d(11,11,5));
                  }
                  _loc12_.update(_loc4_,0,true,false);
                  _loc11_ = _loc12_.image;
               }
               _loc3_.disposeObject(_loc10_,_loc6_);
               this.var_858.freeNumber(_loc10_ - 1);
               _loc13_ = this.var_1324.remove(String(_loc10_)) as IGetImageListener;
               if(_loc13_ != null && _loc11_ != null)
               {
                  _loc13_.imageReady(_loc10_,_loc11_);
               }
               else if(_loc11_ != null)
               {
                  _loc11_.dispose();
               }
            }
            _loc8_--;
         }
         if(_loc4_ != null)
         {
            _loc4_.dispose();
         }
      }
      
      public function objectInitialized(param1:String, param2:int, param3:int) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc4_:int = this.getRoomId(param1);
         var _loc5_:int = this.getRoomCategory(param1);
         if(param3 == RoomObjectCategoryEnum.const_26)
         {
            this.updateObjectRoomWindow(_loc4_,_loc5_,param2);
         }
         var _loc6_:IRoomObjectController = this.getRoomObject(_loc4_,_loc5_,param2,param3) as IRoomObjectController;
         if(_loc6_ != null && _loc6_.getModel() != null && _loc6_.getEventHandler() != null)
         {
            _loc7_ = _loc6_.getModel().getString(RoomObjectVariableEnum.const_91);
            if(_loc7_ != null)
            {
               _loc8_ = _loc6_.getState(0);
               _loc9_ = new RoomObjectDataUpdateMessage(_loc8_,_loc7_);
               _loc6_.getEventHandler().processUpdateMessage(_loc9_);
            }
         }
      }
      
      public function selectAvatar(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         if(this.var_66 != null)
         {
            this.var_66.setSelectedAvatar(param1,param2,param3,param4);
         }
      }
      
      public function getSelectedAvatarId() : int
      {
         if(this.var_66 != null)
         {
            return this.var_66.getSelectedAvatarId();
         }
         return -1;
      }
      
      public function selectRoomObject(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(this.var_66 == null)
         {
            return;
         }
         this.var_66.setSelectedObject(param1,param2,param3,param4);
      }
      
      public function loadRoomResources(param1:String) : Array
      {
         if(this.var_13 != null)
         {
            return this.var_13.loadLegacyContent(param1,events);
         }
         return new Array();
      }
      
      private function showRoomAd(param1:AdEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.var_13 != null)
         {
            _loc2_ = this.getWorldType(param1.roomId,param1.roomCategory);
            this.var_13.addGraphicAsset(this.var_13.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_423,param1.image,true);
            this.var_13.addGraphicAsset(this.var_13.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_1203,param1.adWarningL,true);
            this.var_13.addGraphicAsset(this.var_13.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_1125,param1.adWarningR,true);
            _loc3_ = this.getObjectRoom(param1.roomId,param1.roomCategory);
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = null;
            _loc4_ = new RoomObjectRoomAdUpdateMessage(RoomObjectRoomAdUpdateMessage.const_1093,RoomObjectVariableEnum.const_423,param1.clickUrl);
            _loc3_.getEventHandler().processUpdateMessage(_loc4_);
         }
      }
      
      public function requestRoomAdImage(param1:int, param2:int, param3:String, param4:String) : void
      {
         if(this.var_327 != null)
         {
            this.var_327.loadRoomAdImage(param1,param2,param3,param4);
         }
      }
      
      private function onRoomAdImageLoaded(param1:AdEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:IRoomObjectController = this.getObjectRoom(param1.roomId,param1.roomCategory);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomObjectController = this.getObjectFurniture(param1.roomId,param1.roomCategory,param1.objectId);
         if(_loc3_ == null || _loc3_.getEventHandler() == null)
         {
            return;
         }
         if(param1.image != null)
         {
            this.var_13.addGraphicAsset(_loc3_.getType(),param1.imageUrl,param1.image,true);
         }
         switch(param1.type)
         {
            case AdEvent.const_745:
               _loc4_ = new RoomObjectRoomAdUpdateMessage(RoomObjectRoomAdUpdateMessage.const_1211,param1.imageUrl,param1.clickUrl,param1.objectId,param1.image);
               break;
            case AdEvent.const_932:
               _loc4_ = new RoomObjectRoomAdUpdateMessage(RoomObjectRoomAdUpdateMessage.const_1238,param1.imageUrl,param1.clickUrl,param1.objectId,param1.image);
         }
         if(_loc4_ != null)
         {
            _loc3_.getEventHandler().processUpdateMessage(_loc4_);
         }
      }
      
      public function insertContentLibrary(param1:int, param2:int, param3:IAssetLibrary) : Boolean
      {
         return this.var_13.insertObjectContent(param1,param2,param3);
      }
      
      public function setActiveObjectType(param1:int, param2:String) : void
      {
         this.var_13.setActiveObjectType(param1,param2);
      }
   }
}
