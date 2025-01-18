local l_ContentProvider_0 = game:GetService("ContentProvider");
return function() --[[ Line: 3 ]]
    -- upvalues: l_ContentProvider_0 (copy)
    return string.find(l_ContentProvider_0.BaseUrl, "www.roblox.com") ~= nil;
end;