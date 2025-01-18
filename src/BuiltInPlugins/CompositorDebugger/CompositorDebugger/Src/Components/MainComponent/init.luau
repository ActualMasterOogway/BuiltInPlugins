local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v6 = require(l_script_FirstAncestor_0.Packages.TestLoader);
local l_copy_0 = v2.copy;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v3.UI.Pane;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v12 = require(l_Actions_0.SetActiveLayersFilter);
local v13 = require(l_Actions_0.SetHistoryField);
local v14 = require(l_Actions_0.SetLayerFilter);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v16 = require(l_Components_0.CompositorSelector);
local v17 = require(l_Components_0.LayerPanel);
local v18 = require(l_Components_0.LayerTree);
local v19 = require(l_Components_0.MainSplitPane);
local v20 = require(l_Components_0.Toolbar);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v22 = require(l_Util_0.debugFlags);
local v23 = require(l_Util_0.Constants);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v25 = require(l_Thunks_0.ParseDebugData);
local v26 = require(l_Thunks_0.SetFrameBufferDuration);
local v27 = require(l_Thunks_0.ToggleAdornment);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v29 = require(script.filterChildren);
local v30 = v4.PureComponent:extend("MainComponent");
v30.init = function(v31) --[[ Line: 56 ]] --[[ Name: init ]]
    v31.openedTimestamp = nil;
    v31.useMockPayload = false;
    v31.onToggleAdornment = function(v32) --[[ Line: 60 ]]
        -- upvalues: v31 (copy)
        v31.props.ToggleAdornment(v32.id);
    end;
end;
v30.readSettings = function(v33) --[[ Line: 65 ]] --[[ Name: readSettings ]]
    -- upvalues: v23 (copy)
    local l_props_0 = v33.props;
    local v35 = l_props_0.Plugin:get();
    local l_v35_Setting_0 = v35:GetSetting(v23.SETTINGS.LayerFilters);
    if l_v35_Setting_0 ~= nil then
        for v37, v38 in l_v35_Setting_0 do
            l_props_0.SetLayerFilter(v37, v38);
        end;
    end;
    local l_v35_Setting_1 = v35:GetSetting(v23.SETTINGS.ActiveLayersFilter);
    if l_v35_Setting_1 ~= nil then
        l_props_0.SetActiveLayersFilter(l_v35_Setting_1);
    end;
    local v40 = v35:GetSetting(v23.SETTINGS.FrameBufferDuration) or 10;
    if not v23.TIMECONTROLS_INVERVALS[v40] then
        v40 = 10;
    end;
    l_props_0.SetFrameBufferDuration(v40);
end;
v30.didMount = function(v41) --[[ Line: 88 ]] --[[ Name: didMount ]]
    -- upvalues: v6 (copy), l_RunService_0 (copy), v22 (copy), l_Util_0 (copy)
    v41.openedTimestamp = os.clock();
    v41:readSettings();
    if v6.hasInternalPermission() and l_RunService_0:IsEdit() and v22.UseMockPayload then
        local v42 = require(l_Util_0.debug_payload);
        v41.props.ParseDebugData(v42, v41.props.Analytics);
        v41.useMockPayload = true;
    end;
end;
v30.willUnmount = function(v43) --[[ Line: 99 ]] --[[ Name: willUnmount ]]
    v43.props.Analytics:report("onPluginClosed", os.clock() - v43.openedTimestamp);
