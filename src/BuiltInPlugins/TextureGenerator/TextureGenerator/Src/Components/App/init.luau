local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local l_ContextStack_0 = v2.ContextStack;
local l_useToggleState_0 = v2.useToggleState;
local v5 = require(l_script_FirstAncestor_0.Src.Components.GenerationsProvider);
local v6 = require(l_script_FirstAncestor_0.Src.Components.OptionsProvider);
local v7 = require(l_script_FirstAncestor_0.Src.Components.PreviewProvider);
local v8 = require(l_script_FirstAncestor_0.Src.Components.Screens.GenerationScreen);
local v9 = require(l_script_FirstAncestor_0.Src.Components.Screens.TermsOfServiceScreen);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v11 = game:DefineFastFlag("TextureGeneratorAddTermsOfServicePage", false);
return function(v12) --[[ Line: 21 ]] --[[ Name: App ]]
    -- upvalues: v11 (copy), l_useToggleState_0 (copy), v10 (copy), v1 (copy), v9 (copy), l_ContextStack_0 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
    if v11 then
        local v13 = l_useToggleState_0(v12.Plugin:GetSetting(v10.TEXTURE_GENERATOR_LEGAL_ACCEPT));
        if not v13.enabled then
            return v1.createElement(v9, {
                Plugin = v12.Plugin, 
                AcceptedButtonEnable = v13.enable
            });
        else
            return v1.createElement(l_ContextStack_0, {
                providers = {
                    v1.createElement(v5), 
                    v1.createElement(v6), 
                    v1.createElement(v7)
                }
            }, v1.createElement(v8));
        end;
    else
        return v1.createElement(l_ContextStack_0, {
            providers = {
                v1.createElement(v5), 
                v1.createElement(v6), 
                v1.createElement(v7)
            }
        }, v1.createElement(v8));
    end;
end;