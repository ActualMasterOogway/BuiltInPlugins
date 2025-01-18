local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck);
local v5 = require(l_Parent_0.Wrappers.withForwardRef);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v7 = v1.PureComponent:extend("ResponsiveGrid");
v4.wrap(v7, script);
v7.defaultProps = {
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    ItemHeight = UDim.new(0, 0), 
    Size = UDim2.new(1, 0, 0, 0), 
    SortOrder = Enum.SortOrder.LayoutOrder
};
v7.init = function(v8) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v8.ref = v8.props.ForwardRef or v1.createRef();
    v8.sortedCutOffList = {};
    v8.state = {
        currentCutOffKey = nil
    };
    v8.initializeCutOffs = function() --[[ Line: 55 ]]
        -- upvalues: v8 (copy)
        local l_CutOffs_0 = v8.props.CutOffs;
        v8.sortedCutOffList = {};
        local v10 = {};
        for v11, _ in pairs(l_CutOffs_0) do
            table.insert(v10, v11);
        end;
        table.sort(v10, function(v13, v14) --[[ Line: 64 ]]
            -- upvalues: l_CutOffs_0 (copy)
            return l_CutOffs_0[v13].MinWidth < l_CutOffs_0[v14].MinWidth;
        end);
        for _, v16 in pairs(v10) do
            local v17 = l_CutOffs_0[v16];
            table.insert(v8.sortedCutOffList, v17);
        end;
        v8:setState(function() --[[ Line: 74 ]]
            -- upvalues: v8 (ref)
            local v18 = 1;
            local l_X_0 = (v8.ref and v8.ref.current).AbsoluteSize.X;
            for v20 in pairs(v8.sortedCutOffList) do
                local v21 = v8.sortedCutOffList[v20];
                local v22 = v21.MinWidth > v8.sortedCutOffList[1].MinWidth;
                local v23 = l_X_0 < v8.sortedCutOffList[1].MinWidth;
                if (v22 or v23) and v21.MinWidth <= l_X_0 then
                    v18 = v20;
                end;
            end;
            return {
                currentCutOffKey = v18
            };
        end);
    end;
    v8.updateCurrentCutOff = function() --[[ Line: 96 ]]
        -- upvalues: v8 (copy)
        v8:setState(function(v24) --[[ Line: 97 ]]
            -- upvalues: v8 (ref)
            local l_currentCutOffKey_0 = v24.currentCutOffKey;
            local l_current_0 = v8.ref.current;
            if not l_currentCutOffKey_0 or not l_current_0 then
                return;
            else
                local v27 = v8.sortedCutOffList[l_currentCutOffKey_0];
                local v28 = nil;
                if l_currentCutOffKey_0 + 1 <= #v8.sortedCutOffList then
                    v28 = v8.sortedCutOffList[l_currentCutOffKey_0 + 1];
                end;
                local v29 = nil;
                if l_currentCutOffKey_0 > 1 then
                    v29 = v8.sortedCutOffList[l_currentCutOffKey_0 - 1];
                end;
                local l_X_1 = l_current_0.AbsoluteSize.X;
                local v31 = v29 and v29.MinWidth <= l_X_1 and l_X_1 < v27.MinWidth;
                local v32 = v28 and v28.MinWidth < l_X_1;
                if v31 then
                    return {
                        currentCutOffKey = l_currentCutOffKey_0 - 1
                    };
                elseif v32 then
                    return {
                        currentCutOffKey = l_currentCutOffKey_0 + 1
                    };
                else
                    return;
                end;
            end;
        end);
    end;
end;
v7.didMount = function(v33) --[[ Line: 135 ]] --[[ Name: didMount ]]
    v33.initializeCutOffs();
end;
v7.didUpdate = function(v34, v35, _) --[[ Line: 139 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v34.props;
    if v35.CutOffs ~= l_props_0.CutOffs then
        v34.initializeCutOffs();
    end;
end;
v7.render = function(v38) --[[ Line: 146 ]] --[[ Name: render ]]
    -- upvalues: l_join_0 (copy), v1 (copy)
    local l_props_1 = v38.props;
    local l_state_0 = v38.state;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_AutomaticSize_0 = l_props_1.AutomaticSize;
    local l_HorizontalAlignment_0 = l_props_1.HorizontalAlignment;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_ItemHeight_0 = l_props_1.ItemHeight;
    local l_Position_0 = l_props_1.Position;
    local l_Size_0 = l_props_1.Size;
    local l_SortOrder_0 = l_props_1.SortOrder;
    local l_currentCutOffKey_1 = l_state_0.currentCutOffKey;
    local v50 = l_Stylizer_0.Spacing or 0;
    local v51 = nil;
    if l_currentCutOffKey_1 then
        local v52 = v38.sortedCutOffList[l_currentCutOffKey_1];
        local v53 = math.ceil(v50 / v52.ColumnCount * (v52.ColumnCount - 1));
        v51 = UDim2.new(UDim.new(1 / v52.ColumnCount, -v53), l_ItemHeight_0);
    else
        v51 = UDim2.new(UDim.new(1, -v50), l_ItemHeight_0);
    end;
    local v54 = l_join_0({
        UIGridLayout = v1.createElement("UIGridLayout", {
            CellPadding = UDim2.new(0, v50, 0, v50), 
            CellSize = v51, 
            HorizontalAlignment = l_HorizontalAlignment_0, 
            SortOrder = l_SortOrder_0
        })
    }, v38.props[v1.Children]);
    return v1.createElement("Frame", {
        AutomaticSize = l_AutomaticSize_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0, 
        [v1.Change.AbsoluteSize] = v38.updateCurrentCutOff, 
        [v1.Ref] = v38.ref
    }, v54);
end;
return v5((l_withContext_0({
    Stylizer = v2.Stylizer
})(v7)));