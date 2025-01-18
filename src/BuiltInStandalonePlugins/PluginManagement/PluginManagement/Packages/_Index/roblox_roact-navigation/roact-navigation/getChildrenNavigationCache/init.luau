return function(v0) --[[ Line: 1 ]]
    if not v0 then
        return {};
    else
        if not v0._childrenNavigation then
            v0._childrenNavigation = {};
        end;
        local l__childrenNavigation_0 = v0._childrenNavigation;
        local v2 = {};
        local l_ipairs_0 = ipairs;
        local v4 = v0.state.routes or {};
        for _, v6 in l_ipairs_0(v4) do
            v2[v6.key] = true;
        end;
        if not v0.state.isTransitioning then
            for v7, _ in pairs(l__childrenNavigation_0) do
                if not v2[v7] then
                    l__childrenNavigation_0[v7] = nil;
                end;
            end;
        end;
        return v0._childrenNavigation;
    end;
end;