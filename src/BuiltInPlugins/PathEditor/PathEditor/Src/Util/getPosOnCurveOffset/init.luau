local _ = function(v0, v1) --[[ Line: 1 ]] --[[ Name: hasProperty ]]
    local l_status_0, _ = pcall(function() --[[ Line: 2 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local _ = v0[v1];
    end);
    return l_status_0;
end;
return function(v6, v7) --[[ Line: 8 ]] --[[ Name: getPosOnCurveOffset ]]
    local l_v6_PositionOnCurve_0 = v6:GetPositionOnCurve(v7);
    if l_v6_PositionOnCurve_0.X.Scale == 0 and l_v6_PositionOnCurve_0.Y.Scale == 0 then
        return l_v6_PositionOnCurve_0;
    else
        if v6.Parent ~= nil then
            local l_Parent_0 = v6.Parent;
            local l_pcall_0 = pcall;
            local v11 = "AbsoluteSize";
            local v12;
            l_pcall_0, v12 = l_pcall_0(function() --[[ Line: 2 ]]
                -- upvalues: l_Parent_0 (copy), v11 (copy)
                local _ = l_Parent_0[v11];
            end);
            if l_pcall_0 then
                return UDim2.fromOffset(l_v6_PositionOnCurve_0.X.Scale * v6.Parent.AbsoluteSize.x, l_v6_PositionOnCurve_0.Y.Scale * v6.Parent.AbsoluteSize.y);
            end;
        end;
        return UDim2.new();
    end;
end;