local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Components_0 = l_Parent_0.Components;
local v3 = require(l_Parent_1.Framework);
local v4 = require(l_Parent_1.Dash);
local l_Util_0 = v3.Util;
local l_deepCopy_0 = l_Util_0.deepCopy;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_Style_0 = v3.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_makeTheme_0 = l_Style_0.makeTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_getRawComponentStyle_0 = l_Style_0.getRawComponentStyle;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
local v14 = require(l_Parent_0.Flags.getFFlagMaterialPickerUIChanges);
local v15 = nil;
if v14() then
    local v16 = l_getRawComponentStyle_0("Button");
    local v17 = l_deepCopy_0(v16["&RoundPrimary"]);
    v17.BackgroundStyle.Color = l_StyleKey_0.BackgroundDefault;
    v17[l_StyleModifier_0.Hover].BackgroundStyle.Color = l_StyleKey_0.ButtonHover;
    local v18 = l_deepCopy_0(v16["&RoundActive"]);
    v18.BackgroundStyle.Color = l_StyleKey_0.BackgroundDefault;
    local v19 = v4.join(v16, {
        ["&RoundApplied"] = v17, 
        ["&RoundActiveApplied"] = v18
    });
    v15 = {
        [l_ComponentSymbols_0.Button] = v19
    };
else
    v15 = {};
end;
return {
    new = function(v20, v21) --[[ Line: 50 ]] --[[ Name: new ]]
        -- upvalues: l_StudioTheme_0 (copy), l_makeTheme_0 (copy), l_Components_0 (copy), v15 (ref)
        local v22 = l_StudioTheme_0.new(v20, v21);
        return l_makeTheme_0(l_Components_0, v15, v22)();
    end, 
    mock = function(v23) --[[ Line: 56 ]] --[[ Name: mock ]]
        -- upvalues: l_StudioTheme_0 (copy), l_makeTheme_0 (copy), l_Components_0 (copy), v15 (ref)
        local v24 = l_StudioTheme_0.mock(v23);
        return l_makeTheme_0(l_Components_0, v15, v24)();
    end
};