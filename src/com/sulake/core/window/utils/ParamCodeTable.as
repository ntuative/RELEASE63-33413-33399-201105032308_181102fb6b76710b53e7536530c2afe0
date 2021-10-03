package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["HabboWindowManagerCom_habbo_window_layout_alert_xml"] = const_197;
         param1["bound_to_parent_rect"] = const_102;
         param1["child_window"] = const_1184;
         param1["embedded_controller"] = const_1205;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_704;
         param1["mouse_dragging_target"] = const_286;
         param1["mouse_dragging_trigger"] = const_447;
         param1["mouse_scaling_target"] = const_320;
         param1["mouse_scaling_trigger"] = const_599;
         param1["horizontal_mouse_scaling_trigger"] = const_282;
         param1["vertical_mouse_scaling_trigger"] = const_246;
         param1["observe_parent_input_events"] = const_1148;
         param1["optimize_region_to_layout_size"] = const_610;
         param1["parent_window"] = const_1245;
         param1["relative_horizontal_scale_center"] = const_209;
         param1["relative_horizontal_scale_fixed"] = const_141;
         param1["relative_horizontal_scale_move"] = const_387;
         param1["relative_horizontal_scale_strech"] = const_430;
         param1["relative_scale_center"] = const_1166;
         param1["relative_scale_fixed"] = const_688;
         param1["relative_scale_move"] = const_1141;
         param1["relative_scale_strech"] = const_1153;
         param1["relative_vertical_scale_center"] = const_222;
         param1["relative_vertical_scale_fixed"] = const_145;
         param1["relative_vertical_scale_move"] = const_245;
         param1["relative_vertical_scale_strech"] = const_338;
         param1["on_resize_align_left"] = const_705;
         param1["on_resize_align_right"] = const_555;
         param1["on_resize_align_center"] = const_538;
         param1["on_resize_align_top"] = const_938;
         param1["on_resize_align_bottom"] = const_486;
         param1["on_resize_align_middle"] = const_631;
         param1["on_accommodate_align_left"] = const_1134;
         param1["on_accommodate_align_right"] = const_523;
         param1["on_accommodate_align_center"] = const_983;
         param1["on_accommodate_align_top"] = const_1292;
         param1["on_accommodate_align_bottom"] = const_561;
         param1["on_accommodate_align_middle"] = const_733;
         param1["route_input_events_to_parent"] = const_629;
         param1["use_parent_graphic_context"] = const_34;
         param1["draggable_with_mouse"] = const_1210;
         param1["scalable_with_mouse"] = const_1144;
         param1["reflect_horizontal_resize_to_parent"] = const_576;
         param1["reflect_vertical_resize_to_parent"] = const_475;
         param1["reflect_resize_to_parent"] = const_352;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1221;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
