local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_useDialog_0 = v2.UI.Hooks.useDialog;
local v5 = require(l_script_FirstAncestor_0.Src.Components.DialogContents);
local function v8(v6) --[[ Line: 21 ]] --[[ Name: getDialogBanType ]]
    -- upvalues: l_Localization_0 (copy)
    local v7 = l_Localization_0:use();
    if v6 == "Warn" then
        return v7:getText("WarningHeader", "WarningHeader");
    elseif v6 == "Ban 1 Day" then
        return v7:getText("BanHeader", "Ban1DayHeader");
    elseif v6 == "Ban 3 Days" then
        return v7:getText("BanHeader", "Ban3DaysHeader");
    elseif v6 == "Ban 7 Days" then
        return v7:getText("BanHeader", "Ban7DaysHeader");
    elseif v6 == "Ban 14 Days" then
        return v7:getText("BanHeader", "Ban14DaysHeader");
    elseif v6 == "Ban 6 Months" then
        return v7:getText("BanHeader", "Ban6MonthsHeader");
    elseif v6 == "Ban 1 Year" then
        return v7:getText("BanHeader", "Ban1YearHeader");
    else
        assert(false);
        return;
    end;
end;
return function(v9) --[[ Line: 44 ]] --[[ Name: DialogContainer ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), l_useDialog_0 (copy), v8 (copy), v5 (copy)
    local v10 = l_Localization_0:use();
    local v11, v12 = v1.useState(false);
    local v13 = v1.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v10 (copy), v11 (copy), v9 (copy)
        return table.freeze({
            Label = v10:getText("Buttons", "Reactivate"), 
            Enabled = v11, 
            OnActivated = function() --[[ Line: 53 ]] --[[ Name: OnActivated ]]
                -- upvalues: v9 (ref)
                v9.OnReactivate();
            end
        });
    end, {
        v11, 
        v10.locale
    });
    local v14 = v1.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: v10 (copy), v9 (copy)
        return table.freeze({
            Label = v10:getText("Buttons", "LogOut"), 
            OnActivated = function() --[[ Line: 62 ]] --[[ Name: OnActivated ]]
                -- upvalues: v9 (ref)
                v9.OnLogout();
            end
        });
    end, {
        v10.locale
    });
    local v15 = nil;
    v15 = l_useDialog_0({
        Intent = v9.Type == "Warn" and "Warning" or "Error", 
        Heading = v8(v9.Type), 
        Contents = v5({
            ReviewDateTime = v9.ReviewDateTime, 
            ModeratorNote = v9.ModeratorNote, 
            Reason = v9.Reason, 
            SetChecked = v12, 
            Checked = v11, 
            Type = v9.Type, 
            BannedDateTime = v9.BannedDateTime
        }), 
        ActionPrimary = if v9.Type == "Warn" then v13 else v14, 
        ActionSecondary = if v9.Type == "Warn" then v14 else nil, 
        Modal = true, 
        DisableTitleBar = true, 
        Width = 510
    });
    v1.useEffect(v15, {});
    return nil;
end;