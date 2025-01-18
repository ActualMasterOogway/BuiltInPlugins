local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local l_joinTags_0 = v2.Styling.joinTags;
local l_fflagAnnotationsMaxTextLength_0 = v3.fflagAnnotationsMaxTextLength;
return v1.forwardRef(function(v6, v7) --[[ Line: 27 ]]
    -- upvalues: v1 (copy), v3 (copy), l_joinTags_0 (copy), l_fflagAnnotationsMaxTextLength_0 (copy)
    local v8 = v1.useRef(nil);
    local v9 = v1.useRef(nil);
    local v10, v11 = v1.useState(38);
    v1.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v7 (copy), v8 (copy), v3 (ref)
        if v7 then
            v7.current = v8.current;
        end;
        if v3.fflagAnnotationsFocusTextBox and v8.current then
            local l_Text_0 = v8.current.Text;
            v8.current:CaptureFocus();
            v8.current.Text = l_Text_0;
            v8.current.CursorPosition = 1;
        end;
    end, {
        v7, 
        v6.Key
    });
    v1.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v8 (copy), v11 (copy), v10 (copy)
        if v8.current then
            if not v8.current.TextFits and v8.current.TextBounds.X <= v8.current.AbsoluteSize.X then
                v11((math.min(500, v10 + 27)));
                return;
            else
                v11(math.max(18, v8.current.TextBounds.Y) + 20);
            end;
        end;
    end, {
        v8.current, 
        v6.Text, 
        v10
    });
    v1.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v9 (copy), v8 (copy), v10 (copy)
        if v9.current and v8.current and v8.current.CursorPosition >= string.len(v8.current.Text) then
            v9.current.CanvasPosition = Vector2.new(0, v10);
        end;
    end, {
        v8.current, 
        v9.current, 
        v10
    });
    return v1.createElement("CanvasGroup", {
        LayoutOrder = v6.LayoutOrder, 
        Size = UDim2.new(1, -38, 0, 0), 
        [v1.Tag] = l_joinTags_0("Component-TextInput", string.len(v6.Text) > l_fflagAnnotationsMaxTextLength_0 and "Error" or nil)
    }, {
        ScrollingFrame = v1.createElement("ScrollingFrame", {
            ref = v9, 
            Size = UDim2.new(1, 0, 0, (math.min(v10, 250))), 
            CanvasSize = UDim2.new(1, 0, 0, v10)
        }, {
            InputBox = v1.createElement("TextBox", {
                ref = v8, 
                Text = v6.Text, 
                PlaceholderText = v6.PlaceholderText, 
                Size = UDim2.new(1, 0, 0, v10), 
                TextEditable = not v6.Disabled, 
                [v1.Change.Text] = function(v13) --[[ Line: 81 ]]
                    -- upvalues: l_fflagAnnotationsMaxTextLength_0 (ref), v6 (copy)
                    v13.Text = v13.Text:gsub("%c", "");
                    if string.len(v13.Text) >= l_fflagAnnotationsMaxTextLength_0 + 50 then
                        v13.Text = v6.Text;
                        return;
                    else
                        v6.OnTextChanged(v13.Text);
                        return;
                    end;
                end, 
                [v1.Event.Focused] = function() --[[ Line: 90 ]]
                    -- upvalues: v6 (copy)
                    if v6.OnFocusChanged then
                        v6.OnFocusChanged(true);
                    end;
                end, 
                [v1.Event.FocusLost] = function() --[[ Line: 95 ]]
                    -- upvalues: v6 (copy)
                    if v6.OnFocusChanged then
                        v6.OnFocusChanged(false);
                    end;
                end, 
                [v1.Tag] = v6.Disabled and "Disabled" or nil
            })
        })
    });
end);