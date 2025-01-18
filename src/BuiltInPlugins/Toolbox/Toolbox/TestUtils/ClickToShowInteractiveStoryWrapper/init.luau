local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = v1.PureComponent:extend("ClickToShowInteractiveStoryWrapper");
v2.init = function(v3) --[[ Line: 19 ]] --[[ Name: init ]]
    v3.state = {
        isShowing = if v3.props.IsShownByDefault then v3.props.IsShownByDefault else false
    };
    v3.toggleIsShowing = function() --[[ Line: 24 ]]
        -- upvalues: v3 (copy)
        v3:setState(function(v4) --[[ Line: 25 ]]
            return {
                isShowing = not v4.isShowing
            };
        end);
    end;
end;
v2.render = function(v5) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v5.props;
    local l_state_0 = v5.state;
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        Button = v1.createElement("TextButton", {
            Size = UDim2.fromOffset(200, 50), 
            Text = "Click to View Component", 
            [v1.Event.Activated] = v5.toggleIsShowing
        }), 
        SearchOption = if l_state_0.isShowing then l_props_0.OnRender(l_state_0.isShowing, v5.toggleIsShowing) else nil
    });
end;
return v2;