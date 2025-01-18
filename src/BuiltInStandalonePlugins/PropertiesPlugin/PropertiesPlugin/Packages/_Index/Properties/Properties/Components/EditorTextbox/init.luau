local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return function(v2) --[[ Line: 5 ]] --[[ Name: EditorTextbox ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(false);
    local v5 = v1.useRef(false);
    local l_text_0 = v2.text;
    local v7 = "Properties-Rounded";
    if v3 then
        v7 = v7 .. " Properties-Editing";
    end;
    return v1.createElement("CanvasGroup", {
        [v1.Tag] = v7, 
        Size = v2.size, 
        Position = v2.position, 
        BackgroundTransparency = 1
    }, {
        Chip = v2.chipColor and v1.createElement("Frame", {
            Size = UDim2.new(0, 1, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v2.chipColor, 
            ZIndex = 2
        }), 
        Textbox = v1.createElement("TextBox", {
            [v1.Tag] = "Properties-Textbox", 
            Text = l_text_0, 
            ClearTextOnFocus = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.fromScale(1, 1), 
            TextEditable = v2.textEditable, 
            [v1.Event.FocusLost] = function(v8, _) --[[ Line: 44 ]]
                -- upvalues: v3 (copy), v5 (copy), v4 (copy), v2 (copy), l_text_0 (copy)
                if v3 then
                    v5.current = true;
                    v4(false);
                    if not v2.finishEditing(v8.Text) then
                        v8.Text = l_text_0;
                    end;
                end;
            end, 
            [v1.Event.Focused] = function() --[[ Line: 54 ]]
                -- upvalues: v2 (copy), v5 (copy), v4 (copy)
                if v2.textEditable then
                    v5.current = true;
                    v4(true);
                    task.spawn(v2.beginEditingAsync);
                end;
            end, 
            [v1.Event.InputChanged] = function(_, _) --[[ Line: 61 ]]
                -- upvalues: v3 (copy), v5 (copy)
                if v3 then
                    v5.current = false;
                end;
            end, 
            [v1.Event.InputEnded] = function(v12, v13) --[[ Line: 68 ]]
                -- upvalues: v3 (copy), v5 (copy)
                if v3 and (v13.UserInputType == Enum.UserInputType.MouseButton1 or v13.UserInputType == Enum.UserInputType.Touch) and v5.current then
                    v5.current = false;
                    v12.SelectionStart = 0;
                    v12.CursorPosition = #v12.Text + 1;
                end;
            end
        })
    });
end;