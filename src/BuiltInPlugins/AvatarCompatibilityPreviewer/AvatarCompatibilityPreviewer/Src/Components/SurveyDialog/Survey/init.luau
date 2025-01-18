local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.SurveyDialog.Stars);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v2.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v15 = {
    "Teeth", 
    "Mouth", 
    "Eyes", 
    "Eyebrows", 
    "Eyelashes", 
    "Hair"
};
return function(v16) --[[ Line: 41 ]] --[[ Name: Survey ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), v15 (copy), l_Checkbox_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v4 (copy), v1 (copy), l_TextInput_0 (copy)
    local v17 = l_Localization_0:use();
    local v18 = l_Stylizer_0:use("Survey");
    local v19 = l_LayoutOrderIterator_0.new();
    local v26 = v3.useCallback(function(v20) --[[ Line: 47 ]]
        -- upvalues: v16 (copy), v15 (ref)
        v16.setResults(function(v21) --[[ Line: 48 ]]
            -- upvalues: v20 (copy), v15 (ref)
            local v22 = table.clone(v21);
            local v23 = table.clone(v22.problems);
            if v23[v20] then
                v23[v20] = nil;
            else
                v23[v20] = true;
            end;
            if v20 == "HeadLooksBad" then
                for _, v25 in v15 do
                    v23[("Head%*"):format(v25)] = nil;
                end;
            end;
            v22.problems = v23;
            return v22;
        end);
    end, {});
    local function v28(v27) --[[ Line: 71 ]] --[[ Name: checkbox ]]
        -- upvalues: v3 (ref), l_Checkbox_0 (ref), v16 (copy), v19 (copy), v26 (copy), v17 (copy)
        return v3.createElement(l_Checkbox_0, {
            Key = v27, 
            Checked = v16.results.problems[v27], 
            LayoutOrder = v19:getNextOrder(), 
            OnClick = v26, 
            Text = v17:getText("Survey", (("Problem%*"):format(v27))), 
            TextWrapped = true
        });
    end;
    local v32 = v3.useCallback(function(v29) --[[ Line: 82 ]]
        -- upvalues: v16 (copy)
        v16.setResults(function(v30) --[[ Line: 83 ]]
            -- upvalues: v29 (copy)
            local v31 = table.clone(v30);
            v31.message = v29;
            return v31;
        end);
    end, {});
    local v36 = v3.useCallback(function(v33) --[[ Line: 90 ]]
        -- upvalues: v16 (copy)
        v16.setResults(function(v34) --[[ Line: 91 ]]
            -- upvalues: v33 (copy)
            local v35 = table.clone(v34);
            v35.rating = v33;
            return v35;
        end);
    end, {});
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v18.Spacing, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        [v3.Change.AbsoluteSize] = function(v37) --[[ Line: 104 ]]
            -- upvalues: v16 (copy)
            v16.setHeight(v37.AbsoluteSize.Y);
        end
    }, {
        PleaseRateYourExperience = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v19:getNextOrder(), 
            Style = "Bold", 
            Text = v17:getText("Survey", "PleaseRateYourExperience")
        }), 
        Stars = v3.createElement(v4, {
            layoutOrder = v19:getNextOrder(), 
            rating = v16.results.rating, 
            setRating = v36
        }), 
        Gap = v3.createElement("Frame", {
            LayoutOrder = v19:getNextOrder()
        }), 
        UserIntent = v3.createElement(v3.Fragment, {}, {
            IntentForResults = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v19:getNextOrder(), 
                Style = "Bold", 
                Text = v17:getText("Survey", "IntentForResults")
            }), 
            UseAsNPC = v28("UseAsNPC"), 
            UseForMarketplace = v28("UseForMarketplace"), 
            Gap1 = v3.createElement("Frame", {
                LayoutOrder = v19:getNextOrder()
            })
        }), 
        WhatAreasShouldWeImproveOn = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v19:getNextOrder(), 
            Style = "Bold", 
            Text = v17:getText("Survey", "WhatAreasShouldWeImproveOn")
        }), 
        CharacterDoesntBend = v28("CharacterDoesntBend"), 
        CharacterWeirdBend = v28("CharacterWeirdBend"), 
        BadLayeredClothing = v28("BadLayeredClothing"), 
        Heads = v3.createElement(v3.Fragment, {}, {
            HeadLooksBad = v28("HeadLooksBad"), 
            SpecificProblems = v16.results.problems.HeadLooksBad and v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v19:getNextOrder(), 
                Spacing = v18.Spacing, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v18.HeadIndent)
                }), 
                Specifically = v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v19:getNextOrder(), 
                    Text = v17:getText("Survey", "Specifically")
                }), 
                SpecificProblems = v3.createElement(v3.Fragment, {}, v1.map(v15, function(v38) --[[ Line: 176 ]]
                    -- upvalues: v28 (copy)
                    return v28((("Head%*"):format(v38))), v38;
                end))
            })
        }), 
        Gap2 = v3.createElement("Frame", {
            LayoutOrder = v19:getNextOrder()
        }), 
        Message = v3.createElement(l_TextInput_0, {
            MultiLine = true, 
            LayoutOrder = v19:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, v18.MessageHeight), 
            PlaceholderText = v17:getText("Survey", "MessagePlaceholder"), 
            Text = v16.results.message, 
            OnTextChanged = v32
        })
    });
end;