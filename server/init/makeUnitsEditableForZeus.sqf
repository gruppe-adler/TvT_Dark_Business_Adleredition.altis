
{
	_curator = _x;
	{_curator addCuratorEditableObjects [[_x],true];} forEach allUnits;
	_curator addCuratorEditableObjects [vehicles, true];
} forEach allCurators;
