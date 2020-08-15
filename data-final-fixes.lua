for key, resource in pairs(data.raw.resource) do
    log("making " .. key .. " infinite")

    -- make infinite
    resource.infinite = true

    ---- don't deplete
    resource.infinite_depletion_amount = 0

    -- set minimum to at least 100
    if not resource.minimum or resource.minimum < 100 then
        resource.minimum = 100
    end
    
    -- set normal to at least minimum
    if not resource.normal or resource.normal < resource.minimum then
        resource.normal = resource.minimum
    end

    resource.mining_time = 0.5
    resource.minable.count = 500

    -- increase amount_min and amount_max for crude-oil
    if key == "crude-oil" and resource.minable and resource.minable.results then
        for index,result in ipairs(resource.minable.results) do
            result.amount_min = 10
            result.amount_max = 30
        end
    end

    -- change sprite to always show biggest value
    if resource.stage_counts then
        for i = 1, #resource.stage_counts do
            resource.stage_counts[i] = 0
        end
    end

end
