local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.AvatarScalingTypes);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useResizeAvatarHelper);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoRerunValidation);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerRerunValidation);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Sizing.useAvatarProportions);
local l_UI_0 = v2.UI;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local l_IconButton_0 = l_UI_0.IconButton;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Localization_0 = v2.ContextServices.Localization;
local v19 = {
    "Classic", 
    "ProportionsNormal", 
    "ProportionsSlender"
};
return function(v20) --[[ Line: 40 ]] --[[ Name: AvatarSettings ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_Localization_0 (copy), v9 (copy), v10 (copy), v3 (copy), v1 (copy), v19 (copy), v8 (copy), v5 (copy), v7 (copy), v6 (copy), l_CaptureFocus_0 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), l_TextLabel_0 (copy), l_SelectInput_0 (copy)
    local v21 = l_LayoutOrderIterator_0.new();
    local v22 = l_Localization_0:use();
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    if v9() then
        v24 = v10({
            Avatar = v20.avatar
        });
    else
        local v26, v27 = v3.useState("Mixed");
        v24 = v26;
        v25 = v27;
        v3.useEffect(function() --[[ Line: 55 ]]
            -- upvalues: v1 (ref), v20 (copy), v25 (ref)
            local v28 = nil;
            for _, v30 in v1.allAvatarPartScaleTypeValueObjects(v20.avatar.WorldModel) do
                if v28 == nil then
                    v28 = v30.Value;
                elseif v28 ~= v30.Value then
                    v28 = "Mixed";
                    break;
                end;
            end;
            v25(v28 == nil and "Classic" or v28);
        end, {
            v20.avatar.WorldModel
        });
    end;
    local v45 = v3.useCallback(function(_, v32) --[[ Line: 71 ]]
        -- upvalues: v20 (copy), v19 (ref), v9 (ref), v25 (ref), v1 (ref)
        local l_WorldModel_0 = v20.avatar.WorldModel;
        local v34 = v19[v32];
        if not v9() then
            v25(v34);
        end;
        v1.setAvatarPartScaleTypeValueObjects(l_WorldModel_0, v34);
        local v35 = v1.types[v34];
        assert(v35 ~= nil, "Picked scaling type that has no values");
        local function _(v36, v37) --[[ Line: 84 ]] --[[ Name: safeSetHumanoidValue ]]
            -- upvalues: l_WorldModel_0 (copy)
            local l_FirstChild_0 = l_WorldModel_0.Humanoid:FindFirstChild(v36);
            if l_FirstChild_0 ~= nil and l_FirstChild_0:IsA("NumberValue") then
                l_FirstChild_0.Value = v37;
                return;
            else
                if l_FirstChild_0 == nil then
                    local l_NumberValue_0 = Instance.new("NumberValue");
                    l_NumberValue_0.Name = v36;
                    l_NumberValue_0.Value = v37;
                    l_NumberValue_0.Parent = l_WorldModel_0.Humanoid;
                end;
                return;
            end;
        end;
        local l_BodyTypeScale_0 = v35.BodyTypeScale;
        local l_BodyTypeScale_1 = l_WorldModel_0.Humanoid:FindFirstChild("BodyTypeScale");
        if l_BodyTypeScale_1 ~= nil and l_BodyTypeScale_1:IsA("NumberValue") then
            l_BodyTypeScale_1.Value = l_BodyTypeScale_0;
        elseif l_BodyTypeScale_1 == nil then
            local l_NumberValue_1 = Instance.new("NumberValue");
            l_NumberValue_1.Name = "BodyTypeScale";
            l_NumberValue_1.Value = l_BodyTypeScale_0;
            l_NumberValue_1.Parent = l_WorldModel_0.Humanoid;
        end;
        l_BodyTypeScale_0 = v35.BodyProportionScale;
        l_BodyTypeScale_1 = l_WorldModel_0.Humanoid:FindFirstChild("BodyProportionScale");
        if l_BodyTypeScale_1 ~= nil and l_BodyTypeScale_1:IsA("NumberValue") then
            l_BodyTypeScale_1.Value = l_BodyTypeScale_0;
            return;
        else
            if l_BodyTypeScale_1 == nil then
                local l_NumberValue_2 = Instance.new("NumberValue");
                l_NumberValue_2.Name = "BodyProportionScale";
                l_NumberValue_2.Value = l_BodyTypeScale_0;
                l_NumberValue_2.Parent = l_WorldModel_0.Humanoid;
            end;
            return;
        end;
    end, {
        v20.avatar.WorldModel
    });
    local v46 = nil;
    local v47 = nil;
    if v8() then
        v23 = v3.useContext(v5.Context);
        local v48 = nil;
        v48 = if v9() then v3.useMemo(function() --[[ Line: 107 ]]
            -- upvalues: v23 (ref), v20 (copy)
            return v23.findCachedValidationResponse(v20.avatar.WorldModel);
        end, {
            v23.findCachedValidationResponse, 
            v20.avatar.WorldModel, 
            if v7() then v20.avatar.LatestWorldModelHash else nil
        }) else v23.DEPRECATED_cachedResponses[v20.avatar.WorldModel];
        local v49 = false;
        if v48 ~= nil then
            v49 = v48.completed;
        end;
        v46 = v49;
        v47 = v3.useCallback(function() --[[ Line: 122 ]]
            -- upvalues: v23 (ref), v20 (copy)
            v23.revalidateBundle(v20.avatar.WorldModel);
        end, {
            v20.avatar.WorldModel
        });
    end;
    local v50 = nil;
    local v51 = nil;
    if v9() then
        v50 = v6(v20.avatar);
        v51 = v50.autoSetupOriginalScale and math.abs(v50.autoSetupOriginalScale - v20.avatar.ProportionalScale) > 0.001;
    end;
    return v3.createElement(l_CaptureFocus_0, {
        OnFocusLost = v20.close
    }, v3.createElement(l_Pane_0, {
        AnchorPoint = Vector2.new(0, 1), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        HorizontalAlignment = if v8() then Enum.HorizontalAlignment.Left else nil, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = {
            Top = 4, 
            Bottom = 4, 
            Left = 8, 
            Right = 8
        }, 
        Position = UDim2.new(0, 0, 1, -32), 
        Style = "SubtleBox"
    }, {
        RerunValidation = v8() and v3.createElement(l_IconButton_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = v21:getNextOrder(), 
            Text = v22:getText("AvatarSettings", "RerunValidation"), 
            Size = UDim2.fromOffset(0, 32), 
            Style = "IconOnly", 
            OnClick = if v46 then v47 else nil
        }), 
        RevertScale = v9() and v50.autoSetupOriginalScale ~= nil and v3.createElement(l_IconButton_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = v21:getNextOrder(), 
            Text = if v51 then v22:getText("AvatarSettings", "RevertScale") else v22:getText("AvatarSettings", "ScaleToAvatarRequirements"), 
            Size = UDim2.fromOffset(0, 32), 
            Style = "IconOnly", 
            OnClick = if v50.autoSetupOriginalScale ~= nil then if v51 then v50.revertScale else v50.setScaleToAvatarRequirements else nil, 
            TooltipText = if v51 then v22:getText("AvatarSettings", "RevertScale") else v22:getText("AvatarSettings", "ScaleToAvatarRequirements")
        }), 
        Proportions = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v21:getNextOrder(), 
            Spacing = 8, 
            Size = UDim2.fromOffset(0, 32)
        }, {
            Label = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.X, 
                LayoutOrder = v21:getNextOrder(), 
                Text = v22:getText("AvatarSettings", "Proportions"), 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Selection = v3.createElement(l_SelectInput_0, {
                LayoutOrder = v21:getNextOrder(), 
                OnItemActivated = v45, 
                Width = v8() and 180 or nil, 
                SelectedIndex = if v24 == nil then nil else table.find(v19, v24), 
                PlaceholderText = v22:getText("AvatarSettings", "Mixed"), 
                Items = v19
            })
        })
    }));
end;