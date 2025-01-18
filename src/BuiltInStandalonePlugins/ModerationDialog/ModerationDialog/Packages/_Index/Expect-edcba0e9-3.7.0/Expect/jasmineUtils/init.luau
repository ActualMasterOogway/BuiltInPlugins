local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.RobloxShared);
local _ = require(l_Parent_0.LuauPolyfill);
local l_equals_0 = v1.expect.equals;
local l_isA_0 = v1.expect.isA;
return {
    equals = l_equals_0, 
    isA = l_isA_0, 
    fnNameFor = function(_) --[[ Line: 64 ]] --[[ Name: fnNameFor ]]
        return "[Function]";
    end, 
    isUndefined = function(v6) --[[ Line: 77 ]] --[[ Name: isUndefined ]]
        return v6 == nil;
    end, 
    getPrototype = function(v7) --[[ Line: 81 ]] --[[ Name: getPrototype ]]
        if getmetatable(v7) ~= nil then
            return getmetatable(v7).__index;
        else
            return nil;
        end;
    end, 
    hasProperty = function(v8, v9) --[[ Line: 89 ]] --[[ Name: hasProperty ]]
        if not v8 then
            return false;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 94 ]]
                -- upvalues: v8 (copy), v9 (copy)
                return v8[v9];
            end);
            if l_status_0 then
                return l_result_0 ~= nil;
            else
                error(l_result_0);
                return;
            end;
        end;
    end
};