local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local l_Pane_0 = v1.UI.Pane;
local l_createElement_0 = v2.createElement;
return function(v6) --[[ Line: 11 ]] --[[ Name: RenameBox ]]
    -- upvalues: v2 (copy), v3 (copy), l_createElement_0 (copy), l_Pane_0 (copy)
    local v7 = v2.useState(v6.initialText);
    local v8 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: v8 (copy)
        local l_current_0 = v8.current;
        assert(l_current_0 ~= nil, "TextBox not mounted");
        l_current_0:CaptureFocus();
        l_current_0.SelectionStart = 1;
    end, {});
    local v14 = v2.useCallback(function(v10, _, v12) --[[ Line: 28 ]]
        -- upvalues: v6 (copy)
        local l_Text_0 = v10.Text;
        if v12 == nil or v12.KeyCode == Enum.KeyCode.Escape then
            v6.onCancel();
            return;
        else
            v6.onRenameComplete(l_Text_0);
            return;
        end;
    end, {
        v6.onRenameComplete, 
        v6.onCancel
    });
    local v15 = v3();
    return l_createElement_0(l_Pane_0, {
        [v2.Tag] = "X-Fill Explorer-RenameBox"
    }, {
        Background = l_createElement_0(l_Pane_0, {
            ZIndex = v15(), 
            [v2.Tag] = "Explorer-RenameBox-Background Explorer-BG-Surface100"
        }, {
            BackgroundInner = l_createElement_0(l_Pane_0, {
                [v2.Tag] = "Explorer-RenameBox-BackgroundInner"
            })
        }), 
        TextBox = l_createElement_0("TextBox", {
            ClearTextOnFocus = false, 
            Text = v7, 
            ZIndex = v15(), 
            ref = v8, 
            [v2.Event.FocusLost] = v14
        })
    });
end;