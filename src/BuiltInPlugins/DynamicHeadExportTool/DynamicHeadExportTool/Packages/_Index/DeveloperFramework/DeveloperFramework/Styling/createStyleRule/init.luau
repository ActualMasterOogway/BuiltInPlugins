local _ = require(script.Parent.types);
local v1 = require(script.Parent.shouldOrderStyleRulesByInsertion);
local v2 = game:DefineFastFlag("DevFrameworkCreateStyleRuleAcceptNil", false);
local l_StyleRulePriorityOrderRefactor_0 = game:GetFastFlag("StyleRulePriorityOrderRefactor");
local function _(v4) --[[ Line: 9 ]] --[[ Name: splitInstancePropertiesFromStyleProperties ]]
    if v4 then
        local v5 = {
            Priority = v4.StyleRule_Priority
        };
        v4.StyleRule_Priority = nil;
        return {
            InstanceProperties = v5, 
            StyleProperties = v4
        };
    else
        return nil;
    end;
end;
return function(v7, v8, v9, v10) --[[ Line: 23 ]] --[[ Name: createStyleRule ]]
    -- upvalues: l_StyleRulePriorityOrderRefactor_0 (copy), v1 (copy), v2 (copy)
    local l_StyleRule_0 = Instance.new("StyleRule");
    l_StyleRule_0.Name = v7 == "" and "Default" or v7;
    l_StyleRule_0.Selector = v7;
    if l_StyleRulePriorityOrderRefactor_0 then
        local v12;
        if v8 then
            local v13 = {
                Priority = v8.StyleRule_Priority
            };
            v8.StyleRule_Priority = nil;
            v12 = {
                InstanceProperties = v13, 
                StyleProperties = v8
            };
        else
            v12 = nil;
        end;
        if v12 then
            local l_v12_0 = v12;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 36 ]]
                -- upvalues: l_StyleRule_0 (copy), l_v12_0 (copy)
                l_StyleRule_0:SetProperties(l_v12_0.StyleProperties);
            end);
            if not l_status_0 then
                warn((("Failed to load properties for StyleRule: %*"):format(v7)));
                warn(l_result_0);
            end;
            if v12.InstanceProperties.Priority then
                local l_v12_1 = v12;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 45 ]]
                    -- upvalues: l_StyleRule_0 (copy), l_v12_1 (copy)
                    l_StyleRule_0.Priority = l_v12_1.InstanceProperties.Priority;
                end);
                l_status_0 = l_status_1;
                l_result_0 = l_result_1;
                if not l_status_0 then
                    warn((("Failed to set priority for StyleRule: %*"):format(v7)));
                    warn(l_result_0);
                end;
            end;
        end;
    elseif v8 then
        if v8.StyleRule_Priority ~= nil then
            warn((("StyleRule_Priority property used without FFlagStyleRulePriorityOrderRefactor enabled for StyleRule: %*"):format(v7)));
            v8.StyleRule_Priority = nil;
        end;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 62 ]]
            -- upvalues: l_StyleRule_0 (copy), v8 (copy)
            l_StyleRule_0:SetProperties(v8);
        end);
        if not l_status_2 then
            warn((("Failed to load properties for StyleRule: %*"):format(v7)));
            warn(l_result_2);
        end;
    end;
    if v9 then
        local v22 = nil;
        do
            local l_v22_0 = v22;
            if not pcall(function() --[[ Line: 73 ]]
                -- upvalues: l_v22_0 (ref), v1 (ref), v9 (copy)
                l_v22_0 = v1(v9);
            end) then
                error((("Zero priorities mixed with non-zero priorities in StyleRule children for StyleRule: %*"):format(v7)));
            end;
            for v24, v25 in v9 do
                if not v2 or v25 then
                    if l_StyleRulePriorityOrderRefactor_0 and l_v22_0 then
                        v25.Priority = v24 - 1;
                    end;
                    v25.Parent = l_StyleRule_0;
                end;
            end;
        end;
    end;
    if v10 then
        for v26, v27 in v10 do
            l_StyleRule_0:SetAttribute(v26, v27);
        end;
    end;
    return l_StyleRule_0;
end;