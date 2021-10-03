package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1889:int;
      
      private var _name:String;
      
      private var var_1525:int;
      
      private var var_2740:int;
      
      private var var_2580:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_652:String;
      
      private var var_2742:int;
      
      private var var_2741:int;
      
      private var var_2743:int;
      
      private var var_2158:int;
      
      private var var_2200:int;
      
      private var _ownerName:String;
      
      private var var_542:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1889;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1525;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2740;
      }
      
      public function get experience() : int
      {
         return this.var_2580;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_652;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2742;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2741;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2743;
      }
      
      public function get respect() : int
      {
         return this.var_2158;
      }
      
      public function get ownerId() : int
      {
         return this.var_2200;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_542;
      }
      
      public function flush() : Boolean
      {
         this.var_1889 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1889 = param1.readInteger();
         this._name = param1.readString();
         this.var_1525 = param1.readInteger();
         this.var_2740 = param1.readInteger();
         this.var_2580 = param1.readInteger();
         this.var_2742 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2741 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2743 = param1.readInteger();
         this.var_652 = param1.readString();
         this.var_2158 = param1.readInteger();
         this.var_2200 = param1.readInteger();
         this.var_542 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
