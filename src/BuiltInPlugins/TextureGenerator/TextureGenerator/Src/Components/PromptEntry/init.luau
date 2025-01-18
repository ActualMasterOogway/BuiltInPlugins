local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v9 = require(l_Hooks_0.useSelectedMeshParts);
local _ = v3.Style.Stylizer;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_TextInput_0 = l_UI_0.TextInput;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v18 = require(l_Util_0.createHashFromMeshParts);
local v19 = require(l_Util_0.fetchAndSetQuotas);
local v20 = require(l_Util_0.GenerationsContext);
local v21 = require(l_Util_0.OptionsContext);
local v22 = require(l_Util_0.PreviewsContext);
local v23 = require(l_Util_0.createOptionsFromContext);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetryIncludeLocalId);
local function v27(v26) --[[ Line: 42 ]] --[[ Name: TextInputToolbar ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), l_Tooltip_0 (copy)
    return v2.createElement(l_Pane_0, {
        Size = v26.Size, 
        LayoutOrder = v26.LayoutOrder
    }, {
        SendButton = v2.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            OnClick = v26.OnClick, 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.fromOffset(100, 30), 
            Style = "RoundPrimary", 
            StyleModifier = if not v26.Enabled then l_StyleModifier_0.Disabled else nil, 
            Text = v26.PreviewButtonText
        }, {
            QuotaTooltip = v2.createElement(l_Tooltip_0, {
                Text = v26.QuotaTooltipText, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
return function(v28) --[[ Line: 64 ]] --[[ Name: PromptEntry ]]
    -- upvalues: l_Analytics_0 (copy), l_Localization_0 (copy), v9 (copy), v2 (copy), v21 (copy), v20 (copy), v22 (copy), v23 (copy), v18 (copy), v24 (copy), v25 (copy), l_TextureGenerationService_0 (copy), v19 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), v27 (copy)
    local v29 = l_Analytics_0:use();
    local v30 = l_Localization_0:use();
    local v31 = v9();
    local v32 = v30:getText("General", "Preview");
    local v33 = v2.useContext(v21);
    local v34 = v2.useRef(v33.promptText);
    local v35, v36 = v2.useState(function() --[[ Line: 74 ]]
        -- upvalues: v34 (copy)
        return v34.current ~= "";
    end);
    local v37, v38 = v2.useState(false);
    local v40 = v2.useCallback(function(v39) --[[ Line: 80 ]]
        -- upvalues: v34 (copy), v33 (copy)
        v34.current = v39;
        v33.setPromptText(v39);
    end);
    local v41 = v2.useContext(v20);
    local v42 = v2.useContext(v22);
    local v43 = v42.quota > 0;
    v2.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v33 (copy), v36 (copy), v37 (copy)
        local l_promptText_0 = v33.promptText;
        local v45 = v33.validRotation and v33.validSeed;
        local l_v36_0 = v36;
        local v47 = false;
        if l_promptText_0 ~= "" then
            v47 = not v37 and v45;
        end;
        l_v36_0(v47);
    end, {
        v33.promptText, 
        v37, 
        v33.validRotation, 
        v33.validSeed, 
        v43
    });
    local v48 = string.format(v30:getText("General", "QuotaTooltip"), v42.quota, v42.total, v42.total);
    local v49 = {
        v35, 
        v31, 
        v42.addOrUpdatePreview, 
        v42.addOrUpdateModelToPreview, 
        v33
    };
    local v61 = v2.useCallback(function() --[[ Line: 118 ]]
        -- upvalues: v35 (copy), v36 (copy), v38 (copy), v34 (copy), v23 (ref), v33 (copy), v18 (ref), v31 (copy), v24 (ref), v25 (ref), v29 (copy), l_TextureGenerationService_0 (ref), v30 (copy), v42 (copy), v19 (ref), v41 (copy)
        if not v35 then
            return;
        else
            v36(false);
            v38(true);
            local l_current_0 = v34.current;
            local v51 = v23(v33);
            local v52 = v18(v31);
            local v53, v54, v55 = v33.rotation:ToEulerAnglesYXZ();
            local v56 = Vector3.new(math.deg(v53), math.deg(v54), (math.deg(v55)));
            if v24() and not v25() then
                v29:report("GeneratedPreview", v31, l_current_0, v33.seed, v56, v33.smartUVUnwrap, v33.promptMasking, nil);
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 147 ]]
                -- upvalues: l_TextureGenerationService_0 (ref), v31 (ref), l_current_0 (copy), v51 (copy), v30 (ref)
                local l_l_TextureGenerationService_0_PartGroup_0 = l_TextureGenerationService_0:CreatePartGroup(v31);
                if l_l_TextureGenerationService_0_PartGroup_0 then
                    return l_TextureGenerationService_0:PreviewTexture(l_l_TextureGenerationService_0_PartGroup_0, l_current_0, v51);
                else
                    return v30:getText("PromptEntry", "PartGroupError");
                end;
            end);
            v36(true);
            v38(false);
            if not l_status_0 or typeof(l_result_0) == "string" then
                v42.addError(v52, l_result_0, v30:getText("EntryArea", "ErrorAlertTitle"), l_result_0, "error");
                return;
            else
                l_result_0.meshParts = v31;
                l_result_0.rotation = v56;
                l_result_0.smartUVUnwrap = v33.smartUVUnwrap;
                l_result_0.promptMasking = v33.promptMasking;
                v42.addOrUpdatePreview(l_result_0);
                local v60 = {
                    hash = v52, 
                    uuid = l_result_0.uuid
                };
                v42.addOrUpdateModelToPreview(v60);
                if v24() and v25() then
                    v29:report("GeneratedPreview", v31, l_current_0, v33.seed, v56, v33.smartUVUnwrap, v33.promptMasking, l_result_0.uuid);
                end;
                v19(v41, v42);
                return;
            end;
        end;
    end, v49);
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v28.LayoutOrder, 
        Padding = 10, 
        Size = UDim2.new(1, 0, 0, 140)
    }, {
        TextInput = v2.createElement(l_TextInput_0, {
            BottomComponent = v27, 
            BottomComponentProps = {
                Enabled = v35, 
                OnClick = v61, 
                PreviewButtonText = v32, 
                QuotaTooltipText = v48, 
                Size = UDim2.new(1, 0, 0, 32)
            }, 
            Disabled = v37, 
            MultiLine = true, 
            OnEnter = v61, 
            OnTextChanged = v40, 
            Text = v34.current, 
            Size = UDim2.new(1, 0, 0, 120), 
            PlaceholderText = v30:getText("PromptEntry", "PromptPlaceholder")
        })
    });
end;