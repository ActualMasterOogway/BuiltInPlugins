return function(v0, v1) --[[ Line: 6 ]] --[[ Name: interpolateNotificationSubject ]]
    if v0 then
        if v1 then
            return v0:gsub("{(.-)}", v1);
        else
            return v0;
        end;
    else
        return "";
    end;
end;