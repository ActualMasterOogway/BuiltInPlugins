local v0 = require(script.Parent.shouldOrderStyleRulesByInsertion);
local l_StyleRulePriorityOrderRefactor_0 = game:GetFastFlag("StyleRulePriorityOrderRefactor");
return function(v2, v3, v4, v5) --[[ Line: 5 ]] --[[ Name: createStyleSheet ]]
    -- upvalues: v0 (copy), l_StyleRulePriorityOrderRefactor_0 (copy)
    local l_StyleSheet_0 = Instance.new("StyleSheet");
    l_StyleSheet_0.Name = v2;
    if v4 then
        for v7, v8 in v4 do
            l_StyleSheet_0:SetAttribute(v7, v8);
        end;
    end;
    if v3 then
        local v9 = nil;
        do
            local l_v9_0 = v9;
            if not pcall(function() --[[ Line: 20 ]]
                -- upvalues: l_v9_0 (ref), v0 (ref), v3 (copy)
                l_v9_0 = v0(v3);
            end) then
                error((("Zero priorities mixed with non-zero priorities in StyleRule children for StyleSheet: %*"):format(v2)));
            end;
            for v11, v12 in v3 do
                if l_StyleRulePriorityOrderRefactor_0 and l_v9_0 then
                    v12.Priority = v11 - 1;
                end;
                v12.Parent = l_StyleSheet_0;
            end;
        end;
    end;
    if v5 then
        l_StyleSheet_0:SetDerives(v5);
    end;
    return l_StyleSheet_0;
end;