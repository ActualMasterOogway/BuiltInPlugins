local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local l_LUAU_ANALYZE_ERROR_0 = v3.LUAU_ANALYZE_ERROR;
local l_useHistory_0 = v3.useHistory;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v7 = require(l_Util_0.GeneratedMaterialsContext);
local v8 = require(l_Util_0.addMaterials);
local v9 = require(l_Util_0.getAllMaterialVariants);
local v10 = require(l_Util_0.removeMaterial);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v12) --[[ Line: 23 ]] --[[ Name: GeneratedMaterialsProvider ]]
    -- upvalues: v2 (copy), l_LUAU_ANALYZE_ERROR_0 (copy), l_useHistory_0 (copy), v9 (copy), v10 (copy), v8 (copy), v1 (copy), v7 (copy)
    local v13, v14 = v2.useState({});
    local v15, v16 = v2.useState({});
    local v17 = v2.useRef({});
    assert(v17.current ~= nil, l_LUAU_ANALYZE_ERROR_0);
    local function v22(v18) --[[ Line: 31 ]] --[[ Name: initialize ]]
        -- upvalues: v17 (copy)
        local l_current_0 = v17.current;
        for _, v21 in v18 do
            assert(l_current_0[v21] == nil);
            l_current_0[v21] = v21.Destroying:Connect(function() --[[ Line: 35 ]]

            end);
        end;
    end;
    local _ = function() --[[ Line: 41 ]] --[[ Name: cleanup ]]
        -- upvalues: v17 (copy)
        for _, v24 in v17.current do
            v24:Disconnect();
        end;
        v17.current = {};
    end;
    v2.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: v17 (copy)
        return function() --[[ Line: 50 ]]
            -- upvalues: v17 (ref)
            for _, v27 in v17.current do
                v27:Disconnect();
            end;
            v17.current = {};
        end;
    end, {});
    local v31 = l_useHistory_0(v13, function(v28) --[[ Line: 55 ]]
        -- upvalues: v17 (copy), v14 (copy), v22 (copy), v9 (ref)
        for _, v30 in v17.current do
            v30:Disconnect();
        end;
        v17.current = {};
        v14(v28);
        v22(v9(v28));
    end, {});
    local v35 = v2.useCallback(function(v32) --[[ Line: 61 ]]
        -- upvalues: v10 (ref), v13 (copy), v17 (copy), v14 (copy), v31 (copy)
        local v33 = v10(v32, v13);
        local l_current_1 = v17.current;
        if l_current_1[v32] then
            l_current_1[v32]:Disconnect();
            l_current_1[v32] = nil;
        end;
        v14(v33);
        v31("Update Materials", v33);
    end, {
        v13, 
        v31
    });
    local v44 = v2.useCallback(function(v36, v37, v38, v39) --[[ Line: 75 ]]
        -- upvalues: v22 (copy), v15 (copy), v8 (ref), v13 (copy), v14 (copy), v16 (copy), v31 (copy)
        if #v36 == 0 then
            return;
        else
            v22(v36);
            local v40 = table.clone(v15);
            for v41, v42 in v36 do
                v40[v42] = {
                    generationId = v39, 
                    sampleId = v41 - 1, 
                    hasBaseMaterial = false, 
                    status = "None"
                };
            end;
            local v43 = v8(v36, v37, v38, v13);
            v14(v43);
            v16(v40);
            v31("Update Materials", v43);
            return;
        end;
    end, {
        v13, 
        v15, 
        v31
    });
    local v47 = v2.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v17 (copy), v14 (copy), v31 (copy)
        for _, v46 in v17.current do
            v46:Disconnect();
        end;
        v17.current = {};
        v14({});
        v31("Update Materials", {});
    end, {
        v13, 
        v31
    });
    local v50 = v2.useCallback(function(v48) --[[ Line: 106 ]]
        -- upvalues: v15 (copy)
        local v49 = v15[v48];
        assert(v49);
        return v49.hasBaseMaterial;
    end, {
        v15
    });
    local v54 = v2.useCallback(function(v51) --[[ Line: 113 ]]
        -- upvalues: v15 (copy), v1 (ref), v16 (copy)
        local v52 = v15[v51];
        assert(v52);
        if not v52.hasBaseMaterial then
            local v53 = table.clone(v15);
            v53[v51] = v1.join(v53[v51], {
                hasBaseMaterial = true
            });
            v16(v53);
        end;
    end, {
        v15
    });
    local v57 = v2.useCallback(function(v55) --[[ Line: 126 ]]
        -- upvalues: v15 (copy)
        local v56 = v15[v55];
        assert(v56);
        return v56.status;
    end, {
        v15
    });
    local v62 = v2.useCallback(function(v58, v59) --[[ Line: 132 ]]
        -- upvalues: v15 (copy), v1 (ref), v16 (copy)
        local v60 = v15[v58];
        assert(v60);
        if v60.status ~= v59 then
            local v61 = table.clone(v15);
            v61[v58] = v1.join(v60, {
                status = v59
            });
            v16(v61);
        end;
    end, {
        v15
    });
    local v65 = v2.useCallback(function(v63) --[[ Line: 145 ]]
        -- upvalues: v15 (copy)
        local v64 = v15[v63];
        assert(v64, "Missing state for MaterialVariant");
        return v64.generationId, v64.sampleId;
    end, {
        v15
    });
    local v66 = {
        promptGroups = v13, 
        materialStates = v15, 
        addMaterials = v44, 
        removeMaterial = v35, 
        removeAllMaterials = v47, 
        hasBaseMaterial = v50, 
        markHasBaseMaterial = v54, 
        getMaterialStatus = v57, 
        setMaterialStatus = v62, 
        getMaterialIdentifiers = v65
    };
    return v2.createElement(v7.Provider, {
        value = v66
    }, v12.children);
end;