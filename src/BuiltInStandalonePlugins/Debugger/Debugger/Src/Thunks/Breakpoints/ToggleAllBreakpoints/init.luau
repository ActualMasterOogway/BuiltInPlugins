return function(v0, v1) --[[ Line: 1 ]]
    return function(v2, _) --[[ Line: 2 ]]
        -- upvalues: v0 (copy), v1 (copy)
        if v0 == nil then
            assert(false);
            return;
        else
            local v4 = v2:getState();
            for v5, _ in pairs(v4.Breakpoint.MetaBreakpoints) do
                v0:GetBreakpointById(v5):SetEnabled(v1);
            end;
            return;
        end;
    end;
end;