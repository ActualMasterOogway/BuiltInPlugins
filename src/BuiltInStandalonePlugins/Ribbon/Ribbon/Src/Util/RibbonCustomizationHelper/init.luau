local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local v3 = {};
local _ = game:GetService("StudioWidgetsService");
local v5 = {};
v3.createCustomizationActionsAsync = function(v6, v7, v8, v9) --[[ Line: 15 ]] --[[ Name: createCustomizationActionsAsync ]]
    -- upvalues: l_join_0 (copy), v5 (copy)
    local l_v6_Uri_0 = v6:GetUri();
    local l_v6_PluginComponent_0 = v6:GetPluginComponent("Actions");
    local v12 = l_v6_PluginComponent_0:CreateAsync({
        Uri = l_join_0(l_v6_Uri_0, {
            Category = "Actions", 
            ItemId = "ReloadTabs"
        }), 
        Enabled = true, 
        Exists = true, 
        Visible = true, 
        Checkable = false, 
        Text = v7:getText("Plugin", "ReloadTabs"), 
        Tooltip = v7:getText("Plugin", "ReloadTabsTooltip")
    }, true)[1];
    if v5.reloadTabActivatedSignal then
        v5.reloadTabActivatedSignal:Disconnect();
    end;
    v5.reloadTabActivatedSignal = v12:Connect(v8);
    local v13 = l_v6_PluginComponent_0:CreateAsync({
        Uri = l_join_0(l_v6_Uri_0, {
            Category = "Actions", 
            ItemId = "PrintActions"
        }), 
        Enabled = true, 
        Exists = true, 
        Visible = true, 
        Checkable = false, 
        Text = v7:getText("Plugin", "PrintActions"), 
        Tooltip = v7:getText("Plugin", "PrintActionsTooltip")
    }, true)[1];
    if v5.printActionsActivatedSignal then
        v5.printActionsActivatedSignal:Disconnect();
    end;
    v5.printActionsActivatedSignal = v13:Connect(v9);
end;
v3.getLatestRibbonControlsAsync = function(v14) --[[ Line: 64 ]] --[[ Name: getLatestRibbonControlsAsync ]]
    return (v14:GetPluginComponent("RibbonConfiguration"):ReloadAndGetRibbonDefinitionAsync());
end;
return v3;