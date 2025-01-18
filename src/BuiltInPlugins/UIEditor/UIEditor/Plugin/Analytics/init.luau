local l_status_0, l_result_0 = pcall(function() --[[ Line: 1 ]]
    return game:GetService("RbxAnalyticsService");
end);
return {
    reportEvent = function(_, v3) --[[ Line: 8 ]] --[[ Name: reportEvent ]]
        -- upvalues: l_status_0 (copy), l_result_0 (copy)
        if not l_status_0 or not l_result_0 then
            return;
        else
            l_result_0:TrackEvent("Studio", "UIEditorAction", v3);
            return;
        end;
    end
};