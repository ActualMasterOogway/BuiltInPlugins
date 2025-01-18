local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v5) --[[ Line: 15 ]] --[[ Name: ReactivateDateNote ]]
    -- upvalues: l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), v1 (copy)
    local v6 = l_Localization_0:use();
    local v7 = v6:getLocale();
    local v8 = l_LayoutOrderIterator_0.new();
    local v9 = DateTime.fromIsoDate(v5.BannedDateTime);
    local v10 = v9 and v9:FormatLocalTime("lll", v7);
    return v1.createElement("Frame", {
        LayoutOrder = v5.LayoutOrder, 
        [v1.Tag] = "Component-ReactivateDateNote X-FitY"
    }, {
        AccountDisabledMessage = v10 and v1.createElement("TextLabel", {
            Text = v6:getText("AccountDisabled", "DisabledDateTime", {
                dateTime = v10
            }), 
            LayoutOrder = v8:getNextOrder(), 
            [v1.Tag] = "X-FitY"
        })
    });
end;