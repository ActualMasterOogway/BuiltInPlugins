local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
return function(v5) --[[ Line: 11 ]] --[[ Name: useClothingFromInstances ]]
    -- upvalues: v1 (copy), v4 (copy), v3 (copy)
    local v6 = v1.useContext(v4);
    local v7 = v1.useRef({});
    local v8 = v1.useRef({});
    assert(v7.current ~= nil, v3.LUAU_ANALYZE_ERROR);
    assert(v8.current ~= nil, v3.LUAU_ANALYZE_ERROR);
    v1.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: v5 (copy), v3 (ref), v7 (copy), v6 (copy), v8 (copy)
        if v5 == nil then
            return;
        else
            assert(v5 ~= nil, v3.LUAU_ANALYZE_ERROR);
            local l_current_0 = v7.current;
            local v10 = {};
            for v11, v12 in v6.equippedItems do
                if v12.item.source == v3.SOURCE_INSTANCE then
                    assert(v12.item.source == v3.SOURCE_INSTANCE, v3.LUAU_ANALYZE_ERROR);
                    if v7.current[v12] ~= nil then
                        if not v12.isHidden then
                            v10[v12] = l_current_0[v12];
                            if v12.palette.UpdateInstances ~= nil then
                                v12.palette.UpdateInstances(l_current_0[v12], v11);
                            end;
                        end;
                    elseif not v12.isHidden then
                        v10[v12] = v12.palette.WearInstance(v12.item.instance, v5, v11);
                    end;
                end;
            end;
            for _, v14 in v8.current do
                if v10[v14] == nil and v7.current[v14] ~= nil then
                    for _, v16 in v7.current[v14] do
                        if v16 ~= nil then
                            v16:Destroy();
                        end;
                    end;
                end;
            end;
            v8.current = v6.equippedItems;
            v7.current = v10;
            return;
        end;
    end, {
        v5, 
        v6.equippedItems
    });
    v1.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v7 (copy)
        return function() --[[ Line: 78 ]]
            -- upvalues: v7 (ref)
            for _, v18 in v7.current do
                for _, v20 in v18 do
                    v20:Destroy();
                end;
            end;
            table.clear(v7.current);
        end;
    end, {
        v5
    });
end;