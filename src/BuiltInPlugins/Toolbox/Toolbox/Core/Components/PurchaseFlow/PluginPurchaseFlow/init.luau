local v0 = Vector2.new(150, 150);
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local _ = l_Parent_0.Core.Util;
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.RoactRodux);
local v7 = require(l_Parent_0.Core.Components.PurchaseFlow.BuyPluginDialog);
local v8 = require(l_Parent_0.Core.Components.PurchaseFlow.BuyRobuxDialog);
local v9 = require(l_Packages_0.Framework);
local v10 = require(l_Parent_0.Core.Util.Urls);
local l_withContext_0 = v9.ContextServices.withContext;
local v12 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v13 = require(l_Parent_0.Core.Networking.Requests.GetRobuxBalance);
local v14 = require(l_Parent_0.Core.Networking.Requests.PurchaseAssetRequest);
local _ = require(l_Parent_0.Core.Actions.SetPurchaseStatus);
local _ = require(l_Parent_0.Core.Types.PurchaseStatus);
local v17 = v5.PureComponent:extend("PurchaseFlow");
v17.init = function(v18) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: l_GuiService_0 (copy), v10 (copy)
    v18.cancel = function() --[[ Line: 50 ]]
        -- upvalues: v18 (copy)
        v18.props.Cancel();
    end;
    v18.onPurchaseClicked = function(v19) --[[ Line: 54 ]]
        -- upvalues: v18 (copy)
        return v18.props.OnPurchaseClicked(v19);
    end;
    v18.onBuyRobuxClicked = function(v20) --[[ Line: 58 ]]
        -- upvalues: l_GuiService_0 (ref), v10 (ref), v18 (copy)
        if v20 then
            l_GuiService_0:OpenBrowserWindow(v10.getRobuxPurchaseUrl());
        end;
        v18.props.Cancel();
    end;
end;
v17.didMount = function(v21) --[[ Line: 66 ]] --[[ Name: didMount ]]
    local _ = v21.props;
    v21.props.getRobuxBalance(v21.props.Network.networkInterface);
end;
v17.render = function(v23) --[[ Line: 71 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v0 (copy), v5 (copy), v7 (copy), v8 (copy)
    local l_props_1 = v23.props;
    local _ = v23.state;
    assert(type(l_props_1.Cancel) == "function", "PurchaseFlow expects a Cancel callback.");
    local l_AssetData_0 = l_props_1.AssetData;
    local l_Asset_0 = l_AssetData_0.Asset;
    local l_Id_0 = l_Asset_0.Id;
    local v29 = v10.constructAssetThumbnailUrl(l_Id_0, v0.X, v0.Y);
    local l_Name_0 = l_Asset_0.Name;
    local l_Name_1 = l_AssetData_0.Creator.Name;
    local l_Product_0 = l_AssetData_0.Product;
    local v33 = l_Product_0 and l_Product_0.Price or 0;
    local v34 = v33 > 0;
    local v35 = l_props_1.Balance or "---";
    local v36 = v33 <= v35;
    return v34 and v5.createFragment({
        BuyPlugin = v36 and v5.createElement(v7, {
            Name = l_Name_0, 
            Creator = l_Name_1, 
            Cost = v33, 
            Balance = v35, 
            Thumbnail = v29, 
            OnClose = v23.cancel, 
            OnButtonClicked = v23.onPurchaseClicked
        }), 
        BuyRobux = not v36 and v5.createElement(v8, {
            Name = l_Name_0, 
            Creator = l_Name_1, 
            Cost = v33, 
            Balance = v35, 
            Thumbnail = v29, 
            OnClose = v23.cancel, 
            OnButtonClicked = v23.onBuyRobuxClicked
        })
    });
end;
local function v41(v37, _) --[[ Line: 114 ]] --[[ Name: mapStateToProps ]]
    v37 = v37 or {};
    local l_purchase_0 = v37.purchase;
    local l_pageInfo_0 = v37.pageInfo;
    return {
        Balance = l_purchase_0.robuxBalance, 
        PurchaseStatus = l_purchase_0.status, 
        SearchId = l_pageInfo_0.searchId
    };
end;
local function v51(v42) --[[ Line: 126 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy), v14 (copy)
    return {
        getRobuxBalance = function(v43) --[[ Line: 128 ]] --[[ Name: getRobuxBalance ]]
            -- upvalues: v42 (copy), v13 (ref)
            v42(v13(v43));
        end, 
        purchaseAsset = function(v44, v45, v46, v47, v48, v49, v50) --[[ Line: 132 ]] --[[ Name: purchaseAsset ]]
            -- upvalues: v42 (copy), v14 (ref)
            v42(v14(v44, v45, v46, v47, v48, v49, v50));
        end
    };
end;
v17 = l_withContext_0({
    Network = v12
})(v17);
return v6.connect(v41, v51)(v17);