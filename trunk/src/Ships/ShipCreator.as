package src.Ships
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	public class ShipCreator
	{
		public static const HERO:uint = 0;
		public static const ALIEN:uint = 1;
		
		public static var ships:Array = new Array();
		
		public static var alienShips:Array = new Array();
		public static var heroShips:Array = new Array();
		
		public function addShip(cShipType:uint, target:Sprite, xLoc:int, yLoc:int):void
		{
			var ship:Ship = this.createShip(cShipType);
			
			ships.push(ship);
			if(cShipType == HERO) {
				heroShips.push(ship);
			} else if (cShipType == ALIEN) {
				alienShips.push(ship);
			}
			
			
			ship.drawShip();
			ship.setLoc(xLoc,yLoc);
			target.addChild(ship);
			ship.initShip();
		}
		public static function removeShip(shipReference:Object):void {
			var ship:Object = shipReference;

			if(alienShips.indexOf(ship) != -1) {
				alienShips.splice(alienShips.indexOf(ship), 1);
			}
		
			if(heroShips.indexOf(ship) != -1) {
				heroShips.splice(heroShips.indexOf(ship), 1);
			}
		}
		private function createShip(cShipType:uint):Ship
		{
			if(cShipType == HERO){
				return new HeroShip();
			} else if (cShipType == ALIEN) {
				return new AlienShip();
			} else {
				throw new Error("Invalid kind of ship specified");
				return null;
			}
		}
	}
}