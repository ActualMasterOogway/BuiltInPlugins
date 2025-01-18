local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local v2 = require(l_script_FirstAncestor_0.Src.Util.LocalizationUtil);
local v3 = require(l_script_FirstAncestor_0.Src.Util.WiringUtil);
local function v15(v4) --[[ Line: 9 ]] --[[ Name: getInputsOf ]]
    -- upvalues: v3 (copy)
    local v5 = {};
    for _, v7 in v4 do
        local v8 = #v5;
        if v7:IsA("Wire") and v7.SourceInstance then
            table.insert(v5, v7.SourceInstance);
        end;
        if v3.hasInputPin(v7) then
            for _, v10 in (v7:GetConnectedWires("Input")) do
                table.insert(v5, v10.SourceInstance);
            end;
        end;
        if v3.hasSidechainPin(v7) then
            for _, v12 in (v7:GetConnectedWires("Sidechain")) do
                table.insert(v5, v12.SourceInstance);
            end;
        end;
        if v7:IsA("AudioListener") then
            for _, v14 in (v7:GetInteractingEmitters()) do
                table.insert(v5, v14);
            end;
        end;
        if v8 == #v5 then
            table.insert(v5, v7);
        end;
    end;
    return v5;
end;
local function v25(v16) --[[ Line: 48 ]] --[[ Name: getOutputsOf ]]
    -- upvalues: v3 (copy)
    local v17 = {};
    for _, v19 in v16 do
        local v20 = #v17;
        if v19:IsA("Wire") and v19.TargetInstance then
            table.insert(v17, v19.TargetInstance);
        end;
        if v3.hasOutputPin(v19) then
            for _, v22 in v19:GetConnectedWires("Output") do
                table.insert(v17, v22.TargetInstance);
            end;
        end;
        if v19:IsA("AudioEmitter") then
            for _, v24 in (v19:GetInteractingListeners()) do
                table.insert(v17, v24);
            end;
        end;
        if v20 == #v17 then
            table.insert(v17, v19);
        end;
    end;
    return v17;
end;
local function v27() --[[ Line: 79 ]] --[[ Name: selectWiredInputs ]]
    -- upvalues: v15 (copy), l_Selection_0 (copy)
    local v26 = v15(l_Selection_0:Get());
    l_Selection_0:Set(v26);
end;
local function v29() --[[ Line: 84 ]] --[[ Name: selectWiredOutputs ]]
    -- upvalues: v25 (copy), l_Selection_0 (copy)
    local v28 = v25(l_Selection_0:Get());
    l_Selection_0:Set(v28);
end;
local v30 = nil;
local v31 = nil;
return {
    register = function(v32) --[[ Line: 94 ]] --[[ Name: register ]]
        -- upvalues: v2 (copy), v30 (ref), v31 (ref), v27 (copy), v29 (copy)
        local l_v32_PluginComponent_0 = v32:GetPluginComponent("Actions");
        local v34 = {
            Uri = {
                DataModel = "Standalone", 
                PluginId = "Audio", 
                Category = "Actions", 
                ItemId = "Select Inputs"
            }, 
            Enabled = true, 
            Visible = true, 
            Text = v2.action("SelectInputs"), 
            Tooltip = v2.tooltip("SelectInputs"), 
            Icon = "Help", 
            Shortcuts = {}
        };
        local v35 = {
            Uri = {
                DataModel = "Standalone", 
                PluginId = "Audio", 
                Category = "Actions", 
                ItemId = "Select Outputs"
            }, 
            Enabled = true, 
            Visible = true, 
            Text = v2.action("SelectOutputs"), 
            Tooltip = v2.tooltip("SelectOutputs"), 
            Icon = "Help", 
            Shortcuts = {}
        };
        if v30 then
            v30:Disconnect();
            v30 = nil;
        end;
        if v31 then
            v31:Disconnect();
            v31 = nil;
        end;
        v30 = l_v32_PluginComponent_0:CreateAsync(v34, true)[1]:Connect(v27);
        v31 = l_v32_PluginComponent_0:CreateAsync(v35, true)[1]:Connect(v29);
    end, 
    deregister = function() --[[ Line: 139 ]] --[[ Name: deregister ]]
        -- upvalues: v30 (ref), v31 (ref)
        if v30 then
            v30:Disconnect();
            v30 = nil;
        end;
        if v31 then
            v31:Disconnect();
            v31 = nil;
        end;
    end
};