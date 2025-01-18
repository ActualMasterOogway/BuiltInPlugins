local l_Players_0 = game:GetService("Players");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v15 = require(l_Parent_0.Src.Util.BodyShape);
local v16 = require(l_Parent_0.Src.Components.RigList);
local v17 = v3.PureComponent:extend("RigSelector");
local function _() --[[ Line: 47 ]] --[[ Name: getViewTargetPosition ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v19 = l_CurrentCamera_0.ViewportSize / 2;
    local v20 = l_CurrentCamera_0:ViewportPointToRay(v19.X, v19.Y, 0);
    local v21 = workspace:Raycast(v20.Origin, v20.Direction * 25);
    if not v21 then
        return v20.Origin + v20.Direction * 25;
    else
        return v21.Position;
    end;
end;
local function v26(v23) --[[ Line: 60 ]] --[[ Name: unlockModelParts ]]
    for _, v25 in v23:GetDescendants() do
        if v25:IsA("BasePart") then
            v25.Locked = false;
        end;
    end;
end;
v17.insertRig = function(v27, v28) --[[ Line: 68 ]] --[[ Name: insertRig ]]
    -- upvalues: l_Players_0 (copy), v26 (copy), l_Selection_0 (copy)
    local l_Analytics_1 = v27.props.Analytics;
    local v30 = require(v28)(v27.state.bodyShape);
    local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(v30, v27.state.rigType);
    v26(l_l_Players_0_HumanoidModelFromDescription_0);
    l_l_Players_0_HumanoidModelFromDescription_0.Name = "Rig";
    local l_Humanoid_0 = l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChildWhichIsA("Humanoid");
    local l_HumanoidRootPart_0 = l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChild("HumanoidRootPart");
    assert(l_Humanoid_0, "Generated rig did not have Humanoid");
    assert(l_HumanoidRootPart_0, "Generated rig did not have HumanoidRootPart");
    assert(l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart, "Generated rig does not have PrimaryPart");
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v35 = l_CurrentCamera_1.ViewportSize / 2;
    local v36 = l_CurrentCamera_1:ViewportPointToRay(v35.X, v35.Y, 0);
    local v37 = workspace:Raycast(v36.Origin, v36.Direction * 25);
    local v38 = if not v37 then v36.Origin + v36.Direction * 25 else v37.Position;
    l_CurrentCamera_1 = l_Humanoid_0.HipHeight;
    if v27.state.rigType == Enum.HumanoidRigType.R6 then
        l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart.PivotOffset = CFrame.new(0, -l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart.Size.Y / 2 - l_HumanoidRootPart_0.Size.Y - 2, 0);
    else
        l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart.PivotOffset = CFrame.new(0, -l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart.Size.Y / 2 - l_CurrentCamera_1, 0);
    end;
    l_l_Players_0_HumanoidModelFromDescription_0:PivotTo(CFrame.new(v38));
    l_l_Players_0_HumanoidModelFromDescription_0.Parent = workspace;
    l_Selection_0:Set({
        l_l_Players_0_HumanoidModelFromDescription_0
    });
    l_Analytics_1:report("rigInsert", v28.Name, v27.state.rigType, v27.state.bodyShape);
end;
v17.init = function(v39, _) --[[ Line: 100 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy)
    v39:setState({
        rigType = Enum.HumanoidRigType.R15, 
        bodyShape = v15.Masculine
    });
end;
v17.render = function(v41) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_TitledFrame_0 (copy), l_RadioButtonList_0 (copy), v15 (copy), v16 (copy)
    local l_props_0 = v41.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_MenuCompleted_0 = l_props_0.MenuCompleted;
    local l_state_0 = v41.state;
    local l_rigType_0 = l_state_0.rigType;
    local l_bodyShape_0 = l_state_0.bodyShape;
    return v3.createElement("Frame", {
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(0, 200, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        Pane = v3.createElement(l_Pane_0, {
            Style = "BorderBox", 
            Layout = Enum.FillDirection.Vertical, 
            Padding = 10, 
            Spacing = 10
        }, {
            Text = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 0, 
                Style = "Title", 
                Text = l_Localization_1:getText("Plugin", "Text")
            }), 
            RigType = v3.createElement(l_TitledFrame_0, {
                Title = l_Localization_1:getText("Menu", "RigType"), 
                FillDirection = Enum.FillDirection.Vertical, 
                LayoutOrder = 1
            }, {
                Types = v3.createElement(l_RadioButtonList_0, {
                    Buttons = {
                        {
                            Key = Enum.HumanoidRigType.R15, 
                            Text = Enum.HumanoidRigType.R15.Name
                        }, 
                        {
                            Key = Enum.HumanoidRigType.R6, 
                            Text = Enum.HumanoidRigType.R6.Name
                        }
                    }, 
                    CurrentSelectedKey = l_rigType_0, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    OnClick = function(v48) --[[ Line: 154 ]] --[[ Name: OnClick ]]
                        -- upvalues: v41 (copy)
                        v41:setState({
                            rigType = v48
                        });
                    end
                })
            }), 
            BodyShape = v3.createElement(l_TitledFrame_0, {
                Title = l_Localization_1:getText("Menu", "BodyShape"), 
                FillDirection = Enum.FillDirection.Vertical, 
                LayoutOrder = 2
            }, {
                Types = v3.createElement(l_RadioButtonList_0, {
                    Buttons = {
                        {
                            Key = v15.Masculine, 
                            Text = l_Localization_1:getText("BodyShape", "Masculine")
                        }, 
                        {
                            Key = v15.Feminine, 
                            Text = l_Localization_1:getText("BodyShape", "Feminine")
                        }
                    }, 
                    CurrentSelectedKey = l_bodyShape_0, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    OnClick = function(v49) --[[ Line: 174 ]] --[[ Name: OnClick ]]
                        -- upvalues: v41 (copy)
                        v41:setState({
                            bodyShape = v49
                        });
                    end
                })
            }), 
            Rigs = v3.createElement(v16, {
                LayoutOrder = 3, 
                OnSelected = function(v50) --[[ Line: 184 ]] --[[ Name: OnSelected ]]
                    -- upvalues: v41 (copy), l_MenuCompleted_0 (copy)
                    v41:insertRig(v50);
                    l_MenuCompleted_0();
                end
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v17));