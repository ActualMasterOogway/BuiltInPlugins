local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_join_0 = v3.join;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v9 = require(l_Actions_0.SetActiveLayersFilter);
local v10 = require(l_Actions_0.SetLayerFilter);
local v11 = require(l_Actions_0.SetSkipLimit);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v13 = require(l_Thunks_0.SetFrameBufferDuration);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v15 = require(l_Util_0.Constants);
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v21 = v1.PureComponent:extend("SettingsButton");
v21.init = function(v22) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), l_showContextMenu_0 (copy)
    v22.toggleActiveLayersFilter = function() --[[ Line: 45 ]]
        -- upvalues: v22 (copy), v15 (ref)
        local l_props_0 = v22.props;
        local v24 = l_props_0.Plugin:get();
        local v25 = not v22.props.ActiveLayersFilter;
        v22.props.SetActiveLayersFilter(v25);
        v24:SetSetting(v15.SETTINGS.ActiveLayersFilter, v25);
        l_props_0.Analytics:report("onChangeSetting", "activeLayersFilter", v25);
    end;
    v22.onSkipUIFramesChanged = function(v26) --[[ Line: 54 ]]
        -- upvalues: v22 (copy), v15 (ref)
        local v27 = v22.props.Plugin:get();
        local l_Data_0 = v26.Data;
        v22.props.SetSkipLimit(l_Data_0);
        v27:SetSetting(v15.SETTINGS.SkipUIFrames, l_Data_0);
    end;
    v22.onReplayDurationChanged = function(v29) --[[ Line: 62 ]]
        -- upvalues: v22 (copy), v15 (ref)
        local l_props_1 = v22.props;
        local v31 = l_props_1.Plugin:get();
        local l_Data_1 = v29.Data;
        v22.props.SetFrameBufferDuration(l_Data_1);
        v31:SetSetting(v15.SETTINGS.FrameBufferDuration, l_Data_1);
        l_props_1.Analytics:report("onChangeSetting", "frameBufferDuration", l_Data_1);
    end;
    v22.onButtonClicked = function() --[[ Line: 71 ]]
        -- upvalues: v22 (copy), l_showContextMenu_0 (ref)
        local l_props_2 = v22.props;
        local l_Localization_0 = l_props_2.Localization;
        local v35 = l_props_2.Plugin:get();
        local v36 = {
            {
                Id = "ToggleActiveLayers", 
                Text = l_Localization_0:getText("Settings", "ToggleActiveLayers"), 
                Checked = v22.props.ActiveLayersFilter, 
                OnItemClicked = v22.toggleActiveLayersFilter
            }, 
            v22:makeReplaySubmenu(), 
            v22:makeSkipUIFramesSubmenu()
        };
        l_showContextMenu_0(v35, v36);
    end;
end;
v21.makeSkipUIFramesSubmenu = function(v37) --[[ Line: 90 ]] --[[ Name: makeSkipUIFramesSubmenu ]]
    -- upvalues: v15 (copy)
    local l_props_3 = v37.props;
    local l_Localization_1 = l_props_3.Localization;
    local l_SkipLimit_0 = l_props_3.SkipLimit;
    local v41 = {};
    for _, v43 in v15.SKIP_UI_FRAMES do
        table.insert(v41, {
            Id = string.format("SkipUIFrames_%d", v43), 
            Data = v43, 
            Text = l_Localization_1:getText("Settings", "Frames", {
                frames = v43
            }), 
            Checked = v43 == l_SkipLimit_0, 
            OnItemClicked = v37.onSkipUIFramesChanged
        });
    end;
    v41.Id = "SkipUIFrames";
    v41.Text = l_Localization_1:getText("Settings", "SkipUIFrames", {
        frames = l_SkipLimit_0
    });
    return v41;
end;
v21.makeReplaySubmenu = function(v44) --[[ Line: 111 ]] --[[ Name: makeReplaySubmenu ]]
    -- upvalues: v15 (copy)
    local l_props_4 = v44.props;
    local l_Localization_2 = l_props_4.Localization;
    local v47 = if l_props_4.FrameBuffer then l_props_4.FrameBuffer:getSize() / v15.FRAMERATE else nil;
    local v48 = {};
    for v49, _ in v15.TIMECONTROLS_INVERVALS do
        table.insert(v48, {
            Id = string.format("Replay_%d", v49), 
            Data = v49, 
            Text = l_Localization_2:getText("Settings", "Seconds", {
                duration = v49
            }), 
            Checked = v49 == v47, 
            OnItemClicked = v44.onReplayDurationChanged
        });
    end;
    table.sort(v48, function(v51, v52) --[[ Line: 128 ]]
        return v51.Id < v52.Id;
    end);
    v48.Id = "ReplayLength";
    v48.Text = l_Localization_2:getText("Settings", "ReplayLength", {
        duration = v47
    });
    return v48;
end;
v21.render = function(v53) --[[ Line: 138 ]] --[[ Name: render ]]
    -- upvalues: l_join_0 (copy), v1 (copy), l_Image_0 (copy), l_Button_0 (copy)
    local l_props_5 = v53.props;
    local v55 = l_join_0(l_props_5.children, {
        Icon = v1.createElement(l_Image_0, {
            Size = UDim2.fromOffset(20, 20), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = "rbxasset://textures/CompositorDebugger/settings.png"
        })
    });
    return v1.createElement(l_Button_0, {
        Style = "Round", 
        Size = l_props_5.Size, 
        Position = UDim2.fromScale(1, 0.5), 
        AnchorPoint = Vector2.new(1, 0.5), 
        LayoutOrder = l_props_5.LayoutOrder, 
        OnClick = v53.onButtonClicked
    }, v55);
end;
v21 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v21);
return (v2.connect(function(v56, _) --[[ Line: 166 ]] --[[ Name: mapStateToProps ]]
    return {
        ActiveLayersFilter = v56.Status.ActiveLayersFilter, 
        LayerFilters = v56.Status.LayerFilters, 
        SkipLimit = v56.Status.SkipLimit
    };
end, function(v58) --[[ Line: 174 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), v13 (copy), v10 (copy), v11 (copy)
    return {
        SetActiveLayersFilter = function(v59) --[[ Line: 176 ]] --[[ Name: SetActiveLayersFilter ]]
            -- upvalues: v58 (copy), v9 (ref)
            v58(v9(v59));
        end, 
        SetFrameBufferDuration = function(v60) --[[ Line: 179 ]] --[[ Name: SetFrameBufferDuration ]]
            -- upvalues: v58 (copy), v13 (ref)
            v58(v13(v60));
        end, 
        SetLayerFilter = function(v61, v62) --[[ Line: 182 ]] --[[ Name: SetLayerFilter ]]
            -- upvalues: v58 (copy), v10 (ref)
            v58(v10(v61, v62));
        end, 
        SetSkipLimit = function(v63) --[[ Line: 185 ]] --[[ Name: SetSkipLimit ]]
            -- upvalues: v58 (copy), v11 (ref)
            v58(v11(v63));
        end
    };
end)(v21));