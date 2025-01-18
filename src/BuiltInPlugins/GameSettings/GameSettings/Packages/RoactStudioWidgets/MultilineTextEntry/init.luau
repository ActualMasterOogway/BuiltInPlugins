local l_TextService_0 = game:GetService("TextService");
local v1 = require(script.Parent.Internal.RequireRoact);
local v2 = require(script.Parent.StyledScrollingFrame);
local v3 = v1.PureComponent:extend("MultilineTextEntry");
v3.init = function(v4) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_TextService_0 (copy)
    v4.frameRef = v1.createRef();
    v4.textBoxRef = v1.createRef();
    v4.textConnections = nil;
    v4.updateCanvas = function() --[[ Line: 31 ]]
        -- upvalues: v4 (copy), l_TextService_0 (ref)
        local l_current_0 = v4.frameRef.current;
        local v6 = l_current_0.AbsoluteSize.x - 9;
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v4.props.Text, 22, Enum.Font.SourceSans, Vector2.new(v6, 10000));
        l_current_0.CanvasSize = UDim2.new(0, 0, 0, l_l_TextService_0_TextSize_0.y);
    end;
    v4.textChanged = function(v8) --[[ Line: 38 ]]
        -- upvalues: v4 (copy)
        if v8.Text ~= v4.props.Text then
            v4.props.SetText(v8.Text);
        end;
    end;
    v4.mouseEnter = function() --[[ Line: 44 ]]
        -- upvalues: v4 (copy)
        v4.props.HoverChanged(true);
    end;
    v4.mouseLeave = function() --[[ Line: 47 ]]
        -- upvalues: v4 (copy)
        v4.props.HoverChanged(false);
    end;
end;
v3.didMount = function(v9) --[[ Line: 52 ]] --[[ Name: didMount ]]
    local l_current_1 = v9.textBoxRef.current;
    local l_current_2 = v9.frameRef.current;
    v9.textConnections = {
        l_current_1:GetPropertyChangedSignal("Text"):connect(v9.updateCanvas), 
        l_current_2:GetPropertyChangedSignal("AbsoluteSize"):connect(v9.updateCanvas)
    };
    v9.updateCanvas();
end;
v3.willUnmount = function(v12) --[[ Line: 62 ]] --[[ Name: willUnmount ]]
    for _, v14 in ipairs(v12.textConnections) do
        v14:Disconnect();
    end;
    v12.textConnections = nil;
end;
v3.render = function(v15) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Visible_0 = v15.props.Visible;
    local l_Text_0 = v15.props.Text;
    local l_TextColor3_0 = v15.props.TextColor3;
    local v19 = nil;
    local v20 = true;
    if v15.props.Enabled ~= nil then
        v20 = v15.props.Enabled;
    end;
    if not v20 then
        v19 = {
            v1.createElement("ImageButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ImageTransparency = 1
            })
        };
    end;
    return v1.createElement(v2, {
        Size = UDim2.new(1, 9, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        ShowBackground = false, 
        [v1.Ref] = v15.frameRef
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 9)
        }), 
        Text = v1.createElement("TextBox", {
            Visible = l_Visible_0, 
            MultiLine = true, 
            TextWrapped = true, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClearTextOnFocus = false, 
            Font = Enum.Font.SourceSans, 
            TextSize = 22, 
            TextXAlignment = v15.props.HorizontalAlignment or Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = l_TextColor3_0, 
            Text = l_Text_0, 
            PlaceholderText = v15.props.PlaceholderText, 
            TextTransparency = not v20 and 0.5 or 0, 
            [v1.Event.Focused] = function() --[[ Line: 117 ]]
                -- upvalues: v15 (copy)
                v15.props.FocusChanged(true);
            end, 
            [v1.Event.FocusLost] = function(_, v22) --[[ Line: 121 ]]
                -- upvalues: v15 (copy)
                v15.props.FocusChanged(false, v22);
            end, 
            [v1.Event.MouseEnter] = v15.mouseEnter, 
            [v1.Event.MouseLeave] = v15.mouseLeave, 
            [v1.Change.Text] = v15.textChanged, 
            [v1.Ref] = v15.textBoxRef
        }, v19)
    });
end;
return v3;