local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local _ = require(l_script_FirstAncestor_0.Core.Requests.fetchCategoryAssets);
local _ = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local v7 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v8 = require(l_script_FirstAncestor_0.Core.Hooks.usePrevious);
local l_deepEqual_0 = v2.Util.deepEqual;
return function(v10) --[[ Line: 39 ]]
    -- upvalues: v4 (copy), v1 (copy), v8 (copy), l_deepEqual_0 (copy), v3 (copy), v7 (copy)
    return function(v11, v12) --[[ Line: 40 ]] --[[ Name: useCategorySectionAssets ]]
        -- upvalues: v4 (ref), v1 (ref), v8 (ref), l_deepEqual_0 (ref), v3 (ref), v10 (copy), v7 (ref)
        local l_networkInterface_0 = v4:use().networkInterface;
        local v14, v15 = v1.useState({});
        local v16 = v1.useRef({});
        local v17 = v1.useRef({});
        local v18 = v1.useRef(0);
        local v22 = v1.useMemo(function() --[[ Line: 50 ]]
            -- upvalues: v12 (copy)
            local v19 = {};
            for _, v21 in v12 do
                v19[v21.name] = v21;
            end;
            return v19;
        end, {
            v12
        });
        local v23 = v8(v22);
        local v32 = v1.useMemo(function() --[[ Line: 65 ]]
            -- upvalues: v23 (copy), v22 (copy), l_deepEqual_0 (ref), v12 (copy)
            local v24 = {};
            local v25 = {};
            if v23 then
                for _, v27 in v22 do
                    local v28 = v23[v27.name];
                    if not v28 or not l_deepEqual_0(v27, v28) then
                        table.insert(v24, v27);
                    end;
                end;
                for _, v30 in v23 do
                    local v31 = v22[v30.name];
                    if not v31 or not l_deepEqual_0(v30, v31) then
                        table.insert(v25, v30);
                    end;
                end;
                return {
                    added = v24, 
                    removed = v25
                };
            else
                return {
                    added = v12, 
                    removed = {}
                };
            end;
        end, {
            v22, 
            v23, 
            v12
        });
        local v33 = nil;
        v33 = v1.useCallback(function(v34, v35) --[[ Line: 102 ]]
            -- upvalues: v17 (copy), v15 (copy), v3 (ref), v10 (ref), l_networkInterface_0 (copy), v11 (copy), v18 (copy), v16 (copy), v7 (ref), v33 (ref)
            if v17.current[v34] then
                return;
            else
                v17.current[v34] = true;
                v15(function(v36) --[[ Line: 109 ]]
                    -- upvalues: v34 (copy), v3 (ref)
                    if v36[v34] then
                        return v3.Dictionary.join(v36, {
                            [v34] = v3.Dictionary.join(v36[v34], {
                                loading = true
                            })
                        });
                    else
                        return v3.Dictionary.join(v36, {
                            [v34] = {
                                loading = true, 
                                assets = {}, 
                                assetMap = {}, 
                                assetIds = {}
                            }
                        });
                    end;
                end);
                v10.fetchCategoryAssets(l_networkInterface_0, v11, v34, v35):andThen(function(v37) --[[ Line: 129 ]]
                    -- upvalues: v17 (ref), v34 (copy), v18 (ref), v16 (ref), v15 (ref), v7 (ref), v3 (ref), v35 (copy), v33 (ref)
                    if not v17.current[v34] then
                        return;
                    else
                        local l_v18_0 = v18;
                        l_v18_0.current = l_v18_0.current + 1;
                        v17.current[v34] = nil;
                        v16.current[v34] = true;
                        v15(function(v39) --[[ Line: 140 ]]
                            -- upvalues: v34 (ref), v37 (copy), v18 (ref), v7 (ref), v3 (ref), v35 (ref), v33 (ref)
                            local v40 = v39[v34];
                            local v41 = if v40 and v40.assets then #v40.assets else 0;
                            local v42 = {};
                            for v43, v44 in v37.assetIds do
                                local v45 = v37.assetMap[v44];
                                if v45 then
                                    local v46 = v41 + v43;
                                    v45.Context = {
                                        page = math.round(v41 / v18.current) + 1, 
                                        pagePosition = v43, 
                                        position = v46
                                    };
                                    table.insert(v42, v45);
                                elseif v7.shouldDebugWarnings() then
                                    warn((("asset with ID %* not found in asset map"):format(v44)));
                                end;
                            end;
                            return v3.Dictionary.join(v39, {
                                [v34] = v3.Dictionary.join(v40, {
                                    loading = false, 
                                    assets = v3.List.join(v40.assets, v42), 
                                    assetMap = {}, 
                                    assetIds = {}, 
                                    fetchNextPage = function() --[[ Line: 172 ]] --[[ Name: fetchNextPage ]]
                                        -- upvalues: v3 (ref), v35 (ref), v37 (ref), v33 (ref), v34 (ref)
                                        local v47 = v3.Dictionary.join(v35 or {}, {
                                            nextPageCursor = v37.nextPageCursor
                                        });
                                        v33(v34, v47);
                                    end
                                })
                            });
                        end);
                        return;
                    end;
                end):catch(function(v48) --[[ Line: 183 ]]
                    -- upvalues: v7 (ref), v11 (ref), v34 (copy), v17 (ref), v15 (ref), v3 (ref)
                    if v7.shouldDebugWarnings() then
                        warn(("failed to fetch assets for category \"%*\" and section \"%*\":"):format(v11, v34), v48);
                    end;
                    v17.current[v34] = nil;
                    v15(function(v49) --[[ Line: 190 ]]
                        -- upvalues: v3 (ref), v34 (ref)
                        return v3.Dictionary.join(v49, {
                            [v34] = v3.Dictionary.join(v49[v34], {
                                loading = false
                            })
                        });
                    end);
                end);
                return;
            end;
        end, {
            v11, 
            l_networkInterface_0
        });
        local v52 = v1.useCallback(function(v50) --[[ Line: 200 ]]
            -- upvalues: v17 (copy), v16 (copy), v15 (copy), v3 (ref)
            v17.current[v50] = nil;
            v16.current[v50] = nil;
            v15(function(v51) --[[ Line: 204 ]]
                -- upvalues: v3 (ref), v50 (copy)
                return v3.Dictionary.join(v51, {
                    [v50] = v3.None
                });
            end);
        end, {});
        v1.useEffect(function() --[[ Line: 211 ]]
            -- upvalues: v32 (copy), v52 (copy), v33 (ref)
            for _, v54 in v32.removed do
                v52(v54.name);
            end;
            for _, v56 in v32.added do
                v33(v56.name, v56.fetchArgs);
            end;
        end, {
            v32, 
            v33, 
            v52
        });
        return v14;
    end;
end;