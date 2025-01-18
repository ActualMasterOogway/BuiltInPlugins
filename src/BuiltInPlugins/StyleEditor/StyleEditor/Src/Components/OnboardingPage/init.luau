local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.React);
local l_useEffect_0 = v4.useEffect;
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_DropShadow_0 = l_UI_0.DropShadow;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v14 = require(l_Parent_0.Src.Util.createBlankSystem);
local v15 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v16 = require(l_Parent_0.Src.Resources.ModernIcons);
local v17 = require(l_Parent_0.Src.Resources.Telemetry.OnboardingLearnLinkClickedEvent);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v19 = require(l_Actions_0.Window.SetRootRoute);
local v20 = require(l_Actions_0.Window.SetDesignSheet);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v22 = require(l_Thunks_0.Telemetry.SendTelemetryEvent);
local v23 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local v24 = require(l_Parent_0.Src.Hooks.useDispatch);
return function() --[[ Line: 42 ]] --[[ Name: OnboardingPage ]]
    -- upvalues: v24 (copy), v23 (copy), v19 (copy), v15 (copy), v14 (copy), l_ReplicatedStorage_0 (copy), v20 (copy), l_GuiService_0 (copy), v22 (copy), v17 (copy), l_useEffect_0 (copy), v4 (copy), l_DropShadow_0 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), v16 (copy), l_Image_0 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy)
    local v25 = v24();
    local l_Localization_0 = v23().Localization;
    local function v27() --[[ Line: 47 ]] --[[ Name: onClose ]]
        -- upvalues: v25 (copy), v19 (ref)
        v25(v19("Main"));
    end;
    local function v29() --[[ Line: 51 ]] --[[ Name: createDesignSystem ]]
        -- upvalues: v15 (ref), v14 (ref), l_ReplicatedStorage_0 (ref), v25 (copy), v20 (ref), v19 (ref)
        local v28 = nil;
        v15({
            Name = "StyleEditor.CreateDesignSystem", 
            DisplayName = "Style Editor - Create Design", 
            DoChange = function() --[[ Line: 57 ]] --[[ Name: DoChange ]]
                -- upvalues: v28 (ref), v14 (ref), l_ReplicatedStorage_0 (ref)
                v28 = v14();
                v28.Parent = l_ReplicatedStorage_0;
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        v25(v20(v28.Design));
        v25(v19("Main"));
    end;
    local function v30() --[[ Line: 67 ]] --[[ Name: openLink ]]
        -- upvalues: l_GuiService_0 (ref), v25 (copy), v22 (ref), v17 (ref)
        l_GuiService_0:OpenBrowserWindow("https://devforum.roblox.com/");
        v25(v22(v17()));
    end;
    l_useEffect_0(function() --[[ Line: 72 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v25 (copy), v20 (ref), v19 (ref)
        for _, v32 in l_ReplicatedStorage_0:GetDescendants() do
            if v32:IsA("StyleSheet") and v32:GetAttribute("StyleCategory") == "Designs" then
                v25(v20(v32));
                v25(v19("Main"));
                break;
            end;
        end;
        local v34 = l_ReplicatedStorage_0.DescendantAdded:Connect(function(v33) --[[ Line: 84 ]]
            -- upvalues: v25 (ref), v19 (ref)
            if v33:IsA("StyleSheet") then
                v25(v19("Main"));
            end;
        end);
        return function() --[[ Line: 90 ]]
            -- upvalues: v34 (copy)
            if v34 then
                v34:Disconnect();
            end;
        end;
    end, {});
    return v4.createElement(l_DropShadow_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.fromScale(0, 0)
    }, {
        Column = v4.createElement(l_Pane_0, {
            [v4.Tag] = "OnboardingPage X-ColumnM X-Fit X-PadL"
        }, {
            CloseContainer = v4.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                [v4.Tag] = "X-FitY"
            }, {
                Close = v4.createElement(l_IconButton_0, {
                    Cursor = "PointingHand", 
                    LeftIcon = {
                        Image = v16.close(), 
                        [v4.Tag] = "Icon22"
                    }, 
                    OnClick = v27, 
                    [v4.Tag] = "Compact IconOnly PositionRight"
                })
            }), 
            StylingImage = v4.createElement(l_Image_0, {
                Image = v16.onboarding(), 
                LayoutOrder = 2
            }), 
            Title = v4.createElement(l_TextLabel_0, {
                LayoutOrder = 3, 
                Text = l_Localization_0:getText("Onboarding", "Title"), 
                [v4.Tag] = "Subtitle X-Fit"
            }), 
            Description = v4.createElement(l_TextLabel_0, {
                LayoutOrder = 4, 
                Text = l_Localization_0:getText("Onboarding", "Description"), 
                [v4.Tag] = "TextXAlignLeft X-FitY"
            }), 
            ButtonContainer = v4.createElement(l_Pane_0, {
                LayoutOrder = 5
            }, {
                Link = v4.createElement(l_LinkText_0, {
                    OnClick = v30, 
                    Text = l_Localization_0:getText("Onboarding", "LearnMore")
                }), 
                BlankButton = v4.createElement(l_IconButton_0, {
                    Cursor = "PointingHand", 
                    OnClick = v29, 
                    Text = l_Localization_0:getText("Onboarding", "CreateDesign"), 
                    [v4.Tag] = "PositionRight PrimaryBrand"
                })
            })
        })
    });
end;