local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_ThemeSwitcher_0 = v2.Style.ThemeSwitcher;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v18 = require(l_script_FirstAncestor_0.Src.Resources.Images);
local v19 = v1.PureComponent:extend("PreviewModelComponent");
local function _() --[[ Line: 51 ]] --[[ Name: getResetCamImage ]]
    -- upvalues: l_ThemeSwitcher_0 (copy), v18 (copy)
    local v20 = l_ThemeSwitcher_0.getThemeName();
    if v20 == "Dark" or v20 == "Default" then
        return v18.RESET_CAM_DARK;
    else
        return v18.RESET_CAM_LIGHT;
    end;
end;
local function _(v22) --[[ Line: 60 ]] --[[ Name: getAssetIdText ]]
    if v22 then
        return string.match(v22, "%d+$");
    else
        return "";
    end;
end;
local l_WorldModel_0 = Instance.new("WorldModel");
game:GetService("Players"):CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6).Parent = l_WorldModel_0;
local function _(v25) --[[ Line: 72 ]] --[[ Name: getRenderModel ]]
    if v25 == nil then
        return nil;
    elseif v25:IsA("WorldModel") then
        return v25;
    else
        local l_WorldModel_1 = Instance.new("WorldModel");
        v25.Parent = l_WorldModel_1;
        return l_WorldModel_1;
    end;
end;
v19.init = function(v28) --[[ Line: 84 ]] --[[ Name: init ]]
    v28.camera = Instance.new("Camera");
    v28.resetCamera = function() --[[ Line: 86 ]]
        -- upvalues: v28 (copy)
        local l_Model_0 = v28.props.Model;
        local v30;
        if l_Model_0 == nil then
            v30 = nil;
        elseif l_Model_0:IsA("WorldModel") then
            v30 = l_Model_0;
        else
            local l_WorldModel_2 = Instance.new("WorldModel");
            l_Model_0.Parent = l_WorldModel_2;
            v30 = l_WorldModel_2;
        end;
        local v32 = v30:GetExtentsSize().Magnitude * 0.8;
        local l_Unit_0 = Vector3.new(-1, 1, -1, 0).Unit;
        v28.camera.Focus = CFrame.new();
        v28.camera.CFrame = CFrame.new(v32 * l_Unit_0, v28.camera.Focus.Position);
    end;
    v28.clone = false;
    v28.loadAnimation = function(v34) --[[ Line: 95 ]]
        -- upvalues: v28 (copy)
        local l_AnimationId_0 = v28.props.AnimationId;
        if not l_AnimationId_0 then
            return;
        else
            local v36 = nil;
            v36 = v34.AncestryChanged:Connect(function(_, v38) --[[ Line: 101 ]]
                -- upvalues: v36 (ref), v34 (copy), l_AnimationId_0 (copy), v28 (ref)
                if v38 and v38:IsDescendantOf(game) then
                    v36:Disconnect();
                    local v39 = nil;
                    local l_v34_FirstChildWhichIsA_0 = v34:FindFirstChildWhichIsA("Humanoid", true);
                    if l_v34_FirstChildWhichIsA_0 then
                        v39 = l_v34_FirstChildWhichIsA_0;
                        local l_v39_FirstChildWhichIsA_0 = v39:FindFirstChildWhichIsA("Animator", true);
                        if not l_v39_FirstChildWhichIsA_0 then
                            l_v39_FirstChildWhichIsA_0 = Instance.new("Animator");
                            l_v39_FirstChildWhichIsA_0.Parent = v39;
                        end;
                        local l_Animation_0 = Instance.new("Animation");
                        l_Animation_0.AnimationId = l_AnimationId_0;
                        l_Animation_0.Parent = v39;
                        local v43 = l_v39_FirstChildWhichIsA_0:LoadAnimation(l_Animation_0);
                        v43.Looped = true;
                        if v28.props.Loaded then
                            v28.props.Loaded:Fire(true, v43, l_v39_FirstChildWhichIsA_0);
                        end;
                        v34.Destroying:Connect(function() --[[ Line: 129 ]]
                            -- upvalues: v28 (ref), v43 (copy)
                            v28.props.Loaded:Fire(false, v43);
                        end);
                    else
                        return;
                    end;
                end;
            end);
            return;
        end;
    end;
