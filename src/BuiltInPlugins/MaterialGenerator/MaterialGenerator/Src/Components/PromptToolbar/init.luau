local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Pane_0 = v2.UI.Pane;
local v8 = require(l_script_FirstAncestor_0.Src.Components.LoadingButton);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v10) --[[ Line: 28 ]] --[[ Name: PromptToolbar ]]
    -- upvalues: l_Stylizer_0 (copy), l_Localization_0 (copy), v1 (copy), v3 (copy), l_Pane_0 (copy), v8 (copy)
    local v11 = v10.isDisabled or v10.isGenerating;
    local v12 = v10.isGenerating == true;
    local v13 = l_Stylizer_0:use("PromptToolbar");
    local v14 = l_Localization_0:use();
    local v15 = "";
    if not v12 then
        v15 = v14:getText("PromptToolbar", "GenerateButton");
    end;
    local v16 = v1.omit(v10, {
        "isDisabled", 
        "isGenerating", 
        "onClick", 
        "onGenerate"
    });
    return v3.createElement(l_Pane_0, v1.join(v16, {
        OnClick = v10.onClick
    }), {
        GenerateButton = v3.createElement(v8, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            Size = v13.GenerateButtonSize, 
            Text = v15, 
            isDisabled = v11, 
            isLoading = v12, 
            onClick = v10.onGenerate
        })
    });
end;