_title = "";
_content = "";

switch (side player) do {
	case west: {
		_title = "Abgeschossenen Piloten befreien";
		_content = "Eines unserer Bodenkampfflugzeuge wurde über feindlichem Gebiet in der Nähe des Skopos abgeschossen. Der Pilot konnte sich retten, wurde jedoch von einer Rebellengruppe festgesetzt. Unsere Beziehung zu diesen Gesellen ist schwierig. Unsere größte Sorge ist, daß er von ihnen an CSAT ausgeliefert wird. Dies darf unter keinen Umständen geschehen. Überzeugen Sie die Rebellen davon, mit uns zu kooperieren. Seien Sie nicht zimperlich, tun Sie was nötig ist. <br /><br />Holen sie unseren Mann lebendig heim!";

		if (!(isNil "blufor_hostage")) then {
			if (player == blufor_hostage) then {
				_title = "Zurück zu NATO-Einheiten finden!";
				_content = "Eine Rebellengruppe hat mich gefangengenommen. Vielleicht lassen sie mich laufen - aber genausogut kann es sein, daß sie mich an CSAT verschachern. <br /><br />Ich muß zurück zu eigenen Einheiten finden!";
			};
		};
	};
	case east: {
		_title = "Feindlichen Piloten gefangennehmen";
		_content = "Unsere ruhmreichen Streitkräfte haben ein Flugzeug des Aggressors zerstört. Unsere Patrouillen fanden in dem Gebiet einen Fallschirm, und schlossen daraus, daß der Pilot sich retten konnte. Wir vermuten, daß er bei den Rebellen Unterschlupf gefunden hat. Ihre Aufgabe ist es, diesen Piloten zu finden und in Gewahrsam zu nehmen. Tun Sie, was nötig ist. Dies ist eine Mission von höchster Wichtigkeit. Verhandeln Sie mit den Rebellen, drohen Sie ihnen, erschießen Sie sie oder geben Sie ihnen Waffen - über allem steht das Ziel, diesen Piloten lebend in unsere Hände zu bekommen. <br><br>Scheitern ist keine Option!";
	};
	case resistance: {
		_title = "Munitionstruck erbeuten";
		_content = "Gestern abend wurde ein NATO-Flugzeug von CSAT-Einheiten abgeschossen. Ein aufmerksamer Hirte meldete uns einen Fallschirmspringer am Skopos. Eins unserer Teams war in der Nähe, und wir konnten nach nur kurzer Suche den Piloten unverletzt gefangennehmen. Was für ein Glückstag! Wie ihr alle wißt, haben wir Probleme mit der Munitionsbeschaffung. Piloten sind eine Menge wert. CSAT-Einheiten haben einen Haufen Munition, das  wissen wir - mit dem Piloten in der Hinterhand läßt sich vielleicht jemand davon überzeugen, uns einen LKW voll zu besorgen. <br /><br />Das Spiel ist gefährlich, seit auf der Hut!";
	};
};

player createDiaryRecord ["Diary", [_title, _content]];
