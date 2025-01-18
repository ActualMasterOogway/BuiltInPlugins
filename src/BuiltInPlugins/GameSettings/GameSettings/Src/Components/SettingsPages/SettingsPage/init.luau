local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v4.Util;
local l_UI_0 = v4.UI;
local v9 = if v1 then nil else l_UI_0.Container;
local l_Pane_0 = l_UI_0.Pane;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v14 = if v1 then nil else l_Util_0.FitFrame.FitFrameOnAxis;
local v15 = require(l_Parent_0.Src.Components.Header);
local v16 = require(l_Parent_0.Src.Components.SettingsPages.LoadFailedPage);
local v17 = require(l_Parent_0.Src.Thunks.LoadPageSettings);
local v18 = require(l_Parent_0.Src.Thunks.SavePageSettings);
local v19 = require(l_Parent_0.Src.Actions.SetPageSaveState);
local v20 = require(l_Parent_0.Src.Util.LoadState);
local v21 = require(l_Parent_0.Src.Util.SaveState);
local v22 = v2.Component:extend(script.Name);
v22.init = function(v23) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v23.scrollingFrameRef = v2.createRef();
    v23.contentHeightChanged = function(v24) --[[ Line: 43 ]]
        -- upvalues: v23 (copy)
        local l_current_0 = v23.scrollingFrameRef.current;
        if l_current_0 then
            local l_Stylizer_0 = v23.props.Stylizer;
            l_current_0.CanvasSize = UDim2.new(1, 0, 0, v24.AbsoluteContentSize.Y + l_Stylizer_0.settingsPage.settingPadding);
        end;
    end;
end;
v22.didMount = function(v27) --[[ Line: 54 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy), v21 (copy)
    local l_props_0 = v27.props;
    local l_LoadState_0 = l_props_0.LoadState;
    local l_SaveState_0 = l_props_0.SaveState;
    local l_SettingsLoadJobs_0 = l_props_0.SettingsLoadJobs;
    local l_PageId_0 = l_props_0.PageId;
    if l_LoadState_0 == v20.Unloaded then
        l_props_0.LoadPageSettings(l_PageId_0, l_SettingsLoadJobs_0);
    end;
    if l_SaveState_0 == nil then
        l_props_0.SetPageSaveState(l_PageId_0, v21.Unsaved);
    end;
end;
v22.didUpdate = function(v33, v34, _) --[[ Line: 70 ]] --[[ Name: didUpdate ]]
    -- upvalues: v21 (copy)
    local l_props_1 = v33.props;
    local l_PageId_1 = l_props_1.PageId;
    local l_SettingsSaveJobs_0 = l_props_1.SettingsSaveJobs;
    local l_SaveState_1 = l_props_1.SaveState;
    local l_SaveState_2 = v34.SaveState;
    if l_SaveState_1 == v21.Pending and l_SaveState_1 ~= l_SaveState_2 then
        l_props_1.SavePageSettings(l_PageId_1, l_SettingsSaveJobs_0);
    end;
end;
v22.render = function(v41) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v2 (copy), v1 (copy), l_Pane_0 (copy), v9 (copy), l_LoadingIndicator_0 (copy), v16 (copy), l_ScrollingFrame_0 (copy), l_TextLabel_0 (copy), v15 (copy), v14 (copy)
    local l_props_2 = v41.props;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local l_Title_0 = l_props_2.Title;
    local l_LoadState_1 = l_props_2.LoadState;
    local l_SettingsLoadJobs_1 = l_props_2.SettingsLoadJobs;
    local l_PageId_2 = l_props_2.PageId;
    local v48 = true;
    if l_props_2.ShowHeader ~= nil then
        v48 = l_props_2.ShowHeader;
    end;
    if l_LoadState_1 <= v20.Loading then
        return v2.createElement(if v1 then l_Pane_0 else v9, {}, {
            Loading = v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            })
        });
    elseif l_LoadState_1 == v20.LoadFailed then
        return v2.createElement(v16, {
            OnRetry = function() --[[ Line: 102 ]] --[[ Name: OnRetry ]]
                -- upvalues: l_props_2 (copy), l_PageId_2 (copy), l_SettingsLoadJobs_1 (copy)
                l_props_2.LoadPageSettings(l_PageId_2, l_SettingsLoadJobs_1);
            end
        });
    elseif l_LoadState_1 == v20.Loaded then
        return v2.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Layout = if v1 then Enum.FillDirection.Vertical else nil, 
            Padding = if v1 then {
                Top = l_Stylizer_1.settingsPage.marginY, 
                Bottom = l_Stylizer_1.settingsPage.marginY, 
                Left = l_Stylizer_1.settingsPage.marginX, 
                Right = l_Stylizer_1.settingsPage.marginX
            } else nil, 
            Spacing = if v1 then UDim.new(0, l_Stylizer_1.settingsPage.settingPadding) else nil, 
            [v2.Ref] = v41.scrollingFrameRef
        }, {
            Layout = if v1 then nil else v2.createElement("UIListLayout", {
                [v2.Change.AbsoluteContentSize] = v41.contentHeightChanged, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, l_Stylizer_1.settingsPage.settingPadding)
            }), 
            Padding = if v1 then nil else v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Stylizer_1.settingsPage.marginX), 
                PaddingRight = UDim.new(0, l_Stylizer_1.settingsPage.marginX)
            }), 
            Header = v48 and if v1 then v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                Style = "Title", 
                Text = l_Title_0, 
                TextSize = 30
            }) else v2.createElement(v15, {
                LayoutOrder = 1, 
                Title = l_Title_0
            }), 
            Content = v2.createElement(if v1 then l_Pane_0 else v14, if v1 then {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2, 
                Spacing = l_Stylizer_1.settingsPage.settingPadding
            } else {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                axis = v14.Axis.Vertical, 
                minimumSize = UDim2.new(1, 0, 0, 0), 
                contentPadding = UDim.new(0, l_Stylizer_1.settingsPage.settingPadding)
            }, v41.props.CreateChildren())
        });
    else
        return nil;
    end;
end;
v22 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v22);
return (v3.connect(function(v49, v50) --[[ Line: 180 ]]
    -- upvalues: v20 (copy)
    local l_PageId_3 = v50.PageId;
    return {
        LoadState = v49.PageLoadState[l_PageId_3] or v20.Unloaded, 
        SaveState = v49.PageSaveState[l_PageId_3]
    };
end, function(v52) --[[ Line: 186 ]]
    -- upvalues: v17 (copy), v18 (copy), v19 (copy)
    return {
        LoadPageSettings = function(v53, v54) --[[ Line: 188 ]] --[[ Name: LoadPageSettings ]]
            -- upvalues: v52 (copy), v17 (ref)
            v52(v17(v53, v54));
        end, 
        SavePageSettings = function(v55, v56) --[[ Line: 191 ]] --[[ Name: SavePageSettings ]]
            -- upvalues: v52 (copy), v18 (ref)
            v52(v18(v55, v56));
        end, 
        SetPageSaveState = function(v57, v58) --[[ Line: 194 ]] --[[ Name: SetPageSaveState ]]
            -- upvalues: v52 (copy), v19 (ref)
            v52(v19(v57, v58));
        end
    };
end)(v22));