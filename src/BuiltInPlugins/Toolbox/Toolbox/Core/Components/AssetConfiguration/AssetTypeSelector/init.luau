local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Core.Components;
local v9 = require(l_Components_0.DropdownMenu);
local v10 = v2.PureComponent:extend("AssetTypeSelector");
v10.init = function(v11, _) --[[ Line: 34 ]] --[[ Name: init ]]
    v11.onItemClicked = function(v13) --[[ Line: 35 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            dropDownIndex = v13
        });
        if v11.props.assetTypeEnum == Enum.AssetType.Plugin or v11.props.assetTypeEnum == Enum.AssetType.Animation then
            if v11.props.onAssetTypeSelected then
                v11.props.onAssetTypeSelected(v11.props.assetTypeEnum);
                return;
            end;
        elseif v11.props.onAssetTypeSelected then
            local v14 = v11.props.items[v13];
            if v14 and v14.type then
                v11.props.onAssetTypeSelected(v14.type);
            end;
        end;
    end;
    v11.onItemClicked(v11:getFirstSelectableIndex());
end;
v10.getFirstSelectableIndex = function(v15) --[[ Line: 61 ]] --[[ Name: getFirstSelectableIndex ]]
    for v16 = 1, #v15.props.items do
        if v15.props.items[v16].selectable then
            return v16;
        end;
    end;
end;
v10.render = function(v17) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy), v9 (copy)
    local l_props_0 = v17.props;
    local l_state_0 = v17.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, l_props_0.width, 0, l_props_0.height), 
        Position = l_props_0.Position, 
        Active = true
    }, {
        Title = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, -28), 
            Size = UDim2.new(1, 0, 0, 24), 
            TextColor3 = l_Stylizer_0.typeSelection.selector.title, 
            TextSize = 16, 
            Font = v5.FONT, 
            Text = "Choose asset type", 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Dropdown = v2.createElement(v9, {
            Position = UDim2.new(0.5, -l_props_0.width / 2, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            selectedDropDownIndex = l_state_0.dropDownIndex, 
            visibleDropDOwnCount = 5, 
            items = v17.props.items, 
            rowHeight = 24, 
            fontSize = 20, 
            onItemClicked = v17.onItemClicked
        }), 
        Description = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 0, 18), 
            TextColor3 = l_Stylizer_0.typeSelection.selector.description, 
            TextSize = 12, 
            Font = v5.FONT, 
            Text = "Once published, this model can be shared in Marketplace", 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));