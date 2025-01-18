local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.Parent.utils.TableUtilities);
local v2 = require(script.Parent.Parent.utils.validate);
local function v6(v3, v4) --[[ Line: 8 ]] --[[ Name: compareScenes ]]
    if v3.index == v4.index then
        local v5 = #v3.key - #v4.key;
        if v5 == 0 then
            return v3.key < v4.key;
        else
            return v5 < 0;
        end;
    else
        return v3.index < v4.index;
    end;
end;
local function _(v7, v8) --[[ Line: 23 ]] --[[ Name: routesAreShallowEqual ]]
    -- upvalues: v1 (copy)
    if not v7 or not v8 then
        return v7 == v8;
    elseif v7.key ~= v8.key then
        return false;
    else
        return v1.ShallowEqual(v7, v8);
    end;
end;
local function _(v10, v11) --[[ Line: 35 ]] --[[ Name: scenesAreShallowEqual ]]
    -- upvalues: v1 (copy)
    local v12 = false;
    if v10.key == v11.key then
        v12 = false;
        if v10.index == v11.index then
            v12 = false;
            if v10.isStale == v11.isStale then
                v12 = false;
                if v10.isActive == v11.isActive then
                    if not v10 or not v11 then
                        return v10 == v11;
                    elseif v10.key ~= v11.key then
                        return false;
                    else
                        v12 = v1.ShallowEqual(v10, v11);
                    end;
                end;
            end;
        end;
    end;
    return v12;
end;
return function(v14, v15, v16, v17) --[[ Line: 44 ]]
    -- upvalues: v0 (copy), v2 (copy), v1 (copy), v6 (copy)
    for _, v19 in ipairs(v14) do
        local l_route_0 = v19.route;
        if v17 and v17[l_route_0.key] then
            v19.descriptor = v17[l_route_0.key];
        end;
    end;
    if v16 == v15 then
        return v14;
    else
        local v21 = {};
        local v22 = {};
        local v23 = {};
        for _, v25 in ipairs(v14) do
            local l_key_0 = v25.key;
            if v25.isStale then
                v23[l_key_0] = v25;
            end;
            v21[l_key_0] = v25;
        end;
        local v27 = {};
        local l_routes_0 = v15.routes;
        local v29 = #l_routes_0;
        if v15.index < v29 then
            print("Warning: StackRouter provided invalid state. Index should always be the top route");
            l_routes_0 = v0.List.removeRange(l_routes_0, v15.index, v29);
        end;
        for v30, v31 in ipairs(l_routes_0) do
            local v32 = "scene_" .. v31.key;
            local v33 = v17 and v17[v31.key] or nil;
            local v34 = {
                index = v30, 
                isActive = false, 
                isStale = false, 
                key = v32, 
                route = v31, 
                descriptor = v33
            };
            v2(not v27[v32], "navigation.state.routes[%d].key '%s' conflicts with another route!", v30, v32);
            v27[v32] = true;
            if v23[v32] then
                v23[v32] = nil;
            end;
            v22[v32] = v34;
        end;
        if v16 then
            local l_routes_1 = v16.routes;
            local v36 = #l_routes_1;
            if v16.index < v36 then
                print("StackRouter provided invalid state. Index should always be the top route.");
                l_routes_1 = v0.List.removeRange(l_routes_1, v16.index, v36);
            end;
            for v37, v38 in ipairs(l_routes_1) do
                local v39 = "scene_" .. v38.key;
                if not v22[v39] then
                    local v40 = nil;
                    for _, v42 in ipairs(v14) do
                        if v42.route.key == v38.key then
                            v40 = v42;
                            break;
                        end;
                    end;
                    local v43 = v17[v38.key];
                    if v40 then
                        v43 = v40.descriptor;
                    end;
                    if v43 then
                        v23[v39] = {
                            index = v37, 
                            isActive = false, 
                            isStale = true, 
                            key = v39, 
                            route = v38, 
                            descriptor = v43
                        };
                    end;
                end;
            end;
        end;
        local v44 = {};
        local function _(v45) --[[ Line: 151 ]] --[[ Name: mergeScene ]]
            -- upvalues: v21 (copy), v1 (ref), v44 (copy)
            local v46 = v21[v45.key] or nil;
            if v46 then
                local v47 = false;
                if v46.key == v45.key then
                    v47 = false;
                    if v46.index == v45.index then
                        v47 = false;
                        if v46.isStale == v45.isStale then
                            v47 = false;
                            if v46.isActive == v45.isActive then
                                v47 = if v46 and v45 then not (v46.key ~= v45.key) and v1.ShallowEqual(v46, v45) else v46 == v45;
                            end;
                        end;
                    end;
                end;
                if v47 then
                    table.insert(v44, v46);
                    return;
                end;
            end;
            table.insert(v44, v45);
        end;
        for _, v50 in pairs(v23) do
            local v51 = v21[v50.key] or nil;
            if v51 then
                local v52 = false;
                if v51.key == v50.key then
                    v52 = false;
                    if v51.index == v50.index then
                        v52 = false;
                        if v51.isStale == v50.isStale then
                            v52 = false;
                            if v51.isActive == v50.isActive then
                                v52 = if v51 and v50 then not (v51.key ~= v50.key) and v1.ShallowEqual(v51, v50) else v51 == v50;
                            end;
                        end;
                    end;
                end;
                if v52 then
                    table.insert(v44, v51);
                    continue;
                end;
            end;
            table.insert(v44, v50);
        end;
        for _, v54 in pairs(v22) do
            local v55 = v21[v54.key] or nil;
            if v55 then
                local v56 = false;
                if v55.key == v54.key then
                    v56 = false;
                    if v55.index == v54.index then
                        v56 = false;
                        if v55.isStale == v54.isStale then
                            v56 = false;
                            if v55.isActive == v54.isActive then
                                v56 = if v55 and v54 then not (v55.key ~= v54.key) and v1.ShallowEqual(v55, v54) else v55 == v54;
                            end;
                        end;
                    end;
                end;
                if v56 then
                    table.insert(v44, v55);
                    continue;
                end;
            end;
            table.insert(v44, v54);
        end;
        table.sort(v44, v6);
        local v57 = 0;
        for v58, v59 in ipairs(v44) do
            local v60 = not v59.isStale and v59.index == v15.index;
            if v60 ~= v59.isActive then
                v44[v58] = v0.Dictionary.join(v59, {
                    isActive = v60
                });
            end;
            if v60 then
                v57 = v57 + 1;
            end;
        end;
        v2(v57 == 1, "There should only be one active scene, not %d", v57);
        if #v44 ~= #v14 then
            return v44;
        else
            for v61, v62 in ipairs(v44) do
                local v63 = v14[v61];
                local v64 = false;
                if v63.key == v62.key then
                    v64 = false;
                    if v63.index == v62.index then
                        v64 = false;
                        if v63.isStale == v62.isStale then
                            v64 = false;
                            if v63.isActive == v62.isActive then
                                v64 = if v63 and v62 then not (v63.key ~= v62.key) and v1.ShallowEqual(v63, v62) else v63 == v62;
                            end;
                        end;
                    end;
                end;
                if not v64 then
                    return v44;
                end;
            end;
            return v14;
        end;
    end;
end;