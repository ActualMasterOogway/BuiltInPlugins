local function v10(v0, _, v2, v3, ...) --[[ Line: 14 ]] --[[ Name: invokeGuardedCallbackProd ]]
    local v4 = nil;
    local v5 = nil;
    if not _G.__YOLO__ then
        if v3 == nil then
            local l_status_0, l_result_0 = pcall(v2, ...);
            v4 = l_status_0;
            v5 = l_result_0;
        else
            local l_status_1, l_result_1 = pcall(v2, v3, ...);
            v4 = l_status_1;
            v5 = l_result_1;
        end;
    else
        v4 = true;
        if v3 == nil then
            v2(...);
        else
            v2(v3, ...);
        end;
    end;
    if not v4 then
        v0.onError(v5);
    end;
end;
if _G.__DEV__ then

end;
return v10;