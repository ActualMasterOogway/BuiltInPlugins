local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.UI.Stories.StoryMiddleware);
local v2 = require(l_Parent_0.Util.Typecheck.DocParser);
return {
    name = "Developer Framework", 
    exclude = {
        "_Index"
    }, 
    storyRoots = {
        l_Parent_0
    }, 
    mapStory = v1, 
    mapDefinition = function(v3) --[[ Line: 18 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v2 (copy)
        local v4 = v2.new(v3.name, v3.source.Parent);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
            -- upvalues: v4 (copy)
            return v4:parse();
        end);
        if l_status_0 then
            v3.docs = l_result_0;
            v3.summary = l_result_0.Summary;
        end;
        return v3;
    end
};