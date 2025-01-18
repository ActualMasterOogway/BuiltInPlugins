local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.None);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.forEach);
local v4 = require(l_Parent_0.copy);
local function v5(v6, v7) --[[ Line: 21 ]] --[[ Name: joinDeep ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), v1 (copy)
    local v8 = v4(v6);
    v3(v7, function(v9, v10) --[[ Line: 24 ]]
        -- upvalues: v6 (copy), v8 (copy), v5 (ref), v1 (ref)
        if typeof(v6[v10]) == "table" and typeof(v9) == "table" then
            v8[v10] = v5(v6[v10], v9);
            return;
        elseif v9 == v1 then
            v8[v10] = nil;
            return;
        else
            v8[v10] = v9;
            return;
        end;
    end);
    return v8;
end;
return v5;