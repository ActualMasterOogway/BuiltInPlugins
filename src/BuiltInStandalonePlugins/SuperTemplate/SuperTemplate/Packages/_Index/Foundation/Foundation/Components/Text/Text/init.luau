local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactIs);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.Components.Interactable);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = require(l_script_FirstAncestor_0.Utility.useDefaultTags);
local v10 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v11 = require(l_script_FirstAncestor_0.Utility.withGuiObjectProps);
local v12 = require(l_script_FirstAncestor_0.Utility.useStyledDefaults);
local v13 = require(l_script_FirstAncestor_0.Utility.indexBindable);
local v14 = require(l_script_FirstAncestor_0.Utility.GuiObjectChildren);
local v15 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v16 = require(script.Parent.FontScales);
local v17 = {
    AutoLocalize = false, 
    AutoButtonColor = false, 
    BorderSizePixel = 0, 
    isDisabled = false
};
return v3.memo(v3.forwardRef(function(v18, v19) --[[ Line: 53 ]] --[[ Name: Text ]]
    -- upvalues: v2 (copy), v12 (copy), v17 (copy), v8 (copy), v9 (copy), v15 (copy), v3 (copy), v4 (copy), v16 (copy), v11 (copy), v13 (copy), v6 (copy), v5 (copy), v10 (copy), v14 (copy)
    local v20 = if v2.FoundationStylingPolyfill then v12("Text", v18.tag, "gui-object-defaults text-defaults text-size-defaults text-color-defaults", v17) else nil;
    local v21 = v8(v18, if v2.FoundationStylingPolyfill then v20 else v17);
    local v22 = true;
    if v21.onStateChanged == nil then
        v22 = v21.onActivated ~= nil;
    end;
    local v23 = v9(v21.tag, "gui-object-defaults text-defaults text-size-defaults text-color-defaults");
    local v24 = v15(v23);
    local v26 = v3.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v21 (copy), v4 (ref)
        local v25 = if v21.fontStyle ~= nil then v21.fontStyle.Font else nil;
        if typeof(v25) == "table" and not v4.isBinding(v25) then
            return Font.new(v25.Family, v25.Weight, v25.Style);
        elseif typeof(v25) == "EnumItem" then
            return Font.fromEnum(v25);
        else
            return v25;
        end;
    end, {
        v21.fontStyle
    });
    local v29 = v3.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: v21 (copy), v26 (copy), v4 (ref), v16 (ref)
        if v21.fontStyle == nil or v21.fontStyle.LineHeight == nil or v21.fontStyle.FontSize == nil or v26 == nil then
            return 0;
        else
            local _ = nil;
            local v28 = v16[if v4.isBinding(v26) then v26:getValue().Family else v26.Family];
            if v28 == nil then
                return 0;
            else
                return (v21.fontStyle.FontSize / v28 * (v21.fontStyle.LineHeight * v28) - v21.fontStyle.FontSize) / 2;
            end;
        end;
    end, {
        v26, 
        v21.fontStyle
    });
    if v21.padding == nil and v29 ~= 0 then
        v21.padding = Vector2.new(0, v29);
    end;
    local v30 = v22 and "TextButton" or "TextLabel";
    local v31 = v11(v21, {
        AutoButtonColor = if v30 == "TextButton" then v21.AutoButtonColor else nil, 
        FontFace = v26, 
        LineHeight = if v21.fontStyle ~= nil then v21.fontStyle.LineHeight else nil, 
        RichText = v21.RichText, 
        Text = v21.Text, 
        TextColor3 = if v21.textStyle then v13(v21.textStyle, "Color3") else nil, 
        TextTransparency = if v21.textStyle then v13(v21.textStyle, "Transparency") else nil, 
        TextDirection = v21.TextDirection, 
        TextScaled = v21.TextScaled, 
        TextSize = if v21.fontStyle ~= nil then v21.fontStyle.FontSize else nil, 
        TextTruncate = v21.TextTruncate, 
        TextWrapped = v21.TextWrapped, 
        TextXAlignment = v21.TextXAlignment, 
        TextYAlignment = v21.TextYAlignment, 
        ref = v19, 
        [v3.Tag] = v24
    });
    local v32 = if v22 then v6 else v30;
    local v33 = if v22 then v5.Dictionary.union(v31, {
        component = v30, 
        onActivated = v21.onActivated, 
        onStateChanged = v21.onStateChanged, 
        stateLayer = if v21.onStateChanged then v21.stateLayer else {
            affordance = v10.None
        }, 
        isDisabled = v21.isDisabled
    }) else v31;
    return v3.createElement(v32, v33, v14(v21));
end));