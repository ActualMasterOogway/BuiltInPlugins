local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_String_0 = v1.String;
local l_getConfig_0 = require(script.Parent.config).getConfig;
return {
    getNodeTestId = function(v5) --[[ Line: 12 ]] --[[ Name: getNodeTestId ]]
        -- upvalues: l_Array_0 (copy), l_String_0 (copy), l_getConfig_0 (copy)
        local l_Tags_0 = game:GetService("CollectionService"):GetTags(v5);
        if #l_Tags_0 == 0 then
            return nil;
        else
            local v8 = l_Array_0.filter(l_Tags_0, function(v7) --[[ Line: 19 ]]
                -- upvalues: l_String_0 (ref), l_getConfig_0 (ref)
                return l_String_0.startsWith(v7, l_getConfig_0().testIdAttribute);
            end);
            if #v8 == 0 then
                return nil;
            else
                if #v8 > 1 then
                    error("Instance has multiple TestId tags set");
                end;
                return l_String_0.split(v8[1], l_getConfig_0().testIdAttribute .. "=")[2];
            end;
        end;
    end
};