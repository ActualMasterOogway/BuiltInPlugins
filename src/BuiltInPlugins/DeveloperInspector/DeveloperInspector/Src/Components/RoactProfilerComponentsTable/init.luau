local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.InspectorContext);
local v5 = require(l_Parent_0.Src.Util.TableIds);
local l_RoactInspectorApi_0 = v3.DeveloperTools.RoactInspectorApi;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v8 = require(l_Actions_0.RoactInspector.SetProfilePageSize);
local v9 = require(l_Actions_0.RoactInspector.SetProfilePageIndex);
local v10 = require(l_Actions_0.RoactInspector.SortProfileData);
local v11 = require(l_Actions_0.RoactInspector.SelectProfileRow);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_PaginatedTable_0 = l_UI_0.PaginatedTable;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v18 = v1.Component:extend("RoactProfilerComponentsTable");
local v19 = {
    {
        Name = "Component", 
        Key = "instanceName", 
        TooltipKey = "pathString", 
        Width = UDim.new(0.3, 0)
    }, 
    {
        Name = "Depth", 
        Key = "depth", 
        Width = UDim.new(0.15, 0)
    }, 
    {
        Name = "Renders", 
        Key = "count", 
        Width = UDim.new(0.15, 0)
    }, 
    {
        Name = "Render Time (ms)", 
        Key = "renderTime", 
        Width = UDim.new(0.2, 0)
    }, 
    {
        Name = "Deep Time (ms)", 
        Key = "time", 
        Width = UDim.new(0.2, 0)
    }
};
v18.init = function(v20) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: l_RoactInspectorApi_0 (copy)
    v20.onPageChange = function(v21) --[[ Line: 61 ]]
        -- upvalues: v20 (copy), l_RoactInspectorApi_0 (ref)
        local v22 = v20.props.Inspector:get():getTargetApi();
        v20.props.setPageIndex(v21);
        if l_RoactInspectorApi_0.isInstance(v22) then
            if not v22.setProfileComponentsPageIndex then
                return;
            else
                v22:setProfileComponentsPageIndex(v21);
                v22:getProfileData();
            end;
        end;
    end;
    v20.onHover = function(_, v24) --[[ Line: 73 ]]
        -- upvalues: v20 (copy), l_RoactInspectorApi_0 (ref)
        local v25 = v20.props.Inspector:get():getTargetApi();
        local v26 = v20.props.TableData.pageRows[v24];
        if v26 and v26.path and l_RoactInspectorApi_0.isInstance(v25) then
            v25:highlight(v26.path);
        end;
    end;
    v20.onMouseLeave = function() --[[ Line: 84 ]]
        -- upvalues: v20 (copy), l_RoactInspectorApi_0 (ref)
        local v27 = v20.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v27) then
            v27:dehighlight();
        end;
    end;
    v20.onSizeChange = function(v28) --[[ Line: 91 ]]
        -- upvalues: v20 (copy), l_RoactInspectorApi_0 (ref)
        local v29 = v20.props.Inspector:get():getTargetApi();
        v20.props.setPageSize(v28);
        if l_RoactInspectorApi_0.isInstance(v29) then
            if not v29.setProfileComponentsPageSize then
                return;
            else
                v29:setProfileComponentsPageSize(v28);
                v29:getProfileData();
            end;
        end;
    end;
    v20.onSortChange = function(v30, v31) --[[ Line: 103 ]]
        -- upvalues: v20 (copy), l_RoactInspectorApi_0 (ref)
        local v32 = v20.props.Inspector:get():getTargetApi();
        v20.props.setSort(v30, v31);
        if l_RoactInspectorApi_0.isInstance(v32) then
            if not v32.sortProfileData then
                return;
            else
                v32:sortProfileData("profileComponents", v30, v31);
                v32:getProfileData();
            end;
        end;
    end;
    v20.onSelectRow = function(_, v34) --[[ Line: 115 ]]
        -- upvalues: v20 (copy), l_RoactInspectorApi_0 (ref)
        local v35 = v20.props.Inspector:get():getTargetApi();
        local l_TableData_0 = v20.props.TableData;
        local v37 = v34 + (l_TableData_0.pageIndex - 1) * l_TableData_0.pageSize;
        local v38 = l_TableData_0.pageRows[v34];
        if v38 then
            local l_instanceId_0 = v38.instanceId;
            v20.props.selectRow(v37);
            if l_RoactInspectorApi_0.isInstance(v35) then
                v35:selectProfileInstance(l_instanceId_0);
                v35:setProfileEventsPageIndex(1);
                v35:getProfileData();
            end;
        end;
    end;
end;
v18.render = function(v40) --[[ Line: 134 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_PaginatedTable_0 (copy), v19 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v40.props;
    local l_ProfileData_0 = l_props_0.ProfileData;
    local l_TableData_1 = l_props_0.TableData;
    return v1.createElement(l_PaginatedTable_0, {
        Columns = v19, 
        Rows = l_TableData_1.pageRows, 
        SelectedRow = l_TableData_1.selectedRow, 
        SortIndex = l_TableData_1.sortIndex, 
        SortOrder = l_TableData_1.sortOrder, 
        PageIndex = l_TableData_1.pageIndex, 
        PageSize = l_TableData_1.pageSize, 
        PageCount = math.ceil(l_ProfileData_0.rowCount / l_TableData_1.pageSize), 
        OnHoverRow = v40.onHover, 
        OnMouseLeave = v40.onMouseLeave, 
        OnSelectRow = v40.onSelectRow, 
        OnPageChange = v40.onPageChange, 
        OnPageSizeChange = v40.onSizeChange, 
        OnSortChange = v40.onSortChange, 
        Footer = v1.createElement(l_Pane_0, {
            Padding = 5, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            Label = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = ("%s Events from %s Components"):format(l_ProfileData_0.eventCount, l_ProfileData_0.rowCount)
            })
        })
    });
end;
v18 = l_withContext_0({
    Inspector = v4, 
    Stylizer = l_ContextServices_0.Stylizer
})(v18);
return v2.connect(function(v44) --[[ Line: 172 ]]
    -- upvalues: v5 (copy)
    return {
        ProfileData = v44.RoactInspector.profileData, 
        TableData = v44.RoactInspector[v5.COMPONENTS]
    };
end, function(v45) --[[ Line: 177 ]]
    -- upvalues: v10 (copy), v5 (copy), v8 (copy), v9 (copy), v11 (copy)
    return {
        setSort = function(v46, v47) --[[ Line: 179 ]] --[[ Name: setSort ]]
            -- upvalues: v45 (copy), v10 (ref), v5 (ref)
            v45(v10(v5.COMPONENTS, v46, v47));
        end, 
        setPageSize = function(v48) --[[ Line: 182 ]] --[[ Name: setPageSize ]]
            -- upvalues: v45 (copy), v8 (ref), v5 (ref)
            v45(v8(v5.COMPONENTS, v48));
        end, 
        setPageIndex = function(v49) --[[ Line: 185 ]] --[[ Name: setPageIndex ]]
            -- upvalues: v45 (copy), v9 (ref), v5 (ref)
            v45(v9(v5.COMPONENTS, v49));
        end, 
        selectRow = function(v50) --[[ Line: 188 ]] --[[ Name: selectRow ]]
            -- upvalues: v45 (copy), v11 (ref)
            v45(v11(v50));
        end
    };
end)(v18);