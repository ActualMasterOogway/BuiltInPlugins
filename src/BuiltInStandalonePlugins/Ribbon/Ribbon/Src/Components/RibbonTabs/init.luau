local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v3.Util.counter;
local l_joinTags_0 = v3.Styling.joinTags;
local l_find_0 = require(l_script_FirstAncestor_0.Packages.Dash).find;
local l_Localization_0 = v3.ContextServices.Localization;
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useMenu);
local v9 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
local v10 = require(l_script_FirstAncestor_0.Src.Components.ControlsView);
local v11 = require(l_script_FirstAncestor_0.Src.Components.Tab);
local v12 = {
    "Home", 
    "Model", 
    "Avatar", 
    "UI", 
    "Script", 
    "Plugins"
};
return function(v13) --[[ Line: 43 ]] --[[ Name: RibbonTabs ]]
    -- upvalues: v8 (copy), v10 (copy), l_Localization_0 (copy), l_counter_0 (copy), l_find_0 (copy), v9 (copy), v1 (copy), v11 (copy), v12 (copy), l_joinTags_0 (copy)
    local v14 = v8(v10);
    local v15 = l_Localization_0:use();
    local v16 = l_counter_0();
    local v17 = {};
    local v18 = {};
    local l_RibbonDefinitionAsync_0 = v13.Plugin:GetPluginComponent("RibbonConfiguration"):GetRibbonDefinitionAsync();
    if l_RibbonDefinitionAsync_0.CustomControls then
        for v20, _ in l_RibbonDefinitionAsync_0.CustomControls do
            if l_find_0(v18, function(v22) --[[ Line: 53 ]]
                -- upvalues: v20 (copy)
                return v22 == v20;
            end) then
                warn((("Tab %* is already defined, skipping..."):format(v20)));
            else
                table.insert(v18, v20);
            end;
        end;
    end;
    local function v29(v23, v24) --[[ Line: 62 ]] --[[ Name: addTab ]]
        -- upvalues: v9 (ref), v13 (copy), v15 (copy), v17 (copy), v1 (ref), v11 (ref), v16 (copy), v14 (copy)
        local v25 = v9.child(v13.WidgetUri, v23);
        local v26 = nil;
        v26 = v23 == "Custom" and "+" or if v24 then v15:getText("Plugin", (("Tab_%*"):format(v23))) else v23;
        v17[v23] = v1.createElement(v11, {
            Uri = v25, 
            LayoutOrder = v16(), 
            Scale = v13.Scale, 
            Selected = v13.ActiveTab == v23, 
            Text = v26, 
            OnTabSelected = function(v27, v28) --[[ Line: 80 ]] --[[ Name: OnTabSelected ]]
                -- upvalues: v23 (copy), v14 (ref), v15 (ref), v25 (copy), v13 (ref)
                if v23 == "Custom" then
                    v14({
                        {
                            Id = "Custom", 
                            Type = "Text", 
                            Text = v15:getText("Plugin", "Tab_Custom"), 
                            Tooltip = v15:getText("Plugin", "Tab_Custom_Tooltip")
                        }
                    }, v25, {
                        SubjectAnchorPoint = Vector2.new(1, 0), 
                        TargetAnchorPoint = Vector2.new(1, 1), 
                        Offset = Vector2.new(0, 0)
                    });
                    return;
                else
                    v13.OnSelectTab(v23, v27, v28);
                    return;
                end;
            end
        });
    end;
    for _, v31 in v12 do
        v29(v31, true);
    end;
    for _, v33 in v18 do
        v29(v33, false);
    end;
    if #v18 == 0 then
        v29("Custom", true);
    end;
    return v1.createElement("ScrollingFrame", {
        LayoutOrder = v13.LayoutOrder, 
        [v1.Tag] = l_joinTags_0("Component-RibbonTabs Role-Surface X-RowSpace100", v13.Scale)
    }, v17);
end;