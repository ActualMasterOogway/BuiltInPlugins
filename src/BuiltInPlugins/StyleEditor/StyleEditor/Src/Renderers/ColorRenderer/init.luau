local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useRef_0 = v1.useRef;
local l_useEffect_0 = v1.useEffect;
local v5 = require(l_Parent_0.Packages.Framework);
local l_ColorPicker_0 = v5.UI.ColorPicker;
local l_IconButton_0 = v5.UI.IconButton;
local l_Pane_0 = v5.UI.Pane;
local l_TextInput_0 = v5.UI.TextInput;
local v10 = require(l_Parent_0.Src.Util.colorFromString);
local v11 = require(l_Parent_0.Src.Renderers.Modal);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("Icon16");
local function _(v15) --[[ Line: 41 ]] --[[ Name: colorToHexSafe ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 42 ]]
        -- upvalues: v15 (copy)
        return v15:ToHex();
    end);
    if l_status_0 then
        return "#" .. l_result_0;
    else
        return "#";
    end;
end;
return function(v19) --[[ Line: 53 ]] --[[ Name: ColorRenderer ]]
    -- upvalues: l_useState_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v10 (copy), v1 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), l_IconButton_0 (copy), l_Attribute_0 (copy), v11 (copy), l_ColorPicker_0 (copy)
    local v20, v21 = l_useState_0(false);
    local v22, v23 = l_useState_0(nil);
    local l_l_useState_0_0 = l_useState_0;
    local l_Value_0 = v19.Value;
    local l_l_Value_0_0 = l_Value_0 --[[ copy: 7 -> 16 ]];
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 42 ]]
        -- upvalues: l_l_Value_0_0 (copy)
        return l_l_Value_0_0:ToHex();
    end);
    local v29;
    l_l_useState_0_0, v29 = l_l_useState_0_0(if l_status_1 then "#" .. l_result_1 else "#");
    l_Value_0 = l_useRef_0(nil);
    l_status_1 = l_useRef_0(tick());
    l_useEffect_0(function() --[[ Line: 60 ]]
        -- upvalues: v29 (copy), v19 (copy)
        local l_v29_0 = v29;
        local l_Value_1 = v19.Value;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_Value_1 (copy)
            return l_Value_1:ToHex();
        end);
        l_v29_0(if l_status_2 then "#" .. l_result_2 else "#");
    end, {
        v19.Value
    });
    l_result_1 = function() --[[ Line: 64 ]] --[[ Name: onOpen ]]
        -- upvalues: v21 (copy)
        v21(true);
    end;
    local function _() --[[ Line: 68 ]] --[[ Name: onClose ]]
        -- upvalues: v21 (copy)
        v21(false);
    end;
    local function v35() --[[ Line: 72 ]] --[[ Name: onFocusLost ]]
        -- upvalues: v21 (copy)
        v21(false);
    end;
    local function v43(v36, _) --[[ Line: 76 ]] --[[ Name: onTextInputFocusLost ]]
        -- upvalues: v10 (ref), v19 (copy), v29 (copy)
        local v38 = v10(v36);
        if v38 and v38 ~= v19.Value then
            v19.OnChanged(v38);
            return;
        else
            local l_v29_1 = v29;
            local l_Value_2 = v19.Value;
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 42 ]]
                -- upvalues: l_Value_2 (copy)
                return l_Value_2:ToHex();
            end);
            l_v29_1(if l_status_3 then "#" .. l_result_3 else "#");
            return;
        end;
    end;
    local function v46(v44) --[[ Line: 86 ]] --[[ Name: onTextInputChanged ]]
        -- upvalues: v10 (ref), v29 (copy), v23 (copy)
        local v45 = v10(v44);
        v29(v44);
        if v45 then
            v23(nil);
            return;
        else
            v23("Error: invalid color");
            return;
        end;
    end;
    local function v48(v47) --[[ Line: 98 ]] --[[ Name: onColorChanged ]]
        -- upvalues: v19 (copy), l_status_1 (copy)
        if v47 ~= v19.Value and (l_status_1.current or 0) + 0.05 < tick() then
            l_status_1.current = tick();
            v19.OnChanged(v47);
        end;
    end;
    local v49 = v22 ~= nil;
    return v1.createElement(l_Pane_0, {}, {
        Input = v1.createElement(l_TextInput_0, {
            Disabled = v19.Disabled, 
            LeadingComponent = l_IconButton_0, 
            LeadingComponentProps = {
                BackgroundColor = v19.Value, 
                Size = l_Attribute_0, 
                OnClick = l_result_1, 
                ForwardRef = l_Value_0
            }, 
            OnFocusLost = v43, 
            OnTextChanged = v46, 
            Size = if v19.AutomaticSize then UDim2.new(1, 0, 0, v19.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
            Text = l_l_useState_0_0, 
            [v1.Tag] = v49 and "PropertyCellError" or nil
        }), 
        Modal = v1.createElement(v11, {
            Open = v20, 
            MaxSize = Vector2.new(325, 250), 
            MinSize = Vector2.new(325, 250), 
            ObjectRef = l_Value_0, 
            OnFocusLost = v35
        }, {
            Container = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fit"
            }, {
                ColorPicker = v1.createElement(l_ColorPicker_0, {
                    Size = UDim2.fromOffset(325, 225), 
                    Color = v19.Value, 
                    OnColorChanged = v48
                })
            })
        })
    });
end;