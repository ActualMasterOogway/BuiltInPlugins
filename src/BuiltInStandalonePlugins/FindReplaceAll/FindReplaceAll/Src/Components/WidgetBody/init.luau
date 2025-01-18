local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TreeView_0 = v2.UI.TreeView;
local v4 = v2.Util.LayoutOrderIterator.new();
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_Localization_0 = v2.ContextServices.Localization;
local l_joinTags_0 = v2.Styling.joinTags;
local function v13(v8) --[[ Line: 26 ]] --[[ Name: getNumResults ]]
    local v9 = 0;
    local v10 = 0;
    for _, v12 in ipairs(v8) do
        if v12.children and v12.text then
            v10 = v10 + 1;
            v9 = v9 + #v12.children;
        else
            warn("Result does not have children", v12);
        end;
    end;
    return v10, v9;
end;
return function(v14) --[[ Line: 40 ]] --[[ Name: WidgetBody ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v13 (copy), l_joinTags_0 (copy), v4 (copy), l_TreeView_0 (copy), l_join_0 (copy)
    local v15 = l_Localization_0:use();
    local v16, v17 = v1.useState({});
    local v18, v19 = v1.useState({});
    local v20, v21 = v1.useState(0);
    local v22, v23 = v1.useState(0);
    v1.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: v13 (ref), v14 (copy), v21 (copy), v23 (copy)
        local v24, v25 = v13(v14.FindResults);
        v21(v25);
        v23(v24);
    end, {
        v14.FindResults
    });
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0(v14[v1.Tag], "Component-WidgetBody", "X-Transparent"), 
        LayoutOrder = v14.LayoutOrder
    }, {
        ResultsLine = v1.createElement("Frame", {
            [v1.Tag] = "ResultsLine", 
            LayoutOrder = v4:getNextOrder()
        }, {
            ResultsText = v1.createElement("TextLabel", {
                [v1.Tag] = "ResultsText X-Transparent", 
                LayoutOrder = v4:getNextOrder(), 
                Text = if v20 > 0 then v15:getText("WidgetBody", "ResultsText", {
                    numResults = ("%*"):format(v20), 
                    numResultFiles = ("%*"):format(v22)
                }) else ""
            })
        }), 
        ResultsTree = v1.createElement(l_TreeView_0, {
            [v1.Tag] = "ResultsTree X-Fill", 
            LayoutOrder = v4:getNextOrder(), 
            Expansion = v16, 
            Selection = v18, 
            RootItems = v14.FindResults, 
            OnExpansionChange = function(v26) --[[ Line: 80 ]] --[[ Name: OnExpansionChange ]]
                -- upvalues: v17 (copy), l_join_0 (ref), v16 (copy)
                v17(l_join_0(v16, v26));
            end, 
            OnSelectionChange = function(v27) --[[ Line: 83 ]] --[[ Name: OnSelectionChange ]]
                -- upvalues: v19 (copy), l_join_0 (ref), v18 (copy)
                v19(l_join_0(v18, v27));
            end
        })
    });
end;