local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local v10 = v1.PureComponent:extend("InputBlocker");
v2.Util.Typecheck.wrap(v10, script);
v10.init = function(v11) --[[ Line: 31 ]] --[[ Name: init ]]
    v11.onKeyPressed = function(v12) --[[ Line: 32 ]]
        -- upvalues: v11 (copy)
        if v12.KeyCode == Enum.KeyCode.Escape then
            v11.props.OnFocused();
        end;
    end;
end;
v10.render = function(v13) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_CaptureFocus_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_KeyboardListener_0 (copy)
    local l_props_0 = v13.props;
    local l_OnFocused_0 = l_props_0.OnFocused;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_CaptureFocus_0, {
        OnFocusLost = l_OnFocused_0
    }, {
        Pane = v1.createElement(l_Pane_0, {
            BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
            BackgroundTransparency = l_Stylizer_0.BackgroundTransparency
        }, {
            Text = v1.createElement(l_TextLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                TextSize = l_Stylizer_0.TextSize, 
                Text = l_props_0.Text, 
                TextWrapped = true
            }), 
            KeyboardListener = v1.createElement(l_KeyboardListener_0, {
                OnKeyPressed = v13.onKeyPressed
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));