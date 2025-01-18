return function() --[[ Line: 4 ]] --[[ Name: getStudioSettings ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
        return settings();
    end);
    if not l_status_0 then
        return nil;
    else
        return l_result_0:FindFirstChild("Studio");
    end;
end;