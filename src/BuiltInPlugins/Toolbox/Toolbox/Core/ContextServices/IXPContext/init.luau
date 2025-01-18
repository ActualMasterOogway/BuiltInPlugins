local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local _ = require(l_Packages_0.Dash);
local v5 = require(l_Packages_0.Cryo);
local v6 = l_ContextItem_0:extend("IXPContext");
v6.createMock = function(v7) --[[ Line: 13 ]] --[[ Name: createMock ]]
    -- upvalues: v6 (copy), l_Signal_0 (copy)
    return v6.new({
        GetUserLayerLoadingStatus = function() --[[ Line: 15 ]] --[[ Name: GetUserLayerLoadingStatus ]]
            return Enum.IXPLoadingStatus.Initialized;
        end, 
        GetUserLayerVariables = function() --[[ Line: 18 ]] --[[ Name: GetUserLayerVariables ]]
            -- upvalues: v7 (copy)
            return v7 or {};
        end, 
        OnUserLayerLoadingStatusChanged = l_Signal_0.new()
    });
end;
v6.new = function(v8) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v9 = {
        IXPService = v8 or game:GetService("IXPService")
    };
    setmetatable(v9, v6);
    return v9;
end;
v6.getSignal = function(v10) --[[ Line: 37 ]] --[[ Name: getSignal ]]
    return v10.IXPService.OnUserLayerLoadingStatusChanged;
end;
v6.isReady = function(v11) --[[ Line: 41 ]] --[[ Name: isReady ]]
    return v11.IXPService:GetUserLayerLoadingStatus() == Enum.IXPLoadingStatus.Initialized;
end;
v6.isError = function(v12) --[[ Line: 45 ]] --[[ Name: isError ]]
    local l_UserLayerLoadingStatus_0 = v12.IXPService:GetUserLayerLoadingStatus();
    local v14 = false;
    if l_UserLayerLoadingStatus_0 ~= Enum.IXPLoadingStatus.Initialized then
        v14 = l_UserLayerLoadingStatus_0 ~= Enum.IXPLoadingStatus.Pending;
    end;
    return v14;
end;
v6.getVariables = function(v15) --[[ Line: 50 ]] --[[ Name: getVariables ]]
    -- upvalues: v5 (copy)
    if not v15:isReady() then
        return {};
    else
        return v5.Dictionary.join(v15.IXPService:GetUserLayerVariables("CreatorMarketplace"), v15.IXPService:GetUserLayerVariables("StudioMarketplace"), v15.IXPService:GetUserLayerVariables("Studio.Toolbox.Usage"), v15.IXPService:GetUserLayerVariables("CreatorContent.Music.Studio"), v15.IXPService:GetUserLayerVariables("Studio.Toolbox.AssetQuality.Exposure"));
    end;
end;
v6.logUserLayerExposure = function(v16, v17) --[[ Line: 67 ]] --[[ Name: logUserLayerExposure ]]
    if v16:isReady() then
        pcall(function() --[[ Line: 69 ]]
            -- upvalues: v16 (copy), v17 (copy)
            v16.IXPService:LogUserLayerExposure(v17);
        end);
    end;
end;
return v6;