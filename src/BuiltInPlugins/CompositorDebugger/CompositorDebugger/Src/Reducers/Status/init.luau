local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_join_0 = v1.join;
local l_None_0 = v1.None;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v6 = require(l_Actions_0.SetActiveLayersFilter);
local v7 = require(l_Actions_0.SetActor);
local v8 = require(l_Actions_0.SetAdornments);
local v9 = require(l_Actions_0.SetDebugDataEvent);
local v10 = require(l_Actions_0.SetDebugPoseEvent);
local v11 = require(l_Actions_0.SetExpandedSections);
local v12 = require(l_Actions_0.SetHistoryField);
local v13 = require(l_Actions_0.SetHistoryFrame);
local v14 = require(l_Actions_0.SetHistoryOffset);
local v15 = require(l_Actions_0.SetLayerFilter);
local v16 = require(l_Actions_0.SetPropertyOverridesEvent);
local v17 = require(l_Actions_0.SetSelectedLayer);
local v18 = require(l_Actions_0.SetSendPayloadAnalytics);
local v19 = require(l_Actions_0.SetSkipCounter);
local v20 = require(l_Actions_0.SetSkipLimit);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return (v2.createReducer({
    ActiveLayersFilter = false, 
    Actor = nil, 
    Adornments = {}, 
    DebugDataConnection = nil, 
    DebugDataEvent = nil, 
    DebugPoseEvent = nil, 
    ExpandedSections = {
        layerDetails = true, 
        linkData = true, 
        props = true, 
        state = true, 
        watches = true
    }, 
    HistoryDuration = 600, 
    HistoryField = {}, 
    HistoryOffset = nil, 
    HistoryFrame = nil, 
    LayerFilters = {}, 
    PropertyOverridesEvent = nil, 
    SelectedLayer = nil, 
    SendPayloadAnalytics = false, 
    SkipCounter = 0, 
    SkipLimit = 0
}, {
    [v6.name] = function(v22, v23) --[[ Line: 84 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v22, {
            ActiveLayersFilter = v23.activeLayersFilter
        });
    end, 
    [v7.name] = function(v24, v25) --[[ Line: 89 ]]
        -- upvalues: l_join_0 (copy), l_None_0 (copy)
        return l_join_0(v24, {
            Actor = v25.actor or l_None_0
        });
    end, 
    [v8.name] = function(v26, v27) --[[ Line: 94 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v26, {
            Adornments = v27.adornments
        });
    end, 
    [v9.name] = function(v28, v29) --[[ Line: 99 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v28, {
            DebugDataEvent = v29.event, 
            DebugDataConnection = v29.connection
        });
    end, 
    [v10.name] = function(v30, v31) --[[ Line: 105 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v30, {
            DebugPoseEvent = v31.event
        });
    end, 
    [v11.name] = function(v32, v33) --[[ Line: 110 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v32, {
            ExpandedSections = v33.expandedSections
        });
    end, 
    [v12.name] = function(v34, v35) --[[ Line: 115 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v34, {
            HistoryField = {
                id = v35.id, 
                section = v35.section, 
                field = v35.field
            }
        });
    end, 
    [v13.name] = function(v36, v37) --[[ Line: 124 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v36, {
            HistoryFrame = v37.historyFrame
        });
    end, 
    [v14.name] = function(v38, v39) --[[ Line: 129 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v38, {
            HistoryOffset = v39.historyOffset
        });
    end, 
    [v15.name] = function(v40, v41) --[[ Line: 134 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v40, {
            LayerFilters = l_join_0(v40.LayerFilters, v41.layerFilters)
        });
    end, 
    [v16.name] = function(v42, v43) --[[ Line: 139 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v42, {
            PropertyOverridesEvent = v43.event
        });
    end, 
    [v17.name] = function(v44, v45) --[[ Line: 144 ]]
        -- upvalues: l_join_0 (copy), l_None_0 (copy)
        return l_join_0(v44, {
            SelectedLayer = v45.selectedLayer or l_None_0
        });
    end, 
    [v18.name] = function(v46, v47) --[[ Line: 149 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v46, {
            SendPayloadAnalytics = v47.enable
        });
    end, 
    [v19.name] = function(v48, v49) --[[ Line: 154 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v48, {
            SkipCounter = v49.skipCounter
        });
    end, 
    [v20.name] = function(v50, v51) --[[ Line: 159 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v50, {
            SkipLimit = v51.skipLimit
        });
    end
}));