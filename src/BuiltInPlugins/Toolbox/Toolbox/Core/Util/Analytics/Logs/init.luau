local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = {};
local function _(v3) --[[ Line: 7 ]] --[[ Name: sendLog ]]
    print(("[Toolbox Analytics] %s"):format((tostring(v3))));
end;
v2.logAnalytics = function(v5, v6, v7, v8, v9) --[[ Line: 11 ]] --[[ Name: logAnalytics ]]
    -- upvalues: v1 (copy)
    if not v1.shouldLogAnalytics() then
        return;
    else
        v5 = v5 or "";
        v6 = v6 or "";
        v7 = v7 or "";
        v8 = v8 or "";
        v9 = v9 or {};
        local v10 = {};
        for v11, v12 in pairs(v9) do
            local v13 = type(v11) == "string" and v11 or "[" .. tostring(v12) .. "]";
            local v14 = type(v12) == "string" and "\"" .. v12 .. "\"" or tostring(v12);
            v10[#v10 + 1] = v13 .. "=" .. v14;
        end;
        local v15 = table.concat(v10, ", ");
        local v16 = ("%s(target=\"%s\", eventContext=\"%s\", eventName=\"%s\", additionalArgs={%s})"):format(tostring(v5), tostring(v6), tostring(v7), tostring(v8), v15);
        print(("[Toolbox Analytics] %s"):format((tostring(v16))));
        return;
    end;
end;
v2.logEvent = function(v17, v18, v19, v20, v21) --[[ Line: 42 ]] --[[ Name: logEvent ]]
    -- upvalues: v1 (copy)
    if not v1.shouldLogAnalytics() then
        return;
    else
        v17 = v17 or "";
        v18 = v18 or "";
        v19 = v19 or "";
        v20 = v20 or "";
        v21 = v21 or 0;
        local v22 = ("%s(category=\"%s\", action=\"%s\", label=\"%s\", value=%s)"):format(tostring(v17), tostring(v18), tostring(v19), tostring(v20), (tostring(v21)));
        print(("[Toolbox Analytics] %s"):format((tostring(v22))));
        return;
    end;
end;
v2.logCounterEvent = function(v23, v24, v25) --[[ Line: 64 ]] --[[ Name: logCounterEvent ]]
    -- upvalues: v1 (copy)
    if not v1.shouldLogAnalytics() then
        return;
    else
        v23 = v23 or "";
        v24 = v24 or "";
        v25 = v25 or 1;
        local v26 = ("%s(counter=\"%s\", amount=%s)"):format(tostring(v23), tostring(v24), (tostring(v25)));
        print(("[Toolbox Analytics] %s"):format((tostring(v26))));
        return;
    end;
end;
return v2;