local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v1.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local v9 = require(l_script_FirstAncestor_0.Src.Components.PromptToolbar);
local v10 = require(l_script_FirstAncestor_0.Src.Util.GenerationContext);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v12) --[[ Line: 27 ]] --[[ Name: Prompt ]]
    -- upvalues: l_Stylizer_0 (copy), v2 (copy), v10 (copy), l_Localization_0 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), v9 (copy)
    local v13 = l_Stylizer_0:use("Prompt");
    local v14 = v2.useContext(v10);
    local l_generateMaterialVariants_0 = v14.generateMaterialVariants;
    local l_isGenerating_0 = v14.isGenerating;
    local l_promptText_0 = v14.promptText;
    local l_setPromptText_0 = v14.setPromptText;
    local v19 = v2.useRef(nil);
    local v21 = v2.useCallback(function(v20) --[[ Line: 38 ]]
        -- upvalues: l_promptText_0 (copy), l_generateMaterialVariants_0 (copy)
        if l_promptText_0 ~= "" then
            l_generateMaterialVariants_0(v20);
            return;
        else
            warn("Empty prompt text");
            return;
        end;
    end, {
        l_generateMaterialVariants_0, 
        l_promptText_0
    });
    local v22 = l_Localization_0:use();
    local v23 = v12.isDisabled or l_isGenerating_0 or l_promptText_0 == "";
    local v24 = v12.isDisabled or l_isGenerating_0;
    return v2.createElement(l_Pane_0, {
        BackgroundColor = v13.BackgroundColor, 
        LayoutOrder = v12.LayoutOrder, 
        Padding = v13.Padding, 
        Size = v12.Size
    }, {
        PromptTextInput = v2.createElement(l_TextInput_0, {
            BottomComponent = v9, 
            BottomComponentProps = {
                Size = v13.PromptToolbarSize, 
                isDisabled = v23, 
                isGenerating = l_isGenerating_0, 
                onClick = function() --[[ Line: 63 ]] --[[ Name: onClick ]]
                    -- upvalues: v19 (copy)
                    if v19 then
                        local l_current_0 = v19.current;
                        if l_current_0 then
                            l_current_0:CaptureFocus();
                        end;
                    end;
                end, 
                onGenerate = function() --[[ Line: 71 ]] --[[ Name: onGenerate ]]
                    -- upvalues: v21 (copy)
                    v21("ButtonClick");
                end
            }, 
            Disabled = v24, 
            MultiLine = v13.MultiLine, 
            OnEnter = function() --[[ Line: 77 ]] --[[ Name: OnEnter ]]
                -- upvalues: v21 (copy)
                v21("KeyboardEnter");
            end, 
            OnTextChanged = l_setPromptText_0, 
            PlaceholderText = v22:getText(script.Name, "PromptPlaceholderText"), 
            ForwardRef = v19, 
            Size = UDim2.fromScale(1, 1), 
            Text = l_promptText_0
        })
    });
end;