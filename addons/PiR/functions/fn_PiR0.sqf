if (!isServer) exitWith {};



// Назначение действий на попадание игрок

     private ["_unit","_selection","_shans"];
	_unit = (_this select 0);


	if (vehicle _unit != _unit) exitWith {
	
		if !(_unit getVariable ["dam_ignore_effect0",false]) then {

		 _unit setVariable ["dam_ignore_effect0",true];	
		 _null = [_unit, _anim, _shans] spawn EyeEffect0;
		};
	
	};

	
	
	
if !(_unit getVariable ["dam_ignore_injured0",false]) then {



//________________________________Распределение анимаций по частям тела______________________________________________________________________		

	_anim = selectRandom [
	"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
	"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C","UnconsciousReviveHead_A",
	"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
		
_shans = 0;



if (damage _unit > 0) then {




		if ((_unit getHitPointDamage "HitFace" > 0) && (_unit getHitPointDamage "HitHead" > 0) && (_unit getHitPointDamage "HitNeck" > 0) && (_unit getHitPointDamage "HitPelvis" > 0) && (_unit getHitPointDamage "HitAbdomen" > 0) && (_unit getHitPointDamage "HitDiaphragm" > 0) && (_unit getHitPointDamage "HitChest" > 0) && (_unit getHitPointDamage "HitBody" > 0) && (_unit getHitPointDamage "HitHands" > 0) && (_unit getHitPointDamage "HitArms" > 0) && (_unit getHitPointDamage "HitLegs" > 0)) exitWith {

			_anim = selectRandom [
	"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
	"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C","UnconsciousReviveHead_A",
	"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
		
_shans = 8;
		
		};
					
						

		if ((_unit getHitPointDamage "HitFace" > 0.25) or (_unit getHitPointDamage "HitHead" > 0.25) or (_unit getHitPointDamage "HitNeck" > 0.25)) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveHead_A","UnconsciousReviveHead_B","UnconsciousReviveHead_C"];
_shans = 10;
		};


		if ((_unit getHitPointDamage "HitPelvis" > 0.25) or (_unit getHitPointDamage "HitAbdomen" > 0.25)) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveBody_A","UnconsciousReviveBody_B","UnconsciousReviveDefault_A"];
_shans = 7;
		};

		if ((_unit getHitPointDamage "HitDiaphragm" > 0.25) or (_unit getHitPointDamage "HitChest" > 0.25) or (_unit getHitPointDamage "HitBody" > 0.25)) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C"];
_shans = 9;
		};	

		if (_unit getHitPointDamage "HitHands" > 0.25) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C"];
_shans = 1;
		};

		if (_unit getHitPointDamage "HitArms" > 0.25) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C"];
_shans = 3;
		};

		if (_unit getHitPointDamage "HitLegs" > 0.25) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
_shans = 5;
		};

};

//_____________________________________________________________________________________________________________________




// Голова	
if ((_shans == 10) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		if ((_shans - (random 25)) >=0) then {
		_null = [_unit, _anim, _shans] spawn Helmet0;
		} else {

		_null = [_unit, _anim, _shans] spawn Uncondition0;	
		};
		};


//	Живот и Грудь		
if (((_shans == 7) or (_shans == 9)) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		if ((_shans - (random 22)) >=0) then {
		_null = [_unit, _anim, _shans] spawn BendsDown0;
		} else {
			if ((_shans - (random 14)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn Crawl0;	
			} else {
			_null = [_unit, _anim, _shans] spawn Uncondition0;
			 };
		};	
		};

// Верх руки и Низ руки
if (((_shans == 1) or (_shans == 3)) && ((7 - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		if (((_shans - (random 8)) <=0) && !(_unit getVariable ["dam_ignore_dragger0",false])) then {
		_null = [_unit, _anim, _shans] spawn DropWeapon0;
		} else {
			if ((_shans - (random 10)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn Uncondition0;	
			} else {
			_null = [_unit, _anim, _shans] spawn Crawl0;
			 };
		};	
		};	

// Бедро, голень и стопа
if (((_shans == 6) or (_shans == 4) or (_shans == 2)) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		if ((_shans - (random 22)) >=0) then {
		_null = [_unit, _anim, _shans] spawn Uncondition0;
		} else {
		     _null = [_unit, _anim, _shans] spawn Crawl0;	

		};	
		};	

// Подрыв
if ((_shans == 8) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		if ((_shans - (random 16)) >=0) then {
		_null = [_unit, _anim, _shans] spawn Crawl0;
		} else {
			if ((_shans - (random 12)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn Uncondition0;	
			} else {
			if ((_shans - (random 12)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn BendsDown0;	
			} else {
			_null = [_unit, _anim, _shans] spawn Helmet0;
			 };
		};	
		};		
		};
	
	
	
	//_____________________________________________________________________________________________________________________	

//________________________________Крик при попадании_______________________________________________________________________
  if (_shans !=10 ) then {
   [_unit, (selectRandom ["Hit1", "Hit2", "Hit3", "Hit4", "Hit5", "Hit6", "Hit7", "Hit8", "Hit9", "Hit10"]) ] remoteExec [ "say3D", 0];
  };
//__________________________________________________________________________________________________________________________


//________________________________Эффекты крови_____________________________________________________________________________

	if !(_unit getVariable ["dam_ignore_effect0",false]) then {

	 _unit setVariable ["dam_ignore_effect0",true];	
  	 [_unit, _anim, _shans ] remoteExec [ "EyeEffect0", _unit ];

	};

//__________________________________________________________________________________________________________________________	
//________________________________Стоны при ранении_________________________________________________________________________
		while {true} do {

	 		 sleep (40 + random 20);		
				 
		 if (!(_unit getVariable ["dam_ignore_injured0",false]) or !(alive _unit)) exitWith {};	


	
		 [_unit, (selectRandom ["pain1", "pain2", "pain3", "pain4", "pain5", "pain6", "pain7", "pain8", "pain9"]) ] remoteExec [ "say3D", 0];


		 
		};
		
//___________________________________________________________________________________________________________________________

	

	sleep 1;	
	if !(alive _unit) then {

		_unit 	removeAllMPEventHandlers "MPHit";	
	
	};
	};








