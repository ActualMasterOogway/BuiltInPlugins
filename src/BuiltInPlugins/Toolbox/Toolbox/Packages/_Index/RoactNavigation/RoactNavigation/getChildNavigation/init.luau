local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = require(script.Parent.getEventManager);
local v5 = require(script.Parent.getChildRouter);
local v6 = require(script.Parent.routers.getNavigationActionCreators);
local v7 = require(script.Parent.getChildrenNavigationCache);
local function _(v8) --[[ Line: 12 ]] --[[ Name: createParamGetter ]]
    return function(v9, v10) --[[ Line: 13 ]]
        -- upvalues: v8 (copy)
        local l_params_0 = v8.params;
        if l_params_0 and l_params_0[v9] ~= nil then
            return l_params_0[v9];
        else
            return v10;
        end;
    end;
end;
local function v13(v14, v15, v16) --[[ Line: 24 ]] --[[ Name: getChildNavigation ]]
    -- upvalues: v7 (copy), l_Array_0 (copy), v5 (copy), l_Object_0 (copy), v6 (copy), v4 (copy), v13 (copy)
    local v17 = v7(v14);
    local v19 = l_Array_0.findIndex(v14.state.routes, function(v18) --[[ Line: 27 ]]
        -- upvalues: v15 (copy)
        return v18.key == v15;
    end);
    if v19 < 1 then
        return nil;
    else
        local v20 = v14.state.routes[v19];
        local v21 = v17[v15];
        if v21 and v21.state == v20 then
            return v21;
        else
            local v22 = v5(v14.router, v20.routeName);
            local v23 = nil;
            if v20.routes and type(v20.index) == "number" then
                v23 = v20.routes[v20.index];
            end;
            local v24 = v22 and v22.getActionCreators(v23, v20.key) or {};
            local v25 = l_Object_0.assign(if v14.actions then table.clone(v14.actions) else {}, v14.router.getActionCreators(v20, v14.state.key) or {}, v24 or {}, v6(v20) or {});
            local v26 = {};
            for v27, v28 in v25 do
                v26[v27] = function(...) --[[ Line: 66 ]]
                    -- upvalues: v28 (copy), v14 (copy)
                    local v29 = v28(...);
                    return v14.dispatch(v29);
                end;
            end;
            local v30 = true;
            local v31 = v16();
            if v31 then
                v30 = l_Array_0.indexOf(v31.state.routes, v20) == 1;
            end;
            if v21 and v21.isFirstRouteInParent() == v30 then
                v17[v15] = l_Object_0.assign(table.clone(v21), v26, {
                    state = v20, 
                    router = v22, 
                    actions = v25, 
                    getParam = function(v32, v33) --[[ Line: 13 ]]
                        -- upvalues: v20 (copy)
                        local l_params_1 = v20.params;
                        if l_params_1 and l_params_1[v32] ~= nil then
                            return l_params_1[v32];
                        else
                            return v33;
                        end;
                    end
                });
                return v17[v15];
            else
                local v35 = v4(v15);
                v17[v15] = l_Object_0.assign(table.clone(v26), {
                    state = v20, 
                    router = v22, 
                    actions = v25, 
                    getParam = function(v36, v37) --[[ Line: 13 ]]
                        -- upvalues: v20 (copy)
                        local l_params_2 = v20.params;
                        if l_params_2 and l_params_2[v36] ~= nil then
                            return l_params_2[v36];
                        else
                            return v37;
                        end;
                    end, 
                    getChildNavigation = function(v39) --[[ Line: 99 ]] --[[ Name: getChildNavigation ]]
                        -- upvalues: v13 (ref), v17 (copy), v15 (copy), v16 (copy)
                        return v13(v17[v15], v39, function() --[[ Line: 100 ]]
                            -- upvalues: v16 (ref), v15 (ref)
                            local v40 = v16();
                            if v40 then
                                return (v40.getChildNavigation(v15));
                            else
                                return nil;
                            end;
                        end);
                    end, 
                    isFocused = function() --[[ Line: 105 ]] --[[ Name: isFocused ]]
                        -- upvalues: v16 (copy), v15 (copy)
                        local v41 = v16();
                        if not v41 then
                            return false;
                        elseif not v41.isFocused() then
                            return false;
                        else
                            local l_state_0 = v41.state;
                            if l_state_0.routes[l_state_0.index].key == v15 then
                                return true;
                            else
                                return false;
                            end;
                        end;
                    end, 
                    isFirstRouteInParent = function() --[[ Line: 125 ]] --[[ Name: isFirstRouteInParent ]]
                        -- upvalues: v30 (ref)
                        return v30;
                    end, 
                    dispatch = v14.dispatch, 
                    getScreenProps = v14.getScreenProps, 
                    _dangerouslyGetParent = v16, 
                    addListener = v35.addListener, 
                    emit = v35.emit
                });
                return v17[v15];
            end;
        end;
    end;
end;
return v13;