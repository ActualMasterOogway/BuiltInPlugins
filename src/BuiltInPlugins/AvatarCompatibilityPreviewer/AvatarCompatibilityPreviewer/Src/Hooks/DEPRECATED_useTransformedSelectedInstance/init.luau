local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useIncrementedState);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useRememberLastValue);
local function v14(v7, v8, v9) --[[ Line: 15 ]] --[[ Name: watchForChanges ]]
    local v10 = {};
    local function v11() --[[ Line: 22 ]] --[[ Name: checkSelection ]]
        -- upvalues: v9 (copy), v8 (copy), v7 (copy)
        v9(v8(v7) and v7);
    end;
    table.insert(v10, v7.DescendantAdded:Connect(v11));
    table.insert(v10, v7.DescendantRemoving:Connect(function() --[[ Line: 29 ]]
        -- upvalues: v11 (copy)
        task.defer(v11);
    end));
    table.insert(v10, v7:GetPropertyChangedSignal("Name"):Connect(v11));
    if v7:IsA("Model") then
        table.insert(v10, v7:GetPropertyChangedSignal("PrimaryPart"):Connect(v11));
    end;
    table.insert(v10, v7.Destroying:Connect(v11));
    table.insert(v10, v7.AncestryChanged:Connect(function() --[[ Line: 44 ]]
        -- upvalues: v9 (copy), v8 (copy), v7 (copy)
        v9(v8(v7) and v7);
    end));
    v9(v8(v7) and v7);
    return function() --[[ Line: 51 ]]
        -- upvalues: v10 (copy)
        for _, v13 in v10 do
            v13:Disconnect();
        end;
    end;
end;
return function(v15) --[[ Line: 59 ]] --[[ Name: DEPRECATED_useTransformedSelectedInstance ]]
    -- upvalues: v2 (copy), v1 (copy), v5 (copy), v14 (copy), v4 (copy), v3 (copy), v6 (copy)
    local v16 = v2:use():get();
    local v17, v18 = v1.useState(nil);
    local v19 = v5();
    local v20, v21 = v1.useState(false);
    local v22 = v1.useRef(nil);
    local v24 = v1.useCallback(function(v23) --[[ Line: 70 ]]
        -- upvalues: v21 (copy), v18 (copy), v19 (copy)
        if v23 ~= nil then
            v21(true);
            v18(v23);
            return;
        else
            v21(false);
            v19.increment();
            return;
        end;
    end, {});
    local v26 = v1.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v22 (copy), v16 (copy), v14 (ref), v15 (copy), v24 (copy)
        if v22.current ~= nil then
            v22.current();
            v22.current = nil;
        end;
        local v25 = v16:Get()[1];
        if v25 == nil then
            return;
        else
            v22.current = v14(v25, v15, v24);
            return;
        end;
    end, {
        v24
    });
    v4(v16.SelectionChanged, v26, {
        v24
    });
    v1.useEffect(v26, {});
    v1.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v17 (copy), v3 (ref), v14 (ref), v15 (copy), v24 (copy)
        if v17 == nil then
            return nil;
        else
            assert(v17 ~= nil, v3.LUAU_ANALYZE_ERROR);
            return (v14(v17, v15, v24));
        end;
    end, {
        v17, 
        v24
    });
    local v27 = v6();
    return v1.useMemo(function() --[[ Line: 109 ]]
        -- upvalues: v17 (copy), v27 (copy), v15 (copy), v20 (copy)
        return v17 and v27(v15(v17)), v20;
    end, {
        v17, 
        v19.amount, 
        v20
    });
end;