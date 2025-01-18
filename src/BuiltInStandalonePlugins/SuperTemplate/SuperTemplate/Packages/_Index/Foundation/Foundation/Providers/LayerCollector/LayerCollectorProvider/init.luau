local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.LayerCollectorContext);
local l_GuiService_0 = game:GetService("GuiService");
return function(v4) --[[ Line: 13 ]] --[[ Name: LayerCollectorProvider ]]
    -- upvalues: v1 (copy), l_GuiService_0 (copy), v2 (copy)
    local v5 = v1.useRef(nil);
    local v6, v7 = v1.useState(nil);
    local v8, v9 = v1.useState(nil);
    local v10, v11 = v1.useState(Vector2.new(0, 0));
    local v22 = v1.useCallback(function(v12) --[[ Line: 19 ]]
        -- upvalues: l_GuiService_0 (ref), v11 (copy), v7 (copy)
        local l_AbsoluteSize_0 = v12.AbsoluteSize;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
            -- upvalues: v12 (copy)
            return v12:IsA("ScreenGui") and v12.IgnoreGuiInset;
        end);
        if l_status_0 and l_result_0 then
            local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
            l_AbsoluteSize_0 = l_AbsoluteSize_0 + l_l_GuiService_0_GuiInset_0;
        end;
        v11(l_AbsoluteSize_0);
        v7(v12:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 31 ]]
            -- upvalues: l_AbsoluteSize_0 (ref), v12 (copy), l_GuiService_0 (ref), v11 (ref)
            l_AbsoluteSize_0 = v12.AbsoluteSize;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 33 ]]
                -- upvalues: v12 (ref)
                return v12:IsA("ScreenGui") and v12.IgnoreGuiInset;
            end);
            if l_status_1 and l_result_1 then
                local l_l_GuiService_0_GuiInset_1, _ = l_GuiService_0:GetGuiInset();
                l_AbsoluteSize_0 = l_AbsoluteSize_0 + l_l_GuiService_0_GuiInset_1;
            end;
            v11(l_AbsoluteSize_0);
        end));
    end, {});
    v1.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: v5 (copy), v6 (ref), v7 (copy), v22 (copy), v8 (copy), v9 (copy)
        local l_current_0 = v5.current;
        if l_current_0 == nil then
            return;
        else
            assert(l_current_0 ~= nil, "LayerCollectorProvider must have a child Frame");
            local l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
            if l_l_current_0_FirstAncestorWhichIsA_0 == nil then
                v6 = l_current_0.AncestryChanged:Connect(function() --[[ Line: 55 ]]
                    -- upvalues: l_l_current_0_FirstAncestorWhichIsA_0 (ref), l_current_0 (copy), v6 (ref), v7 (ref), v22 (ref)
                    l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
                    if l_l_current_0_FirstAncestorWhichIsA_0 ~= nil then
                        v6:Disconnect();
                        v7(nil);
                        v22(l_l_current_0_FirstAncestorWhichIsA_0);
                    end;
                end);
            else
                v22(l_l_current_0_FirstAncestorWhichIsA_0);
            end;
            return function() --[[ Line: 67 ]]
                -- upvalues: v6 (ref), v7 (ref), v8 (ref), v9 (ref)
                if v6 then
                    v6:Disconnect();
                    v7(nil);
                end;
                if v8 then
                    v8:Disconnect();
                    v9(nil);
                end;
            end;
        end;
    end, {
        v5
    });
    return v1.createElement(v2.Provider, {
        value = {
            absoluteSize = v10
        }
    }, {
        LayerCollectorChildRef = v1.createElement("Frame", {
            Visible = false, 
            ref = v5
        }), 
        Children = v1.createElement(v1.Fragment, nil, v4.children)
    });
end;