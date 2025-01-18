local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TruncatedTextLabel_0 = l_UI_0.TruncatedTextLabel;
return function(v8) --[[ Line: 13 ]] --[[ Name: StringProperty ]]
    -- upvalues: v2 (copy), l_TruncatedTextLabel_0 (copy), l_Tooltip_0 (copy), l_Pane_0 (copy), l_TextInput_0 (copy)
    if v8.Editable ~= nil and not v8.Editable then
        return v2.createElement(l_TruncatedTextLabel_0, {
            LayoutOrder = v8.LayoutOrder, 
            Size = v8.Size, 
            SuffixLength = 20, 
            Text = v8.Value, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            Tooltip = v2.createElement(l_Tooltip_0, {
                Text = v8.Value
            })
        });
    else
        return v2.createElement(l_Pane_0, {
            Size = v8.Size, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v8.LayoutOrder
        }, {
            v2.createElement(l_TextInput_0, {
                AutomaticSize = Enum.AutomaticSize.None, 
                OnTextChanged = v8.OnSetItem, 
                Text = v8.Value
            })
        });
    end;
end;