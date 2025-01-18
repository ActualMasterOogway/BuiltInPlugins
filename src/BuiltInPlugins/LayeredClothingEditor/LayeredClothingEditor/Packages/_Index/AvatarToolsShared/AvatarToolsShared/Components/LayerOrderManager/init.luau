local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local _ = require(l_Parent_1.RoactRodux);
local v4 = require(l_Parent_0.Contexts.EditingItemContext);
local _ = require(l_Parent_0.Util.AccessoryAndBodyToolShared.Constants);
local v6 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DraggableTileList_0 = v6.UI.DraggableTileList;
local v10 = v2.PureComponent:extend("LayerOrderManager");
v10.init = function(v11) --[[ Line: 34 ]] --[[ Name: init ]]
    v11.previewClothing = {};
    v11.onOrderChangedSignals = {};
    v11.orderedLayers = {};
    v11.mapClothingIdToLayerOrder = {};
    v11.ignoreSignals = false;
    v11.wrapLayerChanged = nil;
    v11.wrapLayerOrderBeforeChange = 0;
    if v11.props.PreviewClothing then
        v11.previewClothing = v11.props.PreviewClothing;
    end;
    v11.sortNewLayers = function() --[[ Line: 47 ]]
        -- upvalues: v11 (copy)
        local v12 = {};
        for _, v14 in ipairs(v11.previewClothing) do
            local l_FirstChildWhichIsA_0 = v14.model:FindFirstChildWhichIsA("WrapLayer", true);
            if l_FirstChildWhichIsA_0 then
                table.insert(v12, l_FirstChildWhichIsA_0);
            end;
        end;
        v11.flattenLayerOrders(v12);
        v11.updateIdMap();
    end;
    v11.findWrapLayerChanged = function() --[[ Line: 60 ]]
        -- upvalues: v11 (copy)
        if v11.wrapLayerChanged then
            return v11.wrapLayerChanged, v11.wrapLayerOrderBeforeChange;
        else
            local v16 = nil;
            local v17 = 0;
            for v18, v19 in ipairs(v11.orderedLayers) do
                if v19.Order ~= v18 then
                    return v19, (math.clamp(v18, 1, #v11.orderedLayers));
                end;
            end;
            return v16, v17;
        end;
    end;
    v11.getNewOrderList = function(v20, v21, v22) --[[ Line: 76 ]]
        -- upvalues: v11 (copy)
        local v23 = {};
        local v24 = v22 < v21;
        for v25, v26 in ipairs(v11.orderedLayers) do
            if v26 ~= v20 then
                if v25 == v22 and v24 then
                    table.insert(v23, v20);
                end;
                table.insert(v23, v26);
                if v25 == v22 and not v24 then
                    table.insert(v23, v20);
                end;
            end;
        end;
        return v23;
    end;
    v11.onOrderChangedFromProperty = function() --[[ Line: 93 ]]
        -- upvalues: v11 (copy)
        if v11.ignoreSignals then
            return;
        else
            local v27 = nil;
            local v28 = nil;
            local v29, v30 = v11.findWrapLayerChanged();
            v27 = v29;
            v28 = v30;
            if v27 then
                v29 = math.clamp(v27.Order, 1, #v11.orderedLayers);
                if v29 == v28 then
                    v27.Order = v28;
                    return;
                else
                    v30 = v11.getNewOrderList(v27, v28, v29);
                    v11.flattenLayerOrders(v30);
                    v11.updateIdMap();
                    v11:setState({
                        temp = {}
                    });
                end;
            end;
            return;
        end;
    end;
    v11.flattenLayerOrders = function(v31) --[[ Line: 114 ]]
        -- upvalues: v11 (copy)
        if v31 then
            v11.ignoreSignals = true;
            v11.orderedLayers = {};
            for _, v33 in pairs(v31) do
                v33.Order = #v11.orderedLayers + 1;
                table.insert(v11.orderedLayers, v33);
            end;
            v11.ignoreSignals = false;
        end;
    end;
    v11.onLayerDragged = function(v34, v35) --[[ Line: 126 ]]
        -- upvalues: v11 (copy)
        local v36 = #v11.orderedLayers;
        if v34 < 1 or v36 + 1 < v34 then
            return;
        elseif v35 < 1 or v36 + 1 < v35 then
            return;
        else
            local l_Order_0 = v11.orderedLayers[v36 + 1 - v35].Order;
            v11.wrapLayerChanged = v11.orderedLayers[v36 + 1 - v34];
            v11.wrapLayerOrderBeforeChange = v11.wrapLayerChanged.Order;
            v11.wrapLayerChanged.Order = l_Order_0;
            v11.wrapLayerChanged = nil;
            return;
        end;
    end;
    v11.getClothingTileProps = function() --[[ Line: 141 ]]
        -- upvalues: v11 (copy)
        local v38 = v11.props.EditingItemContext:getItem();
        local v39 = {};
        for _, v41 in ipairs(v11.previewClothing) do
            local l_model_0 = v41.model;
            local l_l_model_0_FirstChildWhichIsA_0 = l_model_0:FindFirstChildWhichIsA("WrapLayer", true);
            l_model_0.Archivable = true;
            local v44 = v38 and v41.id == v38.Name;
            if l_l_model_0_FirstChildWhichIsA_0 then
                table.insert(v39, {
                    Model = l_model_0, 
                    TileSize = UDim2.new(1, 0, 1, 0), 
                    LayoutOrder = #v11.orderedLayers + 1 - l_l_model_0_FirstChildWhichIsA_0.Order, 
                    IsOn = v44
                });
            end;
        end;
        return v39;
    end;
    v11.updateIdMap = function() --[[ Line: 164 ]]
        -- upvalues: v11 (copy)
        v11.mapClothingIdToLayerOrder = {};
        for _, v46 in ipairs(v11.previewClothing) do
            local l_model_1 = v46.model;
            local l_id_0 = v46.id;
            local l_l_model_1_FirstChildWhichIsA_0 = l_model_1:FindFirstChildWhichIsA("WrapLayer", true);
            if l_l_model_1_FirstChildWhichIsA_0 then
                local l_Order_1 = l_l_model_1_FirstChildWhichIsA_0.Order;
                v11.mapClothingIdToLayerOrder[l_id_0] = l_Order_1;
            end;
        end;
    end;
    v11.getOrderedIdList = function() --[[ Line: 177 ]]
        -- upvalues: v11 (copy)
        local v51 = {};
        for v52, v53 in pairs(v11.mapClothingIdToLayerOrder) do
            table.insert(v51, v53, v52);
        end;
        return v51;
    end;
    v11.updateNewLayersWithOldOrder = function() --[[ Line: 187 ]]
        -- upvalues: v11 (copy)
        local v54 = {};
        local v55 = 0;
        for _, v57 in pairs(v11.mapClothingIdToLayerOrder) do
            v55 = math.max(v55, v57);
        end;
        for _, v59 in ipairs(v11.previewClothing) do
            local l_id_1 = v59.id;
            local l_FirstChildWhichIsA_1 = v59.model:FindFirstChildWhichIsA("WrapLayer", true);
            if l_FirstChildWhichIsA_1 then
                if l_id_1 and v11.mapClothingIdToLayerOrder[l_id_1] then
                    table.insert(v54, {
                        wrap = l_FirstChildWhichIsA_1, 
                        order = v11.mapClothingIdToLayerOrder[l_id_1]
                    });
                else
                    v55 = v55 + 1;
                    table.insert(v54, {
                        wrap = l_FirstChildWhichIsA_1, 
                        order = v55
                    });
                end;
            end;
        end;
        table.sort(v54, function(v62, v63) --[[ Line: 215 ]]
            return v62.order < v63.order;
        end);
        local v64 = {};
        for _, v66 in ipairs(v54) do
            table.insert(v64, v66.wrap);
        end;
        v11.flattenLayerOrders(v64);
        v11.updateIdMap();
    end;
    v11.sortNewLayers();
end;
v10.findNewlyAddedLayerId = function(_, v68, v69) --[[ Line: 231 ]] --[[ Name: findNewlyAddedLayerId ]]
    local v70 = {};
    for _, v72 in ipairs(v68) do
        v70[v72.id] = v72;
    end;
    for _, v74 in ipairs(v69) do
        if not v70[v74.id] then
            return v74.id;
        end;
    end;
end;
v10.checkCapacity = function(v75, v76, v77) --[[ Line: 246 ]] --[[ Name: checkCapacity ]]
    local v78 = v75:findNewlyAddedLayerId(v76, v77);
    if not v78 or #v75.orderedLayers <= v75.props.Capacity then
        return;
    else
        local v79 = v75.getOrderedIdList();
        local v80 = v75.props.EditingItemContext:getItem();
        local v81 = #v79;
        while v79[v81] == v80.Name or v79[v81] == v78 do
            v81 = v81 - 1;
        end;
        v75.props.OnCapacityReached(v79[v81]);
        return;
    end;
end;
v10.willUpdate = function(v82, v83, _) --[[ Line: 264 ]] --[[ Name: willUpdate ]]
    if v83.PreviewClothing and v83.PreviewClothing ~= v82.previewClothing then
        v82:disconnectSignals();
        local l_previewClothing_0 = v82.previewClothing;
        v82.previewClothing = v83.PreviewClothing;
        v82.updateNewLayersWithOldOrder();
        v82:checkCapacity(l_previewClothing_0, v83.PreviewClothing);
        v82:connectSignals();
    end;
end;
v10.disconnectSignals = function(v86) --[[ Line: 275 ]] --[[ Name: disconnectSignals ]]
    if v86.onOrderChangedSignals then
        for _, v88 in ipairs(v86.onOrderChangedSignals) do
            v88:Disconnect();
        end;
    end;
    v86.onOrderChangedSignals = {};
end;
v10.connectSignals = function(v89) --[[ Line: 284 ]] --[[ Name: connectSignals ]]
    v89.onOrderChangedSignals = {};
    if v89.previewClothing then
        for v90, v91 in ipairs(v89.previewClothing) do
            local l_FirstChildWhichIsA_2 = v91.model:FindFirstChildWhichIsA("WrapLayer", true);
            if l_FirstChildWhichIsA_2 then
                v89.onOrderChangedSignals[v90] = l_FirstChildWhichIsA_2:GetPropertyChangedSignal("Order"):Connect(v89.onOrderChangedFromProperty);
            end;
        end;
    end;
end;
v10.render = function(v93) --[[ Line: 298 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_DraggableTileList_0 (copy)
    local l_props_0 = v93.props;
    local l_Size_0 = l_props_0.Size;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Position_0 = l_props_0.Position;
    local l_Capacity_0 = l_props_0.Capacity;
    local l_ShowEmptyBoxes_0 = l_props_0.ShowEmptyBoxes;
    local l_TileComponent_0 = l_props_0.TileComponent;
    local v101 = v93.getClothingTileProps();
    return v2.createElement(l_DraggableTileList_0, {
        AnchorPoint = l_AnchorPoint_0, 
        Size = l_Size_0, 
        Position = l_Position_0, 
        TileList = v101, 
        Capacity = l_Capacity_0, 
        OnOrderChanged = v93.onLayerDragged, 
        ShowEmptyBoxes = l_ShowEmptyBoxes_0, 
        TileComponent = l_TileComponent_0, 
        GetTileProps = function(v102) --[[ Line: 318 ]] --[[ Name: GetTileProps ]]
            return v102;
        end
    });
end;
v10.didMount = function(v103) --[[ Line: 324 ]] --[[ Name: didMount ]]
    v103:connectSignals();
end;
v10.willUnmount = function(v104) --[[ Line: 328 ]] --[[ Name: willUnmount ]]
    v104:disconnectSignals();
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    EditingItemContext = v4
})(v10));