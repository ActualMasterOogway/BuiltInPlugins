local v0 = require(script.Parent.RequireRoact).Component:extend("ThemeChangeListener");
v0.render = function(v1) --[[ Line: 9 ]] --[[ Name: render ]]
    return v1.props.render();
end;
local function _(v2) --[[ Line: 13 ]] --[[ Name: forceReRender ]]
    v2:setState({});
end;
v0.didMount = function(v4) --[[ Line: 17 ]] --[[ Name: didMount ]]
    v4.externalThemeChangedConnection = settings().Studio.ThemeChanged:Connect(function() --[[ Line: 18 ]]
        -- upvalues: v4 (copy)
        v4:setState({});
    end);
end;
v0.willUnmount = function(v5) --[[ Line: 23 ]] --[[ Name: willUnmount ]]
    if v5.externalThemeChangedConnection then
        v5.externalThemeChangedConnection:Disconnect();
    end;
end;
return v0;