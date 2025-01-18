local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.RobloxShared);
local l_equals_0 = v1.expect.equals;
local l_isA_0 = v1.expect.isA;
return {
    equals = l_equals_0, 
    isA = l_isA_0, 
    fnNameFor = function(_) --[[ Line: 64 ]] --[[ Name: fnNameFor ]]
        return "[Function]";
    end, 
    isUndefined = function(v5) --[[ Line: 77 ]] --[[ Name: isUndefined ]]
        return v5 == nil;
    end, 
    getPrototype = function(v6) --[[ Line: 81 ]] --[[ Name: getPrototype ]]
        if getmetatable(v6) ~= nil then
            return getmetatable(v6).__index;
        else
            return nil;
        end;
    end, 
    hasProperty = function(v7, v8) --[[ Line: 89 ]] --[[ Name: hasProperty ]]
        if not v7 then
            return false;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 94 ]]
                -- upvalues: v7 (copy), v8 (copy)
                return v7[v8];
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