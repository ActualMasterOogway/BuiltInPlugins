local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local l_getNodeTestId_0 = require(script.Parent.Parent["get-node-test-id"]).getNodeTestId;
local v3 = {};
local function v10(v4, v5, v6) --[[ Line: 15 ]] --[[ Name: matches ]]
    -- upvalues: l_Array_0 (copy), l_getNodeTestId_0 (copy)
    return l_Array_0.some(v5, function(v7) --[[ Line: 16 ]]
        -- upvalues: v6 (copy), v4 (copy), l_getNodeTestId_0 (ref)
        if not v6 then
            return v4.ClassName:find(v7) ~= nil;
        elseif v6 == "property" then
            local _, l_result_0 = pcall(function() --[[ Line: 21 ]]
                -- upvalues: v4 (ref), v7 (copy)
                return v4[v7];
            end);
            return l_result_0 ~= nil;
        elseif v6 == "tag" then
            return l_getNodeTestId_0(v4) ~= nil;
        else
            return v4:GetAttribute(v7) ~= nil;
        end;
    end);
end;
local function v11(v12, v13, v14, v15) --[[ Line: 33 ]] --[[ Name: getDescendantsMatching ]]
    -- upvalues: l_Array_0 (copy), l_getNodeTestId_0 (copy), v11 (copy)
    local v16 = {};
    local l_v12_Children_0 = v12:GetChildren();
    l_Array_0.forEach(l_v12_Children_0, function(v18) --[[ Line: 37 ]]
        -- upvalues: v13 (copy), v14 (copy), l_Array_0 (ref), l_getNodeTestId_0 (ref), v16 (ref), v11 (ref), v15 (copy)
        local l_v13_0 = v13;
        local l_v14_0 = v14;
        if l_Array_0.some(l_v13_0, function(v21) --[[ Line: 16 ]]
            -- upvalues: l_v14_0 (copy), v18 (copy), l_getNodeTestId_0 (ref)
            if not l_v14_0 then
                return v18.ClassName:find(v21) ~= nil;
            elseif l_v14_0 == "property" then
                local _, l_result_1 = pcall(function() --[[ Line: 21 ]]
                    -- upvalues: v18 (ref), v21 (copy)
                    return v18[v21];
                end);
                return l_result_1 ~= nil;
            elseif l_v14_0 == "tag" then
                return l_getNodeTestId_0(v18) ~= nil;
            else
                return v18:GetAttribute(v21) ~= nil;
            end;
        end) then
            table.insert(v16, v18);
        end;
        v16 = l_Array_0.concat(v16, v11(v18, v13, v14, v15));
    end);
    return if v15 then if v15 == 1 then v16[1] else l_Array_0.slice(v16, 1, v15 + 1) else v16;
end;
v3.querySelector = function(v24, v25, v26) --[[ Line: 49 ]]
    -- upvalues: v11 (copy)
    return (v11(v24, v25, v26, 1));
end;
v3.querySelectorAll = function(v27, v28, v29) --[[ Line: 52 ]]
    -- upvalues: v11 (copy)
    return (v11(v27, v28, v29));
end;
v3.matches = v10;
return v3;