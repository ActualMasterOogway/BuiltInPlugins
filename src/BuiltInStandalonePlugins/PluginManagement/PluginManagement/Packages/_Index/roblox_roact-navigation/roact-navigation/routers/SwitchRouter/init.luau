local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.Parent.NavigationActions);
local v2 = require(script.Parent.Parent.BackBehavior);
local v3 = require(script.Parent.getScreenForRouteName);
local v4 = require(script.Parent.createConfigGetter);
local v5 = require(script.Parent.validateRouteConfigMap);
local v6 = require(script.Parent.Parent.utils.validate);
local function v7() --[[ Line: 9 ]]
    return {};
end;
local function _(v8, v9, v10) --[[ Line: 12 ]] --[[ Name: immutableReplaceListIndex ]]
    local v11 = {};
    for v12, v13 in ipairs(v8) do
        v11[v12] = v13;
    end;
    v11[v9] = v10;
    return v11;
end;
local function _(v15) --[[ Line: 22 ]] --[[ Name: childrenUpdateWithoutSwitchingIndex ]]
    -- upvalues: v1 (copy)
    local v16 = true;
    if v15 ~= v1.SetParams then
        v16 = v15 == v1.CompleteTransition;
    end;
    return v16;
end;
local function v23(v18) --[[ Line: 27 ]] --[[ Name: collectChildRouters ]]
    -- upvalues: v3 (copy)
    local v19 = {};
    for v20, _ in pairs(v18) do
        local v22 = v3(v18, v20);
        if type(v22) == "table" and v22.router then
            v19[v20] = v22.router;
        end;
    end;
    return v19;
end;
local function _(v24, v25, v26) --[[ Line: 39 ]] --[[ Name: getParamsForRoute ]]
    -- upvalues: v0 (copy)
    local v27 = v24[v25];
    if type(v27) == "table" and v27.params then
        return v0.Dictionary.join(v27.params, v26);
    else
        return v26;
    end;
