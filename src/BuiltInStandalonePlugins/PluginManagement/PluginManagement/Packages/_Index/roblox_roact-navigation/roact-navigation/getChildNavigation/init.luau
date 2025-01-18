local v0 = require(script.Parent.Parent.Cryo);
local v1 = require(script.Parent.getChildEventSubscriber);
local v2 = require(script.Parent.routers.getChildRouter);
local v3 = require(script.Parent.routers.getNavigationActionCreators);
local v4 = require(script.Parent.getChildrenNavigationCache);
local function _(v5) --[[ Line: 7 ]] --[[ Name: createParamGetter ]]
    return function(v6, v7) --[[ Line: 8 ]]
        -- upvalues: v5 (copy)
        local l_params_0 = v5.params;
        return l_params_0 and l_params_0[v6] or v7;
    end;
end;
local function v10(v11, v12, v13) --[[ Line: 14 ]] --[[ Name: getChildNavigation ]]
    -- upvalues: v4 (copy), v2 (copy), v0 (copy), v3 (copy), v1 (copy), v10 (copy)
    local v14 = v4(v11);
    local v15 = nil;
    for _, v17 in ipairs(v11.state.routes) do
        if v17.key == v12 then
            v15 = v17;
            break;
        end;
    end;
    if not v15 then
        return nil;
    else
        local v18 = v14[v12];
        if v18 and v18.state == v15 then
            return v18;
        else
            local v19 = v2(v11.router, v15.routeName);
            local v20 = nil;
            if v15.routes and type(v15.index) == "number" then
                v20 = v15.routes[v15.index];
            end;
            local v21 = v19 and v19.getActionCreators(v20, v15.key) or {};
            local v22 = v0.Dictionary.join(v11.actions or {}, v11.router.getActionCreators(v15, v11.state.key) or {}, v21 or {}, v3(v15) or {});
            local v23 = {};
            for v24, v25 in pairs(v22) do
                v23[v24] = function(...) --[[ Line: 57 ]]
                    -- upvalues: v25 (copy), v11 (copy)
                    local v26 = v25(...);
                    return v11.dispatch(v26);
                end;
            end;
            if v18 then
                local l_join_0 = v0.Dictionary.join;
                local l_v18_0 = v18;
                local l_v23_0 = v23;
                local v30 = {
                    state = v15, 
                    router = v19, 
                    actions = v22
                };
                local l_v15_0 = v15;
                v30.getParam = function(v32, v33) --[[ Line: 8 ]]
                    -- upvalues: l_v15_0 (copy)
                    local l_params_1 = l_v15_0.params;
                    return l_params_1 and l_params_1[v32] or v33;
                end;
                v14[v12] = l_join_0(l_v18_0, l_v23_0, v30);
                return v14[v12];
            else
                local v35 = v1(v11.addListener, v12);
                local l_join_1 = v0.Dictionary.join;
                local l_v23_1 = v23;
                local v38 = {
                    state = v15, 
                    router = v19, 
                    actions = v22
                };
                local l_v15_1 = v15;
                v38.getParam = function(v40, v41) --[[ Line: 8 ]]
                    -- upvalues: l_v15_1 (copy)
                    local l_params_2 = l_v15_1.params;
                    return l_params_2 and l_params_2[v40] or v41;
                end;
                v38.getChildNavigation = function(v43) --[[ Line: 82 ]] --[[ Name: getChildNavigation ]]
                    -- upvalues: v10 (ref), v14 (copy), v12 (copy), v13 (copy)
                    return v10(v14[v12], v43, function() --[[ Line: 83 ]]
                        -- upvalues: v13 (ref), v12 (ref)
                        local v44 = v13();
                        return v44 and v44.getChildNavigation(v12) or nil;
                    end);
                end;
                v38.isFocused = function() --[[ Line: 88 ]] --[[ Name: isFocused ]]
                    -- upvalues: v13 (copy), v12 (copy)
                    local v45 = v13();
                    if not v45 then
                        return false;
                    else
                        local l_state_0 = v45.state;
                        local l_routes_0 = l_state_0.routes;
                        local l_index_0 = l_state_0.index;
                        if not v45.isFocused() then
                            return false;
                        else
                            return l_routes_0[l_index_0].key == v12 and (l_state_0.isTransitioning ~= true or false);
                        end;
                    end;
                end;
                v38.dispatch = v11.dispatch;
                v38.getScreenProps = v11.getScreenProps;
                v38.addListener = v35.addListener;
                v38.emit = v35.emit;
                v14[v12] = l_join_1(l_v23_1, v38);
                return v14[v12];
            end;
        end;
    end;
end;
return v10;