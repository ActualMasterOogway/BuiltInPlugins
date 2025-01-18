local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local l_SimpleTab_0 = v2.UI.SimpleTab;
local l_withForwardRef_0 = v2.Wrappers.withForwardRef;
local function v8(v7) --[[ Line: 19 ]] --[[ Name: AssetPaletteTab ]]
    -- upvalues: v3 (copy), l_SimpleTab_0 (copy), v1 (copy)
    return v3.createElement(l_SimpleTab_0, v1.Dictionary.join(v7, {
        Style = "AssetPaletteTab", 
        WrapperProps = {
            BackgroundTransparency = 1
        }
    }));
end;
if v4() then
    return (l_withForwardRef_0(v8));
else
    return v8;
end;