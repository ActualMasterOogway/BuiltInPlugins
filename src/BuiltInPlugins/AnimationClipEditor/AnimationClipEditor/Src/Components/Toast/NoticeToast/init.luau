local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.Toast.BaseToast);
local v7 = v2.PureComponent:extend("NoticeToast");
v7.init = function(v8, v9) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: l_RunService_0 (copy)
    v8.state = {
        showingToast = true, 
        fadeAmount = 0
    };
    v8.startTimer = function() --[[ Line: 39 ]]
        -- upvalues: v9 (copy), v8 (copy)
        local v10 = v9.ShowTime or 3;
        local v11 = v9.FadeTime or 0.5;
        v8.hideTime = tick() + v10;
        v8.fadeTime = v8.hideTime - v11;
        v8.fadeMultiplier = v11 == 0 and 1 or 1 / v11;
        v8:setState({
            fadeAmount = 0
        });
    end;
    v8.connectTimer = function() --[[ Line: 50 ]]
        -- upvalues: v8 (copy), l_RunService_0 (ref)
        v8.timerConnection = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 51 ]]
            -- upvalues: v8 (ref)
            if v8 and v8.state.showingToast then
                if tick() >= v8.hideTime then
                    v8.disconnectTimer();
                    v8.onClose();
                    v8:setState({
                        showingToast = false
                    });
                    return;
                elseif tick() >= v8.fadeTime then
                    v8:setState({
                        fadeAmount = (tick() - v8.fadeTime) * v8.fadeMultiplier
                    });
                end;
            end;
        end);
    end;
    v8.disconnectTimer = function() --[[ Line: 68 ]]
        -- upvalues: v8 (copy)
        if v8.timerConnection then
            v8.timerConnection:Disconnect();
        end;
    end;
    v8.onClose = function() --[[ Line: 74 ]]
        -- upvalues: v8 (copy)
        if v8.props.OnClose then
            v8.props.OnClose();
        end;
    end;
end;
v7.didUpdate = function(v12, v13) --[[ Line: 81 ]] --[[ Name: didUpdate ]]
    if v12.props.Text ~= v13.Text then
        v12.startTimer();
    end;
end;
v7.didMount = function(v14) --[[ Line: 87 ]] --[[ Name: didMount ]]
    v14.startTimer();
    v14.connectTimer();
end;
v7.willUnmount = function(v15) --[[ Line: 92 ]] --[[ Name: willUnmount ]]
    v15.disconnectTimer();
end;
v7.render = function(v16) --[[ Line: 96 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy), v6 (copy)
    local l_props_0 = v16.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_toastTheme_0 = l_Stylizer_0.toastTheme;
    local l_state_0 = v16.state;
    local l_Text_0 = l_props_0.Text;
    local l_showingToast_0 = l_state_0.showingToast;
    local l_fadeAmount_0 = l_state_0.fadeAmount;
    local v24 = v3.getTextWidth(l_Text_0, l_toastTheme_0.textSize, l_Stylizer_0.font) + 40;
    return l_showingToast_0 and v2.createElement(v6, {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.new(0, v24, 0, 35), 
        Transparency = l_fadeAmount_0
    }, {
        Text = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = l_Text_0, 
            TextSize = l_toastTheme_0.textSize, 
            TextColor3 = l_toastTheme_0.textColor, 
            TextTransparency = l_fadeAmount_0, 
            Font = l_Stylizer_0.font
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));