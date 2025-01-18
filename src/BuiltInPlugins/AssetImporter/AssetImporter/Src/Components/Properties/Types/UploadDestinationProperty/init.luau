local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
local v8 = v2.PureComponent:extend("UploadDestinationProperty");
local function _(v9, v10) --[[ Line: 16 ]] --[[ Name: getSelectedIndex ]]
    for v11, v12 in v10 do
        if v12 == v9 then
            return v11;
        end;
    end;
end;
v8.render = function(v14) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v2 (copy), l_Pane_0 (copy), l_SelectInput_0 (copy)
    local v15 = false;
    local l_props_0 = v14.props;
    local v17 = {
        l_props_0.Localization:getText("UploadDestination", "Me")
    };
    local v18 = {
        -1
    };
    for _, v20 in l_props_0.ManagedGroups do
        table.insert(v17, v20.name);
        if v7() then
            table.insert(v18, v20.id);
        else
            table.insert(v18, v20.groupId);
        end;
    end;
    local l_Value_0 = l_props_0.Value;
    local v22;
    for v23, v24 in v18 do
        if v24 == l_Value_0 then
            v22 = v23;
            v15 = true;
        end;
        if v15 then
            break;
        end;
    end;
    if not v15 then
        v22 = nil;
    end;
    v15 = false;
    if v22 == nil then
        v22 = 1;
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = l_props_0.Size
    }, {
        WrapperContents = v2.createElement(l_SelectInput_0, {
            OnItemActivated = function(_, v26) --[[ Line: 53 ]] --[[ Name: OnItemActivated ]]
                -- upvalues: l_props_0 (copy), v18 (copy)
                l_props_0.OnSetItem(v18[v26]);
            end, 
            Items = v17, 
            SelectedIndex = v22, 
            Focus = v17[v22], 
            Size = UDim2.fromScale(1, 1), 
            TextTruncate = if v7() then Enum.TextTruncate.AtEnd else nil
        })
    });
end;
return v3.connect(function(v27) --[[ Line: 65 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v7 (copy)
    return {
        ManagedGroups = if v7() then v27.Dialogs.managedGroups else v27.Preview.managedGroups
    };
end)(v8);