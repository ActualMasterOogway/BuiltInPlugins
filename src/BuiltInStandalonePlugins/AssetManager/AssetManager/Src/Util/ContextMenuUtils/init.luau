local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_StudioService_0 = game:GetService("StudioService");
local v6 = {
    _createAssetUrl = function(v5) --[[ Line: 11 ]]
        -- upvalues: l_ContentProvider_0 (copy), l_HttpService_0 (copy)
        return (("%*library/%*/asset"):format(l_ContentProvider_0.BaseUrl, (l_HttpService_0:urlEncode(v5))));
    end
};
v6.openItemInBrowser = function(v7) --[[ Line: 17 ]]
    -- upvalues: l_GuiService_0 (copy), v6 (copy)
    for _, v9 in v7 do
        l_GuiService_0:OpenBrowserWindow(v6._createAssetUrl(v9));
    end;
end;
v6.copyAssetId = function(v10) --[[ Line: 23 ]]
    -- upvalues: l_StudioService_0 (copy), l_HttpService_0 (copy)
    if #v10 == 1 then
        local v11 = v10[1];
        l_StudioService_0:CopyToClipboard(v11);
        return;
    else
        local v12 = l_HttpService_0:JSONEncode(v10);
        l_StudioService_0:CopyToClipboard(v12);
        return;
    end;
end;
v6.openAssetConfig = function(v13, v14) --[[ Line: 33 ]]
    -- upvalues: l_MemStorageService_0 (copy), l_HttpService_0 (copy)
    l_MemStorageService_0:Fire("OpenAssetConfiguration", l_HttpService_0:JSONEncode({
        id = v13, 
        assetType = v14
    }));
end;
return v6;