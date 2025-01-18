local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_inspect_0 = v1.util.inspect;
return {
    describeError = function(v4) --[[ Line: 34 ]] --[[ Name: describeError ]]
        -- upvalues: v1 (copy)
        if typeof(v4) == "string" then
            local _, v6 = string.find(v4, ":[%d]+: ");
            local v7 = if v6 then string.sub(v4, v6 + 1) else v4;
            local v8 = v1.Error.new(v7);
            v8.stack = debug.traceback(nil, 2);
            return v8;
        else
            return v4;
        end;
    end, 
    errorToString = function(v9) --[[ Line: 54 ]] --[[ Name: errorToString ]]
        -- upvalues: l_inspect_0 (copy)
        local _ = nil;
        if typeof(v9) == "table" then
            if v9.message and v9.stack then
                return "\n------ Error caught by React ------\n" .. v9.message .. "\n------ Error caught by React ------\n" .. tostring(v9.stack);
            else
                return (l_inspect_0(v9));
            end;
        else
            return (l_inspect_0(v9));
        end;
    end, 
    parseReactError = function(v11) --[[ Line: 80 ]] --[[ Name: parseReactError ]]
        -- upvalues: l_Error_0 (copy)
        local v12 = string.split(v11, "\n------ Error caught by React ------\n");
        if #v12 == 3 then
            local v13, v14, v15 = table.unpack(v12);
            local v16 = l_Error_0.new(v14);
            v16.stack = v15;
            return v16, v13;
        else
            local v17 = l_Error_0.new(v11);
            v17.stack = nil;
            return v17, "";
        end;
    end, 
    __ERROR_DIVIDER = "\n------ Error caught by React ------\n"
};