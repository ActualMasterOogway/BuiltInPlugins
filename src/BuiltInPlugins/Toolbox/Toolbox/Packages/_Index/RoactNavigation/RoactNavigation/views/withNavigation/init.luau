local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_0.NavigationContext);
local v6 = require(l_Parent_1.utils.invariant);
local function _(v7) --[[ Line: 11 ]] --[[ Name: isComponent ]]
    local v8 = type(v7);
    local v9 = true;
    if v8 ~= "function" then
        v9 = v8 == "table";
    end;
    return v9;
end;
return function(v11, v12) --[[ Line: 33 ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy), l_Object_0 (copy)
    local v13 = type(v11);
    local v14 = true;
    if v13 ~= "function" then
        v14 = v13 == "table";
    end;
    assert(v14, "withNavigation must be called with a Roact component (stateful or functional)");
    v12 = v12 or {};
    if v12.forwardRef == nil then
        v12.forwardRef = true;
    end;
    return function(v15) --[[ Line: 41 ]]
        -- upvalues: v4 (ref), v5 (ref), v6 (ref), v11 (copy), l_Object_0 (ref), v12 (ref)
        local l_navigation_0 = v15.navigation;
        return v4.createElement(v5.Consumer, {
            render = function(v17) --[[ Line: 44 ]] --[[ Name: render ]]
                -- upvalues: l_navigation_0 (copy), v6 (ref), v4 (ref), v11 (ref), l_Object_0 (ref), v15 (copy), v12 (ref)
                local v18 = l_navigation_0 or v17;
                v6(v18, "withNavigation and withNavigationFocus can only " .. "be used on a view hierarchy of a navigator. The wrapped component is " .. "unable to get access to navigation from props or context.");
                return v4.createElement(v11, l_Object_0.assign(table.clone(v15), {
                    navigation = v18, 
                    [v4.Ref] = if v12.forwardRef then v15[v4.Ref] else l_Object_0.None
                }));
            end
        });
    end;
end;