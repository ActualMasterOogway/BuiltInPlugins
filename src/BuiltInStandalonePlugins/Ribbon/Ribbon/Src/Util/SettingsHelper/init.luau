local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
local l_fromSetting_0 = v2.fromSetting;
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_find_0 = v4.find;
local l_map_0 = v4.map;
local l_insert_0 = table.insert;
local v8 = {};
local v9 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaRibbonAnchorLockModes)();
local v10 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddPauseResumeStepForwardDebugButtonsLuaRibbon)();
local v11 = {
    {
        Uri = l_fromSetting_0("RunTools", "RunMode"), 
        Text = "Setting_RunMode", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "PartShape"), 
        Text = "Setting_Part", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "EffectType"), 
        Text = "Setting_Effect", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "ConstraintType"), 
        Text = "Setting_Constraint", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("ScriptTools", "CreateScript"), 
        Text = "Setting_Script", 
        Tooltip = "Tooltip_Script", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "Group"), 
        Text = "Setting_Group", 
        Tooltip = "Tooltip_Group", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("ScriptTools", "FormatScript"), 
        Text = "Setting_Format", 
        Tooltip = "Tooltip_Format", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("ScriptTools", "Find"), 
        Text = "Setting_Find", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "InsertGui"), 
        Text = "Setting_GUI", 
        Tooltip = "Tooltip_GUI", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "InsertUIFrame"), 
        Text = "Setting_Frame", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "InsertUILabel"), 
        Text = "Setting_Label", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "InsertUIInput"), 
        Text = "Setting_Input", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "InsertUIAppearance"), 
        Text = "Setting_Appearance", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "InsertUILayout"), 
        Text = "Setting_Layout", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }, 
    {
        Uri = l_fromSetting_0("BuilderTools", "InsertUIConstraint"), 
        Text = "Setting_UIConstraint", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    }
};
if v9 then
    table.insert(v11, {
        Uri = l_fromSetting_0("BuilderTools", "AnchorMode"), 
        Text = "Setting_Anchor", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    });
    table.insert(v11, {
        Uri = l_fromSetting_0("BuilderTools", "LockMode"), 
        Text = "Setting_Lock", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    });
end;
if v10 then
    l_insert_0(v11, {
        Uri = l_fromSetting_0("RunTools", "PauseMode"), 
        Text = "Setting_PauseMode", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    });
    l_insert_0(v11, {
        Uri = l_fromSetting_0("RunTools", "ResumeMode"), 
        Text = "Setting_ResumeMode", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    });
    l_insert_0(v11, {
        Uri = l_fromSetting_0("RunTools", "StepForwardMode"), 
        Text = "Setting_StepForwardMode", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    });
    l_insert_0(v11, {
        Uri = l_fromSetting_0("RunTools", "AddClients"), 
        Text = "Setting_AddClients", 
        Tooltip = "", 
        Enabled = true, 
        Value = -1
    });
end;
local v13 = l_map_0(v11, function(v12) --[[ Line: 182 ]]
    return v12.Uri;
end);
v8.createSettings = function(v14, v15) --[[ Line: 186 ]]
    -- upvalues: v13 (copy), v11 (copy), l_find_0 (copy), v2 (copy), l_insert_0 (copy)
    local l_v14_PluginComponent_0 = v14:GetPluginComponent("Settings");
    local l_l_v14_PluginComponent_0_Async_0 = l_v14_PluginComponent_0:GetAsync(v13);
    local v18 = {};
    local v19 = {};
    for _, v21 in v11 do
        local v22 = {
            Uri = v21.Uri, 
            Text = if v21.Text ~= "" then v15:getText("Plugin", v21.Text) else "", 
            Tooltip = if v21.Tooltip ~= "" then v15:getText("Plugin", v21.Tooltip) else "", 
            Enabled = v21.Enabled, 
            Value = v21.Value
        };
        if l_find_0(l_l_v14_PluginComponent_0_Async_0, function(v23) --[[ Line: 200 ]]
            -- upvalues: v2 (ref), v21 (copy)
            return v2.equals(v23.Uri, v21.Uri);
        end) then
            l_insert_0(v19, v22);
        else
            l_insert_0(v18, v22);
        end;
    end;
    if #v18 > 0 then
        l_v14_PluginComponent_0:CreateAsync(v18);
    end;
    if #v19 > 0 then
        l_v14_PluginComponent_0:UpdateAsync(v19);
    end;
end;
return v8;