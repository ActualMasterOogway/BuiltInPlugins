local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
local v2 = {};
v2.__index = v2;
v2.__tostring = function(v3) --[[ Line: 29 ]]
    -- upvalues: v2 (copy)
    return getmetatable(v2).__tostring(v3);
end;
local function _(v4) --[[ Line: 35 ]] --[[ Name: __createError ]]
    -- upvalues: v2 (copy)
    local v5 = setmetatable({
        name = "Error", 
        message = v4 or ""
    }, v2);
    v2.__captureStackTrace(v5, 4);
    return v5;
end;
v2.new = function(v7) --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v8 = setmetatable({
        name = "Error", 
        message = v7 or ""
    }, v2);
    v2.__captureStackTrace(v8, 4);
    return v8;
end;
v2.captureStackTrace = function(v9, v10) --[[ Line: 48 ]] --[[ Name: captureStackTrace ]]
    -- upvalues: v2 (copy)
    v2.__captureStackTrace(v9, 3, v10);
end;
v2.__captureStackTrace = function(v11, v12, v13) --[[ Line: 52 ]] --[[ Name: __captureStackTrace ]]
    local l_message_0 = v11.message;
    local v15 = (v11.name or "Error") .. if l_message_0 ~= nil and l_message_0 ~= "" then ": " .. l_message_0 else "";
    if typeof(v13) == "function" then
        local v16 = debug.traceback(nil, v12);
        local v17 = debug.info(v13, "n");
        local v18 = debug.info(v13, "s");
        local v19 = string.gsub(v18, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. v17;
        local v20 = string.find(v16, v19);
        local v21 = nil;
        if v20 ~= nil then
            local v22, v23 = string.find(v16, "\n", v20 + 1);
            v20 = v22;
            v21 = v23;
        end;
        if v21 ~= nil then
            v16 = string.sub(v16, v21 + 1);
        end;
        v11.stack = v15 .. "\n" .. v16;
        return;
    else
        v11.stack = debug.traceback(v15, v12);
        return;
    end;
end;
return (setmetatable(v2, {
    __call = function(_, ...) --[[ Line: 80 ]] --[[ Name: __call ]]
        -- upvalues: v2 (copy)
        local v25 = setmetatable({
            name = "Error", 
            message = ... or ""
        }, v2);
        v2.__captureStackTrace(v25, 4);
        return v25;
    end, 
    __tostring = function(v26) --[[ Line: 83 ]] --[[ Name: __tostring ]]
        if v26.name ~= nil then
            if v26.message and v26.message ~= "" then
                return string.format("%s: %s", tostring(v26.name), (tostring(v26.message)));
            else
                return (tostring(v26.name));
            end;
        else
            return (tostring("Error"));
        end;
    end
}));