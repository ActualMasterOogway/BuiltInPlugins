local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Components.DraftStatusIndicator);
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TreeViewRow_0 = l_UI_0.TreeViewRow;
local v10 = require(l_Parent_0.Src.Symbols.DraftState);
local v11 = require(l_Parent_0.Src.Symbols.CommitState);
local v12 = require(l_Parent_0.Src.Symbols.AutosaveState);
local v13 = v1.PureComponent:extend("DraftListItem");
v13.init = function(v14) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v11 (copy), v1 (copy), v6 (copy), v12 (copy)
    v14:setState({
        draftName = nil
    });
    v14.nameUpdated = function() --[[ Line: 34 ]]
        -- upvalues: v14 (copy)
        local l_Draft_0 = v14.props.Draft;
        v14:setState({
            draftName = l_Draft_0.Name
        });
    end;
    v14.getDraftIndicator = function() --[[ Line: 41 ]]
        -- upvalues: v14 (copy), v10 (ref), v11 (ref), v1 (ref), v6 (ref)
        local v16 = v14.props.Drafts[v14.props.Draft];
        local l_Localization_0 = v14.props.Localization;
        local l_Stylizer_0 = v14.props.Stylizer;
        local v19 = nil;
        local v20 = nil;
        if v16[v10.Committed] == v11.Committed then
            v19 = l_Localization_0:getText("Tooltip", "DraftCommitted");
            v20 = l_Stylizer_0.icons.DraftState.Committed;
        elseif v16[v10.Deleted] then
            v19 = l_Localization_0:getText("Tooltip", "ScriptDeleted");
            v20 = l_Stylizer_0.icons.DraftState.Deleted;
        elseif v16[v10.Outdated] then
            v19 = l_Localization_0:getText("Tooltip", "DraftOutdated");
            v20 = l_Stylizer_0.icons.DraftState.Outdated;
        end;
        if v20 then
            return v1.createElement(v6, {
                Tooltip = v19, 
                Icon = v20
            });
        else
            return;
        end;
    end;
    v14.getStatusText = function() --[[ Line: 67 ]]
        -- upvalues: v14 (copy), v10 (ref), v11 (ref), v12 (ref)
        local v21 = v14.props.Drafts[v14.props.Draft];
        local l_Localization_1 = v14.props.Localization;
        if v21[v10.Committed] == v11.Committed then
            return "";
        elseif v21[v10.Committed] == v11.Committing then
            return l_Localization_1:getText("StatusText", "Committing");
        elseif v21[v10.Autosaved] == v12.Saved then
            return l_Localization_1:getText("StatusText", "Uncommitted");
        elseif v21[v10.Autosaved] == v12.Saving then
            return l_Localization_1:getText("StatusText", "Saving");
        else
            return "";
        end;
    end;
    v14.getLabelText = function() --[[ Line: 84 ]]
        -- upvalues: v14 (copy), v10 (ref), v11 (ref)
        local l_Draft_1 = v14.props.Draft;
        local l_draftName_0 = v14.state.draftName;
        local v25 = v14.props.Drafts[l_Draft_1];
        local l_Localization_2 = v14.props.Localization;
        if v25[v10.Committed] == v11.Committed then
            return l_Localization_2:getText("DraftItem", "CommittedLabel", {
                l_draftName_0
            });
        else
            return ".../" .. l_draftName_0;
        end;
    end;
    v14.nameChangedConnection = v14.props.Draft:GetPropertyChangedSignal("Name"):Connect(v14.nameUpdated);
    v14.nameUpdated();
end;
v13.didUpdate = function(v27, v28) --[[ Line: 101 ]] --[[ Name: didUpdate ]]
    assert(v28.Draft == v27.props.Draft, "The Draft property of DraftListItem should never be changed. These should be keyed by the draft");
end;
v13.willUnmount = function(v29) --[[ Line: 108 ]] --[[ Name: willUnmount ]]
    v29.nameChangedConnection:Disconnect();
end;
v13.render = function(v30) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TreeViewRow_0 (copy), l_TextLabel_0 (copy)
    local l_Drafts_0 = v30.props.Drafts;
    local l_Draft_2 = v30.props.Draft;
    if not l_Drafts_0[l_Draft_2] then
        return nil;
    else
        local v33 = v30.getLabelText();
        local v34 = v30.getStatusText();
        local l_RowProps_0 = v30.props.RowProps;
        return v1.createElement(l_TreeViewRow_0, {
            TailItem = function() --[[ Line: 126 ]] --[[ Name: TailItem ]]
                -- upvalues: v1 (ref), l_TextLabel_0 (ref), v34 (copy)
                return v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Style = "Label", 
                    Text = v34
                });
            end, 
            BeforeIcon = function() --[[ Line: 133 ]] --[[ Name: BeforeIcon ]]
                -- upvalues: v30 (copy)
                return v30.getDraftIndicator();
            end, 
            Children = {}, 
            Depth = 0, 
            Index = 1, 
            Item = {
                text = v33, 
                tooltip = l_Draft_2:getFullName()
            }, 
            OnToggle = function() --[[ Line: 143 ]] --[[ Name: OnToggle ]]

            end, 
            OnPress = l_RowProps_0.OnPress, 
            OnSecondaryPress = l_RowProps_0.OnSecondaryPress, 
            Selected = l_RowProps_0.Selected
        });
    end;
end;
v13 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13);
return v2.connect(function(v36, _) --[[ Line: 155 ]] --[[ Name: mapStateToProps ]]
    return {
        Drafts = v36.Drafts
    };
end)(v13);