local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local v9 = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_Dash_0 = v4.Dash;
local _ = l_Dash_0.append;
local l_join_0 = l_Dash_0.join;
local l_map_0 = l_Dash_0.map;
local l_None_0 = l_Dash_0.None;
local v16 = require(script.CellComponent);
local v17 = require(script.Renderers);
local v18 = require(script.ScriptPaneHelpers);
local l_UI_0 = v4.UI;
local _ = l_UI_0.Pane;
local l_TreeTable_0 = l_UI_0.TreeTable;
local _ = l_script_FirstAncestor_0.Src.Actions;
local _ = l_script_FirstAncestor_0.Src.Components;
local v24 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v26 = require(l_Thunks_0.ApplyResolutions);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v28 = require(l_Util_0.ScriptReplacement);
local v29 = require(script.Sort);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v31 = {
    {
        Name = nil, 
        Key = "select", 
        SortMethod = v29.booleanSort
    }, 
    {
        Name = "NameTitle", 
        Key = "name", 
        SortMethod = v29.scriptLinkSort
    }, 
    {
        Name = nil, 
        Key = "count", 
        SortMethod = v29.optionalNumSort
    }, 
    {
        Name = "TypeTitle", 
        Key = "issue"
    }, 
    {
        Name = "R6Title", 
        Key = "r6"
    }, 
    {
        Name = "R15Title", 
        Key = "r15"
    }, 
    {
        Name = nil, 
        Key = "menu_status", 
        SortMethod = v29.booleanSort
    }
};
local function v33(v32) --[[ Line: 82 ]] --[[ Name: getChildren ]]
    return v32.children or {};
