local v0 = require(script.Parent.Parent.Cryo);
local v1 = require(script.Parent.NavigationEvents);
local v2 = require(script.Parent.routers.getNavigationActionCreators);
local v3 = require(script.Parent.getChildNavigation);
local v4 = require(script.Parent.getChildrenNavigationCache);
return function(v5, v6, v7, v8, v9, v10) --[[ Line: 7 ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy), v0 (copy), v2 (copy)
    local v11 = v5.getActionCreators(v6, nil);
    local v12 = {
        actions = v11, 
        router = v5, 
        state = v6, 
        dispatch = v7, 
        getScreenProps = v9, 
        _childrenNavigation = v4(v10())
    };
    v12.getChildNavigation = function(v13) --[[ Line: 19 ]] --[[ Name: getChildNavigation ]]
        -- upvalues: v3 (ref), v12 (copy), v10 (copy)
        return v3(v12, v13, v10);
    end;
    v12.isFocused = function(v14) --[[ Line: 23 ]] --[[ Name: isFocused ]]
        -- upvalues: v10 (copy)
        local l_routes_0 = v10().state.routes;
        local l_index_0 = v10().state.index;
        return not v14 or l_routes_0[l_index_0].key == v14;
    end;
    v12.addListener = function(v17, v18) --[[ Line: 30 ]] --[[ Name: addListener ]]
        -- upvalues: v1 (ref), v8 (copy)
        if v17 ~= v1.Action then
            return {
                disconnect = function() --[[ Line: 32 ]] --[[ Name: disconnect ]]

                end
            };
        else
            v8[v18] = true;
            return {
                disconnect = function() --[[ Line: 36 ]] --[[ Name: disconnect ]]
                    -- upvalues: v8 (ref), v18 (copy)
                    v8[v18] = nil;
                end
            };
        end;
    end;
    local v19 = v0.Dictionary.join(v2(v12.state), v11);
    for v20, _ in pairs(v19) do
        v12[v20] = function(...) --[[ Line: 46 ]]
            -- upvalues: v12 (copy), v19 (copy), v20 (copy)
            v12.dispatch(v19[v20](...));
        end;
    end;
    return v12;
end;