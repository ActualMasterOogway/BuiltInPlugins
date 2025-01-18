local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_String_0 = v1.String;
return {
    default = function(v4) --[[ Line: 28 ]] --[[ Name: convertDescriptorToString ]]
        -- upvalues: l_String_0 (copy), l_Error_0 (copy)
        local v5 = typeof(v4);
        if v5 == "function" then
            local v6 = l_String_0.trim(debug.info(v4, "n"));
            if v6 ~= nil and v6 ~= "" then
                return v6;
            end;
        elseif v5 == "number" or v4 == nil then
            return ("%s"):format((tostring(v4)));
        elseif v5 == "string" then
            return v4;
        end;
        local v7 = nil;
        v7 = typeof(v4) == "function" and "[Function anonymous]" or tostring(v4);
        error(l_Error_0.new(("Invalid first argument, %s. It must be a named function, number, or string."):format(v7)));
    end
};