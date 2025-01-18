local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v9 = require(l_script_FirstAncestor_0.Src.Components.IK.IKTreeView);
local v10 = require(l_script_FirstAncestor_0.Src.Components.IK.IKModeButtons);
local v11 = v1.PureComponent:extend("IKWindow");
local v12 = Vector2.new(260, 440);
v11.init = function(v13) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v13.state = {
        treeArray = {}
    };
    v13.hideTree = function() --[[ Line: 57 ]]
        -- upvalues: v13 (copy)
        local l_props_0 = v13.props;
        if l_props_0.ShowTree then
            l_props_0.SetShowTree(false);
        end;
        if l_props_0.IKEnabled then
            l_props_0.SetIKEnabled(false);
        end;
    end;
    v13.onDockWidgetLoaded = function(v15) --[[ Line: 67 ]]
        -- upvalues: v13 (copy)
        if v15:IsA("PluginGui") then
            v15:BindToClose(v13.hideTree);
        end;
    end;
    v13.onTreeUpdated = function(v16) --[[ Line: 73 ]]
        -- upvalues: v13 (copy)
        v13:setState({
            treeArray = v16
        });
    end;
    v13.changeSelectedTrack = function(v17) --[[ Line: 79 ]]
        -- upvalues: v13 (copy)
        local l_state_0 = v13.state;
        local l_props_1 = v13.props;
        local l_treeArray_0 = l_state_0.treeArray;
        local l_SelectedTrack_0 = l_props_1.SelectedTrack;
        local l_SetSelectedTracks_0 = l_props_1.SetSelectedTracks;
        local v23 = 0;
        for v24, v25 in ipairs(l_treeArray_0) do
            if l_SelectedTrack_0 and l_SelectedTrack_0[1] == v25 then
                v23 = v24;
                break;
            end;
        end;
        l_SetSelectedTracks_0({
            {
                l_treeArray_0[math.clamp(v23 + v17, 1, #l_treeArray_0)]
            }
        });
    end;
    v13.onInputBegan = function(_, v27) --[[ Line: 100 ]]
        -- upvalues: v8 (ref), v13 (copy)
        if v27.UserInputType == Enum.UserInputType.Keyboard then
            if v8.isUp(v27.KeyCode) then
                v13.changeSelectedTrack(-1);
                return;
            elseif v8.isDown(v27.KeyCode) then
                v13.changeSelectedTrack(1);
            end;
        end;
    end;
end;
v11.willUnmount = function(v28) --[[ Line: 111 ]] --[[ Name: willUnmount ]]
    v28.hideTree();
end;
v11.render = function(v29) --[[ Line: 115 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_DockWidget_0 (copy), v12 (copy), v10 (copy), v9 (copy), l_Button_0 (copy)
    local l_Localization_0 = v29.props.Localization;
    local l_props_2 = v29.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_RootInstance_0 = l_props_2.RootInstance;
    local l_PinnedParts_0 = l_props_2.PinnedParts;
    local l_IsR15_0 = l_props_2.IsR15;
    local l_IKMode_0 = l_props_2.IKMode;
    local l_IKEnabled_0 = l_props_2.IKEnabled;
    local l_SelectedTrack_1 = l_props_2.SelectedTrack;
    local l_SetSelectedTracks_1 = l_props_2.SetSelectedTracks;
    local l_TogglePinnedPart_0 = l_props_2.TogglePinnedPart;
    local l_ToggleIKEnabled_0 = l_props_2.ToggleIKEnabled;
    local l_SetIKMode_0 = l_props_2.SetIKMode;
    local v43 = l_IsR15_0 and 40 or 0;
    local v44 = l_IsR15_0 and -96 or -56;
    return v1.createElement(l_DockWidget_0, {
        Id = "ManageIK", 
        Title = l_Localization_0:getText("Title", "ManageIK"), 
        Name = "ManageIK", 
        ZIndexBehavior = Enum.ZIndexBehavior.Global, 
        InitialDockState = Enum.InitialDockState.Left, 
        InitialEnabled = true, 
        InitialEnabledShouldOverrideRestore = true, 
        Size = v12, 
        MinSize = v12, 
        OnClose = v29.hideTree, 
        Enabled = true, 
        [v1.Ref] = v29.onDockWidgetLoaded
    }, {
        Container = v1.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v1.Event.InputBegan] = v29.onInputBegan
        }, {
            IKModeControls = l_IsR15_0 and l_IKEnabled_0 and v1.createElement(v10, {
                Height = 32, 
                IKMode = l_IKMode_0, 
                SetIKMode = l_SetIKMode_0
            }), 
            TreeView = l_RootInstance_0 and l_IKEnabled_0 and v1.createElement(v9, {
                Size = UDim2.new(1, 0, 1, v44), 
                Position = UDim2.new(0, 0, 0, v43), 
                RootInstance = l_RootInstance_0, 
                PinnedParts = l_PinnedParts_0, 
                TogglePinnedPart = l_TogglePinnedPart_0, 
                SelectedTrack = l_SelectedTrack_1, 
                SetSelectedTracks = l_SetSelectedTracks_1, 
                Chain = l_props_2.Chain, 
                IKMode = l_IKMode_0, 
                TreeArray = v29.state.treeArray, 
                OnTreeUpdated = v29.onTreeUpdated
            }), 
            EnableIKPrompt = not l_IKEnabled_0 and v1.createElement("TextLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, -8, 1, -40), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = l_Stylizer_0.ikTheme.textSize, 
                TextColor3 = l_Stylizer_0.ikTheme.textColor, 
                TextWrapped = true, 
                Font = l_Stylizer_0.font, 
                Text = l_Localization_0:getText("IKMenu", "Prompt")
            }), 
            BottomFrame = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 48), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = l_Stylizer_0.ikTheme.headerColor, 
                BorderSizePixel = 1, 
                BorderColor3 = l_Stylizer_0.ikTheme.headerBorder
            }, {
                EnableIKButton = v1.createElement(l_Button_0, {
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Position = UDim2.new(0.5, 0, 1, -8), 
                    IsRound = true, 
                    Size = UDim2.new(1, -8, 0, 32), 
                    OnClick = l_ToggleIKEnabled_0
                }, {
                    TextLabel = v1.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextSize = l_Stylizer_0.ikTheme.textSize, 
                        Text = l_IKEnabled_0 and l_Localization_0:getText("IKMenu", "DisableIK") or l_Localization_0:getText("IKMenu", "EnableIK"), 
                        Font = l_Stylizer_0.font, 
                        TextColor3 = l_Stylizer_0.ikTheme.textColor
                    })
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v11));