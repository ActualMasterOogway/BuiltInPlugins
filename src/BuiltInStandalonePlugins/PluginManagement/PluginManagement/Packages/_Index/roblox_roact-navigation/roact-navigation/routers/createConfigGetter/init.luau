local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.getScreenForRouteName);
local v2 = require(script.Parent.validateScreenOptions);
local v3 = require(script.Parent.Parent.utils.validate);
local function v8(v4, v5, v6) --[[ Line: 6 ]] --[[ Name: applyConfig ]]
    -- upvalues: v0 (copy)
    v5 = v5 or {};
    local v7 = type(v4);
    if v7 == "function" then
        return v0.Dictionary.join(v5, v4(v0.Dictionary.join(v6 or {}, {
            navigationOptions = v5
        })));
    elseif v7 == "table" then
        return v0.Dictionary.join(v5, v4);
    else
        return v5;
    end;
end;
return function(v9, v10) --[[ Line: 22 ]]
    -- upvalues: v3 (copy), v1 (copy), v8 (copy), v2 (copy)
    return function(v11, v12) --[[ Line: 23 ]]
        -- upvalues: v3 (ref), v1 (ref), v9 (copy), v8 (ref), v10 (copy), v2 (ref)
        v12 = v12 or {};
        local l_state_0 = v11.state;
        v3(type(l_state_0) == "table", "navigation.state must be a table");
        v3(type(l_state_0.routeName == "string"), "routeName must be a string");
        local v14 = v1(v9, l_state_0.routeName);
        local v15 = v9[l_state_0.routeName];
        local v16 = nil;
        if v15 ~= v14 then
            v16 = v15.navigationOptions;
        end;
        local v17 = type(v14) == "table" and v14.navigationOptions or {};
        local v18 = {
            navigation = v11, 
            screenProps = v12
        };
        local v19 = v8(v10, {}, v18);
        v19 = v8(v17, v19, v18);
        v19 = v8(v16, v19, v18);
        v2(v19, l_state_0);
        return v19;
    end;
end;