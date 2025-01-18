local v0 = require(script.Parent.Internal.RequireRoact);
local v1 = v0.PureComponent:extend("TextEntry");
v1.init = function(v2) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: v0 (copy)
    v2.textBoxRef = v0.createRef();
    v2.onTextChanged = function(v3) --[[ Line: 20 ]]
        -- upvalues: v2 (copy)
        if v2.props.HorizontalAlignment == nil then
            if v3.TextFits then
                v3.TextXAlignment = Enum.TextXAlignment.Left;
            else
                v3.TextXAlignment = Enum.TextXAlignment.Right;
            end;
        end;
        if v3.Text ~= v2.props.Text then
            v2.props.SetText(v3.Text);
        end;
    end;
    v2.mouseEnter = function() --[[ Line: 34 ]]
        -- upvalues: v2 (copy)
        v2.props.HoverChanged(true);
    end;
    v2.mouseLeave = function() --[[ Line: 37 ]]
        -- upvalues: v2 (copy)
        v2.props.HoverChanged(false);
    end;
end;
v1.render = function(v4) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v0 (copy)
    local v5 = true;
    if v4.props.Enabled ~= nil then
        v5 = v4.props.Enabled;
    end;
    return v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        Text = v0.createElement("TextBox", {
            Visible = v4.props.Visible, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClearTextOnFocus = false, 
            TextEditable = v5, 
            Font = Enum.Font.SourceSans, 
            TextSize = 22, 
            TextColor3 = v4.props.TextColor3, 
            Text = v4.props.Text, 
            PlaceholderText = v4.props.PlaceholderText, 
            TextXAlignment = v4.props.HorizontalAlignment or Enum.TextXAlignment.Left, 
            TextTransparency = not v5 and 0.5 or 0, 
            [v0.Ref] = v4.textBoxRef, 
            [v0.Event.MouseEnter] = v4.mouseEnter, 
            [v0.Event.MouseLeave] = v4.mouseLeave, 
            [v0.Event.Focused] = function() --[[ Line: 72 ]]
                -- upvalues: v4 (copy)
                v4.props.FocusChanged(true);
            end, 
            [v0.Event.FocusLost] = function(v6, v7) --[[ Line: 76 ]]
                -- upvalues: v4 (copy)
                v6.TextXAlignment = v4.props.HorizontalAlignment or Enum.TextXAlignment.Left;
                v4.props.FocusChanged(false, v7);
            end, 
            [v0.Change.Text] = v4.onTextChanged
        })
    });
end;
return v1;