local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v3.UI.Button;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Components.FaceControlsEditor.FaceControlsEditorWindow);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.ToggleFaceControlsEditorEnabled);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.ToggleShowFaceControlsEditorPanel);
local v11 = require(l_script_FirstAncestor_0.Src.Actions.SetFaceControlsEditorEnabled);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetShowFaceControlsEditorPanel);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedTracks);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.SetSelectedTracks);
local v15 = require(l_script_FirstAncestor_0.Src.Components.TeachingCallout);
local v16 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v17 = v1.PureComponent:extend("FaceControlsEditorController");
local l_GetTextSize_0 = v3.Util.GetTextSize;
v17.init = function(v19) --[[ Line: 38 ]] --[[ Name: init ]]
    v19.state = {
        showMenu = false, 
        showFaceControlsEditorPanel = false
    };
    v19.showMenu = function() --[[ Line: 44 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            showMenu = true
        });
    end;
    v19.hideMenu = function() --[[ Line: 50 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            showMenu = false
        });
    end;
    v19.setShowFaceControlsEditorPanel = function(v20) --[[ Line: 56 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            showFaceControlsEditorPanel = v20
        });
    end;
    v19.getLastSelectedTrack = function() --[[ Line: 62 ]]
        -- upvalues: v19 (copy)
        if v19.props.SelectedTracks then
            return v19.props.SelectedTracks[#v19.props.SelectedTracks];
        else
            return;
        end;
    end;
    v19.toggleFaceControlsEditorEnabledHandler = function() --[[ Line: 68 ]]
        -- upvalues: v19 (copy)
        return v19.props.ToggleFaceControlsEditorEnabled(v19.props.Analytics);
    end;
end;
v17.didUpdate = function(v21) --[[ Line: 80 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v21.props;
    local l_state_0 = v21.state;
    if l_props_0.ShowFaceControlsEditorPanel ~= l_state_0.showFaceControlsEditorPanel then
        if l_props_0.ShowFaceControlsEditorPanel ~= nil then
            spawn(function() --[[ Line: 87 ]]
                -- upvalues: v21 (copy), l_props_0 (copy)
                v21.setShowFaceControlsEditorPanel(l_props_0.ShowFaceControlsEditorPanel);
            end);
            return;
        else
            v21.setShowFaceControlsEditorPanel(l_props_0.ShowFaceControlsEditorPanel);
        end;
    end;
end;
v17.render = function(v24) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_GetTextSize_0 (copy), v1 (copy), l_Button_0 (copy), v15 (copy), v8 (copy)
    local l_Localization_0 = v24.props.Localization;
    local l_props_1 = v24.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v28 = v24.getLastSelectedTrack();
    local l_button_0 = l_Stylizer_0.button;
    local l_state_1 = v24.state;
    local l_ToggleShowFaceControlsEditorPanel_0 = l_props_1.ToggleShowFaceControlsEditorPanel;
    local v32 = v7.canUseFaceControlsEditor(l_props_1.RootInstance);
    local v33 = l_Localization_0:getText("Title", "FACE");
    local l_textSize_0 = l_Stylizer_0.ikTheme.textSize;
    local l_font_0 = l_Stylizer_0.font;
    local v36 = l_GetTextSize_0(v33, l_textSize_0, l_font_0, Vector2.new(1000, 1000)).X + 10;
    return v24.props.RootInstance and v1.createElement("Frame", {
        Position = l_props_1.Position, 
        Size = UDim2.new(0, v36, 0, 18), 
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 0.5), 
        LayoutOrder = 2
    }, {
        FaceControlsEditorButton = l_props_1.RootInstance and v32 and v1.createElement(l_Button_0, {
            Style = l_state_1.showFaceControlsEditorPanel and l_button_0.FaceControlsEditorActive or l_button_0.FaceControlsEditorDefault, 
            Size = UDim2.new(1, 0, 1, 0), 
            OnClick = l_ToggleShowFaceControlsEditorPanel_0
        }, {
            Label = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = l_Stylizer_0.ikTheme.textSize, 
                Text = l_Localization_0:getText("Title", "FACE"), 
                Font = l_Stylizer_0.font, 
                TextColor3 = l_Stylizer_0.ikTheme.textColor
            }, {
                TeachingCallout = v1.createElement(v15, {
                    Offset = Vector2.new(0, 6), 
                    DefinitionId = "FaceControlsEditorCallout", 
                    LocationId = "FaceControlsEditorButton"
                })
            })
        }), 
        FaceControlsEditorWindow = l_props_1.ShowFaceControlsEditorPanel and l_state_1.showFaceControlsEditorPanel and v1.createElement(v8, {
            RootInstance = l_props_1.RootInstance, 
            FaceControlsEditorEnabled = l_props_1.FaceControlsEditorEnabled, 
            ShowFaceControlsEditorPanel = l_props_1.ShowFaceControlsEditorPanel, 
            SelectedTrack = v28, 
            SetSelectedTracks = l_props_1.SetSelectedTracks, 
            ToggleFaceControlsEditorEnabled = v24.toggleFaceControlsEditorEnabledHandler, 
            SetShowFaceControlsEditorPanel = l_props_1.SetShowFaceControlsEditorPanel, 
            SetFaceControlsEditorEnabled = l_props_1.SetFaceControlsEditorEnabled
        })
    });
end;
v17 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics
})(v17);
return v2.connect(function(v37, _) --[[ Line: 174 ]] --[[ Name: mapStateToProps ]]
    return {
        ShowFaceControlsEditorPanel = v37.Status.ShowFaceControlsEditorPanel, 
        FaceControlsEditorEnabled = v37.Status.FaceControlsEditorEnabled, 
        RootInstance = v37.Status.RootInstance, 
        SelectedTracks = v37.Status.SelectedTracks
    };
end, function(v39) --[[ Line: 183 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy), v11 (copy), v9 (copy), v12 (copy), v16 (copy), v14 (copy), v13 (copy)
    return {
        ToggleShowFaceControlsEditorPanel = function() --[[ Line: 185 ]] --[[ Name: ToggleShowFaceControlsEditorPanel ]]
            -- upvalues: v39 (copy), v10 (ref)
            v39(v10());
        end, 
        SetFaceControlsEditorEnabled = function(v40) --[[ Line: 189 ]] --[[ Name: SetFaceControlsEditorEnabled ]]
            -- upvalues: v39 (copy), v11 (ref)
            v39(v11(v40));
        end, 
        ToggleFaceControlsEditorEnabled = function(v41) --[[ Line: 193 ]] --[[ Name: ToggleFaceControlsEditorEnabled ]]
            -- upvalues: v39 (copy), v9 (ref)
            v39(v9(v41));
        end, 
        SetShowFaceControlsEditorPanel = function(v42) --[[ Line: 197 ]] --[[ Name: SetShowFaceControlsEditorPanel ]]
            -- upvalues: v39 (copy), v12 (ref)
            v39(v12(v42));
        end, 
        SetSelectedTracks = function(v43) --[[ Line: 201 ]] --[[ Name: SetSelectedTracks ]]
            -- upvalues: v16 (ref), v39 (copy), v14 (ref), v13 (ref)
            if v16() then
                v39(v14(v43));
                return;
            else
                v39(v13(v43));
                return;
            end;
        end
    };
end)(v17);