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
local function v21(v11, v12, v13, v14) --[[ Line: 33 ]] --[[ Name: getDescendantsMatching ]]
    -- upvalues: l_Array_0 (copy), l_getNodeTestId_0 (copy)
    local v15 = {};
    for _, v17 in v11:GetDescendants() do
        if l_Array_0.some(v12, function(v18) --[[ Line: 16 ]]
            -- upvalues: v13 (copy), v17 (copy), l_getNodeTestId_0 (ref)
            if not v13 then
                return v17.ClassName:find(v18) ~= nil;
            elseif v13 == "property" then
                local _, l_result_1 = pcall(function() --[[ Line: 21 ]]
                    -- upvalues: v17 (ref), v18 (copy)
                    return v17[v18];
                end);
                return l_result_1 ~= nil;
            elseif v13 == "tag" then
                return l_getNodeTestId_0(v17) ~= nil;
            else
                return v17:GetAttribute(v18) ~= nil;
            end;
        end) then
            if v14 == 1 then
                return v17;
            else
                table.insert(v15, v17);
                if v14 == #v15 then
                    return v15;
                end;
            end;
        end;
    end;
    return v15;
end;
v3.querySelector = function(v22, v23, v24) --[[ Line: 54 ]]
    -- upvalues: v21 (copy)
    return (v21(v22, v23, v24, 1));
end;
v3.querySelectorAll = function(v25, v26, v27) --[[ Line: 57 ]]
    -- upvalues: v21 (copy)
    return (v21(v25, v26, v27));
end;
v3.matches = v10;
return v3;