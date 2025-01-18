local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0);
local l_Children_0 = l_script_FirstAncestor_0.Components:GetChildren();
local l_Children_1 = l_script_FirstAncestor_0.Providers:GetChildren();
return function(v4) --[[ Line: 6 ]] --[[ Name: GetStories ]]
    -- upvalues: l_Children_0 (copy), v1 (copy), l_Children_1 (copy)
    local v5 = {};
    for _, v7 in l_Children_0 do
        local l_status_0, _ = pcall(function() --[[ Line: 9 ]]
            -- upvalues: v1 (ref), v7 (copy)
            return v1[v7.Name];
        end);
        if l_status_0 == v4 then
            table.insert(v5, v7);
        end;
    end;
    for _, v11 in l_Children_1 do
        local l_status_1, _ = pcall(function() --[[ Line: 18 ]]
            -- upvalues: v1 (ref), v11 (copy)
            return v1[v11.Name .. "Provider"];
        end);
        if l_status_1 == v4 then
            table.insert(v5, v11);
        end;
    end;
    return v5;
end;