end;
v19.getDerivedStateFromProps = function(v44, v45) --[[ Line: 137 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v1 (copy)
    if v44.AnimationId ~= v45.animationId or v44.Model ~= v45.refModel then
        return {
            animationId = v44.AnimationId, 
            refModel = if v44.Model then v44.Model else v1.None, 
            model = if v44.Model then v44.Model:Clone() else v1.None
        };
    else
        return nil;
    end;
end;
v19.render = function(v46) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_AssetRenderModel_0 (copy), l_Button_0 (copy), l_Image_0 (copy), l_ThemeSwitcher_0 (copy), v18 (copy), l_Tooltip_0 (copy)
    local l_props_0 = v46.props;
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local v50 = v46.state.model or Instance.new("Model");
    local l_Label_0 = l_props_0.Label;
    local l_AnimationId_1 = l_props_0.AnimationId;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local v54 = l_LayoutOrderIterator_0.new();
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v57 = {
        Size = UDim2.new(l_Size_0.X.Scale, l_Size_0.X.Offset, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = l_Position_0, 
        Padding = l_Stylizer_1.Padding, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    };
    local v58 = {
        Header = v1.createElement(l_Pane_0, {
            LayoutOrder = v54:getNextOrder(), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Padding = l_Stylizer_1.Padding
        }, {
            Label = v1.createElement(l_TextLabel_0, {
                Text = l_Label_0, 
                Style = "Bold", 
                Size = UDim2.fromScale(1, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY
            }), 
            AssetId = v1.createElement(l_TextLabel_0, {
                Text = if l_AnimationId_1 then string.match(l_AnimationId_1, "%d+$") else "", 
                Style = "Body", 
                Size = UDim2.fromScale(1, 0), 
                TextXAlignment = Enum.TextXAlignment.Right, 
                AutomaticSize = Enum.AutomaticSize.XY
            })
        })
    };
    local l_createElement_1 = v1.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v61 = {
        LayoutOrder = v54:getNextOrder(), 
        Style = "RoundBox", 
        Padding = l_Stylizer_1.Padding, 
        BackgroundColor3 = l_Stylizer_1.BackgroundColor, 
        Size = UDim2.fromScale(1, 1), 
        SizeConstraint = Enum.SizeConstraint.RelativeXX
    };
    local v62 = {
        PreviewRender = v1.createElement(l_AssetRenderModel_0, {
            Camera = v46.camera, 
            Model = v50, 
            FocusDirection = Vector3.new(-1, 1, -1, 0), 
            OnViewModelLoaded = if l_AnimationId_1 then v46.loadAnimation else nil
        })
    };
    local l_createElement_2 = v1.createElement;
    local l_l_Button_0_0 = l_Button_0;
    local v65 = {
        OnClick = v46.resetCamera, 
        Style = "RoundSubtle", 
        Size = l_Stylizer_1.ResetButtonSize, 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0)
    };
    local v66 = {};
    local l_createElement_3 = v1.createElement;
    local l_l_Image_0_0 = l_Image_0;
    local v69 = {};
    local v70 = l_ThemeSwitcher_0.getThemeName();
    v69.Image = if not (v70 ~= "Dark") or v70 == "Default" then v18.RESET_CAM_DARK else v18.RESET_CAM_LIGHT;
    v66.Icon = l_createElement_3(l_l_Image_0_0, v69);
    v66.Tooltip = v1.createElement(l_Tooltip_0, {
        Text = "Reset Camera"
    });
    v62.CameraResetButton = l_createElement_2(l_l_Button_0_0, v65, v66);
    v58.Preview = l_createElement_1(l_l_Pane_0_1, v61, v62);
    return l_createElement_0(l_l_Pane_0_0, v57, v58);
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    Plugin = l_Plugin_0
})(v19));