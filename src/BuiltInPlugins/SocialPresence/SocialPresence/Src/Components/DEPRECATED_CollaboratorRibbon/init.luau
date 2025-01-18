local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_IconButton_0 = l_UI_0.IconButton;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_CrossPluginCommunication_0 = v2.Util.CrossPluginCommunication;
local l_Stylizer_0 = v2.Style.Stylizer;
local v13 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local v14 = require(l_Parent_0.Src.Components.Thumbnails.CollaboratorActivityThumbnail);
local l_TextService_0 = game:GetService("TextService");
local v16 = Vector2.new(1000, 1);
local function v24(v17, v18) --[[ Line: 33 ]] --[[ Name: getWidgetSize ]]
    -- upvalues: l_Localization_0 (copy), l_TextService_0 (copy), v16 (copy)
    local v19 = l_Localization_0.use();
    if v17 > 0 then
        local v20 = math.min(v17, 5);
        local v21 = 24 * v20 - (v20 - 1) * 6;
        local v22 = 24;
        if v18 then
            v21 = v21 + 24;
        end;
        v21 = v21 + 4;
        v22 = v22 + 4;
        return Vector2.new(v21, v22);
    else
        local v23 = 24 + l_TextService_0:GetTextSize(v19:getText("Ribbon", "Collaborate"), 18, Enum.Font.SourceSansBold, v16).X + 4 + 4;
        return Vector2.new(v23, 28);
    end;
end;
return function(v25) --[[ Line: 62 ]] --[[ Name: CollaboratorsRibbon ]]
    -- upvalues: v1 (copy), l_CrossPluginCommunication_0 (copy), l_Stylizer_0 (copy), l_Localization_0 (copy), l_Analytics_0 (copy), v13 (copy), l_HoverArea_0 (copy), l_Pane_0 (copy), v14 (copy), l_TextLabel_0 (copy), v24 (copy), l_IconButton_0 (copy)
    local v26, v27 = v1.useState(false);
    local v28 = l_CrossPluginCommunication_0.new("ManageCollaborators");
    local v29 = l_Stylizer_0:use();
    local v30 = l_Localization_0.use();
    local v31 = l_Analytics_0:use();
    local v32 = v13:use():get();
    local v33, v34 = v1.useState({});
    v1.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v32 (copy), v34 (copy)
        local l_v32_CollaboratorsList_0 = v32:GetCollaboratorsList();
        v34(l_v32_CollaboratorsList_0);
        local function v36() --[[ Line: 75 ]]
            -- upvalues: v34 (ref), v32 (ref)
            v34(v32:GetCollaboratorsList());
        end;
        local v37 = v32.CollaboratorInstanceCreatedSignal:Connect(v36);
        local v38 = v32.CollaboratorInstanceDestroyedSignal:Connect(v36);
        local v39 = v32.CollaboratorIdleUpdate:Connect(v36);
        return function() --[[ Line: 81 ]]
            -- upvalues: v37 (copy), v38 (copy), v39 (copy)
            v37:Disconnect();
            v38:Disconnect();
            v39:Disconnect();
        end;
    end, {});
    local v40 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        HoverArea = v1.createElement(l_HoverArea_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Cursor = "PointingHand"
        })
    };
    for v41, v42 in v33 do
        if v41 <= 4 then
            v40[v42.UserId] = v1.createElement(l_Pane_0, {
                Size = UDim2.fromOffset(18, 24), 
                OnClick = function() --[[ Line: 105 ]] --[[ Name: OnClick ]]
                    -- upvalues: v25 (copy)
                    v25.OnClick();
                end
            }, {
                Avatar = v1.createElement(v14, {
                    Id = v42.UserId, 
                    IsIdle = v42.IsIdle, 
                    Size = v29.ribbonItem.size, 
                    RingColor = v42.CollaboratorColor3, 
                    BackgroundColor3 = v26 and v29.ribbonItem.buttonHover or v29.ribbonItem.background, 
                    BackgroundTransparency = 0
                }), 
                Corner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                })
            });
        else
            break;
        end;
    end;
    if #v33 > 4 then
        table.insert(v40, v1.createElement(l_Pane_0, {
            Size = v29.ribbonItem.size, 
            BackgroundColor3 = v29.ribbonItem.overflowBackground, 
            BackgroundTransparency = 0, 
            LayoutOrder = 4, 
            ZIndex = 4, 
            OnClick = v25.OnClick
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            Text = v1.createElement(l_TextLabel_0, {
                Text = "+" .. #v33 - 4, 
                Position = UDim2.fromOffset(-1, -1), 
                TextSize = 13, 
                Font = Enum.Font.SourceSansSemibold, 
                ZIndex = 5
            })
        }));
    end;
    if v25.Widget then
        local l_StudioWidgetsService_0 = game:GetService("StudioWidgetsService");
        local l_RunService_0 = game:GetService("RunService");
        local l_l_StudioWidgetsService_0_WidgetFromPluginGui_0 = l_StudioWidgetsService_0:GetWidgetFromPluginGui(v25.Widget);
        if l_RunService_0:IsEdit() then
            local v46 = v24(#v33, true);
            l_l_StudioWidgetsService_0_WidgetFromPluginGui_0:SetFixedSize(v46.X, v46.Y);
        else
            l_l_StudioWidgetsService_0_WidgetFromPluginGui_0:SetFixedSize(1, 24);
        end;
    end;
    local v47 = v24(#v33, false);
    return v1.createElement(l_Pane_0, {
        Spacing = 0, 
        BackgroundColor3 = v29.ribbonItem.background
    }, {
        v1.createElement(l_Pane_0, {
            Style = "Box", 
            Size = UDim2.new(0, v47.X, 1, 0), 
            BackgroundColor3 = v26 and v29.ribbonItem.buttonHover or v29.ribbonItem.background, 
            Padding = #v33 > 0 and 2 or 0, 
            OnClick = v25.OnClick, 
            [v1.Event.MouseEnter] = function() --[[ Line: 176 ]]
                -- upvalues: v27 (copy)
                v27(true);
            end, 
            [v1.Event.MouseLeave] = function() --[[ Line: 179 ]]
                -- upvalues: v27 (copy)
                v27(false);
            end
        }, v40); 
        AddCollaboratorButton = v1.createElement(l_Pane_0, {
            LayoutOrder = 100
        }, {
            v1.createElement(l_IconButton_0, {
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = v29.ribbonItem.size, 
                Position = #v33 > 0 and UDim2.new(1, 0, 0, 0) or UDim2.new(1, -6, 0, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                LeftIcon = v29.ribbonItem.addIcon, 
                OnClick = function() --[[ Line: 193 ]] --[[ Name: OnClick ]]
                    -- upvalues: v31 (copy), v28 (copy)
                    v31:report("manageCollaboratorsPressed");
                    v28:Fire("ToggleManageCollaborators");
                end, 
                Spacing = 4, 
                Padding = 4, 
                HoverColor = v29.ribbonItem.buttonHover, 
                Text = #v33 == 0 and v30:getText("Ribbon", "Collaborate") or nil, 
                BackgroundStyle = "RoundBox", 
                BackgroundColor = v29.ribbonItem.background
            })
        })
    });
end;