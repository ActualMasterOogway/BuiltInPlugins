local l_Parent_0 = script.Parent.Parent;
local l_find_0 = require(l_Parent_0.Parent.Dash).find;
local l_StyleRulePriorityOrderRefactor_0 = game:GetFastFlag("StyleRulePriorityOrderRefactor");
return function(v3) --[[ Line: 7 ]] --[[ Name: shouldOrderStyleRulesByInsertion ]]
    -- upvalues: l_StyleRulePriorityOrderRefactor_0 (copy), l_find_0 (copy)
    local v4 = true;
    if l_StyleRulePriorityOrderRefactor_0 then
        local v7 = l_find_0(v3, function(v5) --[[ Line: 10 ]]
            local v6 = false;
            if v5 ~= nil then
                v6 = v5 ~= false;
            end;
            return v6;
        end);
        if not v7 then
            return true;
        else
            v4 = v7.Priority == 0;
            for _, v9 in v3 do
                if v9 then
                    local v10 = false;
                    if v9.Priority == 0 then
                        v10 = not v4;
                    end;
                    local v11 = false;
                    if v9.Priority ~= 0 then
                        v11 = v4;
                    end;
                    if v10 or v11 then
                        error("Zero priorities mixed with non-zero priorities in StyleRule children");
                    end;
                end;
            end;
        end;
    end;
    return v4;
end;