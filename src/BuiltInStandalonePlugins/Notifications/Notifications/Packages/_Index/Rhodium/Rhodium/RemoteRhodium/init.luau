local v0 = {};
local l_HttpService_0 = game:GetService("HttpService");
local v2 = nil;
local function v13(v3) --[[ Line: 7 ]] --[[ Name: onCommand ]]
    -- upvalues: l_HttpService_0 (copy), v2 (ref)
    local v4 = v3:find("(", 1, true);
    local v5 = v3:reverse():find(")", 1, true);
    if v5 ~= nil then
        v5 = #v3 - v5 + 1;
    end;
    local v6 = {};
    if v4 then
        assert(v5, "invalid syntex, expecting \")\"");
        local v7 = v3:sub(v4 + 1, v5 - 1);
        if #v7 > 0 then
            v6 = l_HttpService_0:JSONDecode("[" .. v7 .. "]");
        end;
        v3 = v3:sub(1, v4 - 1);
    end;
    local v8 = v3:split(".");
    local l_v2_0 = v2;
    for v10 = 1, #v8 do
        local v11 = v8[v10];
        l_v2_0 = l_v2_0:FindFirstChild(v11);
        assert(l_v2_0, "can not find " .. v11);
        if l_v2_0 and l_v2_0:IsA("ModuleScript") then
            local v12 = require(l_v2_0);
            assert(typeof(v12) == "function", "target is not a function");
            return v12(unpack(v6));
        end;
    end;
    return nil;
end;
v0.setCommandPath = function(v14) --[[ Line: 46 ]] --[[ Name: setCommandPath ]]
    -- upvalues: v2 (ref)
    v2 = v14;
end;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 50 ]]
    return game:GetService("RhodiumService");
end);
if l_status_0 then
    l_result_0.onCommand = v13;
end;
return v0;