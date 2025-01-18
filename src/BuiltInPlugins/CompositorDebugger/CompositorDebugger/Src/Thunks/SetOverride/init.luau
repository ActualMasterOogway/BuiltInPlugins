local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_join_0 = v1.join;
local l_joinDeep_0 = v1.joinDeep;
local l_None_0 = v1.None;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v6 = require(l_Actions_0.SetOverrides);
return function(v7, v8, v9) --[[ Line: 19 ]]
    -- upvalues: l_join_0 (copy), l_None_0 (copy), l_joinDeep_0 (copy), v6 (copy)
    return function(v10) --[[ Line: 20 ]]
        -- upvalues: v7 (copy), v8 (copy), v9 (copy), l_join_0 (ref), l_None_0 (ref), l_joinDeep_0 (ref), v6 (ref)
        local l_DebugData_0 = v10:getState().DebugData;
        local v12 = l_DebugData_0.FrameBuffer and l_DebugData_0.FrameBuffer[1];
        local v13 = v12 and v12.layerMap[v7];
        local l_Overrides_0 = l_DebugData_0.Overrides;
        local v15 = v8[1];
        if v9 == nil then
            l_Overrides_0 = l_join_0(l_Overrides_0, {
                [v7] = l_join_0(l_Overrides_0[v7], {
                    [v15] = l_None_0
                })
            });
            if not next(l_Overrides_0[v7]) then
                l_Overrides_0[v7] = nil;
            end;
        else
            l_Overrides_0 = l_join_0(l_Overrides_0, {});
            l_Overrides_0[v7] = l_Overrides_0[v7] or {};
            if not l_Overrides_0[v7][v15] and v13 and type(v13.props[v15]) == "table" then
                l_Overrides_0[v7][v15] = l_joinDeep_0({}, v13.props[v15]);
            end;
            local v16 = l_Overrides_0[v7];
            for v17, v18 in v8 do
                if v17 < #v8 then
                    if not v16[v18] then
                        v16[v18] = {};
                    end;
                    v16 = v16[v18];
                end;
            end;
            v16[v8[#v8]] = v9;
        end;
        v10:dispatch(v6(l_Overrides_0));
        local l_PropertyOverridesEvent_0 = v10:getState().Status.PropertyOverridesEvent;
        if l_PropertyOverridesEvent_0 then
            l_PropertyOverridesEvent_0:Fire(l_Overrides_0);
        end;
    end;
end;