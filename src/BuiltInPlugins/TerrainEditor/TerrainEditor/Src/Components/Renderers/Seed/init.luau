local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_IconButton_0 = v1.UI.IconButton;
local l_Pane_0 = v1.UI.Pane;
local l_TextInput_0 = v1.UI.TextInput;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local v8 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local function _(v10) --[[ Line: 29 ]] --[[ Name: clampedValue ]]
    -- upvalues: v8 (copy)
    return (math.floor((math.clamp(v10, 1, v8.MaxNoiseValue))));
end;
return function(v12) --[[ Line: 33 ]] --[[ Name: SeedRenderer ]]
    -- upvalues: l_Stylizer_0 (copy), v8 (copy), v2 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), l_StyleModifier_0 (copy), l_IconButton_0 (copy)
    local v13 = l_Stylizer_0:use("SeedRenderer");
    if v12.Value ~= math.floor((math.clamp(v12.Value, 1, v8.MaxNoiseValue))) then
        v12.OnChanged((math.floor((math.clamp(v12.Value, 1, v8.MaxNoiseValue)))));
    end;
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        Size = UDim2.new(1, 0, 0, v13.Height), 
        Spacing = v13.Spacing
    }, {
        Edit = v2.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v13.Height - v13.Spacing, 0, v13.Height)
        }, {
            Button = v2.createElement(l_TextInput_0, {
                OnFocusLost = function(v14) --[[ Line: 50 ]] --[[ Name: OnFocusLost ]]
                    -- upvalues: v8 (ref), v12 (copy)
                    if v14 then
                        local v15 = tonumber(v14);
                        if not v15 or v15 ~= v15 or math.floor((math.clamp(v15, 1, v8.MaxNoiseValue))) == v12.Value and v15 ~= v12.Value then
                            v12.OnChanged(v15);
                            return;
                        else
                            v12.OnChanged((math.floor((math.clamp(v15, 1, v8.MaxNoiseValue)))));
                        end;
                    end;
                end, 
                Size = UDim2.fromScale(1, 1), 
                StyleModifier = if v12.HasError then l_StyleModifier_0.Error else nil, 
                Text = v12.Value
            })
        }), 
        Shuffle = v2.createElement(l_IconButton_0, {
            LayoutOrder = 2, 
            OnClick = function() --[[ Line: 71 ]] --[[ Name: OnClick ]]
                -- upvalues: v12 (copy), v8 (ref)
                v12.OnChanged(math.floor(math.random() * (v8.MaxNoiseValue - 1)) + 1);
            end, 
            LeftIcon = v13.Icon, 
            IconSize = v13.Height - 8, 
            Size = UDim2.fromOffset(v13.Height, v13.Height)
        })
    });
end;