end;
return function(v29) --[[ Line: 49 ]]
    -- upvalues: v6 (copy), v5 (copy), v0 (copy), v7 (copy), v2 (copy), v23 (copy), v1 (copy), v4 (copy), v3 (copy)
    v6(type(v29) == "table", "config must be a table");
    local v30 = v5(v29.routes);
    local v31 = v29.order or v0.Dictionary.keys(v30);
    local v32 = v29.getCustomActionCreators or v7;
    local v33 = v29.initialRouteParams or {};
    local v34 = v6(v29.initialRouteName, "initialRouteName must be provided");
    local v35 = (v29.backBehavior or v2.None) == v2.InitialRoute;
    local v36 = true;
    if type(v29.resetOnBlur) == "boolean" then
        v36 = v29.resetOnBlur;
    end;
    local v37 = v0.List.find(v31, v34);
    if v37 == nil then
        local v38 = "";
        for _, v40 in ipairs(v31) do
            v38 = v38 .. v40 .. ",";
        end;
        error(string.format("Invalid initialRouteName '%s'. Must be one of [%s]", v34, v38), 2);
    end;
    local v41 = v23(v30);
    local function v47(v42) --[[ Line: 86 ]] --[[ Name: resetChildRoute ]]
        -- upvalues: v34 (copy), v33 (copy), v30 (copy), v0 (ref), v41 (copy), v1 (ref)
        local v43 = v42 == v34 and v33 or {};
        local v44 = v30[v42];
        local v45 = if type(v44) == "table" and v44.params then v0.Dictionary.join(v44.params, v43) else v43;
        local v46 = v41[v42];
        if v46 then
            v44 = v1.init();
            return v0.Dictionary.join(v46.getStateForAction(v44), {
                key = v42, 
                routeName = v42, 
                params = v45
            });
        else
            return {
                key = v42, 
                routeName = v42, 
                params = v45
            };
        end;
    end;
    local function v57(v48, v49) --[[ Line: 109 ]] --[[ Name: getNextState ]]
        -- upvalues: v36 (ref), v47 (copy), v0 (ref)
        if not v48 then
            return v49;
        elseif v48.index ~= v49.index and v36 then
            local l_routeName_0 = v48.routes[v48.index].routeName;
            local l_routes_0 = v49.routes;
            local l_index_0 = v48.index;
            local v53 = v47(l_routeName_0);
            local v54 = {};
            for v55, v56 in ipairs(l_routes_0) do
                v54[v55] = v56;
            end;
            v54[l_index_0] = v53;
            return v0.Dictionary.join(v49, {
                routes = v54
            });
        else
            return v49;
        end;
    end;
    local function _() --[[ Line: 129 ]] --[[ Name: getInitialState ]]
        -- upvalues: v0 (ref), v31 (copy), v47 (copy), v37 (copy)
        return {
            routes = v0.List.map(v31, v47), 
            index = v37, 
            isTransitioning = false
        };
    end;
    return {
        childRouters = v41, 
        getScreenOptions = v4(v30, v29.defaultNavigationOptions), 
        getActionCreators = function(v59, v60) --[[ Line: 142 ]] --[[ Name: getActionCreators ]]
            -- upvalues: v32 (copy)
            return v32(v59, v60);
        end, 
        getStateForAction = function(v61, v62) --[[ Line: 146 ]] --[[ Name: getStateForAction ]]
            -- upvalues: v0 (ref), v31 (copy), v47 (copy), v37 (copy), v1 (ref), v34 (copy), v33 (copy), v41 (copy), v57 (copy), v35 (copy)
            local v63 = v62 and v0.Dictionary.join(v62) or nil;
            local v64 = v62 or {
                routes = v0.List.map(v31, v47), 
                index = v37, 
                isTransitioning = false
            };
            local l_index_1 = v64.index;
            if v61.type == v1.Init then
                local l_params_0 = v61.params;
                if l_params_0 then
                    local l_l_params_0_0 = l_params_0 --[[ copy: 5 -> 26 ]];
                    v64.routes = v0.List.map(v64.routes, function(v68) --[[ Line: 156 ]]
                        -- upvalues: v34 (ref), v33 (ref), v0 (ref), l_l_params_0_0 (copy)
                        local v69 = v68.routeName == v34 and v33 or {};
                        return v0.Dictionary.join(v68, {
                            params = v0.Dictionary.join(v68.params, l_l_params_0_0, v69)
                        });
                    end);
                end;
            end;
            local v70 = v64.routes[v64.index];
            local v71 = v41[v31[v64.index]];
            if v71 then
                local v72 = v71.getStateForAction(v61, v70);
                if not v72 and v62 then
                    return nil;
                elseif v72 and v72 ~= v70 then
                    local l_routes_1 = v64.routes;
                    local l_index_2 = v64.index;
                    local v75 = {};
                    for v76, v77 in ipairs(l_routes_1) do
                        v75[v76] = v77;
                    end;
                    v75[l_index_2] = v72;
                    return v57(v63, v0.Dictionary.join(v64, {
                        routes = v75
                    }));
                end;
            end;
            local v78 = not v61.key or v61.key == v70.key;
            if v61.type == v1.Back then
                if v78 and v35 then
                    l_index_1 = v37;
                else
                    return v64;
                end;
            end;
            local v79 = false;
            if v61.type == v1.Navigate then
                for v80, v81 in ipairs(v31) do
                    if v81 == v61.routeName then
                        l_index_1 = v80;
                        v79 = true;
                        break;
                    end;
                end;
                if v79 then
                    local v82 = v64.routes[l_index_1];
                    local v83 = v41[v61.routeName];
                    local l_v82_0 = v82;
                    if v61.action and v83 then
                        local v85 = v83.getStateForAction(v61.action, v82);
                        if v85 then
                            l_v82_0 = v85;
                        end;
                    end;
                    if v61.params then
                        l_v82_0 = v0.Dictionary.join(l_v82_0, {
                            params = v0.Dictionary.join(l_v82_0.params or {}, v61.params)
                        });
                    end;
                    if l_v82_0 ~= v82 then
                        local l_routes_2 = v64.routes;
                        local l_l_index_1_0 = l_index_1;
                        local l_l_v82_0_0 = l_v82_0;
                        local v89 = {};
                        for v90, v91 in ipairs(l_routes_2) do
                            v89[v90] = v91;
                        end;
                        v89[l_l_index_1_0] = l_l_v82_0_0;
                        l_routes_2 = v0.Dictionary.join(v64, {
                            routes = v89, 
                            index = l_index_1
                        });
                        return v57(v63, l_routes_2);
                    elseif l_v82_0 == v82 and v64.index == l_index_1 and v63 then
                        return nil;
                    end;
                end;
            end;
            if v61.type == v1.SetParams then
                local l_key_0 = v61.key;
                local v93 = nil;
                local v94 = nil;
                for v95, v96 in ipairs(v64.routes) do
                    if v96.key == l_key_0 then
                        v93 = v95;
                        v94 = v96;
                        break;
                    end;
                end;
                if v94 then
                    local v97 = v0.Dictionary.join(v94.params or {}, v61.params);
                    local v98 = v0.Dictionary.join(v94, {
                        params = v97
                    });
                    local l_routes_3 = v64.routes;
                    local l_v93_0 = v93;
                    local v101 = {};
                    for v102, v103 in ipairs(l_routes_3) do
                        v101[v102] = v103;
                    end;
                    v101[l_v93_0] = v98;
                    return v57(v63, v0.Dictionary.join(v64, {
                        routes = v101
                    }));
                end;
            end;
            if l_index_1 ~= v64.index then
                return v57(v63, v0.Dictionary.join(v64, {
                    index = l_index_1
                }));
            elseif v79 and not v62 then
                return v64;
            elseif v79 then
                return v0.Dictionary.join(v64);
            else
                local l_index_3 = v64.index;
                local l_routes_4 = v64.routes;
                for v106, v107 in ipairs(v31) do
                    if v106 ~= l_index_3 then
                        local v108 = v41[v107];
                        local v109 = l_routes_4[v106];
                        if v108 then
                            v109 = v108.getStateForAction(v61, v109);
                        end;
                        if not v109 then
                            l_index_3 = v106;
                            break;
                        elseif v109 ~= l_routes_4[v106] then
                            local l_l_routes_4_0 = l_routes_4;
                            local l_v109_0 = v109;
                            local v112 = {};
                            for v113, v114 in ipairs(l_l_routes_4_0) do
                                v112[v113] = v114;
                            end;
                            v112[v106] = l_v109_0;
                            l_routes_4 = v112;
                            l_index_3 = v106;
                            break;
                        end;
                    end;
                end;
                local l_type_0 = v61.type;
                local v116 = true;
                if l_type_0 ~= v1.SetParams then
                    v116 = l_type_0 == v1.CompleteTransition;
                end;
                if v116 then
                    l_index_3 = v64.index;
                end;
                if l_index_3 ~= v64.index or l_routes_4 ~= v64.routes then
                    return v57(v63, v0.Dictionary.join(v64, {
                        index = l_index_3, 
                        routes = l_routes_4
                    }));
                else
                    return v64;
                end;
            end;
        end, 
        getComponentForState = function(v117) --[[ Line: 308 ]] --[[ Name: getComponentForState ]]
            -- upvalues: v6 (ref), v41 (copy), v3 (ref), v30 (copy)
            local l_routeName_1 = (v117.routes[v117.index] or {}).routeName;
            v6(l_routeName_1, "There is no route defined for index '%d'. " .. "Make sure that you passed in a navigation state with a " .. "valid tab/screen index.", v117.index);
            local v119 = v41[l_routeName_1];
            if v119 then
                return v119.getComponentForState(v117.routes[v117.index]);
            else
                return v3(v30, l_routeName_1);
            end;
        end, 
        getComponentForRouteName = function(v120) --[[ Line: 323 ]] --[[ Name: getComponentForRouteName ]]
            -- upvalues: v3 (ref), v30 (copy)
            return v3(v30, v120);
        end
    };
end;