local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v12 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v13 = v1.PureComponent:extend("ImageLocalizationSection");
local l_HttpService_0 = game:GetService("HttpService");
local function v18(v15) --[[ Line: 26 ]] --[[ Name: sendPostRequest ]]
    -- upvalues: l_HttpService_0 (copy)
    l_HttpService_0:RequestInternal({
        Url = "https://apis.sitetest1.robloxlabs.com/image-localization-api/v1/image-localization/ingest", 
        Method = "POST", 
        Headers = {
            ["Content-Type"] = "application/json"
        }, 
        Body = v15
    }):Start(function(v16, v17) --[[ Line: 36 ]]
        if not v16 then
            warn("Error on request: " .. v17);
            return;
        elseif not v17.Success then
            warn("Error returned: " .. v17.StatusCode .. " " .. v17.StatusMessage .. " " .. v17.Body);
            return;
        else
            return;
        end;
    end);
end;
local function _(v19) --[[ Line: 49 ]] --[[ Name: sendImageAssetIds ]]
    -- upvalues: l_HttpService_0 (copy), v18 (copy)
    local v20 = l_HttpService_0:JSONEncode({
        assetIds = v19, 
        universeId = game.GameId
    });
    v18(v20);
end;
local function v26() --[[ Line: 58 ]] --[[ Name: onUploadButtonClicked ]]
    -- upvalues: l_HttpService_0 (copy), v18 (copy)
    local v22 = {};
    for _, v24 in pairs(workspace:GetDescendants()) do
        if v24:IsA("ImageLabel") or v24:IsA("ImageButton") then
            table.insert(v22, v24.Image);
        end;
    end;
    if #v22 > 0 then
        local v25 = l_HttpService_0:JSONEncode({
            assetIds = v22, 
            universeId = game.GameId
        });
        v18(v25);
    end;
end;
v13.init = function(v27) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v26 (copy)
    v27.uploadImageAssetIds = function() --[[ Line: 73 ]]
        -- upvalues: v26 (ref)
        v26();
    end;
end;
v13.render = function(v28) --[[ Line: 78 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TitledFrame_0 (copy), l_Button_0 (copy), l_HoverArea_0 (copy), l_TextLabel_0 (copy)
    if not game:GetFastFlag("ImageLocalizationFeatureEnabled") then
        return;
    else
        local l_props_0 = v28.props;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local l_Localization_0 = l_props_0.Localization;
        local l_LayoutOrder_0 = l_props_0.LayoutOrder;
        local v33 = v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Padding = {
                Top = l_Stylizer_0.PaddingTop, 
                Left = l_Stylizer_0.LeftIndent
            }
        }, {
            Upload = v1.createElement(l_TitledFrame_0, {
                Title = l_Localization_0:getText("ImageLocalizationSection", "UploadButtonLabel"), 
                TitleWidth = l_Stylizer_0.LabelWidth
            }, {
                ButtonContainer = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 1, 0)
                }, {
                    Button = v1.createElement(l_Button_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        OnClick = v28.uploadImageAssetIds, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, l_Stylizer_0.ButtonHeight), 
                        Style = "TextButton", 
                        Text = l_Localization_0:getText("ImageLocalizationSection", "UploadButton")
                    }, {
                        v1.createElement(l_HoverArea_0, {
                            Cursor = "PointingHand"
                        })
                    })
                })
            })
        });
        return v1.createElement(l_Pane_0, {
            LayoutOrder = l_LayoutOrder_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Padding = {
                Top = l_Stylizer_0.PaddingTop
            }, 
            Spacing = l_Stylizer_0.Spacing
        }, {
            SectionLabel = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                Style = "Label", 
                Text = l_Localization_0:getText("ImageLocalizationSection", "SectionLabel")
            }), 
            Content = v33
        });
    end;
end;
local function v36(v34, _) --[[ Line: 135 ]] --[[ Name: mapStateToProps ]]
    return {
        IsBusy = v34.CloudTable.IsBusy
    };
end;
v13 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = v12
})(v13);
return v2.connect(v36)(v13);