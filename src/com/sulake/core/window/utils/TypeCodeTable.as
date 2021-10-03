package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_928;
         param1["bitmap"] = const_905;
         param1["border"] = const_907;
         param1["border_notify"] = const_1671;
         param1["button"] = const_557;
         param1["button_thick"] = const_847;
         param1["button_icon"] = const_1802;
         param1["button_group_left"] = const_815;
         param1["button_group_center"] = const_699;
         param1["button_group_right"] = const_900;
         param1["canvas"] = const_975;
         param1["checkbox"] = const_969;
         param1["closebutton"] = const_1170;
         param1["container"] = const_385;
         param1["container_button"] = const_952;
         param1["display_object_wrapper"] = const_855;
         param1["dropmenu"] = const_488;
         param1["dropmenu_item"] = const_611;
         param1["frame"] = const_399;
         param1["frame_notify"] = const_1638;
         param1["header"] = const_832;
         param1["html"] = const_1299;
         param1["icon"] = const_1120;
         param1["itemgrid"] = const_1101;
         param1["itemgrid_horizontal"] = const_548;
         param1["itemgrid_vertical"] = const_896;
         param1["itemlist"] = const_1267;
         param1["itemlist_horizontal"] = const_381;
         param1["itemlist_vertical"] = const_416;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1679;
         param1["menu"] = const_1763;
         param1["menu_item"] = const_1564;
         param1["submenu"] = const_1258;
         param1["minimizebox"] = const_1697;
         param1["notify"] = const_1785;
         param1["HabboWindowManagerCom_habbo_window_layout_alert_xml"] = const_892;
         param1["password"] = const_827;
         param1["radiobutton"] = const_857;
         param1["region"] = const_643;
         param1["restorebox"] = const_1640;
         param1["scaler"] = const_569;
         param1["scaler_horizontal"] = const_1712;
         param1["scaler_vertical"] = const_1592;
         param1["scrollbar_horizontal"] = const_541;
         param1["scrollbar_vertical"] = const_914;
         param1["scrollbar_slider_button_up"] = const_1173;
         param1["scrollbar_slider_button_down"] = const_1259;
         param1["scrollbar_slider_button_left"] = const_1260;
         param1["scrollbar_slider_button_right"] = const_1182;
         param1["scrollbar_slider_bar_horizontal"] = const_1298;
         param1["scrollbar_slider_bar_vertical"] = const_1095;
         param1["scrollbar_slider_track_horizontal"] = const_1281;
         param1["scrollbar_slider_track_vertical"] = const_1268;
         param1["scrollable_itemlist"] = const_1681;
         param1["scrollable_itemlist_vertical"] = const_536;
         param1["scrollable_itemlist_horizontal"] = const_1246;
         param1["selector"] = const_860;
         param1["selector_list"] = const_898;
         param1["submenu"] = const_1258;
         param1["tab_button"] = const_958;
         param1["tab_container_button"] = const_1270;
         param1["tab_context"] = const_397;
         param1["tab_content"] = const_1204;
         param1["tab_selector"] = const_960;
         param1["text"] = const_573;
         param1["input"] = const_947;
         param1["toolbar"] = const_1761;
         param1["tooltip"] = const_431;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
