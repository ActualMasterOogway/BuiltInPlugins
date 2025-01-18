local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = v1.PureComponent:extend("ScreenFlow");
local v3 = game:DefineFastFlag("InitialOnScreenChanged", false);
require(l_Parent_0.Util.Typecheck).wrap(v2, script);
v2.init = function(v4) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v4.state = {
        currentScreenIndex = 1
    };
    local v5 = v4.props.GetNextIndex and v4.props.GetPreviousIndex and v4.props.OnScreenChanged;
    v4.OnScreenChangedDefault = function(v6) --[[ Line: 34 ]]
        -- upvalues: v4 (copy)
        v4:setState({
            currentScreenIndex = v6
        });
    end;
    if v3 then
        v4.OnScreenChanged = if v5 then v4.props.OnScreenChanged else v4.OnScreenChangedDefault;
    end;
    v4.GetNextIndexDefault = function(v7) --[[ Line: 44 ]]
        -- upvalues: v4 (copy)
        local l_Screens_0 = v4.props.Screens;
        assert(#l_Screens_0 > 0, "No screens");
        local v9 = (v7 + 1) % #l_Screens_0;
        return v9 == 0 and #l_Screens_0 or v9;
    end;
    v4.GetPreviousIndexDefault = function(v10) --[[ Line: 55 ]]
        return v10 - 1;
    end;
    v4.GoToNext = function() --[[ Line: 60 ]]
        -- upvalues: v4 (copy), v5 (copy)
        local l_currentScreenIndex_0 = v4.state.currentScreenIndex;
        if v5 then
            v4.GoTo(v4.props.GetNextIndex(l_currentScreenIndex_0));
            return;
        else
            v4.GoTo(v4.GetNextIndexDefault(l_currentScreenIndex_0));
            return;
        end;
    end;
    v4.GoToPrevious = function() --[[ Line: 69 ]]
        -- upvalues: v4 (copy), v5 (copy)
        local l_currentScreenIndex_1 = v4.state.currentScreenIndex;
        if v5 then
            v4.GoTo(v4.props.GetPreviousIndex(l_currentScreenIndex_1));
            return;
        else
            v4.GoTo(v4.GetPreviousIndexDefault(l_currentScreenIndex_1));
            return;
        end;
    end;
    v4.GoTo = function(v13) --[[ Line: 78 ]]
        -- upvalues: v4 (copy), v3 (ref), v5 (copy)
        local l_Screens_1 = v4.props.Screens;
        assert(#l_Screens_1 > 0, "No screens");
        v13 = math.clamp(v13, 1, #l_Screens_1);
        v4:setState({
            currentScreenIndex = v13
        });
        if v3 then
            v4.OnScreenChanged(v13);
            return;
        elseif v5 then
            v4.props.OnScreenChanged(v13);
            return;
        else
            v4.OnScreenChangedDefault(v13);
            return;
        end;
    end;
    if v3 then
        v4.OnScreenChanged(v4.state.currentScreenIndex);
    end;
end;
v2.render = function(v15) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v15.props;
    local l_state_0 = v15.state;
    local v18 = l_props_0.Screens[l_state_0.currentScreenIndex];
    assert(v18, "No currentScreen");
    return v1.createElement(v18, {
        GoToNext = v15.GoToNext, 
        GoToPrevious = v15.GoToPrevious
    });
end;
return v2;