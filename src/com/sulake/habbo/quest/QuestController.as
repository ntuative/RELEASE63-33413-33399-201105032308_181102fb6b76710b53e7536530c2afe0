package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_654:QuestsList;
      
      private var var_527:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_378:QuestTracker;
      
      private var var_1004:CampaignCompleted;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_378 = new QuestTracker(this._questEngine);
         this.var_654 = new QuestsList(this._questEngine);
         this.var_527 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_1004 = new CampaignCompleted(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_654.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_654.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_378.onQuest(param1);
         this.var_527.onQuest(param1);
         this._questCompleted.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_378.onQuestCompleted(param1);
         this.var_527.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_378.onQuestCancelled();
         this.var_527.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_378.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_654.onRoomExit();
         this.var_378.onRoomExit();
         this.var_527.onRoomExit();
         this.var_1004.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_378.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_654)
         {
            this.var_654.dispose();
            this.var_654 = null;
         }
         if(this.var_378)
         {
            this.var_378.dispose();
            this.var_378 = null;
         }
         if(this.var_527)
         {
            this.var_527.dispose();
            this.var_527 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_1004)
         {
            this.var_1004.dispose();
            this.var_1004 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_654;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_527;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_378;
      }
      
      public function get campaignCompleted() : CampaignCompleted
      {
         return this.var_1004;
      }
   }
}
