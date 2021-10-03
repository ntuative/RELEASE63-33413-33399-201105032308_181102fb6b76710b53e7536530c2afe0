package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_918:BigInteger;
      
      private var var_2276:BigInteger;
      
      private var var_1976:BigInteger;
      
      private var var_2755:BigInteger;
      
      private var var_1529:BigInteger;
      
      private var var_1977:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1529 = param1;
         this.var_1977 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1529.toString() + ",generator: " + this.var_1977.toString() + ",secret: " + param1);
         this.var_918 = new BigInteger();
         this.var_918.fromRadix(param1,param2);
         this.var_2276 = this.var_1977.modPow(this.var_918,this.var_1529);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1976 = new BigInteger();
         this.var_1976.fromRadix(param1,param2);
         this.var_2755 = this.var_1976.modPow(this.var_918,this.var_1529);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2276.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2755.toRadix(param1);
      }
   }
}
