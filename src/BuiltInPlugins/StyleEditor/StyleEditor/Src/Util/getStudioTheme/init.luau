return function() --[[ Line: 3 ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 4 ]]
        return settings().Studio.Theme.Name;
    end);
    if l_status_0 and l_result_0 then
        return l_result_0;
    else
        return "Dark";
    end;
end;