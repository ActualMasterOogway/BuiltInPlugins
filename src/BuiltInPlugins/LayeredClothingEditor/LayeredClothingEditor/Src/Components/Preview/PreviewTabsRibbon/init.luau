local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v3.Util.AccessoryAndBodyToolShared;
local l_Constants_0 = l_AccessoryAndBodyToolShared_0.Constants;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local l_getActivePreviewTabs_0 = l_AccessoryAndBodyToolShared_0.getActivePreviewTabs;
local v8 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_UI_0 = v8.UI;
local l_Tabs_0 = l_UI_0.Tabs;
local l_Pane_0 = l_UI_0.Pane;
local l_Typecheck_0 = v8.Util.Typecheck;
local v16 = require(l_Parent_0.Src.Actions.SelectPreviewTab);
local v17 = v1.PureComponent:extend("PreviewTabsRibbon");
l_Typecheck_0.wrap(v17, script);
local function _(v18, v19) --[[ Line: 44 ]] --[[ Name: isTabActive ]]
    -- upvalues: l_getActivePreviewTabs_0 (copy)
    return l_getActivePreviewTabs_0(v19)[v18] ~= nil;
end;
v17.init = function(v21) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: l_getActivePreviewTabs_0 (copy)
    v21.onClick = function(v22) --[[ Line: 50 ]]
        -- upvalues: v21 (copy), l_getActivePreviewTabs_0 (ref)
        local l_props_0 = v21.props;
        local l_Key_0 = v22.Key;
        local l_SelectedTab_0 = l_props_0.SelectedTab;
        local v26 = l_props_0.EditingItemContext:getItem();
        if l_Key_0 and l_Key_0 == l_SelectedTab_0 or not (l_getActivePreviewTabs_0(v26)[l_Key_0] ~= nil) then
            return;
        else
            v21.props.SelectPreviewTab(l_Key_0);
            return;
        end;
    end;
end;
v17.render = function(v27) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: l_PreviewConstantsInterface_0 (copy), l_Constants_0 (copy), l_getActivePreviewTabs_0 (copy), v1 (copy), l_Pane_0 (copy), l_Tabs_0 (copy)
    local l_props_1 = v27.props;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Localization_0 = l_props_1.Localization;
    local l_SelectedTab_1 = l_props_1.SelectedTab;
    local v32 = l_props_1.EditingItemContext:getItem();
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v34 = {};
    local v35 = l_PreviewConstantsInterface_0.getTabs();
    for v36, v37 in pairs(v35) do
        v34[v37.LayoutOrder] = {
            Key = v36, 
            Label = l_Localization_0:getText(l_Constants_0.LOCALIZATION_KEYS.Preview, v37.LocalizationKey), 
            Disabled = not (l_getActivePreviewTabs_0(v32)[v36] ~= nil)
        };
    end;
    local v38 = nil;
    for _, v40 in ipairs(v34) do
        if v40.Key == l_SelectedTab_1 then
            v38 = v40;
        end;
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.TabHeight), 
        LayoutOrder = l_LayoutOrder_0
    }, {
        BottomLine = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.BorderSize), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor = l_Stylizer_0.BorderColor, 
            ZIndex = 0
        }), 
        Tabs = v1.createElement(l_Tabs_0, {
            Tabs = v34, 
            OnTabSelected = v27.onClick, 
            SelectedTab = v38
        })
    });
end;
v17 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    EditingItemContext = l_EditingItemContext_0
})(v17);
return v2.connect(function(v41, _) --[[ Line: 113 ]] --[[ Name: mapStateToProps ]]
    return {
        SelectedTab = v41.previewStatus.selectedTab
    };
end, function(v43) --[[ Line: 121 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy)
    return {
        SelectPreviewTab = function(v44) --[[ Line: 123 ]] --[[ Name: SelectPreviewTab ]]
            -- upvalues: v43 (copy), v16 (ref)
            v43(v16(v44));
        end
    };
end)(v17);