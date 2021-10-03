package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2084:int = 0;
      
      public static const const_1557:int = 1;
      
      public static const const_1794:int = 2;
      
      public static const const_1956:int = 3;
      
      public static const const_2067:int = 4;
      
      public static const const_2110:int = 5;
      
      public static const const_1694:int = 10;
      
      public static const const_1976:int = 11;
      
      public static const const_2002:int = 12;
      
      public static const const_1985:int = 13;
      
      public static const const_1925:int = 16;
      
      public static const const_2088:int = 17;
      
      public static const const_1986:int = 18;
      
      public static const const_1926:int = 19;
      
      public static const const_2015:int = 20;
      
      public static const const_2091:int = 22;
      
      public static const const_2090:int = 23;
      
      public static const const_1916:int = 24;
      
      public static const const_1906:int = 25;
      
      public static const const_1970:int = 26;
      
      public static const const_2089:int = 27;
      
      public static const const_1937:int = 28;
      
      public static const const_2011:int = 29;
      
      public static const const_2097:int = 100;
      
      public static const const_1979:int = 101;
      
      public static const const_1958:int = 102;
      
      public static const const_2032:int = 103;
      
      public static const const_2008:int = 104;
      
      public static const const_1939:int = 105;
      
      public static const const_1934:int = 106;
      
      public static const const_1917:int = 107;
      
      public static const const_2013:int = 108;
      
      public static const const_2017:int = 109;
      
      public static const const_1988:int = 110;
      
      public static const const_2085:int = 111;
      
      public static const const_2065:int = 112;
      
      public static const const_2102:int = 113;
      
      public static const const_2093:int = 114;
      
      public static const const_2103:int = 115;
      
      public static const const_1953:int = 116;
      
      public static const const_2007:int = 117;
      
      public static const const_2028:int = 118;
      
      public static const const_1981:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1557:
            case const_1694:
               return "banned";
            case const_1794:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
