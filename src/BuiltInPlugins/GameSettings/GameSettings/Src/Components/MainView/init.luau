local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v6.UI;
local l_Util_0 = v6.Util;
local l_Button_0 = l_UI_0.Button;
local l_Container_0 = l_UI_0.Container;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_FitTextLabel_0 = l_Util_0.FitFrame.FitTextLabel;
local v15 = require(l_Parent_0.Src.Components.MenuBar);
local v16 = require(l_Parent_0.Src.Components.Separator);
local v17 = require(l_Parent_0.Src.Components.Footer);
local v18 = require(l_Parent_0.Pages.PageManifest);
local v19 = require(l_Parent_0.Src.Util.Analytics);
local l_TextService_0 = game:GetService("TextService");
local v21 = v2.PureComponent:extend("MainView");
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
v21.init = function(v23) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy)
    local v24 = nil;
    local l_FirstSelectedId_0 = v23.props.FirstSelectedId;
    if l_FirstSelectedId_0 and l_FirstSelectedId_0 ~= "" then
        for v26, v27 in ipairs(v18) do
            if v27 and v27.LocalizationId == l_FirstSelectedId_0 then
                v24 = v26;
                break;
            end;
        end;
        assert(v24, "There are no pages in PageManifest with LocalizationId \"" .. l_FirstSelectedId_0 .. "\"");
    else
        local v28 = nil;
        for v29, v30 in ipairs(v18) do
            if v30 then
                v28 = v29;
                break;
            end;
        end;
        assert(v28, "There are no valid pages in PageManifest");
        v24 = v28;
    end;
    v23.state = {
        Selected = v24, 
        PageContentOffset = 0
    };
end;
v21.pageSelected = function(v31, v32) --[[ Line: 75 ]] --[[ Name: pageSelected ]]
    -- upvalues: v18 (copy), v19 (copy)
    local l_LocalizationId_0 = v18[v31.state.Selected].LocalizationId;
    local l_LocalizationId_1 = v18[v32].LocalizationId;
    v19.onTabChangeEvent(l_LocalizationId_0, l_LocalizationId_1);
    v31:setState({
        Selected = v32
    });
end;
v21.render = function(v35) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v2 (copy), l_TextService_0 (copy), l_FitTextLabel_0 (copy), v4 (copy), l_Button_0 (copy), l_StudioPublishService_0 (copy), l_HoverArea_0 (copy), v1 (copy), l_Container_0 (copy), v15 (copy), v16 (copy), v5 (copy), v17 (copy)
    local l_props_0 = v35.props;
    local l_Selected_0 = v35.state.Selected;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v40 = l_props_0.GameId ~= 0;
    local l_PageLoadStates_0 = l_props_0.PageLoadStates;
    local v42 = {};
    local v43 = {};
    if v40 then
        for v44, v45 in ipairs(v18) do
            if v45 then
                local v46 = l_PageLoadStates_0[v45.LocalizationId];
                v43[v44] = v45.LocalizationId;
                v42[tostring(v45)] = (not (v44 ~= l_Selected_0) or v46 ~= nil) and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    Visible = v44 == l_Selected_0
                }, {
                    PageContents = v2.createElement(v45)
                });
            end;
        end;
    end;
    local v47 = l_Localization_0:getText("General", "PublishText");
    local v48 = l_Localization_0:getText("General", "ButtonPublish");
    v47 = l_Localization_0:getText("General", "SaveText");
    v48 = l_Localization_0:getText("General", "ButtonSaveToRoblox");
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v48, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font, Vector2.new(1e999, 1e999));
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor
    }, not v40 and {
        UseText = v2.createElement(l_FitTextLabel_0, v4.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_0.mainView.publishText.offset), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = v47, 
            BackgroundTransparency = 1, 
            width = l_Stylizer_0.mainView.publishText.width
        })), 
        PublishButton = v2.createElement(l_Button_0, {
            Style = "GameSettingsPrimaryButton", 
            Text = v48, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + l_Stylizer_0.mainView.publishButton.paddingX, 0, l_l_TextService_0_TextSize_0.Y + l_Stylizer_0.mainView.publishButton.paddingY), 
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_0.mainView.publishButton.offset), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            OnClick = function() --[[ Line: 154 ]] --[[ Name: OnClick ]]
                -- upvalues: l_StudioPublishService_0 (ref), v35 (copy)
                l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
                v35.props.OnClose(false);
            end
        }, {
            v2.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        })
    } or {
        Padding = if v1 then nil else v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 5)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        CenterContent = v2.createElement(l_Container_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 1, -l_Stylizer_0.footer.height)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            MenuBar = v2.createElement(v15, {
                LayoutOrder = 1, 
                Entries = v43, 
                Selected = l_Selected_0, 
                SelectionChanged = function(v50) --[[ Line: 186 ]] --[[ Name: SelectionChanged ]]
                    -- upvalues: v35 (copy)
                    v35:pageSelected(v50);
                end
            }), 
            Separator = v2.createElement(v16, {
                LayoutOrder = 2, 
                Size = UDim2.new(0, 3, 1, 0), 
                Position = UDim2.new(0, v5.MENU_BAR_WIDTH, 0, 0)
            }), 
            PageContent = v2.createElement("Frame", {
                LayoutOrder = 3, 
                Size = UDim2.new(1, -v35.state.PageContentOffset, 1, 0), 
                BackgroundTransparency = 1, 
                [v2.Change.AbsolutePosition] = function(v51) --[[ Line: 202 ]]
                    -- upvalues: v35 (copy)
                    local l_Parent_1 = v51.Parent;
                    if not l_Parent_1 then
                        return;
                    else
                        local v53 = v51.AbsolutePosition - l_Parent_1.AbsolutePosition;
                        v35:setState({
                            PageContentOffset = v53.X
                        });
                        return;
                    end;
                end
            }, v42)
        }), 
        FooterContent = v2.createElement(l_Container_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.footer.height), 
            LayoutOrder = 2
        }, {
            Footer = v2.createElement(v17, {
                OnClose = function(v54, v55) --[[ Line: 219 ]] --[[ Name: OnClose ]]
                    -- upvalues: v35 (copy)
                    v35.props.OnClose(v54, v55);
                end
            })
        })
    });
end;
v21 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v21);
return (v3.connect(function(v56, _) --[[ Line: 232 ]]
    return {
        GameId = v56.Metadata.gameId, 
        PageLoadStates = v56.PageLoadState
    };
end)(v21));