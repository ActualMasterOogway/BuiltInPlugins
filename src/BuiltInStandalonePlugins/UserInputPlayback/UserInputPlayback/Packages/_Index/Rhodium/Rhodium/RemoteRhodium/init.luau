local v0 = {};
local v1 = game:getService("HttpService");
local v2 = nil;
local function v8(v3, v4) --[[ Line: 6 ]] --[[ Name: split ]]
    local v5 = {};
    while v3:len() > 0 do
        local v6, v7 = string.find(v3, v4, 1, true);
        if v6 == nil then
            table.insert(v5, v3);
            v3 = "";
        else
            table.insert(v5, (string.sub(v3, 1, v6 - 1)));
            v3 = string.sub(v3, v7 + 1);
            if v3 == "" then
                table.insert(v5, "");
            end;
        end;
    end;
    return v5;
end;
v0.setCommandPath = function(v9) --[[ Line: 22 ]] --[[ Name: setCommandPath ]]
    -- upvalues: v2 (ref)
    v2 = v9;
end;
local function v19(v10) --[[ Line: 26 ]] --[[ Name: onCommand ]]
    -- upvalues: v1 (copy), v8 (copy), v2 (ref)
    assert(type(v10) == "string", "command should be a string");
    local v11 = v10:find("(", 1, true);
    local v12 = v10:reverse():find(")", 1, true);
    if v12 ~= nil then
        v12 = #v10 - v12 + 1;
    end;
    local v13 = {};
    if v11 then
        assert(v12, "invalid syntex, expecting \")\"");
        local v14 = v10:sub(v11 + 1, v12 - 1);
        if #v14 > 0 then
            v13 = v1:JSONDecode("[" .. v14 .. "]");
        end;
        v10 = v10:sub(1, v11 - 1);
    end;
    local v15 = v8(v10, ".");
    local l_v2_0 = v2;
    for v17 = 1, #v15 do
        local v18 = v15[v17];
        l_v2_0 = l_v2_0[v18];
        if l_v2_0 == nil then
            error("can not find " .. v18);
        end;
        if type(l_v2_0) == "userdata" and l_v2_0.ClassName == "ModuleScript" then
            l_v2_0 = require(l_v2_0);
        end;
    end;
    if type(l_v2_0) ~= "function" then
        error("target is not a function");
    end;
    return l_v2_0(unpack(v13));
end;
v0.setCommandPath = function(v20) --[[ Line: 64 ]] --[[ Name: setCommandPath ]]
    -- upvalues: v2 (ref)
    v2 = v20;
end;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 68 ]]
    return game:getService("RhodiumService");
end);
if l_status_0 then
    l_result_0.onCommand = v19;
end;
return v0;