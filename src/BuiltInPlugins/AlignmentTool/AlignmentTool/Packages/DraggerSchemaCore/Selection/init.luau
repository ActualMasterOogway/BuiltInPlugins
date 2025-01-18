local l_Selection_0 = game:GetService("Selection");
local l_DraggerFramework_0 = script.Parent.Parent.Parent.Packages.DraggerFramework;
local v2 = require(l_DraggerFramework_0.Utility.BufferedSignal);
local v3 = require(l_DraggerFramework_0.Utility.isProtectedInstance);
local v4 = require(l_DraggerFramework_0.Flags.getFFlagDraggerShouldBufferSelectionSignals);
local v5 = require(l_DraggerFramework_0.Flags.getFIntDraggerSelectionSignalBufferMilliseconds);
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v4 (copy), v2 (copy), l_Selection_0 (copy), v5 (copy)
    local v7 = setmetatable({}, v6);
    if v4() then
        v7.SelectionChanged = v2.new(l_Selection_0.SelectionChanged, v5() / 1000);
        return v7;
    else
        v7.SelectionChanged = l_Selection_0.SelectionChanged;
        return v7;
    end;
end;
v6.Set = function(_, v9, v10) --[[ Line: 37 ]] --[[ Name: Set ]]
    -- upvalues: l_Selection_0 (copy)
    if v10 then
        l_Selection_0:Remove(v10.Removed);
        l_Selection_0:Add(v10.Added);
        return;
    else
        l_Selection_0:Set(v9);
        return;
    end;
end;
v6.Get = function(_) --[[ Line: 46 ]] --[[ Name: Get ]]
    -- upvalues: l_Selection_0 (copy), v3 (copy)
    local v12 = l_Selection_0:Get();
    local v13 = {};
    for _, v15 in ipairs(v12) do
        if not v3(v15) then
            table.insert(v13, v15);
        end;
    end;
    return v13;
end;
v6.GetActiveInstance = function(_) --[[ Line: 57 ]] --[[ Name: GetActiveInstance ]]
    -- upvalues: l_Selection_0 (copy)
    return l_Selection_0.ActiveInstance;
end;
if v4() then
    v6.flush = function(v17) --[[ Line: 62 ]] --[[ Name: flush ]]
        v17.SelectionChanged:flush();
    end;
end;
return v6;