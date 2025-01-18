local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v13 = require(l_Parent_0.Src.Components.CollaboratorItem);
local v14 = require(l_Parent_0.Src.Components.CollaboratorListFooter);
local v15 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local l_UserId_0 = game:GetService("StudioService"):GetUserId();
return function() --[[ Line: 24 ]] --[[ Name: CollaboratorList ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), l_Analytics_0 (copy), v15 (copy), v1 (copy), l_UserId_0 (copy), v13 (copy), l_Pane_0 (copy), l_ScrollingFrame_0 (copy), l_Image_0 (copy), v14 (copy), l_TextLabel_0 (copy), l_Button_0 (copy)
    local v17 = l_Localization_0.use();
    local v18 = l_Stylizer_0:use();
    local v19 = l_Analytics_0:use();
    local l_StudioPublishService_0 = game:GetService("StudioPublishService");
    local v21 = v15:use():get();
    local v22, v23 = v1.useState({});
    local v24, v25 = v1.useState(true);
    local v26, v27 = v1.useState(false);
    local v28 = game.GameId > 0;
    v1.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v21 (copy), v23 (copy)
        local l_v21_CollaboratorsList_0 = v21:GetCollaboratorsList();
        v23(l_v21_CollaboratorsList_0);
        local v30 = v21.CollaboratorInstanceCreatedSignal:Connect(function() --[[ Line: 42 ]]
            -- upvalues: v23 (ref), v21 (ref)
            v23(v21:GetCollaboratorsList());
        end);
        local v31 = v21.CollaboratorInstanceDestroyedSignal:Connect(function() --[[ Line: 45 ]]
            -- upvalues: v23 (ref), v21 (ref)
            v23(v21:GetCollaboratorsList());
        end);
        local v32 = v21.CollaboratorStatusUpdatedSignal:Connect(function() --[[ Line: 48 ]]
            -- upvalues: v23 (ref), v21 (ref)
            v23(v21:GetCollaboratorsList());
        end);
        local v33 = v21.CollaboratorIdleUpdate:Connect(function() --[[ Line: 51 ]]
            -- upvalues: v23 (ref), v21 (ref)
            v23(v21:GetCollaboratorsList());
        end);
        return function() --[[ Line: 54 ]]
            -- upvalues: v30 (copy), v31 (copy), v32 (copy), v33 (copy)
            v30:Disconnect();
            v31:Disconnect();
            v32:Disconnect();
            v33:Disconnect();
        end;
    end, {});
    if #v22 ~= 0 then
        local v34 = {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        for v35, v36 in v22 do
            local v37 = v36.UserId == l_UserId_0 and -1 or v35;
            local l_createElement_0 = v1.createElement;
            local l_v13_0 = v13;
            local v40 = {
                Id = v36.UserId, 
                Username = v36.Username, 
                Color = v36.CollaboratorColor3, 
                IsIdle = v36.IsIdle, 
                Status = tostring(v36.Status), 
                CurDocGUID = v36.CurDocGUID
            };
            local v41 = false;
            if v36.UserId == l_UserId_0 then
                v41 = v26;
            end;
            v40.CanJumpBack = v41;
            v40.OnJump = function() --[[ Line: 79 ]] --[[ Name: OnJump ]]
                -- upvalues: v27 (copy), v36 (copy), l_UserId_0 (ref)
                v27(v36.UserId ~= l_UserId_0);
            end;
            v34[v37] = l_createElement_0(l_v13_0, v40);
        end;
        return v1.createElement(l_Pane_0, {
            Size = UDim2.fromScale(1, 1)
        }, {
            Body = v1.createElement(l_ScrollingFrame_0, {
                Padding = 8, 
                Size = UDim2.new(1, 0, 1, -(v18.footer.height + v18.highlightToggle.height))
            }, v34), 
            HighlightToggle = v1.createElement("TextButton", {
                Text = v17:getText("Settings", "ShowSelections"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = v18.footer.iconColor, 
                TextSize = 16, 
                FontFace = Font.fromEnum(Enum.Font.SourceSans), 
                AutoButtonColor = false, 
                BackgroundColor3 = v18.highlightToggle.background, 
                BorderColor3 = v18.highlightToggle.border, 
                Size = UDim2.new(1, 0, 0, v18.highlightToggle.height), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, -v18.footer.height - 1), 
                ZIndex = 2, 
                [v1.Event.Activated] = function() --[[ Line: 103 ]]
                    -- upvalues: v21 (copy), v24 (copy), v19 (copy), v25 (copy)
                    v21:ToggleSelectionHighlights(not v24);
                    v19:report("highlightsToggled", not v24);
                    v25(not v24);
                end
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 26)
                }), 
                Image = v1.createElement(l_Image_0, {
                    Image = v24 and v18.footer.checkedIcon or v18.footer.uncheckedIcon, 
                    Size = UDim2.fromOffset(16, 16), 
                    Position = UDim2.new(0, -6, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5)
                })
            }), 
            Footer = v1.createElement(v14)
        });
    else
        return v1.createElement(l_Pane_0, {
            Size = UDim2.fromScale(1, 1), 
            Style = "Box"
        }, {
            TeamCreateText = v1.createElement(l_TextLabel_0, {
                Text = v28 and v17:getText("Settings", "EnableTeamCreateText") or v17:getText("Settings", "SaveToRobloxText"), 
                Size = UDim2.new(1, 0, 0, 48), 
                Position = UDim2.new(0.5, 0, 0.5, -8), 
                AnchorPoint = Vector2.new(0.5, 1), 
                TextWrapped = true, 
                Style = "Body", 
                TextSize = 16
            }), 
            Button = v1.createElement(l_Button_0, {
                Style = "RoundPrimary", 
                Text = v28 and v17:getText("Settings", "EnableTeamCreate") or v17:getText("Settings", "SaveToRoblox"), 
                OnClick = function() --[[ Line: 137 ]] --[[ Name: OnClick ]]
                    -- upvalues: v28 (copy), v21 (copy), l_StudioPublishService_0 (copy)
                    if v28 then
                        v21:ToggleTeamCreate(true);
                        return;
                    else
                        l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
                        return;
                    end;
                end, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromOffset(142, 40)
            })
        });
    end;
end;