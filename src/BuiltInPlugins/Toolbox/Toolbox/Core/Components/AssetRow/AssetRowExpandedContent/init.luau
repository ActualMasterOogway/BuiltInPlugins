local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_Pane_0 = v4.UI.Pane;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v10 = require(l_Util_0.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v13 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v14 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v15 = require(l_script_FirstAncestor_0.Core.Components.AssetTable.GetAssetTableSizes);
local v16 = require(l_script_FirstAncestor_0.Core.Components.ItemRow.ItemRowMetadata);
local v17 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
if not require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows)() then
    return {};
else
    local v19 = v2.PureComponent:extend("AssetRowExpandedContent");
    v19.defaultProps = {
        Size = UDim2.new(1, 0, 0, 26)
    };
    v19.init = function(v20) --[[ Line: 63 ]] --[[ Name: init ]]
        -- upvalues: v15 (copy), v10 (copy)
        v20.getDescriptionWidth = function() --[[ Line: 64 ]]
            -- upvalues: v20 (copy), v15 (ref), v10 (ref)
            local l_props_0 = v20.props;
            local v22 = if l_props_0.AbsoluteSize then l_props_0.AbsoluteSize.X else 0;
            local v23, v24 = v15(v22);
            local v25 = {
                v10.ASSET_ROW_COLUMNS.ICON, 
                v10.ASSET_ROW_COLUMNS.NAME, 
                v10.ASSET_ROW_COLUMNS.CREATOR
            };
            if v24 <= v22 then
                table.insert(v25, v10.ASSET_ROW_COLUMNS.DATE_UPDATED);
            end;
            local v26 = 0;
            local v27 = 0;
            for _, v29 in pairs(v25) do
                if v23[v29] then
                    v26 = v26 + v23[v29].X.Scale;
                    v27 = v27 + v23[v29].X.Offset;
                end;
            end;
            return v26, v27;
        end;
    end;
    v19.render = function(v30) --[[ Line: 92 ]] --[[ Name: render ]]
        -- upvalues: l_LayoutOrderIterator_0 (copy), v15 (copy), v10 (copy), v2 (copy), l_Pane_0 (copy), v5 (copy), v16 (copy)
        local l_props_1 = v30.props;
        local l_Localization_0 = l_props_1.Localization;
        local v33 = l_LayoutOrderIterator_0.new();
        local l_Asset_0 = l_props_1.AssetInfo.Asset;
        local l_AssetGenres_0 = l_Asset_0.AssetGenres;
        local v36 = l_Asset_0.Description or "---";
        local v37 = if l_AssetGenres_0 and #l_AssetGenres_0 > 0 then table.concat(l_AssetGenres_0, ",") else "---";
        local v38 = if l_props_1.AbsoluteSize then l_props_1.AbsoluteSize.X else 0;
        local v39, _ = v15(v38);
        local v41, v42 = v30.getDescriptionWidth();
        local v43 = v39[v10.ASSET_ROW_COLUMNS.DATE_UPDATED];
        return v2.createElement(l_Pane_0, v5.join({
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_props_1.LayoutOrder, 
            Padding = 10, 
            Size = l_props_1.Size
        }, l_props_1.WrapperProps), {
            DescriptionContainer = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v33:getNextOrder(), 
                Spacing = 10, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                Description = v2.createElement(v16, {
                    LayoutOrder = v33:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("General", "Description"):upper(), 
                    MaxLinesOfText = 2, 
                    Size = UDim2.new(v41, v42, 0, 0), 
                    Text = v36
                }), 
                Category = v2.createElement(v16, {
                    LayoutOrder = v33:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("General", "Genre"):upper(), 
                    MaxLinesOfText = nil, 
                    Padding = {
                        Left = v10.ITEM_ROW.LEFT_RIGHT_PADDING
                    }, 
                    Size = UDim2.new(v43.X.Scale, v43.X.Offset, v43.Y.Scale, v43.Y.Offset), 
                    Text = v37
                })
            })
        });
    end;
    local function v48(v44) --[[ Line: 157 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v17 (copy)
        return {
            searchWithOptions = function(v45, v46, v47) --[[ Line: 159 ]] --[[ Name: searchWithOptions ]]
                -- upvalues: v44 (copy), v17 (ref)
                v44(v17(v45, v46, v47));
            end
        };
    end;
    v19 = l_withContext_0({
        Localization = l_ContextServices_0.Localization, 
        Network = v13, 
        Settings = v14, 
        Stylizer = l_ContextServices_0.Stylizer
    })(v19);
    return l_withAbsoluteSize_0((v3.connect(nil, v48)(v19)));
end;