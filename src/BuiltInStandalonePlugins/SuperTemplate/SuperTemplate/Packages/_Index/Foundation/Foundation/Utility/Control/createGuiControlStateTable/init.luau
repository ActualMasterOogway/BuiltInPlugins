local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = script.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v3 = require(l_Parent_0.StateTable.StateTable);
local l_Initialize_0 = v2.Initialize;
local v5 = require(l_Parent_0.guiControlStateTable);
return function(v6) --[[ Line: 14 ]] --[[ Name: createGuiControlStateTable ]]
    -- upvalues: v3 (copy), l_Initialize_0 (copy), v5 (copy)
    local v7 = v3.new("GuiStateTable", l_Initialize_0, v5);
    v7:onStateChange(v6);
    return v7;
end;