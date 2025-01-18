local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v3.UI.Button;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = l_ContextServices_0.Localization;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v9 = require(l_Actions_0.SetIKEnabled);
local v10 = require(l_Actions_0.SetIKMode);
local v11 = require(l_Actions_0.SetSelectedTracks);
local v12 = require(l_Actions_0.SetShowTree);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.IK.IKWindow);
local v15 = require(l_Components_0.IK.R15IKRig);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v17 = require(l_Thunks_0.SetSelectedTracks);
local v18 = require(l_Thunks_0.ToggleIKEnabled);
local v19 = require(l_Thunks_0.TogglePinnedPart);
local v20 = require(l_Thunks_0.ToggleShowTree);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v22 = require(l_Util_0.Constants);
local v23 = require(l_Util_0.RigIK);
local v24 = require(l_Util_0.RigInfo);
local _ = require(l_Util_0.RigUtils);
local v26 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v27 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v28 = v1.PureComponent:extend("IKController");
v28.init = function(v29) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v26 (copy), v24 (copy), v22 (copy), v23 (copy)
    v29.state = {
        showMenu = false, 
        showTree = false
    };
    v29.showMenu = function() --[[ Line: 58 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            showMenu = true
        });
    end;
    v29.hideMenu = function() --[[ Line: 64 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            showMenu = false
        });
    end;
    v29.setShowTree = function(v30) --[[ Line: 70 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            showTree = v30
        });
    end;
    v29.makeChainHelper = function(v31, v32, v33) --[[ Line: 76 ]]
        -- upvalues: v26 (ref), v29 (copy)
        if v26() and not v32 then
            return;
        else
            local v34 = v32[v33.Name];
            if v34 then
                v31[v33.Name] = true;
                v29.makeChainHelper(v31, v32, v34.Part0);
            end;
            return;
        end;
    end;
    v29.makeChainHelperAnimationConstraint = function(v35, v36, v37) --[[ Line: 87 ]]
        -- upvalues: v29 (copy)
        if not v36 then
            return;
        else
            local v38 = v36[v37.Name];
            if v38 then
                v35[v37.Name] = true;
                v29.makeChainHelperAnimationConstraint(v35, v36, v38.Attachment0.Parent);
            end;
            return;
        end;
    end;
    v29.getLastSelectedTrack = function() --[[ Line: 98 ]]
        -- upvalues: v29 (copy)
        if v29.props.SelectedTracks then
            return v29.props.SelectedTracks[#v29.props.SelectedTracks];
        else
            return;
        end;
    end;
    v29.toggleIKEnabledHandler = function() --[[ Line: 104 ]]
        -- upvalues: v29 (copy)
        return v29.props.ToggleIKEnabled(v29.props.Analytics);
    end;
    v29.makeChains = function() --[[ Line: 108 ]]
        -- upvalues: v29 (copy), v24 (ref), v22 (ref), v23 (ref), v26 (ref)
        local v39 = v29.getLastSelectedTrack();
        local v40 = v39 and v39[1] or nil;
        local v41 = v24.getRigInfo(v29.props.RootInstance);
        local l_Parts_0 = v41.Parts;
        local l_PartNameToMotor_0 = v41.PartNameToMotor;
        local l_PartNameToAnimConstraint_0 = v41.PartNameToAnimConstraint;
        local v45 = {};
        local l_PinnedParts_0 = v29.props.PinnedParts;
        if v29.props.IKMode == v22.IK_MODE.BodyPart then
            l_PinnedParts_0 = {};
        end;
        for _, v48 in ipairs(l_Parts_0) do
            if not l_PinnedParts_0[v48] then
                v45[v48.Name] = false;
            end;
        end;
        if v40 then
            local v49 = v24.getPartByName(v29.props.RootInstance, v40);
            if v49 then
                if v29.props.IKMode == v22.IK_MODE.BodyPart then
                    l_PinnedParts_0 = v23.pinForLimbMode(v49, l_PartNameToMotor_0, l_PartNameToAnimConstraint_0);
                end;
                if not v26() or l_PartNameToMotor_0[v40] then
                    v29.makeChainHelper(v45, l_PartNameToMotor_0, l_PartNameToMotor_0[v40].Part1);
                end;
                if v26() and l_PartNameToAnimConstraint_0[v40] then
                    v29.makeChainHelperAnimationConstraint(v45, l_PartNameToAnimConstraint_0, l_PartNameToAnimConstraint_0[v40].Attachment1.Parent);
                end;
                for v50, v51 in pairs(l_PinnedParts_0) do
                    if v50.Name ~= v40 and v51 then
                        v29.makeChainHelper(v45, l_PartNameToMotor_0, v50);
                        if v26() then
                            v29.makeChainHelperAnimationConstraint(v45, l_PartNameToAnimConstraint_0, v50);
                        end;
                    end;
                end;
            end;
        end;
        return v45;
    end;
end;
v28.didUpdate = function(v52) --[[ Line: 167 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v52.props;
    local l_state_0 = v52.state;
    if l_props_0.ShowTree ~= l_state_0.showTree then
        if l_props_0.ShowTree ~= nil then
            spawn(function() --[[ Line: 174 ]]
                -- upvalues: v52 (copy), l_props_0 (copy)
                v52.setShowTree(l_props_0.ShowTree);
            end);
            return;
        else
            v52.setShowTree(l_props_0.ShowTree);
        end;
    end;
end;
v28.render = function(v55) --[[ Line: 184 ]] --[[ Name: render ]]
    -- upvalues: v23 (copy), v1 (copy), l_Button_0 (copy), v14 (copy), v15 (copy)
    local l_Localization_1 = v55.props.Localization;
    local l_props_1 = v55.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v59 = v55.getLastSelectedTrack();
    local l_state_1 = v55.state;
    local l_ToggleShowTree_0 = l_props_1.ToggleShowTree;
    local v62, v63 = v23.canUseIK(l_props_1.RootInstance);
    local v64 = l_state_1.showTree and "ACEHeaderButtonActive" or "ACEHeaderButtonDefault";
    return v55.props.RootInstance and v1.createElement("Frame", {
        Position = l_props_1.Position, 
        Size = UDim2.new(0, 40, 0, 18), 
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 0.5)
    }, {
        IKButton = l_props_1.RootInstance and v62 and v1.createElement(l_Button_0, {
            Style = v64, 
            Size = UDim2.new(1, 0, 1, 0), 
            OnClick = l_ToggleShowTree_0
        }, {
            Label = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = l_Stylizer_0.ikTheme.textSize, 
                Text = l_Localization_1:getText("Title", "IK"), 
                Font = l_Stylizer_0.font, 
                TextColor3 = l_Stylizer_0.ikTheme.textColor
            })
        }), 
        IKWindow = l_props_1.ShowTree and l_state_1.showTree and v1.createElement(v14, {
            RootInstance = l_props_1.RootInstance, 
            PinnedParts = l_props_1.PinnedParts, 
            IKEnabled = l_props_1.IKEnabled, 
            ShowTree = l_props_1.ShowTree, 
            SelectedTrack = v59, 
            SetSelectedTracks = l_props_1.SetSelectedTracks, 
            ToggleIKEnabled = v55.toggleIKEnabledHandler, 
            TogglePinnedPart = l_props_1.TogglePinnedPart, 
            SetShowTree = l_props_1.SetShowTree, 
            SetIKEnabled = l_props_1.SetIKEnabled, 
            SetIKMode = l_props_1.SetIKMode, 
            Chain = v55.makeChains(), 
            IKMode = l_props_1.IKMode, 
            IsR15 = v63
        }), 
        R15IKRig = l_props_1.IKEnabled and v63 and v1.createElement(v15, {
            RootInstance = l_props_1.RootInstance
        })
    });
