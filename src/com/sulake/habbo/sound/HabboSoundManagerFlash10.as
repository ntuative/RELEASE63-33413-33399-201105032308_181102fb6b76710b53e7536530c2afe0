package com.sulake.habbo.sound
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.SoundSettingsEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.SetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.parser.sound.SoundSettingsParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.sound.events.TraxSongLoadEvent;
   import com.sulake.habbo.sound.music.HabboMusicController;
   import com.sulake.habbo.sound.object.HabboSound;
   import com.sulake.habbo.sound.trax.TraxData;
   import com.sulake.habbo.sound.trax.TraxSample;
   import com.sulake.habbo.sound.trax.TraxSequencer;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class HabboSoundManagerFlash10 extends Component implements IHabboSoundManager, IUpdateReceiver
   {
      
      private static const const_1485:int = 60;
       
      
      private var var_176:IHabboConfigurationManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _connection:IConnection;
      
      private var _roomEngine:IRoomEngine;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_1026:IHabboNotifications;
      
      private var var_546:Number = 1.0;
      
      private var var_678:Map;
      
      private var var_1267:Array;
      
      private var var_677:Map;
      
      private var var_1027:Map;
      
      private var var_824:int = -1;
      
      private var var_823:TraxSequencer;
      
      private var var_231:IHabboMusicController;
      
      private var var_1266:Map;
      
      private var var_1547:ByteArray;
      
      public function HabboSoundManagerFlash10(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null, param4:Boolean = true)
      {
         this.var_678 = new Map();
         this.var_1267 = [];
         this.var_677 = new Map();
         this.var_1027 = new Map();
         this.var_1266 = new Map();
         this.var_1547 = new ByteArray();
         super(param1,param2,param3);
         if(param4)
         {
            queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationInit);
            queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
            queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
            queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
            queueInterface(new IIDHabboNotifications(),this.onNotificationsReady);
         }
         events.addEventListener(TraxSongLoadEvent.const_747,this.onTraxLoadComplete);
         registerUpdateReceiver(this,1);
         Logger.log("Sound manager 10 init");
      }
      
      public function get musicController() : IHabboMusicController
      {
         return this.var_231;
      }
      
      public function get volume() : Number
      {
         return this.var_546;
      }
      
      public function set volume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
         this.storeVolumeSetting();
      }
      
      public function set previewVolume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
      }
      
      override public function dispose() : void
      {
         this._connection = null;
         if(this.var_231)
         {
            this.var_231.dispose();
            this.var_231 = null;
         }
         if(this.var_677)
         {
            this.var_677.dispose();
            this.var_677 = null;
         }
         if(this.var_1027)
         {
            this.var_1027.dispose();
            this.var_1027 = null;
         }
         if(this.var_678)
         {
            this.var_678.dispose();
            this.var_678 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_176)
         {
            this.var_176.release(new IIDHabboConfigurationManager());
            this.var_176 = null;
         }
         if(this._roomEngine)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this.var_1026)
         {
            this.var_1026.release(new IIDHabboNotifications());
            this.var_1026 = null;
         }
         super.dispose();
      }
      
      public function playSound(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:HabboSound = this.var_1027.getValue(param1);
         if(_loc2_ == null)
         {
            _loc3_ = "";
            switch(param1)
            {
               case HabboSoundTypesEnum.const_1163:
                  _loc3_ = "sound_call_for_help";
                  break;
               case HabboSoundTypesEnum.const_1739:
                  _loc3_ = "sound_guide_received_invitation";
                  break;
               case HabboSoundTypesEnum.const_1233:
                  _loc3_ = "sound_console_new_message";
                  break;
               case HabboSoundTypesEnum.const_1207:
                  _loc3_ = "sound_console_message_sent";
                  break;
               case HabboSoundTypesEnum.const_1263:
                  _loc3_ = "sound_catalogue_pixels";
                  break;
               case HabboSoundTypesEnum.const_1116:
                  _loc3_ = "sound_catalogue_cash";
                  break;
               case HabboSoundTypesEnum.const_1586:
                  _loc3_ = "sound_respect_received";
                  break;
               default:
                  Logger.log("HabboSoundManagerFlash10: Unknown sound request: " + param1);
            }
            _loc4_ = assets.getAssetByName(_loc3_);
            _loc5_ = _loc4_.content as Sound;
            if(_loc5_ == null)
            {
               return;
            }
            _loc2_ = new HabboSound(_loc5_);
            this.var_1027.add(param1,_loc2_);
         }
         _loc2_.volume = this.var_546;
         _loc2_.play();
      }
      
      public function loadSoundUrl(param1:String) : IHabboSound
      {
         var _loc2_:URLRequest = new URLRequest(param1);
         var _loc3_:Sound = new Sound();
         _loc3_.load(_loc2_);
         var _loc4_:HabboSound = new HabboSound(_loc3_);
         _loc4_.volume = this.var_546;
         return _loc4_ as IHabboSound;
      }
      
      private function loadSample(param1:int) : void
      {
         if(this.var_176 == null)
         {
            return;
         }
         var _loc2_:String = this.var_176.getKey("flash.dynamic.download.url","furniture/");
         _loc2_ += this.var_176.getKey("flash.dynamic.download.samples.template","mp3/sound_machine_sample_%typeid%.mp3");
         _loc2_ = _loc2_.replace(/%typeid%/,param1.toString());
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         var _loc4_:Sound = new Sound();
         _loc4_.addEventListener(Event.COMPLETE,this.onSampleLoadComplete);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         _loc4_.load(_loc3_);
         this.var_678.add(_loc4_,param1);
      }
      
      public function loadTraxSong(param1:int, param2:String) : IHabboSound
      {
         if(this.var_823 != null)
         {
            return this.addTraxSongForDownload(param1,param2);
         }
         var _loc3_:TraxSequencer = this.createTraxInstance(param1,param2);
         if(!_loc3_.ready)
         {
            this.var_823 = _loc3_;
            this.var_824 = param1;
         }
         return _loc3_ as IHabboSound;
      }
      
      private function addTraxSongForDownload(param1:int, param2:String) : IHabboSound
      {
         var _loc3_:TraxSequencer = this.createTraxInstance(param1,param2,false);
         if(!_loc3_.ready)
         {
            this.var_1266.add(param1,_loc3_);
         }
         return _loc3_;
      }
      
      private function createTraxInstance(param1:int, param2:String, param3:Boolean = true) : TraxSequencer
      {
         var _loc4_:TraxData = new TraxData(param2);
         var _loc5_:TraxSequencer = new TraxSequencer(param1,_loc4_,this.var_677,events);
         _loc5_.volume = this.var_546;
         this.validateSampleAvailability(_loc5_,param3);
         return _loc5_;
      }
      
      private function validateSampleAvailability(param1:TraxSequencer, param2:Boolean) : void
      {
         var _loc3_:TraxData = param1.traxData;
         var _loc4_:Array = _loc3_.getSampleIds();
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            if(this.var_677.getValue(int(_loc4_[_loc6_])) == null)
            {
               if(param2)
               {
                  this.loadSample(int(_loc4_[_loc6_]));
               }
               _loc5_ = true;
            }
            _loc6_++;
         }
         if(_loc5_)
         {
            param1.ready = false;
         }
         else
         {
            param1.ready = true;
         }
      }
      
      public function notifyPlayedSong(param1:String, param2:String) : void
      {
         if(this.var_1026 == null)
         {
            return;
         }
         this.var_1026.addSongPlayingNotification(param1,param2);
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this.var_176 = param2 as IHabboConfigurationManager;
         }
      }
      
      protected function setHabboConfiguration(param1:IHabboConfigurationManager) : void
      {
         this.var_176 = param1;
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this._communication = IHabboCommunicationManager(param2);
            this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(this.onConnectionReady);
         if(_loc2_ != null)
         {
            _loc2_.addMessageEvent(new SoundSettingsEvent(this.onSoundSettingsEvent));
            _loc2_.send(new GetSoundSettingsComposer());
            this.onConnectionReady(_loc2_);
            this.initMusicController();
         }
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._roomEngine = IRoomEngine(param2);
         this.initMusicController();
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._toolbar = IHabboToolbar(param2);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_70,this.onHabboToolbarEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_37,this.onHabboToolbarEvent);
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_1026 = IHabboNotifications(param2);
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
         }
         this.initMusicController();
      }
      
      private function initMusicController() : void
      {
         if(this.var_176 == null || this._connection == null || this._roomEngine == null || this.var_231 != null)
         {
            return;
         }
         this.var_231 = new HabboMusicController(this,events,this._roomEngine.events,this._connection);
      }
      
      protected function setMusicController(param1:IHabboMusicController) : void
      {
         this.var_231 = param1;
      }
      
      private function onSampleLoadComplete(param1:Event) : void
      {
         var _loc2_:Sound = param1.target as Sound;
         this.var_1267.push(_loc2_);
      }
      
      private function onTraxLoadComplete(param1:Event) : void
      {
         var _loc2_:TraxSongLoadEvent = param1 as TraxSongLoadEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(this.var_231 == null)
         {
            return;
         }
         this.var_231.onSongLoaded(_loc2_.id);
      }
      
      private function ioErrorHandler(param1:Event) : void
      {
         events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_1771,this.var_824));
         this.var_824 = -1;
         this.var_823 = null;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_70)
         {
            this.setHabboToolbarIconState(this.var_546 > 0);
            return;
         }
         if(param1.type == HabboToolbarEvent.const_37)
         {
            if(param1.iconId == HabboToolbarIconEnum.SOUNDS)
            {
               if(this.var_546 == 1)
               {
                  this.updateVolumeSetting(0);
               }
               else
               {
                  this.updateVolumeSetting(1);
               }
               this.storeVolumeSetting();
            }
         }
      }
      
      private function storeVolumeSetting() : void
      {
         if(this._connection != null)
         {
            this._connection.send(new SetSoundSettingsComposer(int(this.var_546 * 100)));
         }
      }
      
      private function updateVolumeSetting(param1:Number) : void
      {
         this.var_546 = param1;
         this.var_231.updateVolume(this.var_546);
         this.setHabboToolbarIconState(param1 > 0);
      }
      
      private function onSoundSettingsEvent(param1:IMessageEvent) : void
      {
         var _loc2_:SoundSettingsEvent = param1 as SoundSettingsEvent;
         var _loc3_:SoundSettingsParser = _loc2_.getParser() as SoundSettingsParser;
         if(_loc3_.volume == 1 || _loc3_.volume == 0)
         {
            this.updateVolumeSetting(_loc3_.volume * 1);
         }
         else
         {
            this.updateVolumeSetting(_loc3_.volume / 100);
         }
      }
      
      private function setHabboToolbarIconState(param1:Boolean) : void
      {
         if(this._toolbar == null)
         {
            return;
         }
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_106,HabboToolbarIconEnum.SOUNDS);
         _loc2_.iconState = !!param1 ? "1" : "0";
         this._toolbar.events.dispatchEvent(_loc2_);
      }
      
      private function processLoadedSample(param1:Sound) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         if(this.var_678.getValue(param1) != null)
         {
            _loc2_ = this.var_678.remove(param1);
            if(this.var_677.getValue(_loc2_) == null)
            {
               this.var_1547.clear();
               _loc3_ = param1.length;
               param1.extract(this.var_1547,int(_loc3_ * 44.1));
               _loc4_ = new TraxSample(this.var_1547,_loc2_,TraxSample.const_1600,TraxSample.const_1613);
               this.var_677.add(_loc2_,_loc4_);
            }
         }
      }
      
      private function processLoadedSamples() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_1267.length > 0)
         {
            _loc1_ = getTimer();
            _loc2_ = _loc1_;
            while(_loc2_ - _loc1_ < const_1485 && this.var_1267.length > 0)
            {
               _loc3_ = this.var_1267.splice(0,1)[0];
               this.processLoadedSample(_loc3_);
               _loc2_ = getTimer();
            }
            if(this.var_678.length == 0 && this.var_824 != -1)
            {
               this.var_823.ready = true;
               _loc4_ = this.var_824;
               this.var_824 = -1;
               this.var_823 = null;
               events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_747,_loc4_));
            }
         }
      }
      
      private function loadNextSong() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_823 == null && this.var_1266.length > 0)
         {
            _loc1_ = this.var_1266.getKey(0);
            _loc2_ = this.var_1266.remove(_loc1_);
            if(_loc2_ != null)
            {
               this.validateSampleAvailability(_loc2_,true);
               if(_loc2_.ready)
               {
                  events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_747,_loc1_));
               }
               else
               {
                  this.var_823 = _loc2_;
                  this.var_824 = _loc1_;
               }
            }
         }
      }
      
      public function update(param1:uint) : void
      {
         this.processLoadedSamples();
         this.loadNextSong();
      }
   }
}
