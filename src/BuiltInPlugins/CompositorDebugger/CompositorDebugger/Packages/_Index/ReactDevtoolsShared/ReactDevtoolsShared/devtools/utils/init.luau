local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = {};
local _ = require(script.Parent.views.Components.types);
local _ = require(script.Parent.types);
v3.printElement = function(v6, v7) --[[ Line: 25 ]]
    v7 = v7 or false;
    local v8 = " ";
    if #v6.children > 0 then
        v8 = v6.isCollapsed and "\226\150\184" or "\226\150\190";
    end;
    local v9 = "";
    if v6.key ~= nil and v6.key ~= "" then
        v9 = string.format(" key=\"%s\"", (tostring(v6.key)));
    end;
    local v10 = nil;
    if v6.hocDisplayNames ~= nil then
        v10 = table.clone(v6.hocDisplayNames);
    end;
    local v11 = v10 == nil and "" or string.format(" [%s]", table.concat(v10, "]["));
    local v12 = "";
    if v7 then
        v12 = string.format(" (%s)", v6.isCollapsed and "1" or tostring(v6.weight));
    end;
    return string.format("%s%s <%s%s>%s%s", ("  "):rep(v6.depth + 1), v8, v6.displayName or "null", v9, v11, v12);
end;
v3.printOwnersList = function(v13, v14) --[[ Line: 67 ]]
    -- upvalues: l_Array_0 (copy), v3 (copy)
    v14 = v14 or false;
    return table.concat(l_Array_0.map(v13, function(v15) --[[ Line: 70 ]]
        -- upvalues: v3 (ref), v14 (ref)
        return v3.printElement(v15, v14);
    end), "\n");
end;
v3.printStore = function(v16, v17) --[[ Line: 77 ]]
    -- upvalues: l_Array_0 (copy), v3 (copy)
    v17 = v17 or false;
    local v18 = {};
    local v19 = 0;
    l_Array_0.forEach(v16:getRoots(), function(v20) --[[ Line: 82 ]]
        -- upvalues: v16 (copy), v18 (copy), v17 (ref), v19 (ref), v3 (ref)
        local l_weight_0 = v16:getElementByID(v20).weight;
        table.insert(v18, "[root]" .. if v17 then string.format(" (%d)", l_weight_0) else "");
        for v22 = v19, v19 + l_weight_0 - 1 do
            local v23 = v16:getElementAtIndex(v22);
            if v23 == nil then
                error(string.format("Could not find element at index %d", v22));
            end;
            table.insert(v18, v3.printElement(v23, v17));
        end;
        v19 = v19 + l_weight_0;
    end);
    if v19 ~= v16:getNumElements() then
        error(("Inconsistent Store state. Individual root weights (%s) do not match total weight (%s)"):format(tostring(v19), (tostring(v16:getNumElements()))));
    end;
    v16:assertExpectedRootMapSizes();
    return table.concat(v18, "\n");
end;
v3.sanitizeForParse = function(v24) --[[ Line: 124 ]]
    if typeof(v24) == "string" and #v24 >= 2 and string.sub(v24, 1, 1) == "'" and string.sub(v24, #v24) == "'" then
        return "\"" .. string.sub(v24, 1, #v24 - 2) .. "\"";
    else
        return v24;
    end;
end;
v3.smartParse = function(v25) --[[ Line: 137 ]]
    -- upvalues: l_HttpService_0 (copy), v3 (copy)
    if v25 == "Infinity" then
        return 1e999;
    elseif v25 == "NaN" then
        return 0;
    elseif v25 == "undefined" then
        return nil;
    else
        return l_HttpService_0:JSONDecode(v3.sanitizeForParse(v25));
    end;
end;
v3.smartStringify = function(v26) --[[ Line: 150 ]]
    -- upvalues: l_HttpService_0 (copy)
    if typeof(v26) ~= "number" and v26 == nil then
        return "undefined";
    else
        return l_HttpService_0:JSONEncode(v26);
    end;
end;
return v3;