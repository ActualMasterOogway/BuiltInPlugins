local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
return {
    ExcessiveTransactions = "ExcessiveTransactions", 
    PriceChanged = "PriceChanged", 
    PurchaseFailed = "PurchaseFailed", 
    PurchaseSuccess = "PurchaseSuccess"
};