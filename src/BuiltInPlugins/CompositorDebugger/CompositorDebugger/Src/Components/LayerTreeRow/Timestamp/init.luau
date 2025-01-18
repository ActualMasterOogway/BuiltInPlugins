local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_UI_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = v1.PureComponent:extend("Timestamp");
v6.init = function(v7) --[[ Line: 25 ]] --[[ Name: init ]]
    v7.formatTime = function(v8) --[[ Line: 26 ]]
        if v8 == -1e999 then
            return "-inf";
        elseif v8 == 1e999 then
            return "inf";
        else
            return string.format("%02d.%02d", math.floor(v8), math.floor(v8 * 100 + 0.5) % 100);
        end;
    end;
    v7.createLoadingBar = function(_) --[[ Line: 36 ]]

    end;
end;
v6.render = function(v10) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v10.props;
    local v12 = math.max(l_props_0.Length or 0, 0);
    local v13 = if l_props_0.TimePercentage then math.clamp(l_props_0.TimePercentage * v12, 0, v12) else 0;
    return v1.createElement(l_Pane_0, {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        [v1.Tag] = l_props_0[v1.Tag]
    }, if v12 > 0 then {
        ProgressBar = v1.createElement(l_Pane_0, {
            ZIndex = 1
        }, {
            Progress = v1.createElement(l_Pane_0, {
                Size = UDim2.fromScale(math.clamp(l_props_0.TimePercentage, 0, 1), 1), 
                BackgroundColor = v10.props.BarColor
            })
        }), 
        TextLabel = v1.createElement(l_TextLabel_0, {
            TextColor = l_props_0.TextColor, 
            Text = string.format("%s / %s", v10.formatTime(v13), v10.formatTime(v12)), 
            ZIndex = 2, 
            [v1.Tag] = "X-Center"
        })
    } else nil);
end;
return v6;