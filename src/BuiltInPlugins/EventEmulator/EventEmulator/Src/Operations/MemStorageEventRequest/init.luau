local l_MemStorageService_0 = game:GetService("MemStorageService");
local v1 = {};
local function _(v2) --[[ Line: 13 ]] --[[ Name: validate ]]
    if v2 then
        return true;
    else
        warn("Operation Invalid: Must provide key");
        return false;
    end;
end;
v1.GetValue = function(v4) --[[ Line: 21 ]]
    -- upvalues: l_MemStorageService_0 (copy)
    local v5;
    if v4 then
        v5 = true;
    else
        warn("Operation Invalid: Must provide key");
        v5 = false;
    end;
    if v5 then
        return l_MemStorageService_0:GetItem(v4);
    else
        return;
    end;
end;
v1.SetValue = function(v6, v7) --[[ Line: 27 ]]
    -- upvalues: l_MemStorageService_0 (copy)
    local v8;
    if v6 then
        v8 = true;
    else
        warn("Operation Invalid: Must provide key");
        v8 = false;
    end;
    if v8 then
        l_MemStorageService_0:SetItem(v6, v7);
        return true;
    else
        return false;
    end;
end;
return v1;