end;
v30.render = function(v44) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: v29 (copy), l_copy_0 (copy), v4 (copy), l_Pane_0 (copy), v16 (copy), v19 (copy), v20 (copy), v18 (copy), v17 (copy), v22 (copy)
    local l_props_1 = v44.props;
    local v46 = l_props_1.Overrides and l_props_1.Overrides[l_props_1.SelectedLayer];
    local l_ExpandedSections_0 = l_props_1.ExpandedSections;
    local v48 = l_props_1.HistoryFrame or l_props_1.SkipCounter;
    local v49 = if l_props_1.FrameBuffer then l_props_1.FrameBuffer[v48] else nil;
    local v50 = v49 and v49.layerMap and v49.layerMap[l_props_1.SelectedLayer];
    local v51 = v49 and v49.payload;
    if v51 then
        local v52, v53 = v29(v51.children, l_props_1.LayerFilters, l_props_1.ActiveLayersFilter);
        if v53 then
            v51 = l_copy_0(v51);
            v51.children = v52;
        end;
    end;
    return v4.createElement(l_Pane_0, {
        [v4.Tag] = "MainPane X-Fill"
    }, {
        CompositorSelector = if not v44.useMockPayload then v4.createElement(v16) else nil, 
        MainSplitPane = v4.createElement(v19, {}, {
            v4.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                [v4.Tag] = "X-ColumnS"
            }, {
                Toolbar = v4.createElement(v20, {
                    FrameBuffer = l_props_1.FrameBuffer, 
                    LayoutOrder = 1
                }), 
                LayerTree = v4.createElement(v18, {
                    LayoutOrder = 2, 
                    FramePayload = v51, 
                    Adornments = l_props_1.Adornments, 
                    OnToggleAdornment = v44.onToggleAdornment
                })
            }), 
            v4.createElement(v17, {
                LayoutOrder = 2, 
                LayerData = v50, 
                FrameBuffer = l_props_1.FrameBuffer, 
                HistoryFrame = l_props_1.HistoryFrame, 
                SelectedLayer = l_props_1.SelectedLayer, 
                ExpandedSections = l_ExpandedSections_0, 
                Overrides = v46, 
                ShowRawPayload = v22.ShowRawPayload
            })
        })
    });
end;
v30 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Plugin = l_ContextServices_0.Plugin
})(v30);
return (v5.connect(function(v54) --[[ Line: 163 ]] --[[ Name: mapStateToProps ]]
    return {
        FrameBuffer = v54.DebugData.FrameBuffer, 
        Overrides = v54.DebugData.Overrides, 
        ActiveLayersFilter = v54.Status.ActiveLayersFilter, 
        Adornments = v54.Status.Adornments, 
        ExpandedSections = v54.Status.ExpandedSections, 
        HistoryField = v54.Status.HistoryField, 
        HistoryFrame = v54.Status.HistoryFrame, 
        HistoryOffset = v54.Status.HistoryOffset, 
        LayerFilters = v54.Status.LayerFilters, 
        SelectedLayer = v54.Status.SelectedLayer, 
        SkipCounter = v54.Status.SkipCounter
    };
end, function(v55) --[[ Line: 180 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v25 (copy), v12 (copy), v26 (copy), v13 (copy), v14 (copy), v27 (copy)
    return {
        ParseDebugData = function(v56, v57) --[[ Line: 182 ]] --[[ Name: ParseDebugData ]]
            -- upvalues: v55 (copy), v25 (ref)
            v55(v25(v56, v57));
        end, 
        SetActiveLayersFilter = function(v58) --[[ Line: 186 ]] --[[ Name: SetActiveLayersFilter ]]
            -- upvalues: v55 (copy), v12 (ref)
            v55(v12(v58));
        end, 
        SetFrameBufferDuration = function(v59) --[[ Line: 190 ]] --[[ Name: SetFrameBufferDuration ]]
            -- upvalues: v55 (copy), v26 (ref)
            v55(v26(v59));
        end, 
        SetHistoryField = function(v60, v61, v62) --[[ Line: 194 ]] --[[ Name: SetHistoryField ]]
            -- upvalues: v55 (copy), v13 (ref)
            v55(v13(v60, v61, v62));
        end, 
        SetLayerFilter = function(v63, v64) --[[ Line: 198 ]] --[[ Name: SetLayerFilter ]]
            -- upvalues: v55 (copy), v14 (ref)
            v55(v14(v63, v64));
        end, 
        ToggleAdornment = function(v65) --[[ Line: 202 ]] --[[ Name: ToggleAdornment ]]
            -- upvalues: v55 (copy), v27 (ref)
            v55(v27(v65));
        end
    };
end)(v30));