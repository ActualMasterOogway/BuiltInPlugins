local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Core.Components.DropdownMenu);
local _ = require(l_script_FirstAncestor_0.Core.Util.AssetConfigUtil);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_Pane_0 = v2.UI.Pane;
local l_TitledFrame_0 = v2.UI.TitledFrame;
local l_ContextServices_0 = v2.ContextServices;
local _ = require(l_script_FirstAncestor_0.Core.Types.MarketplaceFiatServiceTypes);
local v10 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
return function(v11) --[[ Line: 35 ]] --[[ Name: FiatPriceComponent ]]
    -- upvalues: l_Stylizer_0 (copy), l_ContextServices_0 (copy), v1 (copy), v10 (copy), l_Pane_0 (copy), l_TitledFrame_0 (copy), v3 (copy)
    local _ = l_Stylizer_0:use();
    local v13 = l_ContextServices_0.Localization:use();
    local v16, v17 = v1.useState(function() --[[ Line: 39 ]]
        -- upvalues: v11 (copy)
        for v14, v15 in v11.BasePrices do
            if v15.BasePriceMoney.currencyCode == v11.InitialBaseMoney.currencyCode and v15.BasePriceMoney.quantity.significand == v11.InitialBaseMoney.quantity.significand and v15.BasePriceMoney.quantity.exponent == v11.InitialBaseMoney.quantity.exponent then
                return v14;
            end;
        end;
        return 1;
    end);
    local v20 = v1.useCallback(function(v18) --[[ Line: 53 ]]
        -- upvalues: v11 (copy), v17 (copy)
        local l_BasePriceMoney_0 = v11.BasePrices[v18].BasePriceMoney;
        v11.OnPriceSelected(l_BasePriceMoney_0);
        v17(v18);
    end, {
        v11.BasePrices
    });
    local v24 = v1.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v11 (copy), v10 (ref), v13 (copy)
        local v21 = {};
        for v22, v23 in v11.BasePrices do
            v21[v22] = {
                name = v10.displayStringFromMoney(v23.BasePriceMoney, v13), 
                selectable = v11.Selectable
            };
        end;
        return v21;
    end, {
        v13, 
        v11.BasePrices, 
        v11.Selectable
    });
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v11.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v11.TotalHeight)
    }, {
        TitledFrame = v1.createElement(l_TitledFrame_0, {
            Title = v13:getText("General", "SalesPrice"), 
            TitleWidth = 165
        }, {
            FiatPriceDropdown = v1.createElement(v3, {
                fontSize = 20, 
                items = v24, 
                onItemClicked = v20, 
                rowHeight = 24, 
                selectedDropDownIndex = v16, 
                Size = UDim2.new(0, 225, 0, 40), 
                visibleDropDownCount = 6
            })
        })
    });
end;