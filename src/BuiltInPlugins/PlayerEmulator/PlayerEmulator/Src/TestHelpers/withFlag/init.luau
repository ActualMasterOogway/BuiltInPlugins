return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: withFlag ]]
    local v3 = game:SetFastFlagForTesting(v0, v1);
    local l_status_0, l_result_0 = pcall(v2);
    game:SetFastFlagForTesting(v0, v3);
    assert(l_status_0, l_result_0);
end;