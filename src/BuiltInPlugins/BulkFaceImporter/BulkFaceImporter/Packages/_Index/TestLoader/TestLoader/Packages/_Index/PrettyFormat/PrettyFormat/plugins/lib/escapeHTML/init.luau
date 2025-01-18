return {
    default = function(v0) --[[ Line: 10 ]] --[[ Name: escapeHTML ]]
        return v0:gsub("<", "&lt;"):gsub(">", "&gt;");
    end
};