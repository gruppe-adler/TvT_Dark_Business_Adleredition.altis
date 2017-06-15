DB_playerVictoryVarName = (playerSide call {
    switch (_this) do {
        case BLUFOR: {'OBJECTIVE_STATE_BLUFOR'};
        case INDEPENDENT: {'OBJECTIVE_STATE_IND'};
        case OPFOR: {'OBJECTIVE_STATE_OPFOR'};
        default {''};
    };
});
