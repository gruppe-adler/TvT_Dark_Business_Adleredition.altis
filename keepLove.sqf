[] spawn {
	_targetRating = 100000;
	while {true} do {
		_rating = rating player;
		if (_rating < _targetRating) then {
			player addRating (_targetRating - _rating);
		};
		sleep 15;
	};
};
