local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.Parent.NavigationActions);
local v2 = require(script.Parent.Parent.StackActions);
local v3 = require(script.Parent.Parent.utils.KeyGenerator);
local v4 = require(script.Parent.Parent.StateUtils);
local v5 = require(script.Parent.getScreenForRouteName);
local v6 = require(script.Parent.createConfigGetter);
local v7 = require(script.Parent.validateRouteConfigMap);
local v8 = require(script.Parent.Parent.utils.validate);
local v9 = require(script.Parent.Parent.NavigationSymbol);
local v10 = require(script.Parent.Parent.NoneSymbol);
local v11 = v9("CHILD_IS_SCREEN");
local function v12() --[[ Line: 16 ]]
    return {};
end;
local function _(v13) --[[ Line: 18 ]] --[[ Name: behavesLikePushAction ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v14 = true;
    if v13.type ~= v1.Navigate then
        v14 = v13.type == v2.Push;
    end;
    return v14;
end;
local function _(v16) --[[ Line: 23 ]] --[[ Name: isResetToRootStack ]]
    -- upvalues: v2 (copy), v10 (copy)
    local v17 = false;
    if v16.type == v2.Reset then
        v17 = v16.key == v10;
    end;
    return v17;
end;
return function(v19) --[[ Line: 27 ]]
    -- upvalues: v8 (copy), v7 (copy), v0 (copy), v5 (copy), v11 (copy), v12 (copy), v1 (copy), v3 (copy), v6 (copy), v2 (copy), v10 (copy), v4 (copy)
    v8(type(v19) == "table", "config must be a table");
    local v20 = v7(v19.routes);
    local v21 = v0.Dictionary.keys(v20);
    local v22 = {};
    for _, v24 in ipairs(v21) do
        local v25 = v5(v20, v24);
        if type(v25) == "table" and v25.router then
            v22[v24] = v25.router;
        else
            v22[v24] = v11;
        end;
    end;
    local v26 = v19.getCustomActionCreators or v12;
    local v27 = v19.initialRouteParams or {};
    local v28 = v8(v19.initialRouteName, "initialRouteName must be provided");
    if v0.List.find(v21, v28) == nil then
        local v29 = "";
        for _, v31 in ipairs(v21) do
            v29 = v29 .. v31 .. ",";
        end;
        error(string.format("Invalid initialRouteName '%s'. Must be one of [%s]", v28, v29), 2);
    end;
    local v32 = v22[v28];
    local function v38() --[[ Line: 66 ]] --[[ Name: getInitialState ]]
        -- upvalues: v32 (copy), v11 (ref), v1 (ref), v27 (copy), v20 (copy), v28 (copy), v0 (ref), v19 (copy), v3 (ref)
        local v33 = {};
        if v32 ~= nil and v32 ~= v11 then
            v33 = v32.getStateForAction(v1.init({
                params = v27
            }));
        end;
        local v34 = v20[v28];
        local v35 = type(v34) == "table" and v34.params or {};
        local v36 = v0.Dictionary.join(v35, v33.params or {}, v27 or {});
        local l_initialRouteKey_0 = v19.initialRouteKey;
        v33 = v0.Dictionary.join(v33, v36, {
            routeName = v28, 
            key = l_initialRouteKey_0 or v3.generateKey()
        });
        return {
            key = "StackRouterRoot", 
            isTransitioning = false, 
            index = 1, 
            routes = {
                v33
            }
        };
    end;
    local function _(v39, v40) --[[ Line: 98 ]] --[[ Name: getParamsForRouteAndAction ]]
        -- upvalues: v20 (copy), v0 (ref)
        local v41 = v20[v39];
        if type(v41) == "table" and v41.params then
            return v0.Dictionary.join(v41.params, v40.params);
        else
            return v40.params;
        end;
    end;
    local v43 = {};
    for v44, v45 in pairs(v22) do
        if v45 ~= v11 then
            v43[v44] = v45;
        end;
    end;
    return {
        childRouters = v43, 
        getScreenOptions = v6(v20, v19.defaultNavigationOptions), 
        _CHILD_IS_SCREEN = v11, 
        getComponentForState = function(v46) --[[ Line: 121 ]] --[[ Name: getComponentForState ]]
            -- upvalues: v8 (ref), v22 (copy), v11 (ref), v5 (ref), v20 (copy)
            local v47 = v46.routes[v46.index] or {};
            local l_routeName_0 = v47.routeName;
            v8(l_routeName_0, "There is no route defined for index '%d'. " .. "Make sure that you passed in a navigation state with a " .. "valid stack index.", v46.index);
            local v49 = v22[l_routeName_0];
            if v49 ~= nil and v49 ~= v11 then
                return v22[l_routeName_0].getComponentForState(v47);
            else
                return v5(v20, l_routeName_0);
            end;
        end, 
        getComponentForRouteName = function(v50) --[[ Line: 136 ]] --[[ Name: getComponentForRouteName ]]
            -- upvalues: v5 (ref), v20 (copy)
            return v5(v20, v50);
        end, 
        getActionCreators = function(v51, v52) --[[ Line: 140 ]] --[[ Name: getActionCreators ]]
            -- upvalues: v0 (ref), v26 (copy), v2 (ref), v8 (ref), v1 (ref)
            return v0.Dictionary.join(v26(v51, v52), {
                pop = function(v53, v54) --[[ Line: 142 ]] --[[ Name: pop ]]
                    -- upvalues: v2 (ref), v0 (ref)
                    return v2.pop(v0.Dictionary.join({
                        n = v53
                    }, v54 or {}));
                end, 
                popToTop = function(v55) --[[ Line: 147 ]] --[[ Name: popToTop ]]
                    -- upvalues: v2 (ref)
                    return v2.popToTop(v55);
                end, 
                push = function(v56, v57, v58) --[[ Line: 150 ]] --[[ Name: push ]]
                    -- upvalues: v2 (ref)
                    return v2.push({
                        routeName = v56, 
                        params = v57, 
                        action = v58
                    });
                end, 
                replace = function(v59, v60, v61, v62) --[[ Line: 157 ]] --[[ Name: replace ]]
                    -- upvalues: v2 (ref), v51 (copy), v8 (ref)
                    if type(v59) == "string" then
                        return v2.replace({
                            routeName = v59, 
                            params = v60, 
                            action = v61, 
                            key = v51.key, 
                            newKey = v62
                        });
                    else
                        v8(type(v59) == "table", "replaceWith must be a table or string");
                        v8(v60 == nil, "params cannot be provided to .replace() when specifying a table");
                        v8(v61 == nil, "Child action cannot be provided to .replace() when specifying a table");
                        v8(v62 == nil, "newKey cannot be provided to .replace() when specifying a table");
                        return v2.replace(v59);
                    end;
                end, 
                reset = function(v63, v64) --[[ Line: 175 ]] --[[ Name: reset ]]
                    -- upvalues: v2 (ref), v52 (copy)
                    local l_v64_0 = v64;
                    if v64 == nil then
                        l_v64_0 = #v63;
                    end;
                    return v2.reset({
                        actions = v63, 
                        index = l_v64_0, 
                        key = v52
                    });
                end, 
                dismiss = function() --[[ Line: 187 ]] --[[ Name: dismiss ]]
                    -- upvalues: v1 (ref), v52 (copy)
                    return v1.back({
                        key = v52
                    });
                end
            });
        end, 
        getStateForAction = function(v66, v67) --[[ Line: 195 ]] --[[ Name: getStateForAction ]]
            -- upvalues: v38 (copy), v2 (ref), v10 (ref), v1 (ref), v22 (copy), v11 (ref), v4 (ref), v0 (ref), v8 (ref), v20 (copy), v3 (ref)
            v67 = v67 or v38();
            local v68 = v67.routes[v67.index];
            local v69 = false;
            if v66.type == v2.Reset then
                v69 = v66.key == v10;
            end;
            if not v69 and v66.type ~= v1.Navigate then
                v69 = v22[v68.routeName];
                if v69 ~= nil and v69 ~= v11 then
                    local v70 = v69.getStateForAction(v66, v68);
                    if v70 ~= nil and v70 ~= v68 then
                        return v4.replaceAt(v67, v68.key, v70, v66.type == v1.SetParams);
                    end;
                end;
            elseif v66.type == v1.Navigate then
                for v71 = #v67.routes, 1, -1 do
                    local v72 = v67.routes[v71];
                    local v73 = v22[v72.routeName];
                    local l_v66_0 = v66;
                    if v66.routeName == v72.routeName and v66.action then
                        l_v66_0 = v66.action;
                    end;
                    if v73 ~= nil and v73 ~= v11 then
                        local v75 = v73.getStateForAction(l_v66_0, v72);
                        if v75 == nil or v75 ~= v72 then
                            local v76 = v4.replaceAndPrune(v67, v75 and v75.key or v72.key, v75 and v75 or v72);
                            local l_isTransitioning_0 = v67.isTransitioning;
                            if v67.index ~= v76.index then
                                l_isTransitioning_0 = v66.immediate ~= true;
                            end;
                            return v0.Dictionary.join(v76, {
                                isTransitioning = l_isTransitioning_0
                            });
                        end;
                    end;
                end;
            end;
            v69 = true;
            if v66.type ~= v1.Navigate then
                v69 = v66.type == v2.Push;
            end;
            if v69 and v22[v66.routeName] ~= nil then
                v69 = v22[v66.routeName];
                local l_v8_0 = v8;
                local v79 = true;
                if v66.type == v2.Push then
                    v79 = v66.key == nil;
                end;
                l_v8_0(v79, "StackRouter does not support key on the push action");
                l_v8_0 = nil;
                for v80, v81 in ipairs(v67.routes) do
                    if v66.key and v81.key == v66.key or v81.routeName == v66.routeName then
                        l_v8_0 = v80;
                        break;
                    end;
                end;
                if v66.type ~= v2.Push and l_v8_0 ~= nil then
                    if v67.index == l_v8_0 and not v66.params then
                        return nil;
                    else
                        v79 = v67.index == l_v8_0 and l_v8_0 or l_v8_0 + 1;
                        local v82 = v0.List.removeRange(v67.routes, v79, #v67.routes);
                        if v66.params then
                            local v83 = v67.routes[l_v8_0];
                            v82[l_v8_0] = v0.Dictionary.join(v83, {
                                params = v0.Dictionary.join(v83.params or {}, v66.params)
                            });
                        end;
                        local l_isTransitioning_1 = v67.isTransitioning;
                        if v67.index ~= l_v8_0 then
                            l_isTransitioning_1 = v66.immediate ~= true;
                        end;
                        return v0.Dictionary.join(v67, {
                            isTransitioning = l_isTransitioning_1, 
                            index = l_v8_0, 
                            routes = v82
                        });
                    end;
                else
                    v79 = nil;
                    if v69 ~= v11 then
                        local l_action_0 = v66.action;
                        if not l_action_0 then
                            l_action_0 = v1.init;
                            local v86 = {};
                            local v87 = v20[v66.routeName];
                            v86.params = if type(v87) == "table" and v87.params then v0.Dictionary.join(v87.params, v66.params) else v66.params;
                            l_action_0 = l_action_0(v86);
                        end;
                        local l_join_0 = v0.Dictionary.join;
                        local v89 = {};
                        local v90 = v20[v66.routeName];
                        v89.params = if type(v90) == "table" and v90.params then v0.Dictionary.join(v90.params, v66.params) else v66.params;
                        v79 = l_join_0(v89, v69.getStateForAction(l_action_0), {
                            routeName = v66.routeName, 
                            key = v66.key or v3.generateKey()
                        });
                    else
                        local v91 = {};
                        local v92 = v20[v66.routeName];
                        v91.params = if type(v92) == "table" and v92.params then v0.Dictionary.join(v92.params, v66.params) else v66.params;
                        v91.routeName = v66.routeName;
                        v91.key = v66.key or v3.generateKey();
                        v79 = v91;
                    end;
                    return v0.Dictionary.join(v4.push(v67, v79), {
                        isTransitioning = v66.immediate ~= true
                    });
                end;
            elseif v66.type == v2.Push and v22[v66.routeName] == nil then
                return v67;
            else
                v69 = true;
                if v66.type ~= v1.Navigate then
                    v69 = v66.type == v2.Push;
                end;
                if v69 then
                    v69 = v0.Dictionary.keys(v22);
                    for _, v94 in ipairs(v69) do
                        local v95 = v22[v94];
                        if v95 ~= nil and v95 ~= v11 then
                            local v96 = v95.getStateForAction(v1.init());
                            local v97 = v95.getStateForAction(v66, v96);
                            local v98 = nil;
                            if v97 == nil then
                                v98 = v96;
                            elseif v97 ~= v96 then
                                v98 = v97;
                            end;
                            if v98 then
                                local v99 = v0.Dictionary.join(v98, {
                                    routeName = v94, 
                                    key = v66.key or v3.generateKey()
                                });
                                return v0.Dictionary.join(v4.push(v67, v99), {
                                    isTransitioning = v66.immediate ~= true
                                });
                            end;
                        end;
                    end;
                end;
                if v66.type == v2.PopToTop then
                    if v66.key and v67.key ~= v66.key then
                        return v67;
                    elseif v67.index <= 1 then
                        return v67;
                    else
                        return v0.Dictionary.join(v67, {
                            isTransitioning = v66.immediate ~= true, 
                            index = 1, 
                            routes = {
                                v67.routes[1]
                            }
                        });
                    end;
                else
                    if v66.type == v2.Replace then
                        v69 = nil;
                        if not v66.key and #v67.routes > 0 then
                            v69 = #v67.routes;
                        else
                            for v100, v101 in ipairs(v67.routes) do
                                if v101.key == v66.key then
                                    v69 = v100;
                                    break;
                                end;
                            end;
                        end;
                        if v69 then
                            local v102 = v22[v66.routeName];
                            local v103 = {};
                            if v102 ~= nil and v102 ~= v11 then
                                local l_action_1 = v66.action;
                                if not l_action_1 then
                                    l_action_1 = v1.init;
                                    local v105 = {};
                                    local v106 = v20[v66.routeName];
                                    v105.params = if type(v106) == "table" and v106.params then v0.Dictionary.join(v106.params, v66.params) else v66.params;
                                    l_action_1 = l_action_1(v105);
                                end;
                                v103 = v102.getStateForAction(l_action_1);
                            end;
                            local v107 = v0.List.join(v67.routes);
                            local l_join_1 = v0.Dictionary.join;
                            local v109 = {};
                            local v110 = v20[v66.routeName];
                            v109.params = if type(v110) == "table" and v110.params then v0.Dictionary.join(v110.params, v66.params) else v66.params;
                            v107[v69] = l_join_1(v109, v103, {
                                routeName = v66.routeName, 
                                key = v66.newKey or v3.generateKey()
                            });
                            return v0.Dictionary.join(v67, {
                                routes = v107
                            });
                        end;
                    end;
                    if v66.type == v1.CompleteTransition and (v66.key == nil or v66.key == v67.key) and v66.toChildKey == v67.routes[v67.index].key and v67.isTransitioning then
                        return v0.Dictionary.join(v67, {
                            isTransitioning = false
                        });
                    else
                        if v66.type == v1.SetParams then
                            v69 = v66.key;
                            local v111 = nil;
                            local v112 = nil;
                            for v113, v114 in ipairs(v67.routes) do
                                if v114.key == v69 then
                                    v111 = v113;
                                    v112 = v114;
                                    break;
                                end;
                            end;
                            if v112 then
                                local v115 = v0.Dictionary.join(v112.params or {}, v66.params or {});
                                local v116 = v0.List.join(v67.routes);
                                v116[v111] = v0.Dictionary.join(v112, {
                                    params = v115
                                });
                                return v0.Dictionary.join(v67, {
                                    routes = v116
                                });
                            end;
                        end;
                        if v66.type == v2.Reset then
                            if v66.key ~= nil and v66.key ~= v67.key then
                                return v67;
                            else
                                v69 = v66.actions or {};
                                local v117 = {};
                                for _, v119 in ipairs(v69) do
                                    local v120 = v22[v119.routeName];
                                    local v121 = {};
                                    if v120 ~= nil and v120 ~= v11 then
                                        local l_action_2 = v119.action;
                                        if not l_action_2 then
                                            l_action_2 = v1.init;
                                            local v123 = {};
                                            local v124 = v20[v119.routeName];
                                            v123.params = if type(v124) == "table" and v124.params then v0.Dictionary.join(v124.params, v119.params) else v119.params;
                                            l_action_2 = l_action_2(v123);
                                        end;
                                        v121 = v120.getStateForAction(l_action_2);
                                    end;
                                    local l_v117_0 = v117;
                                    local l_join_2 = v0.Dictionary.join;
                                    local v127 = {};
                                    local v128 = v20[v119.routeName];
                                    v127.params = if type(v128) == "table" and v128.params then v0.Dictionary.join(v128.params, v119.params) else v119.params;
                                    table.insert(l_v117_0, l_join_2(v127, v121, {
                                        routeName = v119.routeName, 
                                        key = v119.key or v3.generateKey()
                                    }));
                                end;
                                return v0.Dictionary.join(v67, {
                                    routes = v117, 
                                    index = v66.index or #v69
                                });
                            end;
                        else
                            if v66.type == v1.Back or v66.type == v2.Pop then
                                v69 = v66.key;
                                local l_n_0 = v66.n;
                                local l_immediate_0 = v66.immediate;
                                local l_index_0 = v67.index;
                                if v66.type == v2.Pop and l_n_0 ~= nil then
                                    l_index_0 = math.max(1, v67.index - l_n_0 + 1);
                                elseif v69 and v69 ~= v10 then
                                    l_index_0 = 0;
                                    for v132, v133 in ipairs(v67.routes) do
                                        if v133.key == v69 then
                                            l_index_0 = v132;
                                            break;
                                        end;
                                    end;
                                end;
                                if l_index_0 > 1 then
                                    return v0.Dictionary.join(v67, {
                                        routes = v0.List.removeRange(v67.routes, l_index_0, #v67.routes), 
                                        index = l_index_0 - 1, 
                                        isTransitioning = l_immediate_0 ~= true
                                    });
                                end;
                            end;
                            v69 = v66.key and v4.indexOf(v67, v66.key) or nil;
                            for v134 = #v67.routes, 1, -1 do
                                local v135 = v67.routes[v134];
                                if v135.key ~= v68.key and (not v69 or v135.key == v66.key) then
                                    local v136 = v22[v135.routeName];
                                    if v136 ~= nil and v136 ~= v11 then
                                        local v137 = v136.getStateForAction(v66, v135);
                                        if not v137 then
                                            return v67;
                                        elseif v137 ~= v135 then
                                            local l_replaceAt_0 = v4.replaceAt;
                                            local l_v67_0 = v67;
                                            local l_key_0 = v135.key;
                                            local l_v137_0 = v137;
                                            local v142 = true;
                                            if v66.type ~= v1.SetParams then
                                                v142 = v66.type == v1.CompleteTransition;
                                            end;
                                            return l_replaceAt_0(l_v67_0, l_key_0, l_v137_0, v142);
                                        end;
                                    end;
                                end;
                            end;
                            return v67;
                        end;
                    end;
                end;
            end;
        end
    };
end;