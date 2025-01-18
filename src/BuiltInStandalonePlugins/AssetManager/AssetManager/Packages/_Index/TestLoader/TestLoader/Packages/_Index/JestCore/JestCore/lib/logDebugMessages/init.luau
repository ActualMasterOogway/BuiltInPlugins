local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local _ = require(l_Parent_0.JestTypes);
local l_JSON_0 = require(l_Parent_0.RobloxShared).nodeUtils.JSON;
v2.default = function(v5, v6, v7) --[[ Line: 30 ]] --[[ Name: logDebugMessages ]]
    -- upvalues: l_JSON_0 (copy)
    local v8 = {
        configs = v6, 
        globalConfig = v5, 
        version = "27.4.7"
    };
    v7:write(l_JSON_0.stringify(v8, nil, "  ") .. "\n");
end;
return v2;