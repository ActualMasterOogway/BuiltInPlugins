local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_String_0 = v1.String;
return {
    default = function(v4) --[[ Line: 27 ]] --[[ Name: convertDescriptorToString ]]
        -- upvalues: l_Error_0 (copy), l_String_0 (copy)
        if typeof(v4) == "string" or typeof(v4) == "number" or v4 == nil then
            return v4;
        else
            if typeof(v4) ~= "function" then
                error(l_Error_0.new("describe expects a function, number, or string."));
            end;
            local v5 = l_String_0.trim(debug.info(v4, "n"));
            if v5 ~= nil and v5 ~= "" then
                return v5;
            else
                return "[Function anonymous]";
            end;
        end;
    end
};