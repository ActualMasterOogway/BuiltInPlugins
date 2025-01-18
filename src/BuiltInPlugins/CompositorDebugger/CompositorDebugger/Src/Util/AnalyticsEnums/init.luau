local l_Util_0 = script:FindFirstAncestor("CompositorDebugger").Src.Util;
local v1 = require(l_Util_0.Constants);
return {
    LAYER_TABS = {
        [v1.LAYER_TABS.LayerData] = 0, 
        [v1.LAYER_TABS.Visualization] = 1, 
        [v1.LAYER_TABS.History] = 2, 
        [v1.LAYER_TABS.RawData] = 3
    }, 
    TAB_SWITCH_REASONS = {
        Manual = 0, 
        HistoryIcon = 1, 
        NoData = 2
    }
};