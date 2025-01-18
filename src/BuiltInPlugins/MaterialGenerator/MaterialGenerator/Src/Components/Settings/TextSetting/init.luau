local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.React);
local l_withContext_0 = v2.ContextServices.withContext;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = v2.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_prioritize_0 = l_Util_0.prioritize;
local v13 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v14 = game:DefineFastFlag("MaterialGeneratorFixNameSetting", false);
local v15 = v3.PureComponent:extend("TextSetting");
v15.defaultProps = {
    Disabled = false
};
v15.init = function(v16) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v3 (copy), v1 (copy), v14 (copy)
    if v13() then
        v16.textInputRef = v3.createRef();
        v16.focusLost = function(v17, v18) --[[ Line: 60 ]]
            -- upvalues: v16 (copy), v1 (ref), v14 (ref)
            local l_props_0 = v16.props;
            if not v17 or v1.trim(v17) == "" then
                local l_current_0 = v16.textInputRef.current;
                if l_current_0 then
                    l_current_0.Text = l_props_0.Value;
                end;
                return;
            else
                local l_v17_0 = v17;
                if v14 then
                    if l_props_0.OnValueChanged then
                        if l_props_0.MaxLength and string.len(l_v17_0) > l_props_0.MaxLength then
                            l_v17_0 = string.sub(l_v17_0, 1, l_props_0.MaxLength);
                            local l_current_1 = v16.textInputRef.current;
                            if l_current_1 then
                                l_current_1.Text = l_v17_0;
                            end;
                        end;
                        l_props_0.OnValueChanged(l_v17_0);
                        return;
                    end;
                elseif v18 and l_props_0.OnValueChanged then
                    if l_props_0.MaxLength and string.len(l_v17_0) > l_props_0.MaxLength then
                        l_v17_0 = string.sub(l_v17_0, 1, l_props_0.MaxLength);
                        local l_current_2 = v16.textInputRef.current;
                        if l_current_2 then
                            l_current_2.Text = l_v17_0;
                        end;
                    end;
                    l_props_0.OnValueChanged(l_v17_0);
                end;
                return;
            end;
        end;
        return;
    else
        v16.valueChanged = function(v24) --[[ Line: 96 ]]
            -- upvalues: v16 (copy)
            local l_props_1 = v16.props;
            if l_props_1.OnValueChanged then
                l_props_1.OnValueChanged(v24);
            end;
        end;
        return;
    end;
end;
v15.render = function(v26) --[[ Line: 105 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), l_prioritize_0 (copy), l_StyleModifier_0 (copy), v3 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_TextInput_0 (copy)
    local l_props_2 = v26.props;
    local v28 = nil;
    v28 = if v13() then {
        HorizontalSpacing = 16, 
        Size = UDim2.new(1, 0, 0, 30), 
        ValueLabelWidth = 30
    } else l_props_2.Stylizer.Setting;
    local l_Disabled_0 = l_props_2.Disabled;
    local l_HorizontalSpacing_0 = v28.HorizontalSpacing;
    local l_LabelWidth_0 = l_props_2.LabelWidth;
    local v32 = l_prioritize_0(l_props_2.Size, v28.Size);
    local v33 = if l_Disabled_0 then l_StyleModifier_0.Disabled else nil;
    local l_Value_0 = l_props_2.Value;
    local v35 = l_LabelWidth_0 + l_HorizontalSpacing_0;
    return v3.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_2.LayoutOrder, 
        Size = v32, 
        Spacing = l_HorizontalSpacing_0, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Label = v3.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, l_LabelWidth_0, 1, 0), 
            StyleModifier = v33, 
            Text = l_props_2.Text, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        TextInput = v3.createElement(l_TextInput_0, {
            Disabled = l_Disabled_0, 
            ForwardRef = v26.textInputRef, 
            LayoutOrder = 2, 
            OnTextChanged = if v13() then nil else v26.valueChanged, 
            OnFocusLost = if v13() then v26.focusLost else nil, 
            Size = UDim2.new(1, -v35, 1, 0), 
            Text = l_Value_0
        })
    });
end;
return l_withContext_0({
    Stylizer = l_Stylizer_0
})(v15);