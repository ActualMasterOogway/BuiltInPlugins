local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.ContextServices.DraftsService);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v5.Util.GetTextSize;
local v9 = require(l_Parent_0.Src.Components.DraftDiscardDialog);
local v10 = require(l_Parent_0.Src.Components.DraftListItem);
local v11 = require(l_Parent_0.Src.Components.ListItemView);
local l_Button_0 = v5.UI.Button;
local l_StyleModifier_0 = v5.Util.StyleModifier;
local v14 = require(l_Parent_0.Src.Actions.DraftStateChangedAction);
local v15 = require(l_Parent_0.Src.Symbols.DraftState);
local v16 = require(l_Parent_0.Src.Symbols.CommitState);
local v17 = v3.Component:extend("DraftListView");
v17.init = function(v18) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v15 (copy), v16 (copy), l_RunService_0 (copy)
    local v19 = nil;
    v18:setState({
        draftsHasActiveSelection = false
    });
    v18.GetCurrentSelection = Instance.new("BindableFunction");
    v18.commitSelectedScripts = function() --[[ Line: 46 ]]
        -- upvalues: v18 (copy)
        local l_Drafts_0 = v18.props.Drafts;
        if next(l_Drafts_0) == nil then
            return;
        else
            local v21 = v18.GetCurrentSelection:Invoke();
            if #v21 == 0 then
                return;
            else
                v18.commitChanges(v21);
                return;
            end;
        end;
    end;
    v18.openScripts = function(v22) --[[ Line: 60 ]]
        -- upvalues: v18 (copy)
        local v23 = v18.props.Plugin:get();
        for _, v25 in pairs(v22) do
            v23:OpenScript(v25);
        end;
    end;
    v18.diffChanges = function(v26) --[[ Line: 67 ]]
        -- upvalues: v19 (ref), v18 (copy)
        v19 = v18.props.DraftService:get();
        v19:ShowDiffsAgainstServer(v26);
    end;
    v18.commitChanges = function(v27) --[[ Line: 72 ]]
        -- upvalues: v19 (ref), v18 (copy)
        v19 = v18.props.DraftService:get();
        v18.props.DraftsCommitted(v27);
        v19:CommitEdits(v27);
    end;
    v18.updateSource = function(v28) --[[ Line: 78 ]]
        -- upvalues: v19 (ref), v18 (copy)
        v19 = v18.props.DraftService:get();
        v19:UpdateToLatestVersion(v28);
    end;
    v18.restoreScripts = function(v29) --[[ Line: 83 ]]
        -- upvalues: v19 (ref), v18 (copy)
        v19 = v18.props.DraftService:get();
        v19:RestoreScripts(v29);
    end;
    v18.promptDiscardEdits = function(v30) --[[ Line: 88 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            draftsPendingDiscard = v30
        });
    end;
    v18.discardPromptClosed = function(v31) --[[ Line: 94 ]]
        -- upvalues: v19 (ref), v18 (copy), v3 (ref)
        if v31 then
            v19 = v18.props.DraftService:get();
            v19:DiscardEdits(v18.state.draftsPendingDiscard);
        end;
        v18:setState({
            draftsPendingDiscard = v3.None
        });
    end;
    v18.getIndicatorEnabled = function(v32) --[[ Line: 105 ]]
        -- upvalues: v18 (copy), v15 (ref), v16 (ref)
        local v33 = v18.props.Drafts[v32];
        local v34 = true;
        if v33[v15.Committed] ~= v16.Committed then
            v34 = v33[v15.Deleted] or v33[v15.Outdated];
        end;
        return v34;
    end;
    v18.getCommitButtonEnabled = function() --[[ Line: 112 ]]
        -- upvalues: l_RunService_0 (ref), v18 (copy)
        return l_RunService_0:IsEdit() and v18.state.draftsHasActiveSelection;
    end;
    v18.onDoubleClicked = function(v35) --[[ Line: 116 ]]
        -- upvalues: v18 (copy)
        v18.openScripts({
            v35
        });
    end;
    v18.onSelectionChanged = function(v36) --[[ Line: 120 ]]
        -- upvalues: v18 (copy)
        if v36 and next(v36) == nil then
            v18:setState({
                draftsHasActiveSelection = false
            });
            return;
        else
            v18:setState({
                draftsHasActiveSelection = true
            });
            return;
        end;
    end;
    v18.makeMenuActions = function(v37) --[[ Line: 132 ]]
        -- upvalues: v18 (copy), v15 (ref), v16 (ref), l_RunService_0 (ref)
        local l_Localization_0 = v18.props.Localization;
        local v39 = true;
        local v40 = true;
        local v41 = true;
        local v42 = true;
        local v43 = true;
        local v44 = true;
        local v45 = true;
        local v46 = true;
        for _, v48 in ipairs(v37) do
            local v49 = v18.props.Drafts[v48];
            if v49[v15.Deleted] then
                v42 = false;
                v44 = false;
                v39 = false;
            elseif v49[v15.Outdated] then
                v44 = false;
            else
                v39 = false;
            end;
            if not v49[v15.Deleted] then
                v40 = false;
            end;
            if v49[v15.Committed] == v16.Committing then
                v41 = false;
                v45 = false;
                v43 = false;
                v44 = false;
                v42 = false;
                v46 = false;
            end;
        end;
        if not l_RunService_0:IsEdit() then
            v40 = false;
            v39 = false;
            v44 = false;
            v42 = false;
            v46 = false;
        end;
        return {
            {
                Text = l_Localization_0:getText("ContextMenu", "OpenScript"), 
                Enabled = v41, 
                OnItemClicked = function() --[[ Line: 184 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v18 (ref), v37 (copy)
                    v18.openScripts(v37);
                end
            }, 
            {
                Text = l_Localization_0:getText("ContextMenu", "ShowDiff"), 
                Enabled = v42, 
                OnItemClicked = function() --[[ Line: 191 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v18 (ref), v37 (copy)
                    v18.diffChanges(v37);
                end
            }, 
            v39 and {
                Text = l_Localization_0:getText("ContextMenu", "Update"), 
                Enabled = v43, 
                OnItemClicked = function() --[[ Line: 198 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v18 (ref), v37 (copy)
                    v18.updateSource(v37);
                end
            }, 
            not v39 and {
                Text = l_Localization_0:getText("ContextMenu", "Commit"), 
                Enabled = v44, 
                OnItemClicked = function() --[[ Line: 205 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v18 (ref), v37 (copy)
                    v18.commitChanges(v37);
                end
            }, 
            v40 and {
                Text = l_Localization_0:getText("ContextMenu", "Restore"), 
                Enabled = v45, 
                OnItemClicked = function() --[[ Line: 212 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v18 (ref), v37 (copy)
                    v18.restoreScripts(v37);
                end
            }, 
            {
                Text = l_Localization_0:getText("ContextMenu", "Revert"), 
                Enabled = v46, 
                OnItemClicked = function() --[[ Line: 219 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v18 (ref), v37 (copy)
                    v18.promptDiscardEdits(v37);
                end
            }
        };
    end;
end;
v17.render = function(v50) --[[ Line: 229 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Button_0 (copy), l_GetTextSize_0 (copy), l_StyleModifier_0 (copy), v11 (copy), v10 (copy), v9 (copy)
    local l_Localization_1 = v50.props.Localization;
    local l_Stylizer_0 = v50.props.Stylizer;
    local l_Drafts_1 = v50.props.Drafts;
    local l_draftsPendingDiscard_0 = v50.state.draftsPendingDiscard;
    local v55 = l_draftsPendingDiscard_0 ~= nil;
    local v56 = next(l_Drafts_1) == nil;
    local v57 = v50.getCommitButtonEnabled();
    local v58 = false;
    local v59 = {};
    for v60, _ in pairs(l_Drafts_1) do
        table.insert(v59, v60);
        if not v58 then
            v58 = v50.getIndicatorEnabled(v60);
        end;
    end;
    table.sort(v59, function(v62, v63) --[[ Line: 249 ]]
        return v62.Name:lower() < v63.Name:lower();
    end);
    local v64 = l_Localization_1:getText("Toolbar", "CommitButton");
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Toolbar = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 32), 
            LayoutOrder = 0
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 4)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            CommitButton = v3.createElement(l_Button_0, {
                OnClick = v50.commitSelectedScripts, 
                Size = UDim2.new(0, l_GetTextSize_0(v64).X + 20, 1, 0), 
                StyleModifier = if not v57 then l_StyleModifier_0.Disabled else nil, 
                Style = "RoundPrimary", 
                Text = v64
            })
        }), 
        Container = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -32), 
            LayoutOrder = 1
        }, {
            ListItemView = v3.createElement(v11, {
                Items = v59, 
                ItemHeight = 24, 
                GetCurrentSelection = v50.GetCurrentSelection, 
                OnDoubleClicked = v50.onDoubleClicked, 
                OnSelectionChanged = v50.onSelectionChanged, 
                MakeMenuActions = v50.makeMenuActions, 
                RenderItem = function(v65, v66) --[[ Line: 301 ]] --[[ Name: RenderItem ]]
                    -- upvalues: v3 (ref), v10 (ref), v58 (ref)
                    return v3.createElement(v10, {
                        Draft = v65, 
                        RowProps = v66, 
                        IndicatorMargin = v58 and 24 or 0
                    });
                end
            }), 
            EmptyLabel = v56 and v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -16, 1, -16), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Text = l_Localization_1:getText("Main", "NoDrafts"), 
                TextColor3 = l_Stylizer_0.labels.MainText, 
                TextSize = 22, 
                Font = l_Stylizer_0.labels.MainFont, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        DiscardDialog = v55 and v3.createElement(v9, {
            Drafts = l_draftsPendingDiscard_0, 
            ChoiceSelected = v50.discardPromptClosed
        })
    });
end;
local function v69(v67, _) --[[ Line: 335 ]] --[[ Name: mapStateToProps ]]
    return {
        Drafts = v67.Drafts
    };
end;
local function v74(v70) --[[ Line: 343 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: v14 (copy), v15 (copy), v16 (copy)
    return {
        DraftsCommitted = function(v71) --[[ Line: 345 ]] --[[ Name: DraftsCommitted ]]
            -- upvalues: v70 (copy), v14 (ref), v15 (ref), v16 (ref)
            for _, v73 in ipairs(v71) do
                v70(v14(v73, v15.Committed, v16.Committing));
            end;
        end
    };
end;
v17 = l_withContext_0({
    DraftService = v2, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v17);
return v4.connect(v69, v74)(v17);