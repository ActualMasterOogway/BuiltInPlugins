local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_GameSettingsExperienceGuidelines_0 = game:GetFastFlag("GameSettingsExperienceGuidelines");
local l_EnableContentMaturityStringChanges_0 = game:GetFastFlag("EnableContentMaturityStringChanges");
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = v3.PureComponent:extend(script.Name);
local l_OpenExperienceQuestionnaire_0 = require(l_Parent_0.Src.Util.BrowserUtils).OpenExperienceQuestionnaire;
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_Parent_0.Packages.Cryo);
local l_LayoutOrderIterator_0 = v6.Util.LayoutOrderIterator;
local l_UI_0 = v6.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Button_0 = l_UI_0.Button;
local l_GetTextSize_0 = v6.Util.GetTextSize;
v4.init = function(v15) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettingsExperienceGuidelines_0 (copy), v3 (copy)
    assert(l_GameSettingsExperienceGuidelines_0);
    v15.frameRef = v3.createRef();
    v15.state = {
        maxChildWidth = 0, 
        questionnaireButtonClicked = false
    };
    v15.updateSize = function() --[[ Line: 31 ]]
        -- upvalues: v15 (copy)
        local l_x_0 = v15.frameRef.current.AbsoluteSize.x;
        v15:setState({
            maxChildWidth = l_x_0
        });
    end;
end;
v4.didMount = function(v17) --[[ Line: 41 ]] --[[ Name: didMount ]]
    v17.updateSize();
end;
v4.render = function(v18) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: l_GameSettingsExperienceGuidelines_0 (copy), l_LayoutOrderIterator_0 (copy), l_EnableContentMaturityStringChanges_0 (copy), l_GetTextSize_0 (copy), v3 (copy), v9 (copy), l_TextLabel_0 (copy), l_Button_0 (copy), l_OpenExperienceQuestionnaire_0 (copy)
    assert(l_GameSettingsExperienceGuidelines_0);
    local l_props_0 = v18.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_GameId_0 = l_props_0.GameId;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v24 = l_LayoutOrderIterator_0.new();
    local v25 = if l_EnableContentMaturityStringChanges_0 then l_Localization_0:getText("Guidelines", "SectionTitleMaturity") else l_Localization_0:getText("Guidelines", "SectionTitle");
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    v27 = if l_props_0.GameGuideline then l_Localization_0:getText("Guidelines", "UpdateQuestionnaire") else l_Localization_0:getText("Guidelines", "SubmitQuestionnaire");
    v28 = l_GetTextSize_0(v27, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font, Vector2.new(1e999, 1e999));
    v26 = l_Localization_0:getText("Guidelines", "17PlusWarning");
    if not l_props_0.GameGuideline then
        v26 = v26 .. " " .. l_Localization_0:getText("Guidelines", "UnavailableNoticeText");
    end;
    return v3.createElement("Frame", v9.Dictionary.join({
        LayoutOrder = l_LayoutOrder_0
    }, l_Stylizer_0.guidelinesFrame), {
        Title = v3.createElement(l_TextLabel_0, v9.Dictionary.join({
            Text = v25
        }, l_Stylizer_0.guidelinesTitle)), 
        DescriptionFrame = v3.createElement("Frame", v9.Dictionary.join({
            [v3.Ref] = v18.frameRef, 
            [v3.Change.AbsoluteSize] = v18.updateSize
        }, l_Stylizer_0.guidelinesDescriptionFrame), {
            Layout = v3.createElement("UIListLayout", l_Stylizer_0.guidelinesDescriptionListLayout), 
            ChosenGuideline = v3.createElement(l_TextLabel_0, v9.Dictionary.join({
                Text = l_props_0.GameGuideline or l_Localization_0:getText("Guidelines", v18.state.questionnaireButtonClicked and "Pending" or "NotSubmitted"), 
                LayoutOrder = v24:getNextOrder(), 
                TextTransparency = l_props_0.GameGuideline and 0 or 0.5
            }, l_Stylizer_0.chosenGuidelineText)), 
            OpenQuestionnaireButton = v3.createElement(l_Button_0, v9.Dictionary.join({
                Size = UDim2.new(0, v28.X + l_Stylizer_0.openQuestionnaireButton.PaddingX, 0, v28.Y + l_Stylizer_0.openQuestionnaireButton.PaddingY), 
                Text = v27, 
                OnClick = function() --[[ Line: 127 ]] --[[ Name: OnClick ]]
                    -- upvalues: v18 (copy), l_OpenExperienceQuestionnaire_0 (ref), l_GameId_0 (copy)
                    v18:setState({
                        questionnaireButtonClicked = true
                    });
                    l_OpenExperienceQuestionnaire_0(l_GameId_0)();
                end, 
                LayoutOrder = v24:getNextOrder()
            }, l_Stylizer_0.openQuestionnaireButton)), 
            GuidelinesQuestionnaireInfo = if l_EnableContentMaturityStringChanges_0 then v3.createElement(l_TextLabel_0, v9.Dictionary.join({
                Text = l_Localization_0:getText("Guidelines", l_props_0.GameGuideline and "RetakeQuestionnaireMaturity" or "GetAContentMaturityLabel"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = v24:getNextOrder()
            }, l_Stylizer_0.guidelinesDescriptionText)) else v3.createElement(l_TextLabel_0, v9.Dictionary.join({
                Text = l_Localization_0:getText("Guidelines", l_props_0.GameGuideline and "RetakeQuestionnaire" or "GetAnAgeRecommendation"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = v24:getNextOrder()
            }, l_Stylizer_0.guidelinesDescriptionText))
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v4));