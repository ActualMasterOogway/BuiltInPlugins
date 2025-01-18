local l_GuiService_0 = game:GetService("GuiService");
return {
    getYoutubeWatchUrl = function(v1) --[[ Line: 8 ]] --[[ Name: getYoutubeWatchUrl ]]
        return "https://" .. "www.youtube.com" .. string.format("/watch?v=%s", v1);
    end, 
    open = function(v2) --[[ Line: 12 ]] --[[ Name: open ]]
        -- upvalues: l_GuiService_0 (copy)
        l_GuiService_0:OpenBrowserWindow(v2);
    end
};