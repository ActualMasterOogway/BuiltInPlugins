local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Table_0 = l_UI_0.Table;
local l_Pane_0 = l_UI_0.Pane;
local l_copy_0 = v4.copy;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateSessionInfo);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.ShowUploadWidget);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v17 = require(l_Components_0.ImportQueue.AssetListCell);
local v18 = require(l_script_FirstAncestor_0.Src.Controllers.QueueController);
local v19 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueGroupSelection);
local v21 = v1.PureComponent:extend("AssetList");
v21.init = function(v22) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: l_copy_0 (copy), v19 (copy)
    v22.state = {
        columns = {}
    };
    v22.onColumnSizesChange = function(v23) --[[ Line: 41 ]]
        -- upvalues: l_copy_0 (ref), v22 (copy)
        local v24 = l_copy_0(v22.state.columns);
        for v25 = 1, #v22.state.columns do
            v24.Width = v23[v25];
        end;
        v22:setState({
            columns = v24
        });
    end;
    v22.getRows = function() --[[ Line: 52 ]]
        -- upvalues: v22 (copy)
        local l_props_0 = v22.props;
        return l_props_0.QueueController:getFilteredRows(l_props_0.SearchTerm);
    end;
    v22.onCheckboxToggle = function(v27) --[[ Line: 57 ]]
        -- upvalues: v22 (copy), l_copy_0 (ref), v19 (ref)
        local l_props_1 = v22.props;
        local v29 = l_copy_0(l_props_1.SessionQueue);
        l_props_1.UpdateSessionInfo(v19.update(v29[v27], {
            enabled = not v29[v27].enabled
        }));
    end;
    v22.updateCreator = function(v30, v31) --[[ Line: 66 ]]
        -- upvalues: v22 (copy)
        local l_props_2 = v22.props;
        local v33 = l_props_2.SessionQueue[v30];
        if v33.creator ~= v31 and v33.session then
            v33.session:GetImportTree().PreferredUploadId = v31;
        end;
        l_props_2.UpdateSessionInfo(v33);
    end;
    v22.getCreatorNameById = function(v34) --[[ Line: 77 ]]
        -- upvalues: v22 (copy)
        local l_props_3 = v22.props;
        if v34 == -1 then
            return l_props_3.Localization:getText("UploadDestination", "Me");
        else
            for _, v37 in v22.props.ManagedGroups do
                if v37.id == v34 then
                    return v37.name;
                end;
            end;
            return;
        end;
    end;
end;
v21.didMount = function(v38) --[[ Line: 93 ]] --[[ Name: didMount ]]
    v38:setState({
        columns = v38:_getColumns()
    });
