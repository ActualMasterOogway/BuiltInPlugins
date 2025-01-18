return {
    default = function(v0, v1) --[[ Line: 12 ]] --[[ Name: pluralize ]]
        return ("%s %s%s"):format(tostring(v1), v0, v1 == 1 and "" or "s");
    end
};