end;
v28 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics
})(v28);
return v2.connect(function(v65, _) --[[ Line: 247 ]] --[[ Name: mapStateToProps ]]
    return {
        ShowTree = v65.Status.ShowTree, 
        IKMode = v65.Status.IKMode, 
        IKEnabled = v65.Status.IKEnabled, 
        RootInstance = v65.Status.RootInstance, 
        PinnedParts = v65.Status.PinnedParts, 
        SelectedTracks = v65.Status.SelectedTracks
    };
end, function(v67) --[[ Line: 258 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v10 (copy), v9 (copy), v18 (copy), v19 (copy), v12 (copy), v27 (copy), v17 (copy), v11 (copy)
    return {
        ToggleShowTree = function() --[[ Line: 260 ]] --[[ Name: ToggleShowTree ]]
            -- upvalues: v67 (copy), v20 (ref)
            v67(v20());
        end, 
        SetIKMode = function(v68) --[[ Line: 264 ]] --[[ Name: SetIKMode ]]
            -- upvalues: v67 (copy), v10 (ref)
            v67(v10(v68));
        end, 
        SetIKEnabled = function(v69) --[[ Line: 268 ]] --[[ Name: SetIKEnabled ]]
            -- upvalues: v67 (copy), v9 (ref)
            v67(v9(v69));
        end, 
        ToggleIKEnabled = function(v70) --[[ Line: 272 ]] --[[ Name: ToggleIKEnabled ]]
            -- upvalues: v67 (copy), v18 (ref)
            v67(v18(v70));
        end, 
        TogglePinnedPart = function(v71) --[[ Line: 276 ]] --[[ Name: TogglePinnedPart ]]
            -- upvalues: v67 (copy), v19 (ref)
            v67(v19(v71));
        end, 
        SetShowTree = function(v72) --[[ Line: 280 ]] --[[ Name: SetShowTree ]]
            -- upvalues: v67 (copy), v12 (ref)
            v67(v12(v72));
        end, 
        SetSelectedTracks = function(v73) --[[ Line: 284 ]] --[[ Name: SetSelectedTracks ]]
            -- upvalues: v27 (ref), v67 (copy), v17 (ref), v11 (ref)
            if v27() then
                v67(v17(v73));
                return;
            else
                v67(v11(v73));
                return;
            end;
        end
    };
end)(v28);