end;
local v34 = v2.PureComponent:extend("ScriptPaneTreeTable");
v34.init = function(v35) --[[ Line: 88 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy), v18 (copy), v31 (copy), l_None_0 (copy), v24 (copy), l_Selection_0 (copy), v28 (copy)
    v35.state = {
        Sizes = {
            UDim.new(0, 24), 
            UDim.new(0.5, -84), 
            UDim.new(0, 24), 
            UDim.new(0, 72), 
            UDim.new(0.25, -42), 
            UDim.new(0.25, -42), 
            UDim.new(0, 48)
        }, 
        SortChildren = nil, 
        SortIndex = 5, 
        SortOrder = Enum.SortDirection.Ascending, 
        Expansion = {}, 
        Selection = {}, 
        _Ref = {
            diagnostics = nil, 
            searchFilters = nil
        }
    };
    v35.onSizesChange = function(v36) --[[ Line: 110 ]]
        -- upvalues: v35 (copy)
        v35:setState({
            Sizes = v36
        });
    end;
    v35.onSortChange = function(v37, v38) --[[ Line: 116 ]]
        -- upvalues: l_join_0 (ref), v35 (copy), v18 (ref), v31 (ref)
        local v39 = l_join_0(v35.state.Items);
        local v40 = v18.genSortItems(v31[v37], v38);
        table.sort(v39, v40);
        v35:setState({
            Items = v39, 
            SortChildren = v18.genSortItems(v31[2], if v37 == 2 then v38 else Enum.SortDirection.Descending), 
            SortIndex = v37, 
            SortOrder = v38
        });
    end;
    v35.onCheckboxEdited = function(v41, v42) --[[ Line: 131 ]]
        -- upvalues: v35 (copy), l_join_0 (ref), v18 (ref), l_None_0 (ref)
        v35:setState({
            Selection = l_join_0(v35.state.Selection, {
                [v18.makeItemId(v42.scriptId, v42.issueType, v42.instanceName)] = if v41 then v42 else l_None_0
            })
        });
    end;
    v35.onSuggestionApplied = function(v43, v44) --[[ Line: 143 ]]
        -- upvalues: l_join_0 (ref), v35 (copy), v18 (ref)
        local v45 = l_join_0(v35.state.Items);
        local l_item_0 = v44.item;
        local v47 = l_join_0(v35.state.Selection);
        if v44.parent and v47[v18.getItemId(v44.parent)] then
            l_item_0 = v44.parent;
            v44 = l_item_0.Path;
        end;
        local v48 = {
            [v44.scriptId] = {}
        };
        l_item_0.r15.Value = v43;
        if l_item_0.children then
            l_item_0.r15.Value = v43;
            for _, v50 in l_item_0.children do
                if v50.r15.Value ~= v43 then
                    v50.r15.Value = v43;
                    table.insert(v48[v44.scriptId], v50.Path.diagnostic.diagnosticId);
                end;
            end;
        else
            table.insert(v48[v44.scriptId], l_item_0.Path.diagnostic.diagnosticId);
        end;
        for _, v52 in v45 do
            if v47 and v47[v18.getItemId(v52)] then
                v48[v52.Path.scriptId] = v48[v52.Path.scriptId] or {};
                for _, v54 in v52.children do
                    table.insert(v48[v52.Path.scriptId], v54.Path.diagnostic.diagnosticId);
                end;
            end;
        end;
        for v55, v56 in v48 do
            v35.props.ApplyResolutions(v55, v56, v43, v35.props.ScriptConversionContext);
        end;
        v35:setState({
            Items = v45, 
            Selection = {}
        });
    end;
    v35.onCellEdited = function(v57, v58, v59) --[[ Line: 205 ]]
        -- upvalues: v35 (copy)
        if v59 == 1 then
            v35.onCheckboxEdited(v57, v58);
            return;
        elseif v59 == 6 then
            v35.onSuggestionApplied(v57.Id, v58, true);
            return;
        else
            assert(false, "Unknown column changed");
            return;
        end;
    end;
    v35.onCellAction = function(v60, v61) --[[ Line: 215 ]]
        -- upvalues: v35 (copy), v24 (ref), l_Selection_0 (ref), v28 (ref), v18 (ref), l_join_0 (ref)
        local l_props_0 = v35.props;
        if v60 == v24.ScriptMenuActions.ShowInExplorer then
            local v63 = l_props_0.ScriptConversionContext:getScriptInstanceFromGUID(v61.scriptId);
            l_Selection_0:Set({
                v63
            });
            return;
        elseif v60 == v24.ScriptMenuActions.GoToScript then
            v28.goToScript(v61.scriptId, if v61.diagnostic then v61.diagnostic.range else nil, l_props_0.ScriptConversionContext);
            return;
        elseif v60 == v24.ScriptMenuActions.RevertScript then
            v35.onSuggestionApplied(v28.UNASSIGNED, v61, false);
            return;
        else
            if v60 == v24.ScriptMenuActions.SelectAllSimilar then
                local v64 = {};
                for v65 in l_props_0.diagnostics do
                    v64[v18.makeItemId(v65, v61.issueType, v61.instanceName)] = l_join_0(v61, {
                        scriptId = v65
                    });
                end;
                v35:setState({
                    Selection = v64
                });
            end;
            return;
        end;
    end;
    v35.onExpansionChange = function(v66) --[[ Line: 242 ]]
        -- upvalues: v35 (copy), l_join_0 (ref)
        v35:setState({
            Expansion = l_join_0(v35.state.Expansion, v66)
        });
    end;
    v35.ExpandAllEventConn = nil;
end;
v34.getDerivedStateFromProps = function(v67, v68) --[[ Line: 251 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v18 (copy), v31 (copy), l_join_0 (copy)
    if v67.diagnostics ~= v68._Ref.diagnostics or v67.SearchFilters ~= v68._Ref.SearchFilters then
        local v69 = v18.generateTreeViewItems(v67.diagnostics, v67.ScriptConversionContext, v67.SearchFilters, v68.Selection, v67.Localization);
        if v68.SortIndex and v68.SortOrder then
            local v70 = v18.genSortItems(v31[v68.SortIndex], v68.SortOrder);
            table.sort(v69, v70);
        end;
        return {
            Items = v69, 
            _Ref = l_join_0(v68._Ref, {
                diagnostics = v67.diagnostics, 
                completedScripts = v67.completedScripts, 
                searchFilters = v67.SearchFilters
            })
        };
    else
        return;
    end;
end;
v34.didMount = function(v71) --[[ Line: 279 ]] --[[ Name: didMount ]]
    -- upvalues: v18 (copy)
    v71.ExpandAllEventConn = v71.props.ExpandTreeView.Event:Connect(function(v72) --[[ Line: 280 ]]
        -- upvalues: v71 (copy), v18 (ref)
        v72 = v72 or nil;
        local v73 = {};
        for _, v75 in v71.state.Items do
            v73[v18.getItemId(v75)] = v72;
        end;
        v71:setState({
            Expansion = v73
        });
    end);
end;
v34.willUnmount = function(v76) --[[ Line: 292 ]] --[[ Name: willUnmount ]]
    v76.ExpandAllEventConn:Disconnect();
    v76.ExpandAllEventConn = nil;
end;
v34.render = function(v77) --[[ Line: 297 ]] --[[ Name: render ]]
    -- upvalues: l_map_0 (copy), v31 (copy), l_join_0 (copy), v2 (copy), l_TreeTable_0 (copy), v16 (copy), v33 (copy), v18 (copy), v17 (copy)
    local _ = v77.state;
    local l_props_1 = v77.props;
    local l_Localization_1 = l_props_1.Localization;
    local v83 = l_map_0(v31, function(v81, v82) --[[ Line: 302 ]]
        -- upvalues: l_join_0 (ref), l_Localization_1 (copy), v77 (copy)
        return l_join_0(v81, {
            Name = if v81.Name then l_Localization_1:getText("ScriptPane", v81.Name) else "", 
            Width = v77.state.Sizes[v82]
        });
    end);
    return v2.createElement(l_TreeTable_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        Size = l_props_1.Size, 
        SortIndex = v77.state.SortIndex, 
        SortOrder = v77.state.SortOrder, 
        SortChildren = v77.state.SortChildren, 
        OnSortChange = v77.onSortChange, 
        Columns = v83, 
        OnExpansionChange = v77.onExpansionChange, 
        CellComponent = v16, 
        Expansion = v77.state.Expansion, 
        Selection = v77.state.Selection, 
        RootItems = v77.state.Items, 
        GetChildren = v33, 
        GetItemId = v18.getItemId, 
        OnCellEdited = v77.onCellEdited, 
        OnCellAction = v77.onCellAction, 
        Scroll = true, 
        ClampSize = true, 
        UseDeficit = true, 
        Renderers = {
            ScriptLink = v17.ScriptLinkCell, 
            Dropdown = v17.DropdownCell, 
            Status = v17.StatusCell
        }
    });
end;
v34 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    ScriptConversionContext = v9
})(v34);
return (v3.connect(function(v84, _) --[[ Line: 345 ]] --[[ Name: mapStateToProps ]]
    return {
        diagnostics = v84.ScriptConversion.diagnostics
    };
end, function(v86) --[[ Line: 351 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v26 (copy)
    return {
        ApplyResolutions = function(v87, v88, v89, v90) --[[ Line: 353 ]] --[[ Name: ApplyResolutions ]]
            -- upvalues: v86 (copy), v26 (ref)
            v86(v26(v87, v88, v89, v90));
        end
    };
end)(v34));