end;
v21._getColumns = function(v39) --[[ Line: 99 ]] --[[ Name: _getColumns ]]
    -- upvalues: v20 (copy)
    local l_Stylizer_1 = v39.props.Stylizer;
    local l_CheckboxWidth_0 = l_Stylizer_1.AssetList.CheckboxWidth;
    local l_DropdownWidth_0 = l_Stylizer_1.AssetList.DropdownWidth;
    local l_StatusWidth_0 = l_Stylizer_1.AssetList.StatusWidth;
    local v44 = if v20() then (l_CheckboxWidth_0 + l_StatusWidth_0 + l_DropdownWidth_0 * 2) / 2 else (l_CheckboxWidth_0 + l_DropdownWidth_0 + l_StatusWidth_0) / 2;
    local l_Localization_1 = v39.props.Localization;
    if v20() then
        return {
            {
                Name = "", 
                Key = "Checkbox", 
                Width = UDim.new(0, l_CheckboxWidth_0)
            }, 
            {
                Name = l_Localization_1:getText("ImportQueue", "Asset"), 
                Key = "Asset", 
                Width = UDim.new(0.5, -v44)
            }, 
            {
                Name = l_Localization_1:getText("ImportQueue", "Preset"), 
                Key = "Preset", 
                Width = UDim.new(0, l_DropdownWidth_0)
            }, 
            {
                Name = l_Localization_1:getText("Properties", "PreferredUploadId"), 
                Key = "Creator", 
                Width = UDim.new(0, l_DropdownWidth_0)
            }, 
            {
                Name = l_Localization_1:getText("ImportQueue", "Path"), 
                Key = "Path", 
                Width = UDim.new(0.5, -v44)
            }, 
            {
                Name = l_Localization_1:getText("ImportQueue", "Status"), 
                Key = "Status", 
                Width = UDim.new(0, l_StatusWidth_0)
            }
        };
    else
        return {
            {
                Name = "", 
                Key = "Checkbox", 
                Width = UDim.new(0, l_CheckboxWidth_0)
            }, 
            {
                Name = l_Localization_1:getText("ImportQueue", "Asset"), 
                Key = "Asset", 
                Width = UDim.new(0.5, -v44)
            }, 
            {
                Name = l_Localization_1:getText("ImportQueue", "Preset"), 
                Key = "Preset", 
                Width = UDim.new(0, l_DropdownWidth_0)
            }, 
            {
                Name = l_Localization_1:getText("ImportQueue", "Path"), 
                Key = "Path", 
                Width = UDim.new(0.5, -v44)
            }, 
            {
                Name = l_Localization_1:getText("ImportQueue", "Status"), 
                Key = "Status", 
                Width = UDim.new(0, l_StatusWidth_0)
            }
        };
    end;
end;
v21.render = function(v46) --[[ Line: 148 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_Table_0 (copy), v17 (copy)
    local l_props_4 = v46.props;
    local l_LayoutOrder_0 = v46.props.LayoutOrder;
    local l_Stylizer_2 = l_props_4.Stylizer;
    local l_IconSize_0 = l_Stylizer_2.PropertyView.IconSize;
    local l_Padding_0 = l_Stylizer_2.AssetList.Padding;
    local l_RowHeight_0 = l_Stylizer_2.AssetList.RowHeight;
    return v1.createElement(l_Pane_0, {
        Size = l_props_4.Size, 
        Padding = l_Padding_0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Inner = v1.createElement(l_Table_0, {
            Rows = v46.getRows(), 
            Columns = v46.state.columns, 
            Size = UDim2.fromScale(1, 1), 
            Scroll = true, 
            CellComponent = v17, 
            CellProps = {
                GetCreatorNameById = v46.getCreatorNameById, 
                OnCheckboxToggle = v46.onCheckboxToggle, 
                ShowUploadWidget = l_props_4.ShowUploadWidget, 
                UpdateCreator = v46.updateCreator, 
                Uploading = l_props_4.Uploading, 
                Parsing = l_props_4.Parsing, 
                StatusIconSize = l_IconSize_0, 
                ActionSelectedOverride = l_Stylizer_2.AssetListCell.ActionSelectedOverride
            }, 
            RowHeight = l_RowHeight_0
        })
    });
end;
v21 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    QueueController = v18
})(v21);
return v2.connect(function(v53) --[[ Line: 207 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v20 (copy)
    return {
        ManagedGroups = if v20() then v53.Dialogs.managedGroups else nil, 
        Parsing = v53.Sessions.parsing, 
        SessionQueue = v53.Sessions.sessionQueue, 
        SearchTerm = v53.Sessions.searchTerm, 
        Uploading = v53.Dialogs.uploading
    };
end, function(v54) --[[ Line: 196 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy), v15 (copy)
    return {
        UpdateSessionInfo = function(v55) --[[ Line: 198 ]] --[[ Name: UpdateSessionInfo ]]
            -- upvalues: v54 (copy), v14 (ref)
            v54(v14(v55));
        end, 
        ShowUploadWidget = function(v56) --[[ Line: 201 ]] --[[ Name: ShowUploadWidget ]]
            -- upvalues: v54 (copy), v15 (ref)
            v54((v15(v56)));
        end
    };
end)(v21);