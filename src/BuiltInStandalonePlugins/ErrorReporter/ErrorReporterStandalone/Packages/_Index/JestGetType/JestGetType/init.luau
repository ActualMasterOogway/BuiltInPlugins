local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_instanceof_0 = v1.instanceof;
local v4 = nil;
local l_Set_0 = v1.Set;
return {
    getType = function(v6) --[[ Line: 23 ]] --[[ Name: getType ]]
        -- upvalues: v4 (ref), l_Parent_0 (copy), l_instanceof_0 (copy), l_Error_0 (copy), l_Set_0 (copy)
        if v6 == nil then
            return "nil";
        elseif typeof(v6) == "boolean" then
            return "boolean";
        elseif typeof(v6) == "function" then
            return "function";
        elseif typeof(v6) == "number" then
            return "number";
        elseif typeof(v6) == "string" then
            return "string";
        elseif typeof(v6) == "DateTime" then
            return "DateTime";
        elseif typeof(v6) == "userdata" and tostring(v6):match("Symbol%(.*%)") then
            return "symbol";
        else
            if typeof(v6) == "table" then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 48 ]]
                    -- upvalues: v6 (copy)
                    local v7 = false;
                    if typeof(v6.test) == "function" then
                        v7 = typeof(v6.exec) == "function";
                    end;
                    return v7;
                end);
                if l_status_0 and l_result_0 then
                    v4 = require(l_Parent_0.RegExp);
                    if l_instanceof_0(v6, v4) then
                        return "regexp";
                    end;
                end;
            end;
            if l_instanceof_0(v6, l_Error_0) then
                return "error";
            elseif l_instanceof_0(v6, l_Set_0) then
                return "set";
            elseif typeof(v6) == "table" then
                return "table";
            elseif type(v6) ~= typeof(v6) then
                return (typeof(v6));
            elseif type(v6) == "userdata" then
                return "userdata";
            elseif typeof(v6) == "thread" then
                return "thread";
            else
                error(string.format("value of unknown type: %s (%s)", typeof(v6), (tostring(v6))));
                return;
            end;
        end;
    end, 
    isPrimitive = function(v10) --[[ Line: 90 ]] --[[ Name: isPrimitive ]]
        local v11 = false;
        if typeof(v10) ~= "table" then
            v11 = false;
            if typeof(v10) ~= "function" then
                v11 = not (type(v10) ~= typeof(v10));
            end;
        end;
        return v11;
    end, 
    isRobloxBuiltin = function(v12) --[[ Line: 19 ]] --[[ Name: isRobloxBuiltin ]]
        return type(v12) ~= typeof(v12);
    end
};