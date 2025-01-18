return {
    escapePatternCharacters = function(v0) --[[ Line: 1 ]] --[[ Name: escapePatternCharacters ]]
        return string.gsub(v0, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1");
    end
};