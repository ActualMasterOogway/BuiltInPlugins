local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Framework).ContextServices.ContextItem:extend("NavigationContext");
v1.new = function(v2) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = {
        navigation = {
            push = function() --[[ Line: 19 ]] --[[ Name: push ]]

            end, 
            pop = function() --[[ Line: 20 ]] --[[ Name: pop ]]

            end, 
            popToTop = function() --[[ Line: 21 ]] --[[ Name: popToTop ]]

            end
        }, 
        observedNavStack = {
            v2
        }, 
        observedRouteStack = {
            v2
        }, 
        rootRoute = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
v1.updateNavigation = function(v4, v5) --[[ Line: 35 ]] --[[ Name: updateNavigation ]]
    v4.navigation = v5;
end;
v1.get = function(v6) --[[ Line: 39 ]] --[[ Name: get ]]
    return v6;
end;
v1.push = function(v7, v8, v9, v10) --[[ Line: 43 ]] --[[ Name: push ]]
    table.insert(v7.observedNavStack, v9);
    table.insert(v7.observedRouteStack, v8);
    v7.navigation.push(v8, v10);
end;
v1.pop = function(v11) --[[ Line: 50 ]] --[[ Name: pop ]]
    table.remove(v11.observedNavStack, #v11.observedNavStack);
    if #v11.observedNavStack <= 0 then
        v11.observedNavStack = {
            v11.rootRoute
        };
    end;
    table.remove(v11.observedRouteStack, #v11.observedRouteStack);
    if #v11.observedRouteStack <= 0 then
        v11.observedRouteStack = {
            v11.rootRoute
        };
    end;
    v11.navigation.pop();
end;
v1.popToTop = function(v12) --[[ Line: 64 ]] --[[ Name: popToTop ]]
    v12.observedNavStack = {
        v12.rootRoute
    };
    v12.observedRouteStack = {
        v12.rootRoute
    };
    v12.navigation.popToTop();
end;
v1.getBreadcrumbRoute = function(v13) --[[ Line: 75 ]] --[[ Name: getBreadcrumbRoute ]]
    return v13.observedNavStack;
end;
v1.getNavigationRoute = function(v14) --[[ Line: 83 ]] --[[ Name: getNavigationRoute ]]
    return v14.observedRouteStack;
end;
v1.getCurrentPath = function(v15) --[[ Line: 87 ]] --[[ Name: getCurrentPath ]]
    return v15.observedNavStack[#v15.observedNavStack];
end;
return v1;