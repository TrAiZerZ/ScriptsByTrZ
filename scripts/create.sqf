vendeur setPos [x,y,z];
publicVariable "vendeur";
while {player distance vendeur < 5 } do
{
	vendeurV = createAgent ["O_helicrew_F", vendeur, [], 0, "NONE"];
	vendeurV allowDamage false;
	vendeurV enableSimulation false;
	vendeurV = player addAction ["Exec the file", "somescript.sqf"]
};