local v0 = game:GetService("ContentProvider").BaseUrl:lower();
if v0:find("https://www.") then
    v0 = v0:sub(13);
elseif v0:find("http://www.") then
    v0 = v0:sub(12);
end;
return {
    BuildUrl = function(v1, v2, ...) --[[ Line: 10 ]] --[[ Name: BuildUrl ]]
        -- upvalues: v0 (ref)
        local v3 = string.format(v2, ...) or "";
        return string.format("https://%s.%s%s", v1, v0, v3);
    end
};