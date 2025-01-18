local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v1.useEffect;
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Src.Util.IconHelper);
local l_Localization_0 = v3.ContextServices.Localization;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Components.RibbonSpinboxController);
local v8 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagRibbonSpinboxStyleUpdate)();
local l_Styling_0 = v3.Styling;
local l_joinTags_0 = l_Styling_0.joinTags;
local l_hasTag_0 = l_Styling_0.hasTag;
local v12 = require(l_script_FirstAncestor_0.Src.Resources.PluginStyles);
local v13 = if v8 then v12:GetAttribute("SpinboxSize") else v12:GetAttribute("Size");
local l_v12_Attribute_0 = v12:GetAttribute("SizeDense");
local l_v12_Attribute_1 = v12:GetAttribute("SpinboxShortSize");
local l_UI_0 = v3.UI;
local l_TextInput_0 = l_UI_0.TextInput;
local l_Image_0 = l_UI_0.Image;
local l_Math_0 = v3.Util.Math;
return function(v20) --[[ Line: 54 ]] --[[ Name: RibbonSpinbox ]]
    -- upvalues: v1 (copy), l_Localization_0 (copy), l_useEffect_0 (copy), v8 (copy), l_Math_0 (copy), v4 (copy), l_TextInput_0 (copy), l_Image_0 (copy), v7 (copy), l_v12_Attribute_1 (copy), v13 (copy), l_hasTag_0 (copy), l_v12_Attribute_0 (copy), l_joinTags_0 (copy)
    local _, v22 = v1.useState(false);
    local v23, v24 = v1.useState(false);
    local v25, v26 = v1.useState("");
    local v27, v28 = v1.useState(false);
    local v29, v30 = v1.useState(false);
    local v31 = v20[v1.Tag];
    local v32 = l_Localization_0:use();
    local v35 = v1.useCallback(function(v33) --[[ Line: 65 ]]
        -- upvalues: v20 (copy), v32 (copy)
        local v34 = tostring(v33);
        if v20.FormatStringKey then
            return v32:getText("Plugin", v20.FormatStringKey, {
                amount = v34
            });
        else
            return v34;
        end;
    end, {
        v32.locale, 
        v20.FormatStringKey
    });
    l_useEffect_0(function() --[[ Line: 75 ]]
        -- upvalues: v23 (copy), v8 (ref), l_Math_0 (ref), v20 (copy), v26 (copy), v35 (copy), v32 (copy), v28 (copy), v30 (copy)
        if not v23 then
            if v8 then
                local v36 = l_Math_0.round(v20.Value, v20.Precision);
                v26(v35(v36));
            else
                local v37 = tostring(l_Math_0.round(v20.Value, v20.Precision));
                v26(v32:getText("Plugin", v20.FormatStringKey, {
                    amount = v37
                }));
            end;
            local v38 = l_Math_0.round(v20.Value + (v20.Increment or 1), v20.Precision);
            if v20.Minimum < v38 and v38 <= v20.Maximum then
                v28(false);
            else
                v28(true);
            end;
            local v39 = l_Math_0.round(v20.Value - (v20.Increment or 1), v20.Precision);
            if v20.Minimum < v39 and v39 <= v20.Maximum then
                v30(false);
                return;
            else
                v30(true);
            end;
        end;
    end, {
        v20.Value, 
        v32.locale
    });
    local v40 = if v20.Icon then v20.Icon:find("/") else nil;
    local v41 = if v20.Icon then if v40 then v20.Icon else v4.getPathForIcon(v20.Icon, "Small") else nil;
    return v1.createElement(l_TextInput_0, {
        LayoutOrder = v20.LayoutOrder or 1, 
        Text = v25, 
        OnFocusLost = function(v42) --[[ Line: 110 ]] --[[ Name: OnFocusLost ]]
            -- upvalues: v20 (copy), l_Math_0 (ref), v8 (ref), v26 (copy), v35 (copy), v32 (copy), v22 (copy), v24 (copy)
            local v43 = tonumber(v42);
            if v43 == nil or v43 <= v20.Minimum then
                local v44 = math.min(v20.Maximum, l_Math_0.round(v20.Value, v20.Precision));
                if v8 then
                    v26(v35(v44));
                else
                    local v45 = tostring(v44);
                    v26(v32:getText("Plugin", v20.FormatStringKey, {
                        amount = v45
                    }));
                end;
                v22(true);
            else
                local v46 = math.min(v20.Maximum, l_Math_0.round(v43, v20.Precision));
                if v8 then
                    v20.OnValueChanged(v46, v20.Uri);
                    v26(v35(v46));
                else
                    local v47 = tostring(v46);
                    v20.OnValueChanged(v46, v20.Uri);
                    v26(v32:getText("Plugin", v20.FormatStringKey, {
                        amount = v47
                    }));
                end;
                v22(false);
            end;
            v24(false);
        end, 
        OnFocused = function() --[[ Line: 148 ]] --[[ Name: OnFocused ]]
            -- upvalues: l_Math_0 (ref), v20 (copy), v26 (copy), v24 (copy)
            local v48 = tostring(l_Math_0.round(v20.Value, v20.Precision));
            v26(v48);
            v24(true);
        end, 
        OnTextChanged = function(v49) --[[ Line: 153 ]] --[[ Name: OnTextChanged ]]
            -- upvalues: v20 (copy), v22 (copy)
            if not v20.Disabled then
                local v50 = tonumber(v49);
                if v50 == nil or v20.Maximum < v50 or v50 <= v20.Minimum then
                    v22(true);
                    return;
                else
                    v22(false);
                end;
            end;
        end, 
        LeadingComponent = if v41 and v8 then l_Image_0 else nil, 
        LeadingComponentProps = if v8 then {
            Image = v41, 
            Size = UDim2.fromOffset(16, 16)
        } else nil, 
        TrailingComponent = v7, 
        TrailingComponentProps = {
            Disabled = v20.Disabled, 
            DisabledUp = v27, 
            DisabledDown = v29, 
            LayoutOrder = (v20.LayoutOrder or 1) + 1, 
            OnClickUp = function() --[[ Line: 181 ]] --[[ Name: OnClickUp ]]
                -- upvalues: v20 (copy), l_Math_0 (ref), v22 (copy)
                if not v20.Disabled then
                    local v51 = l_Math_0.round(v20.Value + (v20.Increment or 1), v20.Precision);
                    if v20.Minimum < v51 and v51 <= v20.Maximum then
                        v20.OnValueChanged(math.min(v20.Maximum, v51), v20.Uri);
                        v22(false);
                        return;
                    else
                        v22(true);
                    end;
                end;
            end, 
            OnClickDown = function() --[[ Line: 194 ]] --[[ Name: OnClickDown ]]
                -- upvalues: v20 (copy), l_Math_0 (ref), v22 (copy)
                if not v20.Disabled then
                    local v52 = l_Math_0.round(v20.Value - (v20.Increment or 1), v20.Precision);
                    if v20.Minimum < v52 and v52 <= v20.Maximum then
                        v20.OnValueChanged(math.min(v20.Maximum, v52), v20.Uri);
                        v22(false);
                        return;
                    else
                        v22(true);
                    end;
                end;
            end
        }, 
        Size = if v8 then if v20.IsShort then l_v12_Attribute_1 else v13 else if l_hasTag_0(v31, "Dense") then l_v12_Attribute_0 else v13, 
        PaneTags = v8 and "Component-RibbonSpinboxWrapper X-Row X-Middle" or "Component-Pane X-RowSpinbox X-PadSpinBox X-Middle", 
        [v1.Tag] = if v8 then l_joinTags_0("Component-RibbonSpinbox X-CornerS", v20.Disabled and "State-Disabled" or "State-Default", v23 and "State-Focus" or nil) else l_joinTags_0("Component-RibbonSpinbox Component-TextInput X-Fit", v20.Disabled and "State-Disabled" or "State-Default", l_hasTag_0(v31, "Dense") and "Dense X-Corner" or "NotDense X-CornerS", v23 and "State-Focus" or nil)
    });
end;