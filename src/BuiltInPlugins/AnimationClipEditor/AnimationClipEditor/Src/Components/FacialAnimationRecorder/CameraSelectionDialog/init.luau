local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local _ = l_UI_0.DockWidget;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_GetTextSize_0 = v2.Util.GetTextSize;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v13 = v1.PureComponent:extend("CameraSelectionDialog");
v2.Util.Typecheck.wrap(v13, script);
v13.init = function(v14) --[[ Line: 46 ]] --[[ Name: init ]]
    local l_props_0 = v14.props;
    v14.onMessageBoxButtonClicked = function(_) --[[ Line: 48 ]]
        -- upvalues: l_props_0 (copy)
        l_props_0.OnClose();
    end;
end;
v13.render = function(v17) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: l_VideoCaptureService_0 (copy), l_GetTextSize_0 (copy), v1 (copy), l_StyledDialog_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_SelectInput_0 (copy)
    local l_props_1 = v17.props;
    local l_Localization_0 = l_props_1.Localization;
    if not l_props_1.Title then
        local _ = l_Localization_0:getText("Dialog", "DefaultTitle");
    end;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_OnClose_0 = l_props_1.OnClose;
    local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
    local l_CameraID_0 = l_VideoCaptureService_0.CameraID;
    local v25 = {};
    local v26 = {};
    local v27 = nil;
    local v28 = 1;
    for v29, v30 in pairs(l_l_VideoCaptureService_0_CameraDevices_0) do
        table.insert(v25, v30);
        table.insert(v26, v29);
        if v29 == l_CameraID_0 then
            v27 = v28;
        end;
        v28 = v28 + 1;
    end;
    local v31 = l_Localization_0:getText("FaceCapture", "CameraSelectionTitle");
    local l_SourceSansBold_0 = Enum.Font.SourceSansBold;
    local v33 = l_GetTextSize_0(v31, 20, l_SourceSansBold_0, Vector2.new(450, 1000));
    local v34 = l_Localization_0:getText("FaceCapture", "CameraSelectionBody");
    local l_SourceSans_0 = Enum.Font.SourceSans;
    local v36 = l_GetTextSize_0(v34, 20, l_SourceSans_0, Vector2.new(450, 1000));
    local v37 = math.max(30 * v28, 40);
    local v38 = v33.Y + v36.Y + 20 + v37;
    local v39 = Vector2.new(450, v38);
    return v1.createElement(l_StyledDialog_0, {
        Title = v31, 
        OnClose = l_OnClose_0, 
        BorderPadding = 20, 
        OnButtonPressed = v17.onMessageBoxButtonClicked, 
        Buttons = {
            {
                Text = l_props_1.Localization:getText("Dialog", "Confirm"), 
                Key = "Confirm", 
                Style = "RoundPrimary"
            }
        }, 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center, 
        MinContentSize = v39, 
        Modal = true
    }, {
        Content = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Spacing = 10
        }, {
            TitleLabel = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v31, 
                Font = l_SourceSansBold_0, 
                TextSize = 20, 
                TextColor3 = l_Stylizer_0.TextColor, 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                LayoutOrder = 1
            }), 
            BodyLabel = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v34, 
                Font = l_SourceSans_0, 
                TextSize = 20, 
                TextColor3 = l_Stylizer_0.TextColor, 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                LayoutOrder = 2
            }), 
            SelectInputWrapper = v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 4
            }, {
                CameraSelection = v1.createElement(l_SelectInput_0, {
                    PlaceholderText = l_Localization_0:getText("FaceCapture", "CameraSelectionPlaceholder"), 
                    Width = 450, 
                    SelectedIndex = v27, 
                    Items = v25, 
                    OnItemActivated = function(_, v41) --[[ Line: 143 ]] --[[ Name: OnItemActivated ]]
                        -- upvalues: v26 (copy), l_VideoCaptureService_0 (ref), v17 (copy)
                        local v42 = v26[v41];
                        l_VideoCaptureService_0.CameraID = v42;
                        v17:setState({
                            selectedGuid = v42
                        });
                    end
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v13));