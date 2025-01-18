local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v3 = require(l_Parent_1.LuauPolyfill);
local _ = v3.Object;
local _ = v3.Array;
local _ = v3.instanceof;
local l_redactStackTrace_0 = require(l_Parent_1.RobloxShared).redactStackTrace;
local _ = require(l_Parent_0.Types);
local v9 = {};
v9.serialize = function(v10, v11, v12, v13, v14, v15) --[[ Line: 37 ]] --[[ Name: serialize ]]
    -- upvalues: l_getType_0 (copy), v9 (copy), l_redactStackTrace_0 (copy)
    v13 = v13 + 1;
    local v16 = l_getType_0(v10);
    if v16 == "string" then
        local v17 = table.clone(v11);
        v17.plugins = table.clone(v17.plugins);
        table.remove(v17.plugins, table.find(v17.plugins, v9));
        local v18 = v15(v10, v17, v12, v13, v14);
        if v11.redactStackTracesInStrings then
            v18 = l_redactStackTrace_0(v18);
        end;
        return v18;
    elseif v16 == "error" then
        local v19 = table.clone(v11);
        v19.plugins = table.clone(v19.plugins);
        table.remove(v19.plugins, table.find(v19.plugins, v9));
        local v20 = v15(v10, v19, v12, v13, v14);
        return (l_redactStackTrace_0(v20));
    else
        error("not supported");
        return;
    end;
end;
v9.test = function(v21) --[[ Line: 67 ]] --[[ Name: test ]]
    -- upvalues: l_getType_0 (copy)
    local v22 = l_getType_0(v21);
    local v23 = true;
    if v22 ~= "error" then
        v23 = v22 == "string";
    end;
    return v23;
end;
return v9;